import electron.browser.*;
import js.Node;

class Main {
	static function main() {
		CrashReporter.start();
		App.on("window-all-closed", function() {
			//if (Node.process.platform != 'darwin')
    		App.quit();
		});

		var mainWindow = null;
		App.on("ready", function() {
			mainWindow = new BrowserWindow({width: 800, height: 600});
			mainWindow.loadUrl('file://' + Node.__dirname + '/index.html');
			mainWindow.on('closed', function() {
				mainWindow = null;
			});
		});
	}
}
