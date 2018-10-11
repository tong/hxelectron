package electron.main;
/**
	Get system preferences.
	@see http://electron.atom.io/docs/api/system-preferences
**/
@:jsRequire("electron", "systemPreferences") extern class SystemPreferences extends js.node.events.EventEmitter<electron.main.SystemPreferences> {
	@:electron_platforms(["macOS"])
	static function isDarkMode():Bool;
	@:electron_platforms(["macOS"])
	static function isSwipeTrackingFromScrollEventsEnabled():Bool;
	/**
		Posts event as native notifications of macOS. The userInfo is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postNotification(event:String, userInfo:Any):Void;
	/**
		Posts event as native notifications of macOS. The userInfo is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postLocalNotification(event:String, userInfo:Any):Void;
	/**
		Posts event as native notifications of macOS. The userInfo is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postWorkspaceNotification(event:String, userInfo:Any):Void;
	/**
		Subscribes to native notifications of macOS, callback will be called with callback(event, userInfo) when the corresponding event happens. The userInfo is an Object that contains the user information dictionary sent along with the notification. The id of the subscriber is returned, which can be used to unsubscribe the event. Under the hood this API subscribes to NSDistributedNotificationCenter, example values of event are:
	**/
	@:electron_platforms(["macOS"])
	static function subscribeNotification(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Same as subscribeNotification, but uses NSNotificationCenter for local defaults. This is necessary for events such as NSUserDefaultsDidChangeNotification.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeLocalNotification(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Same as subscribeNotification, but uses NSWorkspace.sharedWorkspace.notificationCenter. This is necessary for events such as NSWorkspaceDidActivateApplicationNotification.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeWorkspaceNotification(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Removes the subscriber with id.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeNotification(id:Int):Void;
	/**
		Same as unsubscribeNotification, but removes the subscriber from NSNotificationCenter.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeLocalNotification(id:Int):Void;
	/**
		Same as unsubscribeNotification, but removes the subscriber from NSWorkspace.sharedWorkspace.notificationCenter.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeWorkspaceNotification(id:Int):Void;
	/**
		Add the specified defaults to your application's NSUserDefaults.
	**/
	@:electron_platforms(["macOS"])
	static function registerDefaults(defaults:Any):Void;
	/**
		Some popular key and types are:
	**/
	@:electron_platforms(["macOS"])
	static function getUserDefault(key:String, type:String):Any;
	/**
		Set the value of key in NSUserDefaults. Note that type should match actual type of value. An exception is thrown if they don't. Some popular key and types are:
	**/
	@:electron_platforms(["macOS"])
	static function setUserDefault(key:String, type:String, value:String):Void;
	/**
		Removes the key in NSUserDefaults. This can be used to restore the default or global value of a key previously set with setUserDefault.
	**/
	@:electron_platforms(["macOS"])
	static function removeUserDefault(key:String):Void;
	/**
		An example of using it to determine if you should create a transparent window or not (transparent windows won't work correctly when DWM composition is disabled):
	**/
	@:electron_platforms(["Windows"])
	static function isAeroGlassEnabled():Bool;
	@:electron_platforms(["Windows"])
	static function getAccentColor():String;
	@:electron_platforms(["Windows"])
	static function getColor(color:String):String;
	@:electron_platforms(["Windows"])
	static function isInvertedColorScheme():Bool;
}
@:enum abstract SystemPreferencesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	@:electron_platforms(["Windows"])
	var accent_color_changed : electron.main.SystemPreferencesEvent<(js.html.Event, String) -> Void> = "accent-color-changed";
	@:electron_platforms(["Windows"])
	var color_changed : electron.main.SystemPreferencesEvent<js.html.Event -> Void> = "color-changed";
	@:electron_platforms(["Windows"])
	var inverted_color_scheme_changed : electron.main.SystemPreferencesEvent<(js.html.Event, Bool) -> Void> = "inverted-color-scheme-changed";
}
