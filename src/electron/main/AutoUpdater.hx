package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "autoUpdater") @:electron("main") extern class AutoUpdater {
	/**
		Sets the url and initialize the auto updater.
	**/
	static function setFeedURL(options:{ @:optional
	var url : String; /**
		HTTP request headers.
	**/
	@:optional
	var headers : { }; /**
		Either json or default, see the README for more information.
	**/
	@:optional
	var serverType : String; }):Void;
	static function getFeedURL():String;
	/**
		Asks the server whether there is an update. You must call setFeedURL before using this API.
	**/
	static function checkForUpdates():Void;
	/**
		Restarts the app and installs the update after it has been downloaded. It should only be called after update-downloaded has been emitted. Under the hood calling autoUpdater.quitAndInstall() will close all application windows first, and automatically call app.quit() after all windows have been closed. Note: If the application is quit without calling this API after the update-downloaded event has been emitted, the application will still be replaced by the updated one on the next run.
	**/
	static function quitAndInstall():Void;
}