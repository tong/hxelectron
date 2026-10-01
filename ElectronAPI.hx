#if eval
import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;

using StringTools;
using haxe.macro.ComplexTypeTools;
using haxe.macro.MacroStringTools;
using haxe.macro.TypeTools;

/**
	Generates the haxe externs from the `electron-api.json` description file
	which is published with every electron release.
**/
class ElectronAPI {
	public static function generate(apiFile = 'electron-api.json', destination = 'src', clean = false, addDocumentation = true) {
		if (!FileSystem.exists(apiFile))
			Context.fatalError('API description file [$apiFile] not found', Context.currentPos());

		if (clean)
			rmdir(destination);

		var items:Array<Item> = Json.parse(File.getContent(apiFile));
		for (item in items) {
			// `extends` is a keyword and can not be used as a typedef field name
			if (Reflect.hasField(item, "extends"))
				item.extends_ = Reflect.field(item, "extends");
		}
		var types = new Gen(['electron'], addDocumentation).process(items);
		var printer = new haxe.macro.Printer();
		for (tds in types) {
			var type = tds[0];
			var code = printer.printTypeDefinition(type);
			for (i in 1...tds.length) {
				var e = tds[i];
				e.pack = [];
				code += '\n' + printer.printTypeDefinition(e);
			}

			var dir = destination + '/' + type.pack.join('/');
			if (!FileSystem.exists(dir))
				FileSystem.createDirectory(dir);
			File.saveContent('$dir/${type.name}.hx', '$code\n');
		}

		// postprocess: make remote modules
		var main = '$destination/electron/main';
		var remote = '$destination/electron/remote';
		var regex = ~/@:jsRequire\("electron", "(\w*)"\)/;
		if (!FileSystem.exists(remote))
			FileSystem.createDirectory(remote);
		for (item in items) {
			if ((item.type == Module || item.type == Class_) && item.process != null && item.process.main) {
				try {
					var name = Gen.capitalize(item.name);
					var content = File.getContent('$main/$name.hx');
					var patched = regex.replace(content.replace('electron.main', 'electron.remote'), '@:jsRequire("electron", "remote.$1")');
					File.saveContent('$remote/$name.hx', patched);
				} catch (e:Dynamic) {
					// no generated main module for this item
				}
			}
		}
	}

	static function rmdir(path:String) {
		if (FileSystem.exists(path)) {
			for (e in FileSystem.readDirectory(path)) {
				var p = '$path/$e';
				FileSystem.isDirectory(p) ? rmdir(p) : FileSystem.deleteFile(p);
			}
			FileSystem.deleteDirectory(path);
		}
	}
}

