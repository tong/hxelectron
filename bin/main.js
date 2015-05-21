(function (console) { "use strict";
var Main = function() { };
Main.main = function() {
	electron_browser_CrashReporter.start();
	electron_browser_App.on("window-all-closed",function() {
		electron_browser_App.quit();
	});
	var mainWindow = null;
	electron_browser_App.on("ready",function() {
		mainWindow = new electron_browser_BrowserWindow({ width : 800, height : 600});
		mainWindow.loadUrl("file://" + __dirname + "/index.html");
		mainWindow.on("closed",function() {
			mainWindow = null;
		});
	});
};
var electron_browser_App = require("app");
var electron_browser_BrowserWindow = require("browser-window");
var electron_browser_CrashReporter = require("crash-reporter");
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
