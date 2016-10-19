
import haxe.DynamicAccess;
import haxe.macro.Expr;
import haxe.Json;
import sys.FileSystem;
import sys.io.File;
import Sys.println;

using StringTools;

class Run {

	static var DEFAULT_API_SOURCE = 'electron-api.json';
	static var KWDS = [ 'class', 'switch' ];

	static var out = 'src';
	static var pack = [ 'electron' ];

	static var pos = { min: 0, max: 0, file: '' };
	static var printer : haxe.macro.Printer;

	static function main() {

		var file = Sys.args()[0];
		if( file == null ) file = DEFAULT_API_SOURCE;
		if( !FileSystem.exists( file ) ) error( 'API file not found [$file]' );

		var api : Array<Dynamic> = Json.parse( File.getContent( file ) );
		var types = new Array<TypeDefinition>();

		for( item in api ) {

			//if( item.name != 'BrowserWindow' ) continue;
			//println("------------------------------------------------------- "+item.type+'\t'+item.name );
			//traceJson( item );

			var name : String = item.name;
			var fields = new Array<Field>();

			switch item.type {

			case 'Class':

				var sup = null;

				if( item.instanceEvents != null ) {

					sup = {
						pack: ['js','node','events'],
						name: 'EventEmitter',
						params: [TPType(TPath( { name: name, pack:pack } ) )]
					};

					var efields = new Array<Field>();
					for( e in cast( item.instanceEvents, Array<Dynamic> ) ) {
						var name : String = e.name;
						efields.push({
							name: name.replace( '-', '_' ),
							kind: FVar( macro : String, { expr: EConst(CString(name)), pos: pos } ),
							doc: e.description,
							pos: pos
						});
					}
					types.push({
						pack: pack,
						fields: efields,
						name: name+'Event',
						kind: TDAbstract(macro:String,[macro:String],[macro:String]),
						meta: [ { name: ":enum", pos: pos } ],
						pos: pos
					});
				}

				if( item.instanceProperties != null ) {
					for( p in cast( item.instanceProperties, Array<Dynamic> ) ) {
						//TODO
						trace(p);
						//f.access.push( AStatic );
						fields.push( {
							pos: pos,
							name: p.name,
							doc: p.description,
							kind: FVar( macro:Dynamic )
						} );
					}
				}

				if( item.constructorMethod != null ) {
					fields.push( convertMethod( item.constructorMethod ) );
				}

				if( item.instanceMethods != null ) {
					for( m in cast( item.instanceMethods, Array<Dynamic> ) ) {
						fields.push( convertMethod( m ) );
					}
				}

				if( item.staticMethods != null ) {
					for( m in cast( item.staticMethods, Array<Dynamic> ) ) {
						var f = convertMethod( m );
						f.access.push( AStatic );
						fields.push( f );
					}
				}

				types.push( {
	                pos: pos,
	                pack: pack,
	                name: name,
	                isExtern: true,
	                kind: TDClass( sup ),
	                fields: fields,
					meta: [
						{
							name: ":jsRequire",
							params: [
								{ expr: EConst( CString( 'electron' ) ), pos: pos },
								{ expr: EConst( CString( item.name ) ), pos: pos }
							],
							pos: pos
						}
					]
	            } );

			case 'Module':

				name = name.charAt( 0 ).toUpperCase() + name.substr( 1 );
				var sup = null;

				if( item.methods != null ) {
					for( m in cast( item.methods, Array<Dynamic> ) ) {
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
							var f = convertMethod( m );
							f.access.push( AStatic );
							fields.push( f );
						}
					}
				}

				if( item.events != null ) {
					//TODO is eventemitter
					/*
					sup = {
						name: 'EventEmitter',
						pack: ['js','node','events'],
						params: [TPType(TPath( { name: name, pack:pack } ) )]
					};
					*/

					//TPath( { name:'EventEmitter', pack:['js','node'] } );

					/*
					for( e in cast( item.events, Array<Dynamic> ) ) {
						trace(e);
					}
					*/
				}

				///////////////////////////
				//TODO
				//if( EVENT_EMITTER_SUB_MODULES.indexOf( name ) != -1 ) {
				if( name == 'App' ) {
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

				/*
				if( name == 'App' ) {
					sup = {
						pack: [],
						name: 'js.node.events.EventEmitter',
						params: [
							TPType( TPath( { pack: [], name: name } ) )
						]
					};
				}
				*/

				types.push( {
	                pos: pos,
	                pack: ["electron"],
	                name: name,
	                isExtern: true,
	                kind: TDClass( sup ),
	                fields: fields,
	                meta: [
						{
							name: ":jsRequire",
							params: [
								{ expr: EConst( CString( 'electron' ) ), pos: pos },
								{ expr: EConst( CString( item.name ) ), pos: pos }
							],
							pos: pos
						}
					]
	            } );

			case 'Structure':
				types.push( {
	                pos: pos,
	                pack: ["electron"],
	                name: item.name,
	                //isExtern: true,
	                kind: TDStructure,
	                fields: fields,
	                meta: []
	            } );

			default:
				trace( "?????" );
			}
		}

		/////// TODO / HACK missing from api description
		types.push({ pack: pack, name: 'Accelerator', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });
		types.push({ pack: pack, name: 'Any', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });

		if( !FileSystem.exists( out ) )
			FileSystem.createDirectory( out );

		printer = new haxe.macro.Printer();

		var typePaths = new Array();

		for( type in types ) {

			if( type.meta == null ) type.meta = [];

			type.meta.push({
				name: ':require',
				params: [ { expr: EConst( CString( 'electron' ) ), pos: pos } ],
				pos: pos
			});

			/*
			if( item.process.main ) {
				meta.push({
					pos: pos,
					name: ':require',
					params: [
						{ expr: EConst( CString( 'electron_main' ) ), pos: pos }
					]
				});
			}
			if( item.process.renderer ) {
				meta.push({
					pos: pos,
					name: ':require',
					params: [
						{ expr: EConst( CString( 'electron_renderer' ) ), pos: pos }
					]
				});
			}
			*/

			var pkg = type.pack.join( '.' );
			typePaths.push( pkg+'.'+type.name );

			var dir = out + '/' + pkg;
			if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
			File.saveContent( dir + '/' + type.name + '.hx', printer.printTypeDefinition( type ) );
		}

		File.saveContent( 'doc/import.hxml', typePaths.join( '\n' ) );

		println( 'Generated '+types.length+' types.' );
	}

