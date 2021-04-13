
#if macro

import haxe.Json;
import haxe.macro.Context;
import haxe.macro.Expr;
import sys.FileSystem;
import sys.io.File;

using StringTools;
using haxe.macro.ComplexTypeTools;
using haxe.macro.MacroStringTools;
using haxe.macro.TypeTools;

class ElectronAPI {

	public static function generate( apiFile = 'electron-api.json', destination = 'src', clean = false, addDocumentation = true ) {

		if( !FileSystem.exists( apiFile ) )
			Context.fatalError( 'API description file [$apiFile] not found', Context.currentPos() );

		if( clean ) rmdir( destination );

		var items : Array<Item> = Json.parse( File.getContent( apiFile ) );
		var types = new Gen( ['electron'], addDocumentation ).process( items );
		var printer = new haxe.macro.Printer();
		for( tds in types ) {
			var type = tds[0];
			var code = printer.printTypeDefinition( type );
			if( tds.length > 1 ) {
				for( i in 1...tds.length ) {
					var e = tds[i];
					e.pack = [];
					code += '\n'+printer.printTypeDefinition( e );
				}
			}
			#if (haxe_ver < 4)
			var doc = getTypeDoc( type, items );
			if( doc != null ) {
				var lines = code.split( '\n' );
				code = lines.shift()+'\n';
				code += '/**'+doc+'\n**/\n'; //!!!!
				code += lines.join( '\n' );
			}
			#end

			var dir = destination + '/' + type.pack.join( '/' );
			if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
			File.saveContent( '$dir/${type.name}.hx', '$code\n' );
		}
		
		// postprocess: make remote modules
		var main = 'src/electron/main';
		var remote = 'src/electron/remote';
		var regex = ~/@:jsRequire\("electron", "(\w*)"\)/;
		if( !FileSystem.exists( remote ) ) FileSystem.createDirectory( remote );
		for(item in items) {
			if( ( item.type == Module || item.type == Class_ ) && item.process != null && item.process.main ) {
				try {
					var name = Gen.capitalize( item.name );
					var content = File.getContent( '$main/$name.hx' );
					var patched = regex.replace( content.replace( 'electron.main', 'electron.remote' ), '@:jsRequire("electron", "remote.$1")' );
					if( item.name == 'screen' ) {
						// TODO: https://github.com/fponticelli/hxelectron/issues/29
						patched = patched.replace("@:native('require(\\\"electron\\\").screen')", "@:native('require(\\\"electron\\\").remote.screen')");
					}
					File.saveContent( '$remote/$name.hx', patched );
				} catch( e:Dynamic ) {
					// trace( e ); 
				}
			}
		}
		
	}

	static function rmdir( path : String ) {
		if( FileSystem.exists( path ) ) {
			for( e in FileSystem.readDirectory( path ) ) {
				var p = '$path/$e';
				FileSystem.isDirectory( p ) ? rmdir( p ) : FileSystem.deleteFile( p );
			}
			FileSystem.deleteDirectory( path );
		}
	}

	#if (haxe_ver < 4)
	static function getTypeDoc( type : TypeDefinition, items : Array<Item> ) : String {
		for( item in items ) {
			if( item.name == type.name ) {
				var doc = '';
				if( item.description != null ) doc += '\n\t'+item.description;
				if( item.websiteUrl != null ) doc += '\n\t@see '+item.websiteUrl;
				return doc;
			}
		}
		return null;
	}
	#end
}

private class Gen {

	static var KWDS = ['class','private','switch'];

	var root : Array<String>;
	var addDocumentation : Bool;
	var items : Array<Item>;
	var types = new Map<String,TypeDefinition>();
	var extraTypes = new Map<String,Array<TypeDefinition>>();

	public function new( ?root : Array<String>, addDocumentation = true ) {
		this.root = (root != null) ? root : [];
		this.addDocumentation = addDocumentation;
	}

