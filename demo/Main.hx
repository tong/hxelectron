import electron.main.App;
import electron.main.App.AppEvent;
import electron.main.BaseWindow.BaseWindowEvent;
import electron.main.BrowserWindow;
import electron.main.Menu;
import electron.main.MenuItem;
import electron.main.Notification;
import electron.main.Tray;
import electron.main.Tray.TrayEvent;
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

		App.on(AppEvent.ready, (_, _) -> {
			var win = new BrowserWindow({
				width: 800,
				height: 600,
				webPreferences: {
					nodeIntegration: true,
					contextIsolation: false
				}
			});
			win.on(BaseWindowEvent.closed, () -> {
				win = null;
			});
			win.on(BaseWindowEvent.move, () -> {
				trace('Window move ' + win.getPosition());
			});
			win.on(BaseWindowEvent.resize, () -> {
				trace('Window resize ' + win.getSize());
			});
			win.loadFile('app.html');
			// win.webContents.openDevTools();

			var tray = new Tray('${__dirname}/icon-192.png');
			tray.setToolTip('Haxelectron');
			tray.on(TrayEvent.click, (e, _, _) -> {
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

		App.on(AppEvent.window_all_closed, () -> {
			if (process.platform != 'darwin')
				electron.main.App.quit();
		});
	}
}
