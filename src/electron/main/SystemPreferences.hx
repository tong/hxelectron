package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "systemPreferences") extern class SystemPreferences {
	@:electron_platform(["macOS"])
	static function isDarkMode():Bool;
	@:electron_platform(["macOS"])
	static function isSwipeTrackingFromScrollEventsEnabled():Bool;
	/**
		Posts event as native notifications of macOS. The userInfo is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platform(["macOS"])
	static function postNotification(event:String, userInfo:Dynamic):Void;
	/**
		Posts event as native notifications of macOS. The userInfo is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platform(["macOS"])
	static function postLocalNotification(event:String, userInfo:Dynamic):Void;
	/**
		Subscribes to native notifications of macOS, callback will be called with callback(event, userInfo) when the corresponding event happens. The userInfo is an Object that contains the user information dictionary sent along with the notification. The id of the subscriber is returned, which can be used to unsubscribe the event. Under the hood this API subscribes to NSDistributedNotificationCenter, example values of event are:
	**/
	@:electron_platform(["macOS"])
	static function subscribeNotification(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Removes the subscriber with id.
	**/
	@:electron_platform(["macOS"])
	static function unsubscribeNotification(id:Int):Void;
	/**
		Same as subscribeNotification, but uses NSNotificationCenter for local defaults. This is necessary for events such as NSUserDefaultsDidChangeNotification
	**/
	@:electron_platform(["macOS"])
	static function subscribeLocalNotification(event:String, callback:haxe.Constraints.Function):Void;
	/**
		Same as unsubscribeNotification, but removes the subscriber from NSNotificationCenter.
	**/
	@:electron_platform(["macOS"])
	static function unsubscribeLocalNotification(id:Int):Void;
	/**
		This API uses NSUserDefaults on macOS. Some popular key and types are:
	**/
	@:electron_platform(["macOS"])
	static function getUserDefault(key:String, type:String):Any;
	/**
		Set the value of key in system preferences. Note that type should match actual type of value. An exception is thrown if they don't. This API uses NSUserDefaults on macOS. Some popular key and types are:
	**/
	@:electron_platform(["macOS"])
	static function setUserDefault(key:String, type:String, value:String):Void;
	/**
		An example of using it to determine if you should create a transparent window or not (transparent windows won't work correctly when DWM composition is disabled):
	**/
	@:electron_platform(["Windows"])
	static function isAeroGlassEnabled():Bool;
	@:electron_platform(["Windows"])
	static function getAccentColor():String;
	@:electron_platform(["Windows"])
	static function getColor(color:String):String;
	@:electron_platform(["Windows"])
	static function isInvertedColorScheme():Bool;
}