	public function process( items : Array<Item> ) : Map<String,Array<TypeDefinition>> {

		this.items = items;

		// Pre patch
		function addAlias( name : String, ?type : ComplexType, ?pack : Array<String> ) {
			if( type == null ) type = macro : Dynamic;
			var _pack = root.copy();
			if( pack != null ) _pack = _pack.concat( pack );
			this.types.set( name, {
				pack: _pack,
				name: name,
				kind: TDAlias( type ),
				fields: [],
				pos: null
			} );
		}
		addAlias( 'Partial' );
		addAlias( 'Record' );
		addAlias( 'SaveDialogOptions' );
		addAlias( 'MessagePort' );
		addAlias( 'PopupOptions' );
		this.types.set( 'Accelerator', {
			pack: root.copy(),
			name: 'Accelerator',
			kind: TDAbstract( macro:String, [macro:String], [macro:String] ),
			fields: [],
			pos: null
		} );

		for( item in items ) {
			//if( item.name != 'WebContents' ) continue;
			this.types.set( item.name, processItem( item ) );
		}

		var map = new Map<String,Array<TypeDefinition>>();
		for( t in types ) {
			map.set( t.name, extraTypes.exists( t.name ) ? [t].concat( extraTypes.get( t.name ) ) : [t] );
		}

		return map;
	}