private class Gen {
	static var KEYWORDS = [
		'abstract', 'break', 'case', 'cast', 'catch', 'class', 'continue', 'default', 'do', 'dynamic', 'else', 'enum', 'extends', 'extern', 'false',
		'final', 'for', 'function', 'if', 'implements', 'import', 'in', 'inline', 'interface', 'macro', 'new', 'null', 'override', 'package',
		'private', 'public', 'return', 'static', 'super', 'switch', 'this', 'throw', 'true', 'try', 'typedef', 'untyped', 'using', 'var', 'while'
	];
	/** Types with a fixed haxe equivalent. **/
	static var SIMPLE_TYPES:Map<String, ComplexType> = [
		'this' => macro :Dynamic,
		'undefined' => macro :Dynamic,
		'null' => macro :Dynamic,
		'void' => macro :Void,
		'any' => macro :Any,
		'Any' => macro :Any,
		'unknown' => macro :Dynamic,
		'Boolean' => macro :Bool,
		'boolean' => macro :Bool,
		'Integer' => macro :Int,
		'Double' => macro :Float,
		'Float' => macro :Float,
		'Number' => macro :Float,
		'number' => macro :Float,
		'String' => macro :String,
		'URL' => macro :String, // TODO: js.html.URL
		'Date' => macro :Date,
		'Function' => macro :haxe.Constraints.Function, // TODO: type from parameters/returns
		'Error' => macro :js.lib.Error,
		'Event' => macro :js.html.Event,
		'Blob' => macro :js.html.Blob,
		'Buffer' => macro :js.node.Buffer,
		'Uint8Array' => macro :js.lib.Uint8Array,
		'ArrayBufferLike' => macro :js.lib.ArrayBuffer,
		'ArrayBufferView' => macro :js.lib.ArrayBufferView,
		'ReadableStream' => macro :js.node.stream.Readable<Dynamic>, // TODO: type param
		'NodeJS.ReadableStream' => macro :js.node.stream.Readable<Dynamic>,
		'Electron.ParentPort' => macro :electron.ParentPort,
		'RequestInit & { bypassCustomProtocolHandlers?: boolean }' => macro :js.html.RequestInit,
		'Array' => macro :Array<Dynamic>, // array without a type parameter
		'[number, number]' => macro :Array<Float>,
		"'rawData'" => macro :js.node.Buffer,
		// not defined in the description
		'MenuItemConstructorOptions' => macro :Dynamic,
		'TouchBarItem' => macro :Dynamic,
		'UserDefaultTypes[Type]' => macro :Dynamic,
	];
	static var IDENTIFIER = ~/^[A-Za-z_][A-Za-z0-9_]*$/;
	// ordered, so the generated metadata is stable
	static var PLATFORM_TAGS = [
		{tag: 'os_macos', name: 'macOS'},
		{tag: 'os_windows', name: 'Windows'},
		{tag: 'os_linux', name: 'Linux'},
		{tag: 'os_mas', name: 'MAS'}
	];

	var root:Array<String>;
	var addDocumentation:Bool;
	var items:Array<Item>;
	var types = new Map<String, TypeDefinition>();
	var extraTypes = new Map<String, Array<TypeDefinition>>();
	/** Names of types which are referenced but not defined by the description. **/
	var aliases = new Array<String>();
	/** Names of the enum abstracts generated from `possibleValues`. **/
	var enumTypes = new Map<String, Bool>();
	/** Name of the generated enum abstract by its context and values. **/
	var enumNames = new Map<String, String>();
	/** Where in the description we currently are, e.g. [App, getPath, name]. Used to name enums. **/
	var context = new Array<String>();
	/** Type parameters of the method which is currently processed. **/
	var generics = new Map<String, ComplexType>();

	public function new(?root:Array<String>, addDocumentation = true) {
		this.root = (root != null) ? root : [];
		this.addDocumentation = addDocumentation;
	}

	public function process(items:Array<Item>):Map<String, Array<TypeDefinition>> {
		this.items = items;

		// Types which are referenced by the description but not defined
		function addAlias(name:String, ?type:ComplexType) {
			aliases.push(name);
			this.types.set(name, {
				pack: root.copy(),
				name: name,
				kind: TDAlias(type != null ? type : macro :Dynamic),
				fields: [],
				pos: null
			});
		}
		addAlias('AbortSignal');
		addAlias('Accelerator', macro :String);
		addAlias('ClientRequestConstructorOptions');
		addAlias('File');
		addAlias('GlobalResponse');
		addAlias('GlobalRequest');
		addAlias('MessagePort');
		addAlias('Partial');
		addAlias('PopupOptions');

		// not defined by the description, but identical to the options of `dialog.showSaveDialog()`
		addStructureFromParameter('SaveDialogOptions', 'dialog', 'showSaveDialog', 'options');

		for (item in items)
			this.types.set(item.name, processItem(item));

		var map = new Map<String, Array<TypeDefinition>>();
		for (t in types)
			map.set(t.name, extraTypes.exists(t.name) ? [t].concat(extraTypes.get(t.name)) : [t]);
		return map;
	}

