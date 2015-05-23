(function (console) { "use strict";
var Main = function() { };
Main.main = function() {
	electron_main_CrashReporter.start();
	electron_main_App.on("window-all-closed",function() {
		electron_main_App.quit();
	});
	var mainWindow = null;
	electron_main_App.on("ready",function() {
		mainWindow = new electron_main_BrowserWindow({ width : 800, height : 600});
		mainWindow.loadUrl("file://" + __dirname + "/index.html");
		mainWindow.on("closed",function() {
			mainWindow = null;
		});
	});
};
var electron_main_App = require("app");
var electron_main_BrowserWindow = require("browser-window");
var electron_main_CrashReporter = require("crash-reporter");
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
