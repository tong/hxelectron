
import electron.main.*;

class Main {

	static function main() {

		electron.CrashReporter.start({
			companyName : "hxelectron (not a company)",
			submitURL : "https://github.com/fponticelli/hxelectron/issues"
		});

		electron.main.App.on( 'ready', function(e) {

			var win = new BrowserWindow( { width: 800, height: 600 } );
			win.on( BrowserWindowEvent.closed, function(e) {
				if( js.Node.process.platform != 'darwin' ) App.quit();
			});
			win.loadURL( 'file://' + js.Node.__dirname + '/app.html' );
		});
	}

}
