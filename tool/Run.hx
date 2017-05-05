
import haxe.Json;
import haxe.ds.StringMap;
import sys.FileSystem;
import sys.io.File;

using StringTools;

@:require(sys)
class Run {

	static inline var API_SOURCE_FILE = 'electron-api.json';

	static function main() {

		var args = Sys.args();

		switch args[0] {

		//case 'update':
			//TODO requires ssl
			//https://api.github.com/repos/electron/electron/releases
			//https://github.com/electron/electron/releases/download/v${version}/electron-api.json

		default:

			#if macro
			var file = API_SOURCE_FILE;
			#else
			var file = args[0];
			if( file == null ) file = API_SOURCE_FILE;
			#end

			if( !FileSystem.exists( file ) )
				error( 'API file not found [$file]' );

			var out = 'src';
			var pack = ['electron'];
			var json = Json.parse( File.getContent( file ) );
			var types = ElectronAPI.build( json, pack );
			var sourceCode = new StringMap<String>();
			var printer = new haxe.macro.Printer();
			//var typePaths = new Array<String>();

			for( i in 0...types.length ) {

				var type = types[i];
				var modulePath = type.pack.join( '.' );
				var moduleName = type.name;

				var doc = '\n\n/**';
				for( item in json ) {
					if( item.name == type.name ) {
						if( item.description != null ) doc += '\n\t'+item.description+'\n';
						if( item.websiteUrl != null ) doc += '\n\tSee: <'+item.websiteUrl+'>';
						break;
					}
				}
				doc += '\n**/\n';

				var code = printer.printTypeDefinition( type );
				var lines = code.split( '\n' );
				code = lines.shift() + doc + lines.join( '\n' );
				var classPath = modulePath+'.'+moduleName;
				if( moduleName.endsWith( 'Event' ) ) {
					code = code.split( '\n' ).slice(1).join( '\n' );
					sourceCode.set( modulePath, sourceCode.get( modulePath ) +'\n'+code );
				} else {
					sourceCode.set( classPath, code );
				}
			}

			for( key in sourceCode.keys() ) {
				var parts = key.split( '.' );
				var file = parts.pop();
				var dir = out + '/' + parts.join( '/' );
				if( !FileSystem.exists( dir ) ) FileSystem.createDirectory( dir );
				File.saveContent( dir+'/'+file+'.hx', sourceCode.get( key ) );
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
