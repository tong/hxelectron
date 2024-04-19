package electron;
/**
	@see https://electronjs.org/docs/api/structures/browser-window-options
**/
typedef BrowserWindowConstructorOptions = {
	/**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : electron.WebPreferences;
	/**
		Whether the renderer should be active when `show` is `false` and it has just been created.  In order for `document.visibilityState` to work correctly on first load with `show: false` you should set this to `false`.  Setting this to `false` will cause the `ready-to-show` event to not fire.  Default is `true`.
	**/
	@:optional
	var paintWhenInitiallyHidden : Bool;
	/**
		When using a frameless window in conjunction with `win.setWindowButtonVisibility(true)` on macOS or using a `titleBarStyle` so that the standard window controls ("traffic lights" on macOS) are visible, this property enables the Window Controls Overlay JavaScript APIs and CSS Environment Variables. Specifying `true` will result in an overlay with default system colors. Default is `false`.
	**/
	@:optional
	var titleBarOverlay : haxe.extern.EitherType<{ /**
		The CSS color of the Window Controls Overlay when enabled. Default is the system color.
	**/
	@:optional
	var color : String; /**
		The CSS color of the symbols on the Window Controls Overlay when enabled. Default is the system color.
	**/
	@:optional
	var symbolColor : String; /**
		The height of the title bar and Window Controls Overlay in pixels. Default is system height.
	**/
	@:optional
	var height : Int; }, Bool>;
}