	/** Creates a structure from the properties of an `Object` parameter of a method. **/
	function addStructureFromParameter(name:String, itemName:String, methodName:String, parameterName:String) {
		aliases.push(name);
		var item = getItem(itemName);
		var method = (item == null || item.methods == null) ? null : item.methods.filter(m -> m.name == methodName)[0];
		var param = (method == null || method.parameters == null) ? null : method.parameters.filter(p -> p.name == parameterName)[0];
		if (param == null || param.properties == null) {
			Context.warning('cannot create $name: $itemName.$methodName($parameterName) not found', Context.currentPos());
			types.set(name, {pack: root.copy(), name: name, kind: TDAlias(macro :Dynamic), fields: [], pos: null});
			return;
		}
		context = [name];
		types.set(name, {
			pack: root.copy(),
			name: name,
			kind: TDStructure,
			fields: [for (p in param.properties) createVarField(p)],
			pos: null
		});
	}

	function processItem(item:Item):TypeDefinition {
		context = [capitalize(item.name)];
		var type:TypeDefinition = {
			pack: getItemPack(item),
			name: item.name,
			isExtern: item.type != Structure,
			kind: null,
			fields: [],
			meta: [],
			pos: null
		};

		if (addDocumentation) {
			type.doc = '';
			if (item.description != null && item.description.length > 0)
				type.doc += item.description + '\n';
			type.doc += '@see ' + item.websiteUrl;
		}

		switch item.type {
			case Class_:
				var supItem:Item = null;
				var sup:TypePath = null;
				if (item.extends_ != null) {
					supItem = getItem(item.extends_);
					if (supItem != null)
						sup = {name: supItem.name, pack: getItemPack(supItem)}
					else // external DOM type, e.g. WebSocket extends EventTarget
						sup = {name: item.extends_, pack: ['js', 'html']}
				} else if (item.instanceEvents != null) {
					sup = createEventEmitter(type, item.instanceEvents);
				}
				type.kind = TDClass(sup);
				type.meta.push({name: ':jsRequire', params: [macro $v{'electron'}, macro $v{item.name}], pos: null});
				if (item.staticMethods != null)
					for (m in item.staticMethods)
						type.fields.push(createFunField(m, [AStatic]));
				if (item.instanceProperties != null)
					for (p in item.instanceProperties)
						if (!superHasProperty(supItem, p.name))
							type.fields.push(createVarField(p));
				if (item.constructorMethod != null)
					type.fields.push(createFunField(cast {name: 'new', parameters: item.constructorMethod.parameters}));
				if (item.instanceMethods != null)
					for (m in item.instanceMethods)
						type.fields.push(createFunField(m));
				// TODO: staticProperties (e.g. the TouchBar* classes) are not generated
				mergeTypeItem(type, item);

			case Module:
				type.name = capitalize(item.name);
				type.meta.push({name: ':jsRequire', params: [macro $v{'electron'}, macro $v{item.name}], pos: null});
				var sup = (item.events == null) ? null : createEventEmitter(type, item.events);
				type.kind = TDClass(sup);
				if (item.properties != null)
					for (p in item.properties)
						type.fields.push(createVarField(p, [AStatic]));
				if (item.methods != null)
					for (m in item.methods)
						type.fields.push(createFunField(m, [AStatic]));
				if (item.events != null && item.events.length > 0)
					for (f in createStaticEmitterMethods())
						type.fields.push(f);
				mergeTypeItem(type, item);

			case Structure:
				var extType = (item.extends_ != null) ? getComplexType(item.extends_) : null;
				var extendsElectronType = extType != null && isElectronType(extType);
				var fields = [];
				if (item.properties != null)
					for (p in item.properties)
						// an intersection can not redefine fields (e.g. with a narrower enum)
						if (!extendsElectronType || !inheritsProperty(item, p.name))
							fields.push(createVarField(p));
				if (extendsElectronType) {
					// structure extending another generated structure
					type.kind = TDAlias(TIntersection([TAnonymous(fields), extType]));
				} else {
					type.kind = TDStructure;
					type.fields = fields;
				}

			case Element:
				type.name = capitalize(item.name);
				type.kind = TDClass({pack: ['js', 'html'], name: 'Element'});
				type.meta.push({name: ':native', params: [macro $v{item.name}], pos: null});
				if (item.attributes != null)
					for (a in item.attributes)
						type.fields.push(createVarField(a));
				if (item.methods != null)
					for (m in item.methods)
						type.fields.push(createFunField(m));
				// TODO: domEvents
		}

		switch type.kind {
			case null:
				type.kind = TDClass();
			case TDClass(_, _, _, _):
				mergeDuplicateMethods(type);
			case _:
		}

		postPatch(type);
		return type;
	}