	function processItem( item : Item, ?module : String ) : TypeDefinition {

		var type : TypeDefinition = {
			pack: getItemPack( item ),
			name: item.name,
			isExtern: item.type != Structure,
			kind: null,
			fields: [],
			meta: [],
			pos: null
		};

		if( addDocumentation ) {
			#if haxe4
			type.doc = '';
			if( item.description != null && item.description.length > 0 ) type.doc += item.description+'\n';
			type.doc += '@see '+item.websiteUrl;
			#end
		}

		switch item.type {
		case Class_:
			var sup : TypePath = if( item.instanceEvents == null ) null else {
				createEventEnumAbstract( type.name, type.pack, item.instanceEvents );
				{ pack: ['js','node','events'], name: 'EventEmitter', params: [TPType( TPath( { name: type.name, pack: type.pack } ) )] };
			}
			type.kind = TDClass( sup );
			var jsRequireName = item.name;
			if( module != null ) jsRequireName = module+'.'+jsRequireName;
			type.meta.push( { name: ':jsRequire', params: [macro $v{'electron'}, macro $v{jsRequireName}], pos: null } );
			if( item.staticMethods != null ) for( m in item.staticMethods ) type.fields.push( createFunField( m, [AStatic] ) );
			if( item.instanceProperties != null ) for( p in item.instanceProperties ) type.fields.push( createVarField( p ) );
			if( item.constructorMethod != null ) type.fields.push( createFunField( cast { name: 'new', parameters:  item.constructorMethod.parameters } ) );
			if( item.instanceMethods != null ) for( m in item.instanceMethods ) type.fields.push( createFunField( m ) );
			/*TODO:
			if( item.staticProperties != null ) {
				for( p in item.staticProperties ) {
					var t = processItem( cast p, type.name );
					if( !this.extraTypes.exists( type.name ) ) this.extraTypes.set( type.name, [t] );
					else this.extraTypes.get( type.name ).push( t );
				}
			}
			*/
			mergeTypeItem( type, item );

		case Module:
			type.name = capitalize( item.name );
			type.meta.push({ name: ':jsRequire', params: [macro $v{'electron'}, macro $v{item.name}], pos: null });
			var sup : TypePath = if( item.events == null ) null else {
				createEventEnumAbstract( type.name, type.pack, item.events );
				{ pack: ['js','node','events'], name: 'EventEmitter', params: [TPType( TPath( { name: type.name, pack: type.pack } ) )] };
			}
			type.kind = TDClass( sup );
			if( item.properties != null ) for( p in item.properties ) type.fields.push( createVarField( p, [AStatic] ) );
			if( item.methods != null ) for( m in item.methods ) type.fields.push( createFunField( m, [AStatic] ) );
			mergeTypeItem( type, item );

		case Structure:
			type.kind = TDStructure;
			if( item.properties != null ) for( p in item.properties ) type.fields.push( createVarField( p ) );

		case Element:
			type.name = capitalize( item.name );
			type.kind = TDClass({ pack: ['js','html'], name: 'Element' });
			type.meta.push( { name: ':native', params: [macro $v{item.name}], pos: null } );
			if( item.attributes != null ) for( a in item.attributes ) type.fields.push( createVarField( a ) );
			if( item.methods != null ) for( m in item.methods ) type.fields.push( createFunField( m ) );
			//TODO domEvents
			//if( item.domEvents != null ) {
		}

		if( type.kind != null ) {
			// Create @:overload for duplicate method definitions
			switch type.kind {
			#if (haxe_ver < 4)
			case TDClass(superClass,interfaces,isInterface):
			#else
			case TDClass(superClass,interfaces,isInterface,isFinal):
			#end
				var i = 0;
				while( i < type.fields.length ) {
					var a = type.fields[i];
					var j = 0;
					while( j < type.fields.length ) {
						if( j != i ) {
							var b = type.fields[j];
							if( a.name == b.name ) {
								type.fields.splice( i, 1 );
								var expr : Expr = null;
								switch a.kind {
								case FFun(f):
									f.expr = { expr: EBlock([]), pos: Context.currentPos() };
									expr = { expr: EFunction( null, f ), pos: Context.currentPos() };
								default:
								}
								b.meta.push( { name: ':overload', params: [expr], pos: Context.currentPos() } );
							}
						}
						j++;
					}
					i++;
				}
			default:
			}
		} else {
			//trace(type);
			type.kind = TDClass();
			///type.kind = TDAlias( macro : Dynamic );
		}

		// Post patch

		function patchEventListenerMethods() {
			//var eType = extraTypes.get( type.name );
			type.fields.push( {
				name: 'on',
				access: [AStatic],
				kind: FFun( {
					params: [
						{ name: 'T', constraints: [macro:haxe.Constraints.Function] },
					], 
					args: [
						{ name: 'eventType', type: macro : Dynamic }, //TODO
						{ name: 'callback', type: macro:T }
					],
					ret: macro : Void,
					expr: null
				} ),
				pos: null
			} );
		}

		switch type.name {
		case 'App','InAppPurchase':
			patchEventListenerMethods();
		case 'Screen':
			// TODO: https://github.com/fponticelli/hxelectron/issues/29
			for( i in 0...type.meta.length ) {
				if( type.meta[i].name == ':jsRequire' ) {
					type.meta.splice( i, 1 );
					type.meta.push( { name: ':native', params: [macro 'require("electron").screen'], pos: null } );
					break;
				}
			}
		case 'PostBody': // TODO: https://github.com/tong/hxelectron/issues/51
			for( f in type.fields ) {
				if( f.name == "data" ) {
					f.kind = FVar( TPath( { name : "Array<PostData>", pack : [], params : [] } ), null );
					break;
				}
			}
		}
		return type;
	}

	function getItemPack( item : Item ) : Array<String> {
		var pack = root.copy();
		if( item.process != null && (!item.process.main || !item.process.renderer) ) {
			if( item.process.main ) pack.push( 'main' );
			else if( item.process.renderer ) pack.push( 'renderer' );
		}
		return pack;
	}

	function mergeTypeItem( type : TypeDefinition, item : Item ) {
		var name = if( item.type == Module ) capitalize( item.name ) else uncapitalize( item.name );
		if( types.exists( name ) ) {
			//trace("ALREADY EXISTS "+name );
			var t = types.get( name );
			types.remove( name );
			type.fields = (item.type == Module) ? type.fields.concat( t.fields ) : t.fields.concat( type.fields );
		}
	}

