
import electron.main.App;
import electron.main.BrowserWindow;
import electron.main.CrashReporter;
import js.Node;

class Main {

	static function main() {

		CrashReporter.start();

		App.on( window_all_closed, function() {
			//if (Node.process.platform != 'darwin')
    		App.quit();
		});

		var mainWindow = null;
		App.on( ready, function() {
			mainWindow = new BrowserWindow({width: 800, height: 600});
			mainWindow.loadURL('file://' + Node.__dirname + '/index.html');
			mainWindow.on( closed, function() {
				mainWindow = null;
			});
		});
	}
}
