
import haxe.macro.Expr;

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
	parameters : Array<APIMethodParameter>,
	platforms : Array<String>
}

typedef APIProcess = {
	var main : Bool;
	var renderer : Bool;
}

@:enum abstract APIType(String) from String to String {
	var Module = "Module";
	var Class_ = "Class";
	var Structure = "Structure";
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
	?events : Array<APIEvent>,
};

/**
	Generates extern type definitions from electron-api.json
**/
class ElectronAPI {

	static var KWDS = ['class','switch'];

	public static var pos(default,null) = #if macro null #else { min: 0, max: 0, file: '' } #end;

	public static function build( api : Array<APIItem>, ?pack : Array<String> ) : Array<TypeDefinition> {

		if( pack == null ) pack = ['electron'];

		var types = new Array<TypeDefinition>();
		for( item in api ) {
			//if( item.name != 'net' ) continue;
			var itemTypes = convertItem( item, pack );
			types = types.concat( itemTypes );
		}

		///// PATCH ////////////////////////////////////////////////////////////

		for( type in types ) {
			switch type.name {
			case 'App':
				type.fields.push( {
					name: 'on',
					access: [AStatic],
					kind: FFun( { args: [
						{ name: 'eventType', type: macro:Dynamic },
						{ name: 'callback', type: macro:Dynamic->Void }
					], ret: macro: Void, expr: null } ),
					pos: pos
				} );
			case 'Remote':
				var manipulateReturn = function(f:Field) {
					switch f.kind {
					case FFun(f):
						switch f.ret {
						case TPath(p): p.pack = ['electron','main'];
						default:
						}
					default:
					}
				}
				for( f in type.fields ) {
					switch f.name {
					case 'getCurrentWindow','getCurrentWebContents': manipulateReturn(f);
					}
				}
			}
		}

		types.push( createAlias( 'Any', pack ) );
		types.push( createTypeDefinition( pack, 'Accelerator', TDAbstract( macro:String, [macro:String], [macro:String] ) ) );

		////////////////////////////////////////////////////////////////////////

		return types;
	}

	public static function createAlias( name : String, pack : Array<String>, ?type : ComplexType ) : TypeDefinition {
		if( type == null ) type = macro : Dynamic;
		return createTypeDefinition( pack, name, TDAlias(type) );
	}

	static function convertItem( item : APIItem, pack : Array<String> ) : Array<TypeDefinition> {

		var pack = pack.copy();
		var meta = [];
		var fields = new Array<Field>();
		var extraTypes = new Array<TypeDefinition>();

		if( !item.process.main || !item.process.renderer ) {
			if( item.process.main ) {
				pack.push( 'main' );
				//meta.push( { name: ':require', params: [macro $i{'electron_main'}], pos: pos } );
			} else if( item.process.renderer ) {
				pack.push( 'renderer' );
				//meta.push( { name: ':require', params: [macro $i{'electron_renderer'}], pos: pos } );
			}
		}

		var def = switch item.type {

		case Class_:
			var sup : TypePath = null;
			if( item.instanceEvents != null ) {
				sup = {
					pack: ['js','node','events'], name: 'EventEmitter',
					params: [TPType( TPath( { name: item.name, pack: pack } ) )]
				};
				extraTypes.push( createEventAbstract( pack, item.name, item.instanceEvents ) );
			}
			if( item.instanceProperties != null )
				for( p in item.instanceProperties )
					fields.push( createField( p.name, FVar( convertType( p.type ) ), p.description ) );
			if( item.constructorMethod != null )
				fields.push( convertMethod( item.constructorMethod ) );
			if( item.instanceMethods != null )
				for( m in item.instanceMethods ) fields.push( convertMethod( m ) );
			if( item.staticMethods != null )
				for( m in item.instanceMethods ) fields.push( convertMethod( m, [AStatic] ) );
			createClassTypeDefinition( pack, item.name, sup, fields, meta );

		case Module:
			var sup : TypePath = null;
			if( item.methods != null ) {
				//TODO hack
				var alreadyAdded = false;
				for( m in item.methods ) {
					for( f in fields ) {
						if( f.name == m.name ) {
							trace( 'WARNING Duplicate module method name: '+item.name+'.'+m.name );
							alreadyAdded = true;
							break;
						}
					}
					if( !alreadyAdded ) fields.push( convertMethod( m, [AStatic] ) );
				}
			}
			createClassTypeDefinition( pack, item.name, sup, fields, meta );

		case Structure:
			for( p in item.properties ) {
				//TODO hack to check if field is optional
				var meta = (p.description != null && p.description.startsWith( '(optional)' ) ) ? [{ name: ':optional', pos: pos }] : [];
				fields.push( createField( p.name, FVar( convertType( p.type, p.properties ) ), p.description, meta ) );
			}
			createTypeDefinition( pack, item.name, TDStructure, fields, meta );
		}

		var types = [def];
		for( def in extraTypes ) types.push( def );
		return types;
	}

