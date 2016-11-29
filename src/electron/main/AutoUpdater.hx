package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "autoUpdater") extern class AutoUpdater {
	/**
		Sets the url and initialize the auto updater.
	**/
	static function setFeedURL(url:String, ?requestHeaders:Dynamic):Void;
	static function getFeedURL():String;
	/**
		Asks the server whether there is an update. You must call setFeedURL before using this API.
	**/
	static function checkForUpdates():Void;
	/**
		Restarts the app and installs the update after it has been downloaded. It should only be called after update-downloaded has been emitted. Note: autoUpdater.quitAndInstall() will close all application windows first and only emit before-quit event on app after that. This is different from the normal quit event sequence.
	**/
	static function quitAndInstall():Void;
}