
import electron.main.App;
import electron.main.BrowserWindow;
import js.Node.__dirname;
import js.Node.process;

using StringTools;

class Main {

	static function main() {

        var timeout = -1;
        var args = process.argv;
        var lastArg = args[args.length-1];
        if(lastArg.startsWith("--timeout=")) {
            timeout = Std.parseInt(lastArg.split("=")[1]);
        }

		Sys.println( process.platform +' '+ process.arch );
		Sys.println( 'node '+process.version );
		Sys.println( 'electron '+process.versions['electron'] );

		electron.main.App.whenReady().then(_ -> {

			var win = new BrowserWindow( {
				width: 720, height: 480,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
				}
			} );
			win.on( closed, () -> {
				win = null;
			});
            win.on( move, () -> {
                trace('Window move');
            });
			win.on( resize, () -> {
                trace('Window resize');
            });
            win.loadFile( 'app.html' );
			//win.webContents.openDevTools();

			var tray = new electron.main.Tray( '${__dirname}/icon-192.png' );
			tray.setToolTip('Haxelectron');

			// var dialog = new electron.main.Dialog();
			// electron.main.Dialog.showOpenDialog({ properties: ['openFile', 'multiSelections'] });

			var menu : electron.main.Menu = electron.main.Menu.getApplicationMenu();
			menu.append(new electron.main.MenuItem(
				{
					label: 'Haxe',
					submenu: [
						{ label: 'Website', click: e -> win.loadURL('https://haxe.org') },
						{ label: 'Github', click: e -> win.loadURL('https://github.com/HaxeFoundation') }
					]
				}
			));
			electron.main.Menu.setApplicationMenu(menu);

            if(timeout > 0) {
                trace('Auto closing application in $timeout seconds ...');
                haxe.Timer.delay( () -> {
                    win.close();
                }, timeout*1000 );
            }
		});

		electron.main.App.on( window_all_closed, e -> {
			if( process.platform != 'darwin' ) electron.main.App.quit();
		});
	}

}
