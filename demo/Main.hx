
import electron.main.App;
import electron.main.BrowserWindow;
import js.Node.__dirname;
import js.Node.process;

class Main {

	static function main() {

		Sys.println( process.platform +' '+ process.arch );
		Sys.println( 'node '+process.version );
		Sys.println( 'electron '+process.versions['electron'] );

		electron.main.App.on( ready, e -> {

			var win = new BrowserWindow( {
				width: 720, height: 480,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
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

		electron.main.App.on( window_all_closed, e -> {
			if( process.platform != 'darwin' ) electron.main.App.quit();
		});
	}

}
