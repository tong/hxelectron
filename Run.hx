
import haxe.DynamicAccess;
import haxe.macro.Expr;
import haxe.Json;
import sys.FileSystem;
import sys.io.File;
import Sys.println;

using StringTools;

typedef APIProperty = {
	name : String,
	type : String,
	?description : String,
	?properties : Array<APIProperty>
}

typedef APIEvent = {
	name : String,
	?description : String,
	?platforms : Array<String>,
	returns : Array<APIReturn>
}

typedef APIMethodParameter = {
	name : String,
	type : String,
	description : String,
	properties : Array<APIProperty>
}

typedef APIReturn = {
	name : String,
	type : String,
	description : String,
	?properties : Array<APIProperty>
}

typedef APIMethod = {
	name : String,
	signature : String,
	description : String,
	returns : APIReturn,
	parameters : Array<APIMethodParameter>
}

@:enum abstract APIProcess(String) from String to String {
	var main_ = "main";
	var renderer = "renderer";
}

@:enum abstract APIType(String) from String to String {
	var module = "Module";
	var class_ = "Class";
	var structure = "Structure";
}

typedef APIItem = {
	name : String,
	description : String,
	process : APIProcess,
	type : APIType,
	slug : String,
	websiteUrl : String,
	repoUrl : String,
	methods : Array<APIMethod>,
	?instanceEvents : Array<APIEvent>,
	?instanceName : String,
	?instanceProperties : Array<APIProperty>,
	?instanceMethods : Array<APIMethod>,
	?constructorMethod : APIMethod,
	?staticMethods : Array<APIMethod>,
	?properties : Array<APIProperty>,
	?events : Array<APIEvent>, //TODO
};

typedef API = Array<APIItem>;

class Run {

	static var DEFAULT_API_SOURCE = 'electron-api.json';
	static var KWDS = [ 'class', 'switch' ];

	static var out = 'src';
	static var pack = [ 'electron' ];
	static var pos = { min: 0, max: 0, file: '' };

	static function main() {

		var file = Sys.args()[0];
		if( file == null ) file = DEFAULT_API_SOURCE;
		if( !FileSystem.exists( file ) ) error( 'API file not found [$file]' );

		var api : API = Json.parse( File.getContent( file ) );
		var types = new Array<TypeDefinition>();

		for( item in api ) {

			var name : String = item.name;
			var fields = new Array<Field>();

			println( '---------------------------- '+item.name );

			switch item.type {
			case class_:

				var sup : TypePath = null;

				if( item.instanceEvents != null ) {
					sup = {
						pack: ['js','node','events'], name: 'EventEmitter',
						params: [TPType(TPath( { pack: pack, name: name } ) )]
					};
					types.push( createEventAbstract( item.name, item.instanceEvents ) );
				}
				if( item.instanceProperties != null ) {
					for( p in item.instanceProperties ) {
						fields.push( {
							name: p.name,
							doc: p.description,
							kind: FVar( macro : Dynamic ), //TODO types of properties not availabale in description
							pos: pos
						} );
					}
				}
				if( item.constructorMethod != null ) {
					fields.push( convertMethod( item.constructorMethod ) );
				}
				if( item.instanceMethods != null ) {
					for( m in item.instanceMethods )
						fields.push( convertMethod(m) );
				}
				if( item.staticMethods != null ) {
					for( m in item.instanceMethods ) {
						fields.push( convertMethod( m, [AStatic] ) );
					}
				}

				types.push( createClassTypeDefinition( pack, name, sup, fields ) );

			case module:

				var sup : TypePath = null;

				if( item.events != null ) {
					sup = {
						pack: ['js','node','events'], name: 'EventEmitter',
						params: [TPType(TPath( { pack: pack, name: uppercaseName( name ) } ) )]
					};
					types.push( createEventAbstract( item.name, item.events ) );
				}

				if( item.methods != null ) {
					for( m in item.methods ) {
						var alreadyAdded = false;
						for( f in fields ) {
							if( f.name == m.name ) {
								alreadyAdded = true;
								break;
							}
						}
						if( alreadyAdded ) {
							warning( 'Duplicate module method name: '+item.name+'.'+m.name );
						} else {
							//trace(m);
							fields.push( convertMethod( m, [AStatic] ) );
						}
					}
				}

				/////// TODO / HACK
				if( name == 'app' ) {
					fields.push({
						{
							name: 'on',
							access: [AStatic],
							kind: FFun( { args: [
								{ name: 'eventType', type: macro:Dynamic },
								{ name: 'callback', type: macro:Dynamic->Void }
							], ret: macro: Void, expr: null } ),
							//doc: m.description,
							pos: pos
						}
					});
				}

				types.push( createClassTypeDefinition( pack, name, sup, fields ) );

			case structure:
				types.push({
					pos: pos,
					pack: pack,
					name: item.name,
					kind: TDStructure,
					fields: [for( p in item.properties )
						{
							name: p.name,
							doc: p.description,
							kind: FVar( convertType( p.type, p.properties ) ),
							pos: pos
						}
					]
				});
			}
		}

		/////// TODO / HACK missing from api description
		types.push({ pack: pack, name: 'Accelerator', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });
		types.push({ pack: pack, name: 'Any', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });
		//////////////////////////////////////////

		if( !FileSystem.exists( out ) ) FileSystem.createDirectory( out );

		var printer = new haxe.macro.Printer();
		var typePaths = new Array<String>();

		for( type in types ) {

			if( type.meta == null ) type.meta = [];

			type.meta.push({
				name: ':require',
				params: [ { expr: EConst( CString( 'electron' ) ), pos: pos } ],
				pos: pos
			});

			var pkg = type.pack.join( '.' );

			typePaths.push( '$pkg.${type.name}' );

			var dir = '$out/$pkg';
			if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
			//trace('$dir/${type.name}.hx');
			var code = printer.printTypeDefinition( type );
			File.saveContent( '$dir/${type.name}.hx', code );
		}

		File.saveContent( 'all.hxml', typePaths.join( '\n' ) );

		println( 'Generated [${types.length}] types into [$out]' );
	}