	/** Manual fixes for specific types. **/
	function postPatch(type:TypeDefinition) {
		switch type.name {
			case 'Process':
				// `process` is a global (also in sandboxed renderers, where `require("process")` is not available)
				for (i in 0...type.meta.length)
					if (type.meta[i].name == ':jsRequire') {
						type.meta.splice(i, 1);
						type.meta.push({name: ':native', params: [macro 'process'], pos: null});
						break;
					}
		}
	}

	/**
		Modules are event emitter instances, but are generated as classes with static fields,
		so the `EventEmitter` instance methods are not available. Adds static counterparts.
	**/
	function createStaticEmitterMethods():Array<Field> {
		function method(name:String, withListener:Bool):Field {
			var event = {name: 'event', type: macro :js.node.events.EventEmitter.Event<T>};
			return {
				name: name,
				access: [AStatic],
				kind: FFun({
					params: [{name: 'T', constraints: [macro :haxe.Constraints.Function]}],
					args: withListener ? [event, {name: 'listener', type: macro :T}] : [{name: 'event', type: macro :js.node.events.EventEmitter.Event<T>, opt: true}],
					ret: macro :Void,
					expr: null
				}),
				pos: null
			};
		}
		return [for (n in ['on', 'once', 'addListener', 'removeListener', 'off']) method(n, true)].concat([method('removeAllListeners', false)]);
	}

	/** Turn fields with the same name into `@:overload`s of the last definition. **/
	function mergeDuplicateMethods(type:TypeDefinition) {
		var i = 0;
		while (i < type.fields.length) {
			var a = type.fields[i];
			var b = null;
			for (j in i + 1...type.fields.length)
				if (type.fields[j].name == a.name) {
					b = type.fields[j];
					break;
				}
			if (b == null) {
				i++;
				continue;
			}
			type.fields.splice(i, 1);
			switch a.kind {
				case FFun(f):
					f.expr = {expr: EBlock([]), pos: Context.currentPos()};
					var expr:Expr = {expr: EFunction(null, f), pos: Context.currentPos()};
					if (b.meta == null)
						b.meta = [];
					b.meta.push({name: ':overload', params: [expr], pos: Context.currentPos()});
				case _:
			}
		}
	}

	function getItem(name:String):Item {
		for (item in items)
			if (item.name == name)
				return item;
		return null;
	}

	function getItemPack(item:Item):Array<String> {
		var pack = root.copy();
		if (item.process != null && (!item.process.main || !item.process.renderer)) {
			if (item.process.main)
				pack.push('main');
			else if (item.process.renderer)
				pack.push('renderer');
		}
		return pack;
	}

	function superHasProperty(supItem:Item, name:String):Bool {
		if (supItem == null || supItem.instanceProperties == null)
			return false;
		for (sp in supItem.instanceProperties)
			if (sp.name == name)
				return true;
		return false;
	}

	/** Whether a (transitive) parent of `item` defines the property. **/
	function inheritsProperty(item:Item, name:String):Bool {
		var parent = (item.extends_ != null) ? getItem(item.extends_) : null;
		if (parent == null)
			return false;
		var props = (parent.type == Structure) ? parent.properties : parent.instanceProperties;
		if (props != null)
			for (p in props)
				if (p.name == name)
					return true;
		return inheritsProperty(parent, name);
	}

	function isElectronType(t:ComplexType):Bool {
		return switch t {
			case TPath(p): p.pack[0] == root[0];
			case _: false;
		}
	}

	function mergeTypeItem(type:TypeDefinition, item:Item) {
		var name = if (item.type == Module) capitalize(item.name) else uncapitalize(item.name);
		if (types.exists(name)) {
			var t = types.get(name);
			types.remove(name);
			if (extraTypes.exists(name)) {
				for (et in extraTypes.get(name))
					addExtraType(type.name, et);
				extraTypes.remove(name);
			}
			type.fields = (item.type == Module) ? type.fields.concat(t.fields) : t.fields.concat(type.fields);
		}
	}

