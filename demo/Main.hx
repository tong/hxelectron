import electron.main.App;
import electron.main.BrowserWindow;
import electron.main.Menu;
import electron.main.MenuItem;
import electron.main.Notification;
import electron.main.Tray;
import js.Node.__dirname;
import js.Node.process;

using StringTools;

class Main {
	static function main() {
		var timeout = -1;
		var args = process.argv;
		var lastArg = args[args.length - 1];
		if (lastArg.startsWith("--timeout=")) {
			timeout = Std.parseInt(lastArg.split("=")[1]);
		}

		Sys.println(process.platform + ' ' + process.arch);
		Sys.println('node ' + process.version);
		Sys.println('electron ' + process.versions['electron']);

		App.on('ready', () -> {
			var win = new BrowserWindow({
				width: 800,
				height: 600,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
				}
			});
			win.on("closed", () -> {
				win = null;
			});
			win.on("move", () -> {
				trace('Window move ' + win.getPosition());
			});
			win.on("resize", () -> {
				trace('Window resize ' + win.getSize());
			});
			win.loadFile('app.html');
			// win.webContents.openDevTools();

			var tray = new Tray('${__dirname}/icon-192.png');
			tray.setToolTip('Haxelectron');
			tray.on('click', (e) -> {
				trace(e);
			});
			var contextMenu = Menu.buildFromTemplate([
				{
					label: 'haxe.org',
					click: e -> win.loadURL('https://haxe.org')
				},
				{
					label: 'github/HaxeFoundation',
					click: e -> win.loadURL('https://github.com/HaxeFoundation')
				},
				{
					label: 'github/hxelectron',
					click: e -> win.loadURL('https://github.com/tong/hxelectron')
				}
			]);
			tray.setContextMenu(contextMenu);

			var menu:Menu = Menu.getApplicationMenu();
			menu.append(new MenuItem({
				label: 'Haxe',
				submenu: [
					{label: 'Website', click: e -> win.loadURL('https://haxe.org')},
					{label: 'Github', click: e -> win.loadURL('https://github.com/HaxeFoundation')}
				]
			}));
			Menu.setApplicationMenu(menu);

			var notification = new Notification({
				title: 'Haxe',
				body: 'https://haxe.org'
			});
			notification.show();

			if (timeout > 0) {
				trace('Auto closing application in $timeout seconds ...');
				haxe.Timer.delay(() -> {
					win.close();
				}, timeout * 1000);
			}
		});

		App.on(window_all_closed, e -> {
			if (process.platform != 'darwin')
				electron.main.App.quit();
		});
	}
}
