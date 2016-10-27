
import haxe.Json;
import sys.FileSystem;
import sys.io.File;

using StringTools;

@:require(sys)
class Run {

	static var DEFAULT_API_SOURCE = 'electron-api.json';

	static var out = 'src';

	static function main() {

		#if macro
		var file = DEFAULT_API_SOURCE;
		#else
		var file = Sys.args()[0];
		if( file == null ) file = DEFAULT_API_SOURCE;
		if( !FileSystem.exists( file ) )
			error( 'API file not found [$file]' );
		#end

		var pack = ['electron'];
		var api = Json.parse( File.getContent( file ) );
		var types = ElectronAPI.build( api, pack );

		/////// TODO / HACK missing from api description
		//types.push({ pack: pack, name: 'Accelerator', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });
		//types.push({ pack: pack, name: 'Any', kind: TDAlias(macro:Dynamic), fields: [], meta: [], pos: pos });
		types.push( ElectronAPI.createDynamicAlias( 'Any' ) );
		types.push( {
			name: 'Accelerator',
			pack: pack,
			kind: TDAbstract( macro:String, [macro:String], [macro:String] ),
			fields: [],
			pos: ElectronAPI.pos
		} );
		//////////////////////////////////////////

		if( !FileSystem.exists( out ) ) FileSystem.createDirectory( out );

		var printer = new haxe.macro.Printer();
		var typePaths = new Array<String>();

		for( type in types ) {

			var pkg = type.pack.join( '.' );

			typePaths.push( '$pkg.${type.name}' );

			var dir = '$out/$pkg';
			if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );

			var code = printer.printTypeDefinition( type );

			var doc = '\n\n///// GENERATED - DO NOT EDIT /////\n\n/**';
			for( item in api ) {
				if( item.name == type.name.toLowerCase() ) {
					if( item.description != null ) doc += '\n\t'+item.description+'\n';
					if( item.websiteUrl != null ) doc += '\n\t[Documentation]('+item.websiteUrl+')';
					//if( item.repoUrl != null ) doc += '\n\t[]'+item.repoUrl;
					break;
				}
			}
			doc += '\n**/\n';
			var lines = code.split( '\n' );
			code = lines.shift() + doc + lines.join( '\n' );

			File.saveContent( '$dir/${type.name}.hx', code );
		}

		File.saveContent( 'all.hxml', typePaths.join( '\n' ) );

		Sys.println( 'Generated [${types.length}] types into [$out]' );
	}

	static function warning( msg : String ) {
		Sys.println( '!!! WARNING '+msg );
	}

	static function error( info : String, code = -1 ) {
		Sys.println( info );
		Sys.exit( code );
	}

}