	static function convertMethod( method : APIMethod, ?access : Array<Access> ) : Field {

		var ret = macro : Void;
		if( method.returns != null )
			ret = convertType( method.returns.type, method.returns.properties );

		var args = new Array<FunctionArg>();
		if( method.parameters != null ) {
			for( p in method.parameters ) {
				//TODO temp hack
				var type = untyped if( Std.is( p.type, Array ) ) 'Object' else p.type;
				args.push( {
					name: escapeName( p.name ),
					type: convertType( type, p.properties ),
					//TODO hack to check if field is optional
					opt: p.description != null && p.description.startsWith( '(optional)')
				} );
			}
		}

		return createField(
			(method.name == null) ? 'new' : method.name,
			FFun( { args: args, ret: ret, expr: null } ),
			access,
			method.description
		);
	}

	static function convertType( type : String, ?properties : Array<Dynamic> ) : ComplexType {

		var isArray = if( type.endsWith( '[]' ) ) {
			type = type.substr( 0, type.length-2 );
			true;
		} else false;

		var ctype = switch type {
		case 'Bool','Boolean': macro : Bool;
		case 'Buffer': macro : js.node.Buffer;
		case 'Int','Integer': macro : Int;
		case 'Dynamic': macro : Dynamic; // allows to explicit set type to Dynamic
		case 'Double','Float','Number': macro : Float;
		case 'Function':
			if( properties == null ) macro : haxe.Constraints.Function;
			else {
				//TODO
				//for( p in properties ) {
				TFunction(
					[for(p in properties) convertType( p.type, p.properties )],
					macro : Dynamic
				);
			}
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
		case 'Promise': macro : js.Promise<Dynamic>;
		case 'String','URL': macro : String;
		default: TPath( { pack: [], name: escapeTypeName( type ) } );
		}

		return if( !isArray ) ctype else switch ctype {
			case TPath(p): TPath( { name: 'Array<${p.name}>', pack: [] } );
			default: throw 'failed to convert array type';
		}
	}

	static function createField( name : String, kind: FieldType, ?access : Array<Access>, ?doc : String, ?meta : Metadata ) : Field {
		return {
			access: access,
			name: name,
			kind: kind,
			doc: doc,
			meta: meta,
			pos: pos
		}
	}

	static function createClassTypeDefinition( pack : Array<String>, name : String, sup : TypePath, ?fields : Array<Field>, ?meta : Metadata ) : TypeDefinition {
		var _meta = [{
			name: ":jsRequire",
			params: [
				{ expr: EConst( CString( 'electron' ) ), pos: pos },
				{ expr: EConst( CString( name ) ), pos: pos }
			],
			pos: pos
		}];
		if( meta != null ) _meta = _meta.concat( meta );
		return createTypeDefinition( pack, name, TDClass( sup ), fields, _meta, true );
	}

	static function createEventAbstract( pack : Array<String>, name : String, events : Array<APIEvent> ) : TypeDefinition {
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
		return createTypeDefinition( pack, escapeTypeName( name )+'Event', TDAbstract(macro:String,[macro:String],[macro:String]), fields, [{ name: ":enum", pos: pos }] );
	}

	static function createTypeDefinition( pack : Array<String>, name : String, kind : TypeDefKind, ?fields : Array<Field>, ?meta : Metadata, ?isExtern : Bool ) : TypeDefinition {
		var _meta = [{ name: ':require', params: [macro $i{'js'},macro $i{'electron'}], pos: pos }];
		if( meta != null ) _meta = _meta.concat( meta );
		return {
			pack: pack,
			name: escapeTypeName( name ),
			kind: kind,
			fields: (fields == null) ? [] : fields,
			meta: _meta,
			isExtern: isExtern,
			pos: pos
		};
	}

	static function escapeTypeName( name : String ) : String
		return name.charAt( 0 ).toUpperCase() + name.substr( 1 );

	static function escapeName( name : String ) : String
		return (KWDS.indexOf( name ) != -1) ? name+'_' : name;

}
