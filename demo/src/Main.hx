
import electron.BrowserWindow;

class Main {

	static function main() {

		electron.CrashReporter.start({
			companyName : "hxelectron (not a company)",
			submitURL : "https://github.com/fponticelli/hxelectron/issues",
		});

		var win : BrowserWindow;

		electron.App.on( 'ready', function(e) {

			win = new BrowserWindow( { width: 800, height: 600 } );
			win.on( electron.BrowserWindowEvent.closed, function(e) {
				if( js.Node.process.platform != 'darwin' ) electron.App.quit();
			});
			win.loadURL( 'file://' + js.Node.__dirname + '/app.html' );
		});

	}
}