	/** Creates the event enum abstract and returns the `EventEmitter` super class. **/
	function createEventEmitter(type:TypeDefinition, events:Array<Event>):TypePath {
		createEventEnumAbstract(type.name, type.pack, events);
		return {pack: ['js', 'node', 'events'], name: 'EventEmitter', params: [TPType(TPath({name: type.name, pack: type.pack}))]};
	}

	/** Adds a type to the module of the type `owner`. **/
	function addExtraType(owner:String, type:TypeDefinition) {
		if (!extraTypes.exists(owner))
			extraTypes.set(owner, []);
		extraTypes.get(owner).push(type);
	}

	function createEventEnumAbstract(name:String, pack:Array<String>, events:Array<Event>) {
		var _name = name + 'Event';
		var type:TypeDefinition = null;
		if (extraTypes.exists(name))
			for (et in extraTypes.get(name))
				if (et.name == _name) {
					type = et;
					break;
				}
		if (type == null) {
			type = {
				name: _name,
				pack: pack,
				params: [{name: 'T', constraints: [macro :haxe.Constraints.Function]}],
				kind: TDAbstract(macro :js.node.events.EventEmitter.Event<T>, [AbEnum], [macro :js.node.events.EventEmitter.Event<T>], [macro :js.node.events.EventEmitter.Event<T>]),
				fields: [],
				pos: null
			};
			addExtraType(name, type);
		}
		for (e in events) {
			context.push(e.name);
			var args = [for (p in e.parameters) withContext(p.name, () -> getComplexType(p.type, p.collection, p.properties, !p.required, p.innerTypes, p.possibleValues))];
			context.pop();
			type.fields.push({
				name: e.name.replace('-', '_'),
				kind: FVar(TPath({pack: pack, name: _name, params: [TPType(TFunction(args, macro :Void))]}), macro $v{e.name}),
				meta: createTagMetadata(e.additionalTags),
				doc: getDoc(e.description),
				pos: null
			});
		}
	}

	function createVarField(p:Property, ?access:Array<Access>):Field {
		var meta = createTagMetadata(p.additionalTags);
		if (p.required != null && !p.required)
			meta.push({name: ':optional', pos: null});
		var type = withContext(p.name, () -> getComplexType(p.type, p.collection, p.properties, false, p.innerTypes, p.possibleValues));
		return createField(p.name, FVar(type, null), access, meta, p.description);
	}

	function createFunField(m:Method, ?access:Array<Access>):Field {
		var meta = createTagMetadata(m.additionalTags);
		generics = parseGenerics(m.rawGenerics);
		context.push(m.name);

		var args = new Array<FunctionArg>();
		if (m.parameters != null) {
			for (p in m.parameters) {
				switch p.name {
					case '...args':
						args.push({
							name: 'args',
							type: macro :haxe.extern.Rest<Any>,
							opt: false // Haxe doesn't allow rest args to be optional.
						});
					default:
						args.push({
							name: escapeArgument(p.name),
							type: withContext(p.name, () -> getComplexType(p.type, p.collection, p.properties, false, p.innerTypes, p.possibleValues)),
							opt: (p.required == null) ? true : !p.required
						});
				}
			}
		}

		var ret = if (m.returns == null) macro :Void else withContext('Result', () -> getComplexType(m.returns.type, m.returns.collection, m.returns.properties, false, m.returns.innerTypes, m.returns.possibleValues));

		generics = new Map();
		context.pop();
		return createField(m.name, FFun({args: args, ret: ret, expr: null}), access, meta, m.description);
	}

