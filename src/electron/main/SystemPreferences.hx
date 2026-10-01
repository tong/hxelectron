package electron.main;
/**
	> Get system preferences.
	
	Process: Main, Utility
	@see https://electronjs.org/docs/api/system-preferences
**/
@:jsRequire("electron", "systemPreferences") extern class SystemPreferences extends js.node.events.EventEmitter<electron.main.SystemPreferences> {
	/**
		A `boolean` property which determines whether the app avoids using semitransparent backgrounds. This maps to NSWorkspace.accessibilityDisplayShouldReduceTransparency
		
		**Deprecated:** Use the new `nativeTheme.prefersReducedTransparency` API.
	**/
	@:electron_platforms(["macOS"])
	@:deprecated
	static var accessibilityDisplayShouldReduceTransparency : Bool;
	/**
		A `string` property that can be `dark`, `light` or `unknown`.
		
		Returns the macOS appearance setting that is currently applied to your application, maps to NSApplication.effectiveAppearance
	**/
	@:electron_platforms(["macOS"])
	static var effectiveAppearance : SystemPreferencesEffectiveAppearance;
	/**
		Whether the Swipe between pages setting is on.
	**/
	@:electron_platforms(["macOS"])
	static function isSwipeTrackingFromScrollEventsEnabled():Bool;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postNotification(event:String, userInfo:haxe.DynamicAccess<Any>, ?deliverImmediately:Bool):Void;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postLocalNotification(event:String, userInfo:haxe.DynamicAccess<Any>):Void;
	/**
		Posts `event` as native notifications of macOS. The `userInfo` is an Object that contains the user information dictionary sent along with the notification.
	**/
	@:electron_platforms(["macOS"])
	static function postWorkspaceNotification(event:String, userInfo:haxe.DynamicAccess<Any>):Void;
	/**
		The ID of this subscription
		
		Subscribes to native notifications of macOS, `callback` will be called with `callback(event, userInfo)` when the corresponding `event` happens. The `userInfo` is an Object that contains the user information dictionary sent along with the notification. The `object` is the sender of the notification, and only supports `NSString` values for now.
		
		The `id` of the subscriber is returned, which can be used to unsubscribe the `event`.
		
		Under the hood this API subscribes to `NSDistributedNotificationCenter`, example values of `event` are:
		
		* `AppleInterfaceThemeChangedNotification`
		* `AppleAquaColorVariantChanged`
		* `AppleColorPreferencesChangedNotification`
		* `AppleShowScrollBarsSettingChanged`
		
		If `event` is null, the `NSDistributedNotificationCenter` doesn’t use it as criteria for delivery to the observer. See docs  for more information.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeNotification(event:haxe.extern.EitherType<String, Dynamic>, callback:haxe.Constraints.Function):Float;
	/**
		The ID of this subscription
		
		Same as `subscribeNotification`, but uses `NSNotificationCenter` for local defaults. This is necessary for events such as `NSUserDefaultsDidChangeNotification`.
		
		If `event` is null, the `NSNotificationCenter` doesn’t use it as criteria for delivery to the observer. See docs for more information.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeLocalNotification(event:haxe.extern.EitherType<String, Dynamic>, callback:haxe.Constraints.Function):Float;
	/**
		The ID of this subscription
		
		Same as `subscribeNotification`, but uses `NSWorkspace.sharedWorkspace.notificationCenter`. This is necessary for events such as `NSWorkspaceDidActivateApplicationNotification`.
		
		If `event` is null, the `NSWorkspaceNotificationCenter` doesn’t use it as criteria for delivery to the observer. See docs for more information.
	**/
	@:electron_platforms(["macOS"])
	static function subscribeWorkspaceNotification(event:haxe.extern.EitherType<String, Dynamic>, callback:haxe.Constraints.Function):Float;
	/**
		Removes the subscriber with `id`.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeNotification(id:Int):Void;
	/**
		Same as `unsubscribeNotification`, but removes the subscriber from `NSNotificationCenter`.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeLocalNotification(id:Int):Void;
	/**
		Same as `unsubscribeNotification`, but removes the subscriber from `NSWorkspace.sharedWorkspace.notificationCenter`.
	**/
	@:electron_platforms(["macOS"])
	static function unsubscribeWorkspaceNotification(id:Int):Void;
	/**
		Add the specified defaults to your application's `NSUserDefaults`.
	**/
	@:electron_platforms(["macOS"])
	static function registerDefaults(defaults:haxe.DynamicAccess<haxe.extern.EitherType<String, haxe.extern.EitherType<Bool, Float>>>):Void;
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
	@:electron_platforms(["macOS"])
	static function getUserDefault(key:String, type:Dynamic):Dynamic;
	/**
		Set the value of `key` in `NSUserDefaults`.
		
		Note that `type` should match actual type of `value`. An exception is thrown if they don't.
		
		Some popular `key` and `type`s are:
		
		* `ApplePressAndHoldEnabled`: `boolean`
	**/
	@:electron_platforms(["macOS"])
	static function setUserDefault(key:String, type:Dynamic, value:Dynamic):Void;
	/**
		Removes the `key` in `NSUserDefaults`. This can be used to restore the default or global value of a `key` previously set with `setUserDefault`.
	**/
	@:electron_platforms(["macOS"])
	static function removeUserDefault(key:String):Void;
	/**
		The users current system wide accent color preference in RGBA hexadecimal form.
		
		This API is only available on macOS 10.14 Mojave or newer.
	**/
	static function getAccentColor():String;
	/**
		The system color setting in RGBA hexadecimal form (`#RRGGBBAA`). See the Windows docs and the macOS docs for more details.
		
		The following colors are only available on macOS 10.14: `find-highlight`, `selected-content-background`, `separator`, `unemphasized-selected-content-background`, `unemphasized-selected-text-background`, and `unemphasized-selected-text`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function getColor(color:SystemPreferencesGetColorColor):String;
	/**
		The standard system color formatted as `#RRGGBBAA`.
		
		Returns one of several standard system colors that automatically adapt to vibrancy and changes in accessibility settings like 'Increase contrast' and 'Reduce transparency'. See Apple Documentation for  more details.
	**/
	@:electron_platforms(["macOS"])
	static function getSystemColor(color:SystemPreferencesGetSystemColorColor):String;
	/**
		Can be `dark`, `light` or `unknown`.
		
		Gets the macOS appearance setting that is currently applied to your application, maps to NSApplication.effectiveAppearance
	**/
	@:electron_platforms(["macOS"])
	static function getEffectiveAppearance():SystemPreferencesGetEffectiveAppearanceResult;
	/**
		whether or not this device has the ability to use Touch ID.
	**/
	@:electron_platforms(["macOS"])
	static function canPromptTouchID():Bool;
	/**
		resolves if the user has successfully authenticated with Touch ID.
		
		This API itself will not protect your user data; rather, it is a mechanism to allow you to do so. Native apps will need to set Access Control Constants like `kSecAccessControlUserPresence` on their keychain entry so that reading it would auto-prompt for Touch ID biometric consent. This could be done with `node-keytar`, such that one would store an encryption key with `node-keytar` and only fetch it if `promptTouchID()` resolves.
	**/
	@:electron_platforms(["macOS"])
	static function promptTouchID(reason:String):js.lib.Promise<Void>;
	/**
		`true` if the current process is a trusted accessibility client and `false` if it is not.
	**/
	@:electron_platforms(["macOS"])
	static function isTrustedAccessibilityClient(prompt:Bool):Bool;
	/**
		Can be `not-determined`, `granted`, `denied`, `restricted` or `unknown`.
		
		This user consent was not required on macOS 10.13 High Sierra so this method will always return `granted`. macOS 10.14 Mojave or higher requires consent for `microphone` and `camera` access. macOS 10.15 Catalina or higher requires consent for `screen` access.
		
		Windows 10 has a global setting controlling `microphone` and `camera` access for all win32 applications. It will always return `granted` for `screen` and for all media types on older versions of Windows.
	**/
	@:electron_platforms(["macOS", "Windows"])
	static function getMediaAccessStatus(mediaType:SystemPreferencesGetMediaAccessStatusMediaType):SystemPreferencesGetMediaAccessStatusResult;
	/**
		A promise that resolves with `true` if consent was granted and `false` if it was denied. If an invalid `mediaType` is passed, the promise will be rejected. If an access request was denied and later is changed through the System Preferences pane, a restart of the app will be required for the new permissions to take effect. If access has already been requested and denied, it _must_ be changed through the preference pane; an alert will not pop up and the promise will resolve with the existing access status.
		
		**Important:** In order to properly leverage this API, you must set the `NSMicrophoneUsageDescription` and `NSCameraUsageDescription` strings in your app's `Info.plist` file. The values for these keys will be used to populate the permission dialogs so that the user will be properly informed as to the purpose of the permission request. See Electron Application Distribution for more information about how to set these in the context of Electron.
		
		This user consent was not required until macOS 10.14 Mojave, so this method will always return `true` if your system is running 10.13 High Sierra.
	**/
	@:electron_platforms(["macOS"])
	static function askForMediaAccess(mediaType:SystemPreferencesAskForMediaAccessMediaType):js.lib.Promise<Bool>;
	/**
		* `shouldRenderRichAnimation` boolean - Returns true if rich animations should be rendered. Looks at session type (e.g. remote desktop) and accessibility settings to give guidance for heavy animations.
		* `scrollAnimationsEnabledBySystem` boolean - Determines on a per-platform basis whether scroll animations (e.g. produced by home/end key) should be enabled.
		* `prefersReducedMotion` boolean - Determines whether the user desires reduced motion based on platform APIs.
		
		Returns an object with system animation settings.
	**/
	static function getAnimationSettings():{ /**
		Returns true if rich animations should be rendered. Looks at session type (e.g. remote desktop) and accessibility settings to give guidance for heavy animations.
	**/
	var shouldRenderRichAnimation : Bool; /**
		Determines on a per-platform basis whether scroll animations (e.g. produced by home/end key) should be enabled.
	**/
	var scrollAnimationsEnabledBySystem : Bool; /**
		Determines whether the user desires reduced motion based on platform APIs.
	**/
	var prefersReducedMotion : Bool; };
	static function on<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function once<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function addListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function off<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeAllListeners<T:(haxe.Constraints.Function)>(?event:js.node.events.EventEmitter.Event<T>):Void;
}
enum abstract SystemPreferencesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	@:electron_platforms(["Windows", "Linux"])
	var accent_color_changed : electron.main.SystemPreferencesEvent<(js.html.Event, String) -> Void> = "accent-color-changed";
	@:electron_platforms(["Windows"])
	var color_changed : electron.main.SystemPreferencesEvent<js.html.Event -> Void> = "color-changed";
}
enum abstract SystemPreferencesEffectiveAppearance(String) from String to String {
	var dark = "dark";
	var light = "light";
	var unknown = "unknown";
}
enum abstract SystemPreferencesGetColorColor(String) from String to String {
	/**
		Dark shadow for three-dimensional display elements.
	**/
	var _3d_dark_shadow = "3d-dark-shadow";
	/**
		Face color for three-dimensional display elements and for dialog box backgrounds.
	**/
	var _3d_face = "3d-face";
	/**
		Highlight color for three-dimensional display elements.
	**/
	var _3d_highlight = "3d-highlight";
	/**
		Light color for three-dimensional display elements.
	**/
	var _3d_light = "3d-light";
	/**
		Shadow color for three-dimensional display elements.
	**/
	var _3d_shadow = "3d-shadow";
	/**
		Active window border.
	**/
	var active_border = "active-border";
	/**
		Active window title bar. Specifies the left side color in the color gradient of an active window's title bar if the gradient effect is enabled.
	**/
	var active_caption = "active-caption";
	/**
		Right side color in the color gradient of an active window's title bar.
	**/
	var active_caption_gradient = "active-caption-gradient";
	/**
		Background color of multiple document interface (MDI) applications.
	**/
	var app_workspace = "app-workspace";
	/**
		Text on push buttons.
	**/
	var button_text = "button-text";
	/**
		Text in caption, size box, and scroll bar arrow box.
	**/
	var caption_text = "caption-text";
	/**
		Desktop background color.
	**/
	var desktop = "desktop";
	/**
		Grayed (disabled) text.
	**/
	var disabled_text = "disabled-text";
	/**
		Item(s) selected in a control.
	**/
	var highlight = "highlight";
	/**
		Text of item(s) selected in a control.
	**/
	var highlight_text = "highlight-text";
	/**
		Color for a hyperlink or hot-tracked item.
	**/
	var hotlight = "hotlight";
	/**
		Inactive window border.
	**/
	var inactive_border = "inactive-border";
	/**
		Inactive window caption. Specifies the left side color in the color gradient of an inactive window's title bar if the gradient effect is enabled.
	**/
	var inactive_caption = "inactive-caption";
	/**
		Right side color in the color gradient of an inactive window's title bar.
	**/
	var inactive_caption_gradient = "inactive-caption-gradient";
	/**
		Color of text in an inactive caption.
	**/
	var inactive_caption_text = "inactive-caption-text";
	/**
		Background color for tooltip controls.
	**/
	var info_background = "info-background";
	/**
		Text color for tooltip controls.
	**/
	var info_text = "info-text";
	/**
		Menu background.
	**/
	var menu = "menu";
	/**
		The color used to highlight menu items when the menu appears as a flat menu.
	**/
	var menu_highlight = "menu-highlight";
	/**
		The background color for the menu bar when menus appear as flat menus.
	**/
	var menubar = "menubar";
	/**
		Text in menus.
	**/
	var menu_text = "menu-text";
	/**
		Scroll bar gray area.
	**/
	var scrollbar = "scrollbar";
	/**
		Window background.
	**/
	var window = "window";
	/**
		Window frame.
	**/
	var window_frame = "window-frame";
	/**
		Text in windows.
	**/
	var window_text = "window-text";
	/**
		The background of a large interface element, such as a browser or table.
	**/
	var control_background = "control-background";
	/**
		The surface of a control.
	**/
	var control = "control";
	/**
		The text of a control that isn’t disabled.
	**/
	var control_text = "control-text";
	/**
		The text of a control that’s disabled.
	**/
	var disabled_control_text = "disabled-control-text";
	/**
		The color of a find indicator.
	**/
	var find_highlight = "find-highlight";
	/**
		The gridlines of an interface element such as a table.
	**/
	var grid = "grid";
	/**
		The text of a header cell in a table.
	**/
	var header_text = "header-text";
	/**
		The virtual light source onscreen.
	**/
	var highlight_ = "highlight";
	/**
		The ring that appears around the currently focused control when using the keyboard for interface navigation.
	**/
	var keyboard_focus_indicator = "keyboard-focus-indicator";
	/**
		The text of a label containing primary content.
	**/
	var label = "label";
	/**
		A link to other content.
	**/
	var link = "link";
	/**
		A placeholder string in a control or text view.
	**/
	var placeholder_text = "placeholder-text";
	/**
		The text of a label of lesser importance than a tertiary label such as watermark text.
	**/
	var quaternary_label = "quaternary-label";
	/**
		The background of a scrubber in the Touch Bar.
	**/
	var scrubber_textured_background = "scrubber-textured-background";
	/**
		The text of a label of lesser importance than a normal label such as a label used to represent a subheading or additional information.
	**/
	var secondary_label = "secondary-label";
	/**
		The background for selected content in a key window or view.
	**/
	var selected_content_background = "selected-content-background";
	/**
		The surface of a selected control.
	**/
	var selected_control = "selected-control";
	/**
		The text of a selected control.
	**/
	var selected_control_text = "selected-control-text";
	/**
		The text of a selected menu.
	**/
	var selected_menu_item_text = "selected-menu-item-text";
	/**
		The background of selected text.
	**/
	var selected_text_background = "selected-text-background";
	/**
		Selected text.
	**/
	var selected_text = "selected-text";
	/**
		A separator between different sections of content.
	**/
	var separator = "separator";
	/**
		The virtual shadow cast by a raised object onscreen.
	**/
	var shadow = "shadow";
	/**
		The text of a label of lesser importance than a secondary label such as a label used to represent disabled text.
	**/
	var tertiary_label = "tertiary-label";
	/**
		Text background.
	**/
	var text_background = "text-background";
	/**
		The text in a document.
	**/
	var text = "text";
	/**
		The background behind a document's content.
	**/
	var under_page_background = "under-page-background";
	/**
		The selected content in a non-key window or view.
	**/
	var unemphasized_selected_content_background = "unemphasized-selected-content-background";
	/**
		A background for selected text in a non-key window or view.
	**/
	var unemphasized_selected_text_background = "unemphasized-selected-text-background";
	/**
		Selected text in a non-key window or view.
	**/
	var unemphasized_selected_text = "unemphasized-selected-text";
	/**
		The background of a window.
	**/
	var window_background = "window-background";
	/**
		The text in the window's titlebar area.
	**/
	var window_frame_text = "window-frame-text";
}
enum abstract SystemPreferencesGetSystemColorColor(String) from String to String {
	var blue = "blue";
	var brown = "brown";
	var gray = "gray";
	var green = "green";
	var orange = "orange";
	var pink = "pink";
	var purple = "purple";
	var red = "red";
	var yellow = "yellow";
}
enum abstract SystemPreferencesGetEffectiveAppearanceResult(String) from String to String {
	var dark = "dark";
	var light = "light";
	var unknown = "unknown";
}
enum abstract SystemPreferencesGetMediaAccessStatusMediaType(String) from String to String {
	var microphone = "microphone";
	var camera = "camera";
	var screen = "screen";
}
enum abstract SystemPreferencesGetMediaAccessStatusResult(String) from String to String {
	var not_determined = "not-determined";
	var granted = "granted";
	var denied = "denied";
	var restricted = "restricted";
	var unknown = "unknown";
}
enum abstract SystemPreferencesAskForMediaAccessMediaType(String) from String to String {
	var microphone = "microphone";
	var camera = "camera";
}
