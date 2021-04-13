package electron.remote;
/**
	> Get system preferences.
	
	Process: Main
	@see https://electronjs.org/docs/api/system-preferences
**/
@:jsRequire("electron", "remote.systemPreferences") extern class SystemPreferences extends js.node.events.EventEmitter<electron.remote.SystemPreferences> {
	/**
		A `String` property that can be `dark`, `light` or `unknown`. It determines the macOS appearance setting for your application. This maps to values in: NSApplication.appearance. Setting this will override the system default as well as the value of `getEffectiveAppearance`.
		
		Possible values that can be set are `dark` and `light`, and possible return values are `dark`, `light`, and `unknown`.
		
		This property is only available on macOS 10.14 Mojave or newer.
	**/
	static var appLevelAppearance : String;
	/**
		A `String` property that can be `dark`, `light` or `unknown`.
		
		Returns the macOS appearance setting that is currently applied to your application, maps to NSApplication.effectiveAppearance
	**/
	static var effectiveAppearance : String;
	/**
		Whether the system is in Dark Mode.
		
		**Deprecated:** Should use the new `nativeTheme.shouldUseDarkColors` API.
	**/
	static function isDarkMode():Bool;
	/**
		Whether the Swipe between pages setting is on.
	**/
	static function isSwipeTrackingFromScrollEventsEnabled():Bool;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	static function postNotification(event:String, userInfo:Record, ?deliverImmediately:Bool):Void;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	static function postLocalNotification(event:String, userInfo:Record):Void;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	static function postWorkspaceNotification(event:String, userInfo:Record):Void;
	/**
		The ID of this subscription
		
		Subscribes to native notifications of macOS, `callback` will be called with `callback(event, userInfo)` when the corresponding `event` happens. The `userInfo` is an Object that contains the user information dictionary sent along with the notification. The `object` is the sender of the notification, and only supports `NSString` values for now.
		
		The `id` of the subscriber is returned, which can be used to unsubscribe the `event`.
		
		Under the hood this API subscribes to `NSDistributedNotificationCenter`, example values of `event` are:
		
		* `AppleInterfaceThemeChangedNotification`
		* `AppleAquaColorVariantChanged`
		* `AppleColorPreferencesChangedNotification`
		* `AppleShowScrollBarsSettingChanged`
	**/
	static function subscribeNotification(event:String, callback:haxe.Constraints.Function):Float;
	/**
		The ID of this subscription
		
		Same as `subscribeNotification`, but uses `NSNotificationCenter` for local defaults. This is necessary for events such as `NSUserDefaultsDidChangeNotification`.
	**/
	static function subscribeLocalNotification(event:String, callback:haxe.Constraints.Function):Float;
	/**
		The ID of this subscription
		
		Same as `subscribeNotification`, but uses `NSWorkspace.sharedWorkspace.notificationCenter`. This is necessary for events such as `NSWorkspaceDidActivateApplicationNotification`.
	**/
	static function subscribeWorkspaceNotification(event:String, callback:haxe.Constraints.Function):Float;
	/**
		Removes the subscriber with `id`.
	**/
	static function unsubscribeNotification(id:Int):Void;
	/**
		Same as `unsubscribeNotification`, but removes the subscriber from `NSNotificationCenter`.
	**/
	static function unsubscribeLocalNotification(id:Int):Void;
	/**
		Same as `unsubscribeNotification`, but removes the subscriber from `NSWorkspace.sharedWorkspace.notificationCenter`.
	**/
	static function unsubscribeWorkspaceNotification(id:Int):Void;
	/**
		Add the specified defaults to your application's `NSUserDefaults`.
	**/
	static function registerDefaults(defaults:Record):Void;
	/**
		The value of `key` in `NSUserDefaults`.
		
		Some popular `key` and `type`s are:
		
		* `AppleInterfaceStyle`: `string`
		* `AppleAquaColorVariant`: `integer`
		* `AppleHighlightColor`: `string`
		* `AppleShowScrollBars`: `string`
		* `NSNavRecentPlaces`: `array`
		* `NSPreferredWebServices`: `dictionary`
		* `NSUserDictionaryReplacementItems`: `array`
	**/
	static function getUserDefault(key:String, type:String):Any;
	/**
		Set the value of `key` in `NSUserDefaults`.
		
		Note that `type` should match actual type of `value`. An exception is thrown if they don't.
		
		Some popular `key` and `type`s are:
		
		* `ApplePressAndHoldEnabled`: `boolean`
	**/
	static function setUserDefault(key:String, type:String, value:String):Void;
	/**
		Removes the `key` in `NSUserDefaults`. This can be used to restore the default or global value of a `key` previously set with `setUserDefault`.
	**/
	static function removeUserDefault(key:String):Void;
	/**
		`true` if DWM composition (Aero Glass) is enabled, and `false` otherwise.
		
		An example of using it to determine if you should create a transparent window or not (transparent windows won't work correctly when DWM composition is disabled):
	**/
	static function isAeroGlassEnabled():Bool;
	/**
		The users current system wide accent color preference in RGBA hexadecimal form.
		
		This API is only available on macOS 10.14 Mojave or newer.
	**/
	static function getAccentColor():String;
	/**
		The system color setting in RGB hexadecimal form (`#ABCDEF`). See the Windows docs and the macOS docs for more details.
		
		The following colors are only available on macOS 10.14: `find-highlight`, `selected-content-background`, `separator`, `unemphasized-selected-content-background`, `unemphasized-selected-text-background`, and `unemphasized-selected-text`.
	**/
	static function getColor(color:String):String;
	/**
		The standard system color formatted as `#RRGGBBAA`.
		
		Returns one of several standard system colors that automatically adapt to vibrancy and changes in accessibility settings like 'Increase contrast' and 'Reduce transparency'. See Apple Documentation for  more details.
	**/
	static function getSystemColor(color:String):String;
	/**
		`true` if an inverted color scheme (a high contrast color scheme with light text and dark backgrounds) is active, `false` otherwise.
		
		**Deprecated:** Should use the new `nativeTheme.shouldUseInvertedColorScheme` API.
	**/
	static function isInvertedColorScheme():Bool;
	/**
		`true` if a high contrast theme is active, `false` otherwise.
		
		**Deprecated:** Should use the new `nativeTheme.shouldUseHighContrastColors` API.
	**/
	static function isHighContrastColorScheme():Bool;
	/**
		Can be `dark`, `light` or `unknown`.
		
		Gets the macOS appearance setting that is currently applied to your application, maps to NSApplication.effectiveAppearance
	**/
	static function getEffectiveAppearance():String;
	/**
		| `null` - Can be `dark`, `light` or `unknown`.
		
		Gets the macOS appearance setting that you have declared you want for your application, maps to NSApplication.appearance. You can use the `setAppLevelAppearance` API to set this value.
	**/
	static function getAppLevelAppearance():String;
	/**
		Sets the appearance setting for your application, this should override the system default and override the value of `getEffectiveAppearance`.
	**/
	static function setAppLevelAppearance(appearance:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		whether or not this device has the ability to use Touch ID.
		
		**NOTE:** This API will return `false` on macOS systems older than Sierra 10.12.2.
	**/
	static function canPromptTouchID():Bool;
	/**
		resolves if the user has successfully authenticated with Touch ID.
		
		This API itself will not protect your user data; rather, it is a mechanism to allow you to do so. Native apps will need to set Access Control Constants like `kSecAccessControlUserPresence` on their keychain entry so that reading it would auto-prompt for Touch ID biometric consent. This could be done with `node-keytar`, such that one would store an encryption key with `node-keytar` and only fetch it if `promptTouchID()` resolves.
		
		**NOTE:** This API will return a rejected Promise on macOS systems older than Sierra 10.12.2.
	**/
	static function promptTouchID(reason:String):js.lib.Promise<Any>;
	/**
		`true` if the current process is a trusted accessibility client and `false` if it is not.
	**/
	static function isTrustedAccessibilityClient(prompt:Bool):Bool;
	/**
		Can be `not-determined`, `granted`, `denied`, `restricted` or `unknown`.
		
		This user consent was not required on macOS 10.13 High Sierra or lower so this method will always return `granted`. macOS 10.14 Mojave or higher requires consent for `microphone` and `camera` access. macOS 10.15 Catalina or higher requires consent for `screen` access.
		
		Windows 10 has a global setting controlling `microphone` and `camera` access for all win32 applications. It will always return `granted` for `screen` and for all media types on older versions of Windows.
	**/
	static function getMediaAccessStatus(mediaType:String):String;
	/**
		A promise that resolves with `true` if consent was granted and `false` if it was denied. If an invalid `mediaType` is passed, the promise will be rejected. If an access request was denied and later is changed through the System Preferences pane, a restart of the app will be required for the new permissions to take effect. If access has already been requested and denied, it _must_ be changed through the preference pane; an alert will not pop up and the promise will resolve with the existing access status.
		
		**Important:** In order to properly leverage this API, you must set the `NSMicrophoneUsageDescription` and `NSCameraUsageDescription` strings in your app's `Info.plist` file. The values for these keys will be used to populate the permission dialogs so that the user will be properly informed as to the purpose of the permission request. See Electron Application Distribution for more information about how to set these in the context of Electron.
		
		This user consent was not required until macOS 10.14 Mojave, so this method will always return `true` if your system is running 10.13 High Sierra or lower.
	**/
	static function askForMediaAccess(mediaType:String):js.lib.Promise<Any>;
	/**
		* `shouldRenderRichAnimation` Boolean - Returns true if rich animations should be rendered. Looks at session type (e.g. remote desktop) and accessibility settings to give guidance for heavy animations.
		* `scrollAnimationsEnabledBySystem` Boolean - Determines on a per-platform basis whether scroll animations (e.g. produced by home/end key) should be enabled.
		* `prefersReducedMotion` Boolean - Determines whether the user desires reduced motion based on platform APIs.
		
		Returns an object with system animation settings.
	**/
	static function getAnimationSettings():Any;
}
@:enum abstract SystemPreferencesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	var accent_color_changed : electron.remote.SystemPreferencesEvent<Void -> Void> = "accent-color-changed";
	var color_changed : electron.remote.SystemPreferencesEvent<Void -> Void> = "color-changed";
	/**
		**Deprecated:** Should use the new `updated` event on the `nativeTheme` module.
	**/
	var inverted_color_scheme_changed : electron.remote.SystemPreferencesEvent<Void -> Void> = "inverted-color-scheme-changed";
	/**
		**Deprecated:** Should use the new `updated` event on the `nativeTheme` module.
	**/
	var high_contrast_color_scheme_changed : electron.remote.SystemPreferencesEvent<Void -> Void> = "high-contrast-color-scheme-changed";
}
