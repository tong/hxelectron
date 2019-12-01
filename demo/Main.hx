
import js.Node;
import js.Node.__dirname;
import electron.main.App;
import electron.main.BrowserWindow;

class Main {

	static function main() {

		electron.main.App.on( ready, function(e) {

			var win = new BrowserWindow( {
				width: 720, height: 480,
				webPreferences: {
					nodeIntegration: true
				}
			} );
			win.on( closed, function() {
				win = null;
			});
			win.loadFile( 'app.html' );
			//win.webContents.openDevTools();

			var tray = new electron.main.Tray( '${__dirname}/icon-192.png' );
		});

		electron.main.App.on( window_all_closed, function(e) {
			if( Node.process.platform != 'darwin' ) electron.main.App.quit();
		});
	}

}