	function createEventEnumAbstract( name : String, pack : Array<String>, events : Array<Event> ) {
		var _name = name+'Event';
		var type : TypeDefinition = null;
		if( extraTypes.exists( name ) ) {
			for( et in extraTypes.get( name ) ) {
				if( et.name == _name ) {
					type = et;
					break;
				}
			}
		} else {
			type = {
				name: _name,
				pack: pack,
				params: [{ name: 'T', constraints: [macro:haxe.Constraints.Function] }],
				kind: TDAbstract(macro:js.node.events.EventEmitter.Event<T>,[],[macro:js.node.events.EventEmitter.Event<T>]),
				fields: [],
				meta: [{ name: ":enum", pos: null }],
				pos: null
			};
			this.extraTypes.set( name, [type] );
		}
		for( e in events ) {
			var params : Array<TypeParam> = if( e.returns == null ) [TPType(macro : Void->Void)] else {
				[TPType( TFunction( [for(r in e.returns) getComplexType( r.type, r.collection, !r.required )], macro : Void ) )];
			}
			type.fields.push({
				name: e.name.replace( '-', '_' ),
				kind: FVar( TPath( { pack: pack, name: _name, params: params } ), macro $v{e.name} ),
				meta: (e.platforms == null ) ? null : [createPlatformMetadata(e)],
				doc: getDoc( e.description ),
				pos: null
			});
		}
		/*
		var fields = [];
		for( e in events ) {
			var params : Array<TypeParam> = if( e.returns == null ) [TPType(macro : Void->Void)] else {
				[TPType( TFunction( [for(r in e.returns) getComplexType( r.type, r.collection, !r.required )], macro : Void ) )];
			}
			fields.push({
				name: e.name.replace( '-', '_' ),
				kind: FVar( TPath( { pack: pack, name: _name, params: params } ), macro $v{e.name} ),
				meta: (e.platforms == null ) ? null : [createPlatformMetadata(e)],
				doc: getDoc( e.description ),
				pos: null
			});
		}
		var type = {
			name: _name,
			pack: pack,
			params: [{ name: 'T', constraints: [macro:haxe.Constraints.Function] }],
			kind: TDAbstract(macro:js.node.events.EventEmitter.Event<T>,[],[macro:js.node.events.EventEmitter.Event<T>]),
			fields: fields,
			meta: [{ name: ":enum", pos: null }],
			pos: null
		};
		if( !this.extraTypes.exists( name ) ) this.extraTypes.set( name, [type] );
		else this.extraTypes.get( name ).push( type );
		*/
	}

	function createVarField( p : Property, ?access : Array<Access> ) : Field {
		return createField( p.name, FVar( getComplexType( p.type, p.collection, p.properties ), null ), access, null, p.description );
	}

	function createFunField( m : Method, ?access : Array<Access> ) : Field {

		var meta : Metadata = [];
		if( m.platforms != null ) meta.push( createPlatformMetadata( m ) );

		var args = new Array<FunctionArg>();
		if( m.parameters != null ) {
			for( p in m.parameters ) {
				switch p.name {
				case '...args':
					args.push( {
						name: 'args',
						type: macro : haxe.extern.Rest<Any>,
						opt: false // Haxe doesn't allow rest args to be optional.
					} );
				default:
					args.push( {
						name: escapeArgument( p.name ),
						type: getComplexType( p.type, p.collection, p.properties, null, p.possibleValues ),
						opt: (p.required == null) ? true : !p.required
					} );
				}
			}
		}

		var ret = if( m.returns == null ) macro : Void else {
			//TODO: handle return doc
			getComplexType( m.returns.type, m.returns.collection );
		}

		return createField( m.name, FFun( { args: args, ret: ret, expr: null } ), access, meta, m.description );
	}

	function createField( name : String, kind : FieldType, access : Array<Access>, ?meta : Metadata, ?doc : String  ) : Field {
		//var kwds = ['class','private','switch'];
		var expr = ~/^([A-Za-z_])([A-Za-z0-9_]*)$/i; //TODO: test/improve
		if( !expr.match( name ) || KWDS.indexOf( name ) != -1  ) {
			//trace("INVALID TYPE NAME: "+name);
			var _name = '_'+name;
			if( meta == null ) meta = [];
			meta.push( { name: ':native', params: [macro $v{name}], pos: null } );
			name = _name;
		}
		return { name: name, access: access, kind: kind, meta: meta, doc: getDoc( doc ), pos: null }
	}

