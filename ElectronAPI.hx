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
			patchType(type);
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

	/** Manual fixes for types the description file gets wrong. **/
	static function patchType(type:TypeDefinition) {
		if (type.name == "UtilityProcess") {
			for (f in type.fields) {
				if (f.name == "fork") {
					switch f.kind {
						case FFun({ret: TPath(p)}):
							p.pack = ['electron'];
						case _:
					}
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
	static var KWDS = ['class', 'private', 'switch'];
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

	public function new(?root:Array<String>, addDocumentation = true) {
		this.root = (root != null) ? root : [];
		this.addDocumentation = addDocumentation;
	}

	public function process(items:Array<Item>):Map<String, Array<TypeDefinition>> {
		this.items = items;

		// Types which are referenced by the description but not defined
		function addAlias(name:String, ?type:ComplexType) {
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
		addAlias('GlobalRequest');
		addAlias('MessagePort');
		addAlias('Partial');
		addAlias('PopupOptions');
		addAlias('SaveDialogOptions');

		for (item in items)
			this.types.set(item.name, processItem(item));

		var map = new Map<String, Array<TypeDefinition>>();
		for (t in types)
			map.set(t.name, extraTypes.exists(t.name) ? [t].concat(extraTypes.get(t.name)) : [t]);
		return map;
	}

	function processItem(item:Item):TypeDefinition {
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
				mergeTypeItem(type, item);

			case Structure:
				var fields = [];
				if (item.properties != null)
					for (p in item.properties)
						fields.push(createVarField(p));
				var extType = (item.extends_ != null) ? getComplexType(item.extends_) : null;
				if (extType != null && isElectronType(extType)) {
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
			case 'App', 'InAppPurchase':
				// events are not typed per event name
				type.fields.push({
					name: 'on',
					access: [AStatic],
					kind: FFun({
						params: [{name: 'T', constraints: [macro :haxe.Constraints.Function]}],
						args: [
							{name: 'eventType', type: macro :Dynamic}, // TODO
							{name: 'callback', type: macro :T}
						],
						ret: macro :Void,
						expr: null
					}),
					pos: null
				});
			case 'Process':
				for (m in type.meta)
					if (m.name == ':jsRequire') {
						m.params.shift();
						break;
					}
		}
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
			type.fields = (item.type == Module) ? type.fields.concat(t.fields) : t.fields.concat(type.fields);
		}
	}

	/** Creates the event enum abstract and returns the `EventEmitter` super class. **/
	function createEventEmitter(type:TypeDefinition, events:Array<Event>):TypePath {
		createEventEnumAbstract(type.name, type.pack, events);
		return {pack: ['js', 'node', 'events'], name: 'EventEmitter', params: [TPType(TPath({name: type.name, pack: type.pack}))]};
	}

	function createEventEnumAbstract(name:String, pack:Array<String>, events:Array<Event>) {
		var _name = name + 'Event';
		var type:TypeDefinition = null;
		if (extraTypes.exists(name)) {
			for (et in extraTypes.get(name)) {
				if (et.name == _name) {
					type = et;
					break;
				}
			}
		} else {
			type = {
				name: _name,
				pack: pack,
				params: [{name: 'T', constraints: [macro :haxe.Constraints.Function]}],
				kind: TDAbstract(macro :js.node.events.EventEmitter.Event<T>, [AbEnum], [macro :js.node.events.EventEmitter.Event<T>]),
				fields: [],
				pos: null
			};
			this.extraTypes.set(name, [type]);
		}
		for (e in events) {
			var args = [for (p in e.parameters) getComplexType(p.type, p.collection, p.properties, !p.required)];
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
		return createField(p.name, FVar(getComplexType(p.type, p.collection, p.properties), null), access, meta, p.description);
	}

	function createFunField(m:Method, ?access:Array<Access>):Field {
		var meta = createTagMetadata(m.additionalTags);

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
							type: getComplexType(p.type, p.collection, p.properties, false, p.possibleValues),
							opt: (p.required == null) ? true : !p.required
						});
				}
			}
		}

		// TODO: handle return doc
		var ret = if (m.returns == null) macro :Void else getComplexType(m.returns.type, m.returns.collection);

		return createField(m.name, FFun({args: args, ret: ret, expr: null}), access, meta, m.description);
	}

	function createField(name:String, kind:FieldType, access:Array<Access>, ?meta:Metadata, ?doc:String):Field {
		var expr = ~/^([A-Za-z_])([A-Za-z0-9_]*)$/i; // TODO: test/improve
		if (!expr.match(name) || KWDS.indexOf(name) != -1) {
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
			var params = [TPType(getComplexType(t1Name, t1.collection, t1.properties))];
			if (remain.length > 1) {
				params.push(TPType(createEitherType(remain)));
			} else {
				var t2Name = getTypeName(remain[0]);
				if (t2Name == null)
					throw 'cannot resolve type name';
				params.push(TPType(getComplexType(t2Name, remain[0].collection, remain[0].properties)));
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
			return getComplexType(getTypeName(merged[0]), merged[0].collection, merged[0].properties);
		return createEitherType(merged);
	}

	function getComplexType(name:Dynamic, collection = false, ?properties:Array<Dynamic>, optional = false, ?possibleValues:Array<PossibleValue>):ComplexType {
		var t:ComplexType = switch name {
			case 'this': macro :Dynamic;
			case 'undefined': macro :Dynamic;
			case null, 'null': macro :Dynamic;
			case 'Accelerator': // TODO: HACK
				TPath({name: name, pack: root.copy()});
			case 'Any', 'any': macro :Any;
			case 'unknown': macro :Dynamic;
			case 'Array': macro :Array<Dynamic>; // TODO HACK for fields with Array type without type param
			case 'UserDefaultTypes[Type]': macro :Dynamic; // TODO HACK for invalid description
			case 'Blob': macro :js.html.Blob;
			case 'T': macro :String; // HACK: generic `<T extends string>` (ClipboardItem.getType)
			case 'Record': macro :Dynamic; // TS Record<K, V>
			case 'ArrayBufferLike': macro :js.lib.ArrayBuffer;
			case 'ArrayBufferView': macro :js.lib.ArrayBufferView;
			case 'Boolean', 'boolean': macro :Bool;
			case 'Buffer': macro :js.node.Buffer;
			case 'Date': macro :Date;
			case '[number, number]': macro :Array<Float>; // HACK
			case 'Double', 'Float', 'Number', 'number': macro :Float;
			case 'Electron.ParentPort': return macro :electron.ParentPort;
			case 'Error': macro :js.lib.Error;
			case 'Event': macro :js.html.Event;
			case 'Function': macro :haxe.Constraints.Function; // TODO
			case 'Integer': macro :Int;
			case 'Object':
				if (properties == null || properties.length == 0) macro :Any else {
					var fields = new Array<Field>();
					for (p in properties) {
						var meta = createTagMetadata(p.additionalTags);
						if (p.required != null && !p.required)
							meta.push({name: ":optional", pos: null});
						fields.push({
							name: p.name,
							kind: FVar(getComplexType(p.type, p.collection, p.properties)),
							meta: meta,
							doc: getDoc(p.description),
							pos: null
						});
					}
					TAnonymous(fields);
				}
			case 'Promise': macro :js.lib.Promise<Any>;
			case 'String': macro :String; // TODO: create abstract enum from possibleValues
			case 'ReadableStream', 'NodeJS.ReadableStream':
				// TODO: type param
				macro :js.node.stream.Readable<Dynamic>;
			case 'MenuItemConstructorOptions', 'TouchBarItem': // TODO: HACK
				macro :Dynamic;
			case 'URL': macro :String; // TODO: macro: js.html.URL;
			case _ if (Std.isOfType(name, Array)):
				createMultiType(cast name);
			case "'rawData'": // HACK:
				macro :js.node.Buffer;
			case _ if (isStringLiteral(name)): // e.g. 'file'
				macro :String;
			case _ if (StringTools.startsWith(name, 'typeof ')):
				// reference to a class, e.g. `typeof WebSocket` -> Class<WebSocket>
				var ref = getComplexType(StringTools.trim(name.substr(7)));
				TPath({pack: [], name: 'Class', params: [TPType(ref)]});
			case "(...args: any[]) => any": // HACK:
				macro :Dynamic;
			case "(options: BrowserWindowConstructorOptions) => WebContents": // HACK:
				macro :Dynamic;
			case "RequestInit & { bypassCustomProtocolHandlers?: boolean }": // HACK:
				macro :js.html.RequestInit;
			default:
				var pack = [];
				for (item in this.items) {
					if (item.name == name || item.name == uncapitalize(name)) {
						pack = getItemPack(item);
						break;
					}
				}
				TPath({name: name, pack: pack});
		}
		if (collection)
			t = TPath({name: 'Array<${t.toString()}>', pack: []});
		if (optional)
			t = TOptional(t);
		return t;
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
		var expr = ~/^([A-Za-z_])([A-Za-z0-9_]*)$/i; // TODO: test/improve
		if (!expr.match(name) || KWDS.indexOf(name) != -1)
			return name + '_';
		return name;
	}

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
