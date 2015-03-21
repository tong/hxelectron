(function (console) { "use strict";
var Main = function() { };
Main.main = function() {
	as_CrashReporter.start();
	as_App.on("window-all-closed",function() {
		if(process.platform != "darwin") as_App.quit();
	});
	var mainWindow = null;
	as_App.on("ready",function() {
		mainWindow = new as_BrowserWindow({ width : 800, height : 600});
		mainWindow.loadUrl("file://" + __dirname + "/index.html");
		mainWindow.on("closed",function() {
			mainWindow = null;
		});
	});
};
var as_App = require("app");
var as_BrowserWindow = require("browser-window");
var as_CrashReporter = require("crash-reporter");
Main.main();
})(typeof console != "undefined" ? console : {log:function(){}});
