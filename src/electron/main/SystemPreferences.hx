package electron.main;
/**
	Get system preferences.
	@see http://electronjs.org/docs/api/system-preferences
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
	static function subscribeNotification(event:String, callback:haxe.Constraints.Function):Float;
	/**
		Same as subscribeNotification, but uses NSNotificationCenter for local defaults. This is necessary for events such as NSUserDefaultsDidChangeNotification.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeLocalNotification(event:String, callback:haxe.Constraints.Function):Float;
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
	/**
		Gets the macOS appearance setting that is currently applied to your application, maps to NSApplication.effectiveAppearance Please note that until Electron is built targeting the 10.14 SDK, your application's effectiveAppearance will default to 'light' and won't inherit the OS preference. In the interim in order for your application to inherit the OS preference you must set the NSRequiresAquaSystemAppearance key in your apps Info.plist to false.  If you are using electron-packager or electron-forge just set the enableDarwinDarkMode packager option to true.  See the Electron Packager API for more details.
	**/
	@:electron_platforms(["macOS"])
	static function getEffectiveAppearance():String;
	/**
		Gets the macOS appearance setting that you have declared you want for your application, maps to NSApplication.appearance. You can use the setAppLevelAppearance API to set this value.
	**/
	@:electron_platforms(["macOS"])
	static function getAppLevelAppearance():String;
	/**
		Sets the appearance setting for your application, this should override the system default and override the value of getEffectiveAppearance.
	**/
	@:electron_platforms(["macOS"])
	static function setAppLevelAppearance(appearance:haxe.extern.EitherType<String, Dynamic>):Void;
	@:electron_platforms(["macOS"])
	static function isTrustedAccessibilityClient(prompt:Bool):Bool;
	/**
		This user consent was not required until macOS 10.14 Mojave, so this method will always return granted if your system is running 10.13 High Sierra or lower.
	**/
	@:electron_platforms(["macOS"])
	static function getMediaAccessStatus(mediaType:String):String;
	/**
		Important: In order to properly leverage this API, you must set the NSMicrophoneUsageDescription and NSCameraUsageDescription strings in your app's Info.plist file. The values for these keys will be used to populate the permission dialogs so that the user will be properly informed as to the purpose of the permission request. See Electron Application Distribution for more information about how to set these in the context of Electron. This user consent was not required until macOS 10.14 Mojave, so this method will always return true if your system is running 10.13 High Sierra or lower.
	**/
	@:electron_platforms(["macOS"])
	static function askForMediaAccess(mediaType:String):js.Promise<Any>;
}
@:enum abstract SystemPreferencesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	@:electron_platforms(["Windows"])
	var accent_color_changed : electron.main.SystemPreferencesEvent<(js.html.Event, String) -> Void> = "accent-color-changed";
	@:electron_platforms(["Windows"])
	var color_changed : electron.main.SystemPreferencesEvent<js.html.Event -> Void> = "color-changed";
	@:electron_platforms(["Windows"])
	var inverted_color_scheme_changed : electron.main.SystemPreferencesEvent<(js.html.Event, Bool) -> Void> = "inverted-color-scheme-changed";
	/**
		NOTE: This event is only emitted after you have called startAppLevelAppearanceTrackingOS
	**/
	@:electron_platforms(["macOS"])
	var appearance_changed : electron.main.SystemPreferencesEvent<String -> Void> = "appearance-changed";
}
