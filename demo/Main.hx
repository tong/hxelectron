
import electron.main.App;
import electron.main.BrowserWindow;
import electron.common.CrashReporter;
import js.Node.*;

class Main {
	static function main() {
		CrashReporter.start({
			companyName : "hxelectron (not a company)",
			submitURL : "https://github.com/fponticelli/hxelectron/issues",
		});

		App.on(window_all_closed, function() {
			App.quit();
		});

		var mainWindow = null;
		App.on(ready, function() {
			mainWindow = new BrowserWindow({width: 800, height: 600});
			mainWindow.loadURL('file://' + __dirname + '/index.html');
			mainWindow.on(closed, function() mainWindow = null);
		});
	}
}
