(function (console) { "use strict";
var Main = function() { };
Main.main = function() {
	as_browser_CrashReporter.start();
	as_browser_App.on("window-all-closed",function() {
		if(process.platform != "darwin") as_browser_App.quit();
	});
	var mainWindow = null;
	as_browser_App.on("ready",function() {
		mainWindow = new as_browser_BrowserWindow({ width : 800, height : 600});
		mainWindow.loadUrl("file://" + __dirname + "/index.html");
		mainWindow.on("closed",function() {
			mainWindow = null;
		});
	});
};
var as_browser_App = require("app");
var as_browser_BrowserWindow = require("browser-window");
var as_browser_CrashReporter = require("crash-reporter");
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