	static function convertMethod( m : Dynamic ) : Field {

		var returnType = macro : Dynamic;
		if( m.name == null || m.name == "constructor" || m.returns == null )
            returnType = macro : Void;
		if( m.returns != null ) {
			returnType = convertType( m.returns.type );
		}

		var args = new Array<FunctionArg>();
		if( m.parameters!= null ) {
            for( param in cast( m.parameters, Array<Dynamic> ) ) {
				args.push( {
					name: escapeName( param.name ),
					type: convertType( param.type, param.properties ),
					opt: (param.description == '(optional)')
				} );
			}
		}

		return {
			pos: pos,
			access: [],
			name: (m.name == null) ? 'new' : m.name,
            kind: FFun( { args: args, ret: returnType, expr: null } ),
            doc: m.description
        };
	}

	static function convertType( type : String, ?properties : Array<Dynamic> ) : ComplexType {

		var c0 = type.charAt( 0 );
		if( c0 == c0.toLowerCase() ) {
			warning( '??? lowercase type name: '+type );
			type = type.charAt(0).toUpperCase() + type.substr(1);
		}

		var isArray = if( type.endsWith( '[]' ) ) {
			type = type.substr( 0, type.length-2 );
			true;
		} else false;

		var ctype = switch type {
		case "Array":
			macro : Array<Dynamic>;
		case 'Bool','Boolean':
			macro : Bool;
		case 'Buffer':
			macro : js.node.Buffer;
		case 'Function':
			if( properties != null ) {
                    var args = [for(prop in properties) convertType( prop.type, prop.properties )];
                    var ret = macro : Dynamic;
                    TFunction( args, ret );
                } else {
                    macro : haxe.Constraints.Function;
                }

		case 'Int','Integer':
			macro : Int;
		case 'Double','Float','Number':
			macro : Float;
		case 'Object':
			if( properties == null ) {
				macro : Dynamic;
				//macro : Dynamic<Dynamic>;
			} else {
				var fields = new Array<Field>();
				for( prop in properties ) {
					fields.push({
						pos: pos,
						name: escapeName( prop.name ),
						kind: FVar( convertType( prop.type, prop.properties ) ),
						meta: [ { name: ":optional", pos: pos } ]
					});
				}
				TAnonymous( fields );
			}
		case 'String':
			macro : String;
		case 'URL':
			//TODO
			macro : String;
			//macro : js.node.Url;
			//macro : js.html.URL;
		default:
			/*
			var c0 = type.charAt( 0 );
			if( c0 == c0.toLowerCase() ) {
				warning( '??? Type name starts with lowercase character: '+type );
				macro : Dynamic;
			}
			*/
			TPath( { pack: pack, name: type } );
		}

		return if( !isArray ) ctype else switch ctype {
			case TPath(p):
				TPath( { pack: [], name: 'Array<${p.name}>' } );
			default:
				throw 'failed to convert array type';
		};
	}

	static function escapeName( n : String ) : String {
		return (KWDS.indexOf( n ) != -1) ? n+'_' : n;
	}

	static function saveModule( type : TypeDefinition ) {
		var dir = out + '/' + type.pack.join( '.' );
		if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
		File.saveContent( dir + '/' + type.name + '.hx', printer.printTypeDefinition( type ) );
	}

	static function warning( msg : String ) {
		println( '!!! WARNING '+msg );
	}

	static function error( info : String, code = -1 ) {
		println( info );
		Sys.exit( code );
	}

	static inline function traceJson( obj : Dynamic, sep = '  ' ) {
		trace( haxe.format.JsonPrinter.print( obj, sep ) );
	}
}