	function createMultiType( types : Array<{typeName:String,collection:Bool,?properties:Array<Dynamic>}> ) : ComplexType {
		function createEitherType( remain : Array<{typeName:String,collection:Bool,?properties:Array<Dynamic>}> ) {
			var params = new Array<TypeParam>();
			var t1 = remain.shift();
			params.push( TPType( getComplexType( t1.typeName, t1.collection, t1.properties ) ) );
			params.push( (remain.length > 1)
				? TPType( createEitherType( remain ) )
				: TPType( getComplexType( remain[0].typeName, remain[0].collection, remain[0].properties ) )
			);
			return TPath( { pack: ['haxe','extern'], name: 'EitherType', params: params } );
		}
		return createEitherType( types );
	}

	function getComplexType( name, collection = false, ?properties : Array<Dynamic>, optional = false, ?possibleValues : Array<PossibleValue> ) : ComplexType {
		var t : ComplexType = switch name {
		case 'undefined': macro : Dynamic;
		case null,'null': macro : Dynamic;
		case 'Accelerator': // TODO: HACK
			TPath( { name: name, pack: root.copy() } );
		case 'Any','any': macro : Any;
		case 'Blob': macro : js.html.Blob;
		case 'Bool','Boolean','boolean': macro : Bool;
		case 'Buffer': macro : js.node.Buffer;
		case 'Date': macro : Date;
		case 'NodeJS.Process': macro : js.node.Process; // HACK
		case 'NodeJS.Require': macro : Dynamic; // HACK TODO
		case 'Double','Float','Number','number': macro : Float;
		case 'Dynamic': macro : Dynamic; // Allows to explicit set type to Dynamic
		case 'Error':
			#if (haxe_ver>=4)
			macro : js.lib.Error;
			#else
			macro : js.Error;
			#end
		case 'Event': macro : js.html.Event;
		case 'Function','VoidFunction':
			//TODO:
			//trace("Function",properties);
			macro : haxe.Constraints.Function;
		case 'Integer': macro : Int;
		case 'Object':
			if( properties == null || properties.length == 0 ) macro : Any else {
				var fields = new Array<Field>();
				for( p in properties ) {
					var meta : Metadata = [];
					if( p.required != null && !p.required ) meta.push( { name: ":optional", pos: null } );
					if( p.platforms != null ) meta.push( createPlatformMetadata( p ) );
					fields.push({
						name: p.name,
						kind: FVar( getComplexType( p.type, p.collection, p.properties ) ),
						meta: meta,
						doc: getDoc( p.description ),
						pos: null
					});
				}
				TAnonymous( fields );
			}
		case 'Promise':
			#if (haxe_ver>=4)
			macro : js.lib.Promise<Any>;
			#else
			macro : js.Promise<Any>;
			#end
		case 'String','string':
			if( possibleValues != null ) {
				//TODO create abstract @:enum
			}
			macro: String;
		case 'ReadableStream':
			//TODO: type param
			macro : js.node.stream.Readable<Dynamic>; //macro : js.node.stream.Readable.IReadable;
		case 'MenuItemConstructorOptions','TouchBarItem': // TODO: HACK
			macro : Dynamic;
		case 'URL': macro: String; // TODO: macro: js.html.URL;
		case _ if( Std.is( name, Array ) ):
			createMultiType( cast name );
		case "'rawData'": // HACK
			macro : js.node.Buffer; 
		case "'file'": // HACK
			macro : String; 
		default:
			var pack = [];
			for( item in this.items ) {
				if( item.name == name || item.name == uncapitalize( name ) ) {
					pack = getItemPack( item );
					break;
				}
			}
			//if( pack.length == 0 ) Context.warning( '[$name] not found', Context.currentPos() );
			TPath( { name: name, pack: pack } );
		}
		if( collection ) t = TPath( { name: 'Array<${t.toString()}>', pack: [] } );
		if( optional ) t = TOptional( t );
		return t;
	}

