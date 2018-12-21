package electron.main;
/**
	Enable apps to automatically update themselves.
	@see http://electronjs.org/docs/api/auto-updater
**/
@:jsRequire("electron", "autoUpdater") extern class AutoUpdater extends js.node.events.EventEmitter<electron.main.AutoUpdater> {
	/**
		Sets the url and initialize the auto updater.
	**/
	static function setFeedURL(options:{ var url : String; /**
		HTTP request headers.
	**/
	@:optional
	var headers : Any; /**
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
		Restarts the app and installs the update after it has been downloaded. It should only be called after update-downloaded has been emitted. Under the hood calling autoUpdater.quitAndInstall() will close all application windows first, and automatically call app.quit() after all windows have been closed. Note: It is not strictly necessary to call this function to apply an update, as a successfully downloaded update will always be applied the next time the application starts.
	**/
	static function quitAndInstall():Void;
}
@:enum abstract AutoUpdaterEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when there is an error while updating.
	**/
	var error : electron.main.AutoUpdaterEvent<js.Error -> Void> = "error";
	/**
		Emitted when checking if an update has started.
	**/
	var checking_for_update : electron.main.AutoUpdaterEvent<Void -> Void> = "checking-for-update";
	/**
		Emitted when there is an available update. The update is downloaded automatically.
	**/
	var update_available : electron.main.AutoUpdaterEvent<Void -> Void> = "update-available";
	/**
		Emitted when there is no available update.
	**/
	var update_not_available : electron.main.AutoUpdaterEvent<Void -> Void> = "update-not-available";
	/**
		Emitted when an update has been downloaded. On Windows only releaseName is available. Note: It is not strictly necessary to handle this event. A successfully downloaded update will still be applied the next time the application starts.
	**/
	var update_downloaded : electron.main.AutoUpdaterEvent<(js.html.Event, String, String, Date, String) -> Void> = "update-downloaded";
	/**
		This event is emitted after a user calls quitAndInstall(). When this API is called, the before-quit event is not emitted before all windows are closed. As a result you should listen to this event if you wish to perform actions before the windows are closed while a process is quitting, as well as listening to before-quit.
	**/
	var before_quit_for_update : electron.main.AutoUpdaterEvent<Void -> Void> = "before-quit-for-update";
}
