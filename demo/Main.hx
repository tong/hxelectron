
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
					nodeIntegration: true,
					enableRemoteModule: true
				}
			} );
			win.on( closed, function() {
				win = null;
			});
			win.loadFile( 'app.html' );
			//win.webContents.openDevTools();

			var tray = new electron.main.Tray( '${__dirname}/icon-192.png' );

			//var dialog = new electron.main.Dialog();
			//electron.main.Dialog.showOpenDialog({ properties: ['openFile', 'multiSelections'] });

			// var menu = new electron.main.Menu();
			// menu.append(new electron.main.MenuItem({ label: 'MenuItem1'} ) );
			// electron.main.Menu.setApplicationMenu(menu);
		});

		electron.main.App.on( window_all_closed, function(e) {
			if( Node.process.platform != 'darwin' ) electron.main.App.quit();
		});
	}

}