	/** Maps the type parameters of e.g. `<T extends string>` to their constraint. **/
	function parseGenerics(raw:String):Map<String, ComplexType> {
		var map = new Map<String, ComplexType>();
		if (raw == null)
			return map;
		var re = ~/(\w+)(?: extends (\w+))?/;
		var rest = raw.substr(1, raw.length - 2); // strip < >
		while (re.match(rest)) {
			map.set(re.matched(1), re.matched(2) == 'string' ? macro :String : macro :Dynamic);
			rest = re.matchedRight();
		}
		return map;
	}

	function createField(name:String, kind:FieldType, access:Array<Access>, ?meta:Metadata, ?doc:String):Field {
		if (name != 'new' && !isValidIdentifier(name)) { // constructors keep their name
			if (meta == null)
				meta = [];
			meta.push({name: ':native', params: [macro $v{name}], pos: null});
			name = '_' + name;
		}
		return {
			name: name,
			access: access,
			kind: kind,
			meta: meta,
			doc: getDoc(doc),
			pos: null
		}
	}

	function createMultiType(types:Array<TypeRef>):ComplexType {
		function getTypeName(t:TypeRef):String
			return (t.typeName != null) ? t.typeName : t.type;

		function createEitherType(remain:Array<TypeRef>) {
			var t1 = remain.shift();
			var t1Name = getTypeName(t1);
			if (t1Name == null)
				throw 'cannot resolve type name';
			var params = [TPType(getComplexType(t1Name, t1.collection, t1.properties, false, t1.innerTypes))];
			if (remain.length > 1) {
				params.push(TPType(createEitherType(remain)));
			} else {
				var t2Name = getTypeName(remain[0]);
				if (t2Name == null)
					throw 'cannot resolve type name';
				params.push(TPType(getComplexType(t2Name, remain[0].collection, remain[0].properties, false, remain[0].innerTypes)));
			}
			return TPath({pack: ['haxe', 'extern'], name: 'EitherType', params: params});
		}

		// collapse string literal types ('thin', 'bold', ...) into a single String
		var merged:Array<TypeRef> = [];
		var hasString = false;
		for (t in types) {
			var n = getTypeName(t);
			if (n != null && (isStringLiteral(n) || n == 'String')) {
				if (hasString)
					continue;
				hasString = true;
				merged.push({type: 'String', collection: false});
			} else
				merged.push(t);
		}
		if (merged.length == 1)
			return getComplexType(getTypeName(merged[0]), merged[0].collection, merged[0].properties, false, merged[0].innerTypes);
		return createEitherType(merged);
	}

	/**
		Resolves a type of the api description. `name` is a type name or, for unions, an array of `TypeRef`.
		`innerTypes` are the type arguments of generic types (`Promise<T>`, `Record<K, V>`).
	**/
	function getComplexType(name:Dynamic, collection = false, ?properties:Array<Dynamic>, optional = false, ?innerTypes:Array<Dynamic>, ?possibleValues:Array<PossibleValue>):ComplexType {
		var t = resolveType(name, properties, innerTypes, possibleValues);
		if (collection)
			t = TPath({name: 'Array<${t.toString()}>', pack: []});
		if (optional)
			t = TOptional(t);
		return t;
	}

	function resolveType(name:Dynamic, properties:Array<Dynamic>, innerTypes:Array<Dynamic>, possibleValues:Array<PossibleValue>):ComplexType {
		if (name == null)
			return macro :Dynamic;
		if (Std.isOfType(name, Array))
			return createMultiType(cast name);
		var n:String = name;
		if (generics.exists(n))
			return generics.get(n);
		if (n == 'String' && possibleValues != null && possibleValues.length > 0)
			return createEnumAbstract(possibleValues);
		var simple = SIMPLE_TYPES.get(n);
		if (simple != null)
			return simple;
		if (aliases.contains(n))
			return TPath({name: n, pack: root.copy()});
		if (isStringLiteral(n)) // e.g. 'file'
			return macro :String;
		if (n.startsWith('typeof ')) // reference to a class, e.g. `typeof WebSocket` -> Class<WebSocket>
			return TPath({pack: [], name: 'Class', params: [TPType(getComplexType(n.substr(7).trim()))]});
		if (n.contains('=>') || n.contains(' extends ')) // typescript function and conditional types
			return macro :Dynamic;
		return switch n {
			case 'Object': createAnonymousType(properties);
			case 'Promise': TPath({pack: ['js', 'lib'], name: 'Promise', params: [TPType(getInnerType(innerTypes, 0, macro :Any))]});
			case 'Record': // Record<string, V>
				if (innerTypes != null && innerTypes.length == 2 && innerTypes[0].type == 'String')
					TPath({pack: ['haxe'], name: 'DynamicAccess', params: [TPType(getInnerType(innerTypes, 1, macro :Dynamic))]})
				else
					macro :Dynamic;
			default:
				// prefer the exact name: `UtilityProcess` is a class and a module (`utilityProcess`)
				var item = getItem(n);
				if (item == null)
					item = getItem(uncapitalize(n));
				TPath({name: n, pack: (item != null) ? getItemPack(item) : []});
		}
	}

