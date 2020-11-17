package electron.main;
/**
	> Read and respond to changes in Chromium's native color theme.
	
	Process: Main
	@see https://electronjs.org/docs/api/native-theme
**/
@:jsRequire("electron", "nativeTheme") extern class NativeTheme extends js.node.events.EventEmitter<electron.main.NativeTheme> {
	/**
		A `Boolean` for if the OS / Chromium currently has a dark mode enabled or is being instructed to show a dark-style UI.  If you want to modify this value you should use `themeSource` below.
	**/
	static var shouldUseDarkColors : Bool;
	/**
		A `String` property that can be `system`, `light` or `dark`.  It is used to override and supersede the value that Chromium has chosen to use internally.
		
		Setting this property to `system` will remove the override and everything will be reset to the OS default.  By default `themeSource` is `system`.
		
		Settings this property to `dark` will have the following effects:
		
		* `nativeTheme.shouldUseDarkColors` will be `true` when accessed
		* Any UI Electron renders on Linux and Windows including context menus, devtools, etc. will use the dark UI.
		* Any UI the OS renders on macOS including menus, window frames, etc. will use the dark UI.
		* The `prefers-color-scheme` CSS query will match `dark` mode.
		* The `updated` event will be emitted
		
		Settings this property to `light` will have the following effects:
		
		* `nativeTheme.shouldUseDarkColors` will be `false` when accessed
		* Any UI Electron renders on Linux and Windows including context menus, devtools, etc. will use the light UI.
		* Any UI the OS renders on macOS including menus, window frames, etc. will use the light UI.
		* The `prefers-color-scheme` CSS query will match `light` mode.
		* The `updated` event will be emitted
		
		The usage of this property should align with a classic "dark mode" state machine in your application where the user has three options.
		
		* `Follow OS` --> `themeSource = 'system'`
		* `Dark Mode` --> `themeSource = 'dark'`
		* `Light Mode` --> `themeSource = 'light'`
		
		Your application should then always use `shouldUseDarkColors` to determine what CSS to apply.
	**/
	static var themeSource : String;
	/**
		A `Boolean` for if the OS / Chromium currently has high-contrast mode enabled or is being instructed to show a high-contrast UI.
	**/
	static var shouldUseHighContrastColors : Bool;
	/**
		A `Boolean` for if the OS / Chromium currently has an inverted color scheme or is being instructed to use an inverted color scheme.
	**/
	static var shouldUseInvertedColorScheme : Bool;
}
@:enum abstract NativeThemeEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when something in the underlying NativeTheme has changed. This normally means that either the value of `shouldUseDarkColors`, `shouldUseHighContrastColors` or `shouldUseInvertedColorScheme` has changed. You will have to check them to determine which one has changed.
	**/
	var updated : electron.main.NativeThemeEvent<Void -> Void> = "updated";
}
