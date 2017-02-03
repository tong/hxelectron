
import electron.main.BrowserWindow;

class Main {

	static function main() {

		electron.CrashReporter.start({
			companyName : "hxelectron (not a company)",
			submitURL : "https://github.com/fponticelli/hxelectron/issues"
		});

		electron.main.App.on( 'ready', function(e) {
			var win = new BrowserWindow( { width: 720, height: 480 } );
			win.on( closed, function(e) {
				if( js.Node.process.platform != 'darwin' )
					electron.main.App.quit();
			});
			win.loadURL( 'file://' + js.Node.__dirname + '/app.html' );
		});
	}

}