	function withContext<T>(part:String, f:() -> T):T {
		context.push(part);
		var r = f();
		context.pop();
		return r;
	}

	/** Creates (or reuses) an `enum abstract` for the possible values of a string and returns its type. **/
	function createEnumAbstract(possibleValues:Array<PossibleValue>):ComplexType {
		// the enum is added to the module of the type it is used in
		var owner = context[0];
		var key = owner + '.' + context[context.length - 1] + ':' + possibleValues.map(v -> v.value).join('|');
		var name = enumNames.get(key);
		if (name == null) {
			var base = [for (part in context) toPascalCase(part)].join('');
			name = base;
			var i = 2;
			while (enumTypes.exists(name) || types.exists(name) || getItem(name) != null)
				name = base + (i++);
			enumTypes.set(name, true);
			enumNames.set(key, name);
			var fields = new Array<Field>();
			var used = new Map<String, Bool>();
			for (v in possibleValues) {
				var fieldName = enumFieldName(v.value);
				while (used.exists(fieldName))
					fieldName += '_';
				used.set(fieldName, true);
				fields.push({name: fieldName, kind: FVar(null, macro $v{v.value}), doc: getDoc(v.description), pos: null});
			}
			addExtraType(owner, {
				pack: [],
				name: name,
				kind: TDAbstract(macro :String, [AbEnum], [macro :String], [macro :String]),
				fields: fields,
				pos: null
			});
		}
		return TPath({pack: [], name: name});
	}

	static function enumFieldName(value:String):String {
		var name = ~/[^A-Za-z0-9_]/g.replace(value, '_');
		if (name == '')
			return 'empty';
		if (~/^[0-9]/.match(name))
			name = '_' + name;
		return KEYWORDS.indexOf(name) != -1 ? name + '_' : name;
	}

	static function toPascalCase(s:String):String
		return [for (part in ~/[^A-Za-z0-9]+/g.split(s)) if (part != '') capitalize(part)].join('');

	function getInnerType(innerTypes:Array<Dynamic>, index:Int, fallback:ComplexType):ComplexType {
		if (innerTypes == null || innerTypes.length <= index)
			return fallback;
		var t:TypeRef = innerTypes[index];
		return getComplexType(t.type, t.collection, t.properties, false, t.innerTypes, t.possibleValues);
	}

	function createAnonymousType(properties:Array<Dynamic>):ComplexType {
		if (properties == null || properties.length == 0)
			return macro :Any;
		var fields = new Array<Field>();
		for (p in properties) {
			var meta = createTagMetadata(p.additionalTags);
			if (p.required != null && !p.required)
				meta.push({name: ":optional", pos: null});
			fields.push({
				name: p.name,
				kind: FVar(withContext(p.name, () -> getComplexType(p.type, p.collection, p.properties, false, p.innerTypes, p.possibleValues))),
				meta: meta,
				doc: getDoc(p.description),
				pos: null
			});
		}
		return TAnonymous(fields);
	}

	static function isStringLiteral(n:String):Bool
		return n.length > 1 && n.charAt(0) == "'" && n.charAt(n.length - 1) == "'";

	function getDoc(s:String):String {
		if (!addDocumentation || s == null)
			return null;
		s = s.trim();
		return (s.length == 0) ? null : s;
	}

