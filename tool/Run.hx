
import haxe.Json;
import sys.FileSystem;
import sys.io.File;

using StringTools;

@:require(sys)
class Run {

	static inline var API_SOURCE_FILE = 'electron-api.json';

	static function main() {

		var args = Sys.args();
		switch args[0] {
		case 'update':
			//TODO
			//https://api.github.com/repos/electron/electron/releases
			//https://github.com/electron/electron/releases/download/v${version}/electron-api.json
			//var r = haxe.Http.requestUrl( 'https://api.github.com/repos/electron/electron/releases' );

		default:

			#if macro
			var file = API_SOURCE_FILE;
			#else
			var file = Sys.args()[0];
			if( file == null ) file = API_SOURCE_FILE;
			if( !FileSystem.exists( file ) )
				error( 'API file not found [$file]' );
			#end

			var out = 'src';
			var pack = ['electron'];
			var api = Json.parse( File.getContent( file ) );
			var types = ElectronAPI.build( api, pack );
			var printer = new haxe.macro.Printer();
			var typePaths = new Array<String>();

			if( FileSystem.exists( out ) ) FileSystem.createDirectory( out );

			for( type in types ) {

				var pkg = type.pack.join( '.' );
				var fullName = '$pkg.${type.name}';

				typePaths.push( fullName );

				var code = printer.printTypeDefinition( type );
				var doc = '\n\n/**';
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

				var dir = '$out/' + pkg.replace( '.', '/' );
				if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
				File.saveContent( '$dir/${type.name}.hx', code );
			}

			//File.saveContent( 'all.hxml', typePaths.join( '\n' ) );

			Sys.println( 'Generated [${types.length}] types into [$out]' );

		}
	}

	static function error( info : String, code = -1 ) {
		Sys.println( info );
		Sys.exit( code );
	}

}