	static function createEventAbstract( name : String, events : Array<APIEvent> ) : TypeDefinition {
		var fields = new Array<Field>();
		for( e in events ) {
			var ename : String = e.name;
			fields.push({
				name: ename.replace( '-', '_' ),
				kind: FVar( macro : String, { expr: EConst(CString(ename)), pos: pos } ),
				doc: e.description,
				pos: pos
			});
		}
		return {
			pack: pack,
			fields: fields,
			name: uppercaseName( name )+'Event',
			kind: TDAbstract(macro:String,[macro:String],[macro:String]),
			meta: [ { name: ":enum", pos: pos } ],
			pos: pos
		};
	}

	static function createClassTypeDefinition( pack : Array<String>, name : String, ?sup : TypePath, fields : Array<Field> ) : TypeDefinition {
		return {
			pack: pack,
			name: name.charAt( 0 ).toUpperCase() + name.substr( 1 ),
			isExtern: true,
			kind: TDClass( sup ),
			fields: fields,
			meta: [
				{
					name: ":jsRequire",
					params: [
						{ expr: EConst( CString( 'electron' ) ), pos: pos },
						{ expr: EConst( CString( name ) ), pos: pos }
					],
					pos: pos
				}
			],
			pos: pos
		}
	}

	static function convertMethod( m : APIMethod, ?access : Array<Access> ) : Field {

		if( access == null ) access = [];

		var name = m.name;
		var ret = macro : Dynamic;

		if( m.returns != null )
			ret = convertType( m.returns.type, m.returns.properties );
		else if( name == null )
			ret = macro : Void;

		var args = new Array<FunctionArg>();
		if( m.parameters != null ) {
			for( p in m.parameters ) {
				args.push( {
					name: escapeName( p.name ),
					type: convertType( p.type, p.properties ),
					opt: (p.description == '(optional)')
				} );
			}
		}

		return {
			pos: pos,
			access: access,
			name: (m.name == null) ? 'new' : m.name,
            kind: FFun( { args: args, ret: ret, expr: null } ),
            doc: m.description
        };
	}

	static function convertType( type : String, ?properties : Array<Dynamic> ) : ComplexType {

		var fchar = type.charAt( 0 );
		if( fchar == fchar.toLowerCase() ) {
			warning( '??? lowercase type name: '+type );
			type = fchar.toUpperCase() + type.substr( 1 );
		}

		var isArray = if( type.endsWith( '[]' ) ) {
			type = type.substr( 0, type.length-2 );
			true;
		} else false;

		var ctype = switch type {
		case 'Bool','Boolean':
			macro : Bool;
		case 'Buffer':
			macro : js.node.Buffer;
		case 'Int','Integer':
			macro : Int;
		case 'Double','Float','Number':
			macro : Float;
		case 'Function':
			if( properties == null )
				macro : haxe.Constraints.Function;
			else
				TFunction(
					[for(prop in properties) convertType( prop.type, prop.properties )],
					macro : Dynamic
				);
		case 'Object':
			if( properties == null ) macro : Dynamic else {
				TAnonymous( [for(p in properties){
					name: escapeName( p.name ),
					kind: FVar( convertType( p.type, p.properties ) ),
					meta: [ { name: ":optional", pos: pos } ], //TODO
					pos: pos,
					doc: p.description
				}] );
			}
		case 'String':
			macro : String;
		case 'URL':
			//TODO
			macro : String;
			//macro : js.node.Url;
			//macro : js.html.URL;
		default:
			//macro : Dynamic;
			TPath( { pack: pack, name: type } );
		}

		return if( !isArray ) ctype else switch ctype {
			case TPath(p):
				TPath( { pack: [], name: 'Array<${p.name}>' } );
			default:
				throw 'failed to convert array type';
		};
	}

	static function uppercaseName( n : String ) : String {
		return n.charAt( 0 ).toUpperCase() + n.substr( 1 );
	}

	static function escapeName( n : String ) : String {
		return (KWDS.indexOf( n ) != -1) ? n+'_' : n;
	}

	static function warning( msg : String ) {
		println( '!!! WARNING '+msg );
	}

	static function error( info : String, code = -1 ) {
		println( info );
		Sys.exit( code );
	}
}