	/**
		Derives metadata from the `additionalTags` of an api entry:
		- `@:electron_platforms(["macOS", "Windows", "Linux", "MAS"])` the supported platforms (only if specific)
		- `@:deprecated` for deprecated entries
		- `@:electron_experimental` for experimental entries
	**/
	static function createTagMetadata(tags:Array<String>):Metadata {
		var meta:Metadata = [];
		if (tags == null)
			return meta;
		var platforms = [for (p in PLATFORM_TAGS) if (tags.contains(p.tag)) p.name];
		if (platforms.length > 0)
			meta.push({name: ':electron_platforms', params: [macro $a{platforms.map(p -> macro $v{p})}], pos: null});
		if (tags.contains('stability_deprecated'))
			meta.push({name: ':deprecated', pos: null});
		if (tags.contains('stability_experimental'))
			meta.push({name: ':electron_experimental', pos: null});
		return meta;
	}

	static function escapeArgument(name:String):String {
		return isValidIdentifier(name) ? name : name + '_';
	}

	/** Whether `name` can be used as is as a haxe field or argument name. **/
	static function isValidIdentifier(name:String):Bool
		return IDENTIFIER.match(name) && KEYWORDS.indexOf(name) == -1;

	public static inline function capitalize(s:String):String
		return s.charAt(0).toUpperCase() + s.substr(1);

	public static inline function uncapitalize(s:String):String
		return s.charAt(0).toLowerCase() + s.substr(1);
}
#end

// ---- electron-api.json structure ----

enum abstract ItemType(String) from String to String {
	var Module = "Module";
	var Class_ = "Class";
	var Structure = "Structure";
	var Element = "Element";
}

/** A (possibly nested) type: `type` is a type name or, for unions, an array of `TypeRef`. **/
typedef TypeRef = {
	?typeName:String,
	?type:Dynamic,
	collection:Bool,
	?properties:Array<Dynamic>,
	?innerTypes:Array<Dynamic>,
	?possibleValues:Array<PossibleValue>
}

typedef PossibleValue = {
	value:String,
	description:String,
}

/** Property, method/event parameter or class/element attribute. **/
typedef Property = {
	name:String,
	type:Dynamic,
	collection:Bool,
	?description:String,
	?properties:Array<Property>,
	?required:Bool,
	?possibleValues:Array<PossibleValue>,
	?innerTypes:Array<Dynamic>,
	?additionalTags:Array<String>,
	?urlFragment:String,
	// function typed properties
	?parameters:Array<Dynamic>,
	?returns:Dynamic,
}

typedef MethodParameter = Property;

typedef Return = {
	type:Dynamic,
	collection:Bool,
	?properties:Array<Property>,
	?innerTypes:Array<Dynamic>,
	?possibleValues:Array<PossibleValue>,
}

typedef Event = {
	name:String,
	?description:String,
	parameters:Array<Property>,
	?additionalTags:Array<String>,
	?urlFragment:String,
}

typedef Method = {
	name:String,
	?signature:String,
	?description:String,
	?returns:Return,
	?parameters:Array<MethodParameter>,
	?rawGenerics:String,
	?additionalTags:Array<String>,
	?urlFragment:String,
}

typedef Process = {
	var main:Bool;
	var renderer:Bool;
	var utility:Bool;
	var exported:Bool;
}

typedef Item = {
	name:String,
	description:String,
	?process:Process,
	version:String,
	type:ItemType,
	slug:String,
	websiteUrl:String,
	repoUrl:String,
	?extends_:String,
	// Module & Element
	?methods:Array<Method>,
	?properties:Array<Property>,
	?events:Array<Event>,
	?exportedClasses:Array<Dynamic>,
	?attributes:Array<Property>,
	// Class
	?instanceName:String,
	?instanceEvents:Array<Event>,
	?instanceProperties:Array<Property>,
	?instanceMethods:Array<Method>,
	?constructorMethod:Method,
	?staticMethods:Array<Method>,
	?staticProperties:Array<Property>,
}
