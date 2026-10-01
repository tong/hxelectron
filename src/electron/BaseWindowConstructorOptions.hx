package electron;
/**
	When setting minimum or maximum window size with `minWidth`/`maxWidth`/ `minHeight`/`maxHeight`, it only constrains the users. It won't prevent you from passing a size that does not follow size constraints to `setBounds`/`setSize` or to the constructor of `BrowserWindow`.
	
	The possible values and behaviors of the `type` option are platform dependent. Possible values are:
	
	* On Linux, possible types are `desktop`, `dock`, `toolbar`, `splash`, `notification`.
	  * The `desktop` type places the window at the desktop background window level (kCGDesktopWindowLevel - 1). However, note that a desktop window will not receive focus, keyboard, or mouse events. You can still use globalShortcut to receive input sparingly.
	  * The `dock` type creates a dock-like window behavior.
	  * The `toolbar` type creates a window with a toolbar appearance.
	  * The `splash` type behaves in a specific way. It is not draggable, even if the CSS styling of the window's body contains -webkit-app-region: drag. This type is commonly used for splash screens.
	  * The `notification` type creates a window that behaves like a system notification.
	* On macOS, possible types are `desktop`, `textured`, `panel`.
	  * The `textured` type adds metal gradient appearance. This option is **deprecated**.
	  * The `desktop` type places the window at the desktop background window level (`kCGDesktopWindowLevel - 1`). Note that desktop window will not receive focus, keyboard or mouse events, but you can use `globalShortcut` to receive input sparingly.
	  * The `panel` type enables the window to float on top of full-screened apps by adding the `NSWindowStyleMaskNonactivatingPanel` style mask, normally reserved for NSPanel, at runtime. Also, the window will appear on all spaces (desktops).
	* On Windows, possible type is `toolbar`.
	@see https://electronjs.org/docs/api/structures/base-window-options
**/
typedef BaseWindowConstructorOptions = {
	/**
		Window's width in pixels. Default is `800`.
	**/
	@:optional
	var width : Int;
	/**
		Window's height in pixels. Default is `600`.
	**/
	@:optional
	var height : Int;
	/**
		(**required** if y is used) Window's left offset from screen. Default is to center the window.
	**/
	@:optional
	var x : Int;
	/**
		(**required** if x is used) Window's top offset from screen. Default is to center the window.
	**/
	@:optional
	var y : Int;
	/**
		The `width` and `height` would be used as web page's size, which means the actual window's size will include window frame's size and be slightly larger. Default is `false`.
	**/
	@:optional
	var useContentSize : Bool;
	/**
		Show window in the center of the screen. Default is `false`.
	**/
	@:optional
	var center : Bool;
	/**
		Window's minimum width. Default is `0`.
	**/
	@:optional
	var minWidth : Int;
	/**
		Window's minimum height. Default is `0`.
	**/
	@:optional
	var minHeight : Int;
	/**
		Window's maximum width. Default is no limit.
	**/
	@:optional
	var maxWidth : Int;
	/**
		Window's maximum height. Default is no limit.
	**/
	@:optional
	var maxHeight : Int;
	/**
		Whether window is resizable. Default is `true`.
	**/
	@:optional
	var resizable : Bool;
	/**
		Whether window is movable. This is not implemented on Linux. Default is `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var movable : Bool;
	/**
		Whether window is minimizable. This is not implemented on Linux. Default is `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var minimizable : Bool;
	/**
		Whether window is maximizable. This is not implemented on Linux. Default is `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var maximizable : Bool;
	/**
		Whether window is closable. This is not implemented on Linux. Default is `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var closable : Bool;
	/**
		Whether the window can be focused. Default is `true`. On Windows setting `focusable: false` also implies setting `skipTaskbar: true`. On Linux setting `focusable: false` makes the window stop interacting with wm, so the window will always stay on top in all workspaces.
	**/
	@:optional
	var focusable : Bool;
	/**
		Whether the window should always stay on top of other windows. Default is `false`. Not supported on Wayland (Linux).
	**/
	@:optional
	var alwaysOnTop : Bool;
	/**
		Whether the window should show in fullscreen. When explicitly set to `false` the fullscreen button will be hidden or disabled on macOS. Default is `false`.
	**/
	@:optional
	var fullscreen : Bool;
	/**
		Whether the window can be put into fullscreen mode. On macOS, also whether the maximize/zoom button should toggle full screen mode or maximize window. Default is `true`.
	**/
	@:optional
	var fullscreenable : Bool;
	/**
		Use pre-Lion fullscreen on macOS. Default is `false`.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var simpleFullscreen : Bool;
	/**
		Whether to show the window in taskbar. Default is `false`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var skipTaskbar : Bool;
	/**
		Whether window should be hidden when the user toggles into mission control.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var hiddenInMissionControl : Bool;
	/**
		Whether the window is in kiosk mode. Default is `false`.
	**/
	@:optional
	var kiosk : Bool;
	/**
		A unique identifier for the window, used internally by Electron to enable features such as state persistence. Each window must have a distinct name. It can only be reused after the corresponding window has been destroyed. An error is thrown if the name is already in use. This is not the visible title shown to users on the title bar.
	**/
	@:optional
	var name : String;
	/**
		Configures or enables the persistence of window state (position, size, maximized state, etc.) across application restarts. Has no effect if window `name` is not provided. Automatically disabled when there is no available display. _Experimental_
	**/
	@:optional
	var windowStatePersistence : haxe.extern.EitherType<electron.WindowStatePersistence, Bool>;
	/**
		Default window title. Default is `"Electron"`. If the HTML tag `<title>` is defined in the HTML file loaded by `loadURL()`, this property will be ignored.
	**/
	@:optional
	var title : String;
	/**
		The window icon. On Windows it is recommended to use `ICO` icons to get best visual effects, you can also leave it undefined so the executable's icon will be used.
	**/
	@:optional
	var icon : haxe.extern.EitherType<electron.NativeImage, String>;
	/**
		Whether window should be shown when created. Default is `true`.
	**/
	@:optional
	var show : Bool;
	/**
		Specify `false` to create a frameless window. Default is `true`.
	**/
	@:optional
	var frame : Bool;
	/**
		Specify parent window. Default is `null`.
	**/
	@:optional
	var parent : electron.main.BaseWindow;
	/**
		Whether this is a modal window. This only works when the window is a child window. Default is `false`.
	**/
	@:optional
	var modal : Bool;
	/**
		Whether clicking an inactive window will also click through to the web contents. Default is `false` on macOS. This option is not configurable on other platforms.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var acceptFirstMouse : Bool;
	/**
		Whether to hide cursor when typing. Default is `false`.
	**/
	@:optional
	var disableAutoHideCursor : Bool;
	/**
		Auto hide the menu bar unless the `Alt` key is pressed. Default is `false`.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var autoHideMenuBar : Bool;
	/**
		Enable the window to be resized larger than screen. Only relevant for macOS, as other OSes allow larger-than-screen windows by default. Default is `false`.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var enableLargerThanScreen : Bool;
	/**
		The window's background color in Hex, RGB, RGBA, HSL, HSLA or named CSS color format. Alpha in #AARRGGBB format is supported if `transparent` is set to `true`. Default is `#FFF` (white). See win.setBackgroundColor for more information.
	**/
	@:optional
	var backgroundColor : String;
	/**
		Whether window should have a shadow. Default is `true`.
	**/
	@:optional
	var hasShadow : Bool;
	/**
		Set the initial opacity of the window, between 0.0 (fully transparent) and 1.0 (fully opaque). This is only implemented on Windows and macOS.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var opacity : Float;
	/**
		Forces using dark theme for the window, only works on some GTK+3 desktop environments. Default is `false`.
	**/
	@:optional
	var darkTheme : Bool;
	/**
		Makes the window transparent. Default is `false`. On Windows, does not work unless the window is frameless. When you add a `View` to a `BaseWindow`, you'll need to call `view.setBackgroundColor` with a transparent background color on that view to make its background transparent as well.
	**/
	@:optional
	var transparent : Bool;
	/**
		The type of window, default is normal window. See more about this below.
	**/
	@:optional
	var type : String;
	/**
		Specify how the material appearance should reflect window activity state on macOS. Must be used with the `vibrancy` property. Possible values are:
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var visualEffectState : BaseWindowConstructorOptionsVisualEffectState;
	/**
		The style of window title bar. Default is `default`. Possible values are:
	**/
	@:optional
	var titleBarStyle : BaseWindowConstructorOptionsTitleBarStyle;
	/**
		When using a frameless window in conjunction with `win.setWindowButtonVisibility(true)` on macOS or using a `titleBarStyle` so that the standard window controls ("traffic lights" on macOS) are visible, this property enables the Window Controls Overlay JavaScript APIs and CSS Environment Variables. Specifying `true` will result in an overlay with default system colors. Default is `false`.
	**/
	@:optional
	var titleBarOverlay : haxe.extern.EitherType<{ /**
		The CSS color of the Window Controls Overlay when enabled. Default is the system color.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var color : String; /**
		The CSS color of the symbols on the Window Controls Overlay when enabled. Default is the system color.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var symbolColor : String; /**
		The height of the title bar and Window Controls Overlay in pixels. Default is system height.
	**/
	@:optional
	var height : Int; }, Bool>;
	/**
		The accent color for the window. By default, follows user preference in System Settings. Set to `false` to explicitly disable, or set the color in Hex, RGB, RGBA, HSL, HSLA or named CSS color format. Alpha values will be ignored.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var accentColor : haxe.extern.EitherType<Bool, String>;
	/**
		Set a custom position for the traffic light buttons in frameless windows.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var trafficLightPosition : electron.Point;
	/**
		Whether a frameless window should have rounded corners. Default is `true`. On Windows versions older than Windows 11 Build 22000 this property has no effect, and frameless windows will not have rounded corners. On Linux, rounded corners are only drawn when the desktop environment supports client-side decorations.
	**/
	@:optional
	var roundedCorners : Bool;
	/**
		Use `WS_THICKFRAME` style for frameless windows on Windows, which adds the standard window frame. Setting it to `false` will remove window shadow and window animations, and disable window resizing via dragging the window edges. Default is `true`.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var thickFrame : Bool;
	/**
		Add a type of vibrancy effect to the window, only on macOS. Can be `appearance-based`, `titlebar`, `selection`, `menu`, `popover`, `sidebar`, `header`, `sheet`, `window`, `hud`, `fullscreen-ui`, `tooltip`, `content`, `under-window`, or `under-page`.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var vibrancy : BaseWindowConstructorOptionsVibrancy;
	/**
		Set the window's system-drawn background material, including behind the non-client area. Can be `auto`, `none`, `mica`, `acrylic` or `tabbed`. See win.setBackgroundMaterial for more information.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var backgroundMaterial : BaseWindowConstructorOptionsBackgroundMaterial;
	/**
		Controls the behavior on macOS when option-clicking the green stoplight button on the toolbar or by clicking the Window > Zoom menu item. If `true`, the window will grow to the preferred width of the web page when zoomed, `false` will cause it to zoom to the width of the screen. This will also affect the behavior when calling `maximize()` directly. Default is `false`.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var zoomToPageWidth : Bool;
	/**
		Tab group name, allows opening the window as a native tab. Windows with the same tabbing identifier will be grouped together. This also adds a native new tab button to your window's tab bar and allows your `app` and window to receive the `new-window-for-tab` event.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var tabbingIdentifier : String;
}
enum abstract BaseWindowConstructorOptionsVisualEffectState(String) from String to String {
	/**
		The backdrop should automatically appear active when the window is active, and inactive when it is not. This is the default.
	**/
	var followWindow = "followWindow";
	/**
		The backdrop should always appear active.
	**/
	var active = "active";
	/**
		The backdrop should always appear inactive.
	**/
	var inactive = "inactive";
}
enum abstract BaseWindowConstructorOptionsTitleBarStyle(String) from String to String {
	/**
		Results in the standard title bar for macOS or Windows respectively.
	**/
	var default_ = "default";
	/**
		Results in a hidden title bar and a full size content window. On macOS, the window still has the standard window controls (“traffic lights”) in the top left. On Windows and Linux, when combined with `titleBarOverlay: true` it will activate the Window Controls Overlay (see `titleBarOverlay` for more information), otherwise no window controls will be shown.
	**/
	var hidden = "hidden";
	/**
		Results in a hidden title bar with an alternative look where the traffic light buttons are slightly more inset from the window edge.
	**/
	var hiddenInset = "hiddenInset";
	/**
		Results in a hidden title bar and a full size content window, the traffic light buttons will display when being hovered over in the top left of the window. **Note:** This option is currently experimental.
	**/
	var customButtonsOnHover = "customButtonsOnHover";
}
enum abstract BaseWindowConstructorOptionsVibrancy(String) from String to String {
	var appearance_based = "appearance-based";
	var titlebar = "titlebar";
	var selection = "selection";
	var menu = "menu";
	var popover = "popover";
	var sidebar = "sidebar";
	var header = "header";
	var sheet = "sheet";
	var window = "window";
	var hud = "hud";
	var fullscreen_ui = "fullscreen-ui";
	var tooltip = "tooltip";
	var content = "content";
	var under_window = "under-window";
	var under_page = "under-page";
}
enum abstract BaseWindowConstructorOptionsBackgroundMaterial(String) from String to String {
	var auto = "auto";
	var none = "none";
	var mica = "mica";
	var acrylic = "acrylic";
	var tabbed = "tabbed";
}