	function getDoc( s : String ) : String {
		if( !addDocumentation || s == null )
			return null;
		s = s.trim();
		return (s.length == 0) ? null : s;
	}

	static function createPlatformMetadata( e : { ?platforms : Array<String> } ) : MetadataEntry {
		if( e.platforms == null )
			return null;
		var ereg = ~/^\(*([a-zA-Z]+)( +\(([a-zA-Z]+)\))?\)*$/;
		var flags = new Array<String>();
		for( p in e.platforms ) {
			if( ereg.match( p ) ) {
				flags.push( ereg.matched(1) );
				if( ereg.matched(3) != null ) flags.push( ereg.matched(3) );
			} else {
				Context.warning( 'unknown platform restriction [$p]', Context.currentPos() );
				return null;
			}
		}
		return {
			name: ':electron_platforms',
			params: [macro $a{ flags.map( function(p) return macro $v{p} ) }],
			pos: null
		}
	}

	static function escapeArgument( name : String ) : String {
		var expr = ~/^([A-Za-z_])([A-Za-z0-9_]*)$/i; //TODO: test/improve
		if( !expr.match( name ) || KWDS.indexOf( name ) != -1  ) {
			return name+'_';
		}
		return name;
	}
	
	public static inline function capitalize( s : String ) : String
		return s.charAt( 0 ).toUpperCase() + s.substr( 1 );

	public static inline function uncapitalize( s : String ) : String
		return s.charAt( 0 ).toLowerCase() + s.substr( 1 );
}

#end

@:enum abstract ItemType(String) from String to String {
	var Module = "Module";
	var Class_ = "Class";
	var Structure = "Structure";
	var Element = "Element";
}

@:enum abstract Platform(String) from String to String {
	var MacOS = "macOS";
	var Windows = "Windows";
	var Linux = "Linux";
	var Experimental = "Experimental";
	var Deprecated = "(Deprecated)";
}

typedef Property = {
	name : String,
	type : String,
	collection: Bool,
	?description : String,
	?properties : Array<Property>
	// TODO: ?required
	// TODO: ?possibleValues
	// TODO: ?additionalTags : Array<String>
}

typedef Event = {
	name : String,
	?description : String,
	?platforms : Array<Platform>,
	returns : Array<Return>
}

typedef MethodParameter = {
	name : String,
	type : String,
	description : String,
	collection: Bool,
	properties : Array<Property>,
	required: Null<Bool>,
	?possibleValues : Array<PossibleValue>
}

typedef PossibleValue = {
	value : String,
	description : String,
}

typedef Return = {
	name : String,
	type : String,
	description : String,
	collection: Bool,
	?properties : Array<Property>,
	required: Null<Bool>,
	?possibleValues : Array<PossibleValue>
}

typedef Method = {
	name : String,
	signature : String,
	description : String,
	returns : Return,
	parameters : Array<MethodParameter>,
	platforms : Array<Platform>
}

typedef Process = {
	var main : Bool;
	var renderer : Bool;
}

typedef Item = {
	name : String,
	description : String,
	?process : Process,
	version : String,
	type : ItemType,
	slug : String,
	websiteUrl : String,
	repoUrl : String,
	methods : Array<Method>,
	?instanceEvents : Array<Event>,
	?instanceName : String,
	?instanceProperties : Array<Property>,
	?instanceMethods : Array<Method>,
	?constructorMethod : Method,
	?staticMethods : Array<Method>,
	?staticProperties : Array<Property>,
	?properties : Array<Property>,
	?events : Array<Event>,
	?attributes : Array<Dynamic>,
	//?domEvents : Array<Dynamic>,
	?domEvents : Array<Event>,
}
