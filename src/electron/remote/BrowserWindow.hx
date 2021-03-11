package electron.remote;
/**
	> Create and control browser windows.
	
	Process: Main
	
	### Frameless window
	
	To create a window without chrome, or a transparent window in arbitrary shape, you can use the Frameless Window API.
	
	### Showing window gracefully
	
	When loading a page in the window directly, users may see the page load incrementally, which is not a good experience for a native app. To make the window display without visual flash, there are two solutions for different situations.
	
	### Using `ready-to-show` event
	
	While loading the page, the `ready-to-show` event will be emitted when the renderer process has rendered the page for the first time if the window has not been shown yet. Showing the window after this event will have no visual flash:
	
	```
	const { BrowserWindow } = require('electron')
	const win = new BrowserWindow({ show: false })
	win.once('ready-to-show', () => {
	  win.show()
	})
	```
	
	This event is usually emitted after the `did-finish-load` event, but for pages with many remote resources, it may be emitted before the `did-finish-load` event.
	
	Please note that using this event implies that the renderer will be considered "visible" and paint even though `show` is false.  This event will never fire if you use `paintWhenInitiallyHidden: false`
	
	### Setting `backgroundColor`
	
	For a complex app, the `ready-to-show` event could be emitted too late, making the app feel slow. In this case, it is recommended to show the window immediately, and use a `backgroundColor` close to your app's background:
	
	```
	const { BrowserWindow } = require('electron')
	
	const win = new BrowserWindow({ backgroundColor: '#2e2c29' })
	win.loadURL('https://github.com')
	```
	
	Note that even for apps that use `ready-to-show` event, it is still recommended to set `backgroundColor` to make app feel more native.
	
	### Parent and child windows
	
	By using `parent` option, you can create child windows:
	
	```
	const { BrowserWindow } = require('electron')
	
	const top = new BrowserWindow()
	const child = new BrowserWindow({ parent: top })
	child.show()
	top.show()
	```
	
	The `child` window will always show on top of the `top` window.
	
	### Modal windows
	
	A modal window is a child window that disables parent window, to create a modal window, you have to set both `parent` and `modal` options:
	
	```
	const { BrowserWindow } = require('electron')
	
	const child = new BrowserWindow({ parent: top, modal: true, show: false })
	child.loadURL('https://github.com')
	child.once('ready-to-show', () => {
	  child.show()
	})
	```
	
	### Page visibility
	
	The Page Visibility API works as follows:
	
	* On all platforms, the visibility state tracks whether the window is hidden/minimized or not.
	* Additionally, on macOS, the visibility state also tracks the window occlusion state. If the window is occluded (i.e. fully covered) by another window, the visibility state will be `hidden`. On other platforms, the visibility state will be `hidden` only when the window is minimized or explicitly hidden with `win.hide()`.
	* If a `BrowserWindow` is created with `show: false`, the initial visibility state will be `visible` despite the window actually being hidden.
	* If `backgroundThrottling` is disabled, the visibility state will remain `visible` even if the window is minimized, occluded, or hidden.
	
	It is recommended that you pause expensive operations when the visibility state is `hidden` in order to minimize power consumption.
	
	### Platform notices
	
	* On macOS modal windows will be displayed as sheets attached to the parent window.
	* On macOS the child windows will keep the relative position to parent window when parent window moves, while on Windows and Linux child windows will not move.
	* On Linux the type of modal windows will be changed to `dialog`.
	* On Linux many desktop environments do not support hiding a modal window.
	
	### Class: BrowserWindow
	
	> Create and control browser windows.
	
	Process: Main
	
	`BrowserWindow` is an EventEmitter.
	
	It creates a new `BrowserWindow` with native properties as set by the `options`.
	@see https://electronjs.org/docs/api/browser-window
**/
@:jsRequire("electron", "remote.BrowserWindow") extern class BrowserWindow extends js.node.events.EventEmitter<electron.remote.BrowserWindow> {
	/**
		An array of all opened browser windows.
	**/
	static function getAllWindows():Array<electron.remote.BrowserWindow>;
	/**
		The window that is focused in this application, otherwise returns `null`.
	**/
	static function getFocusedWindow():haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		The window that owns the given `webContents` or `null` if the contents are not owned by a window.
	**/
	static function fromWebContents(webContents:electron.remote.WebContents):haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		The window that owns the given `browserView`. If the given view is not attached to any window, returns `null`.
	**/
	static function fromBrowserView(browserView:electron.remote.BrowserView):haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		The window with the given `id`.
	**/
	static function fromId(id:Int):haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		Adds Chrome extension located at `path`, and returns extension's name.
		
		The method will also not return if the extension's manifest is missing or incomplete.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.loadExtension(path)`.
	**/
	static function addExtension(path:String):Void;
	/**
		Remove a Chrome extension by name.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.removeExtension(extension_id)`.
	**/
	static function removeExtension(name:String):Void;
	/**
		The keys are the extension names and each value is an Object containing `name` and `version` properties.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.getAllExtensions()`.
	**/
	static function getExtensions():Record;
	/**
		Adds DevTools extension located at `path`, and returns extension's name.
		
		The extension will be remembered so you only need to call this API once, this API is not for programming use. If you try to add an extension that has already been loaded, this method will not return and instead log a warning to the console.
		
		The method will also not return if the extension's manifest is missing or incomplete.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.loadExtension(path)`.
	**/
	static function addDevToolsExtension(path:String):Void;
	/**
		Remove a DevTools extension by name.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.removeExtension(extension_id)`.
	**/
	static function removeDevToolsExtension(name:String):Void;
	/**
		The keys are the extension names and each value is an Object containing `name` and `version` properties.
		
		To check if a DevTools extension is installed you can run the following:
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** This method is deprecated. Instead, use `ses.getAllExtensions()`.
	**/
	static function getDevToolsExtensions():Record;
	/**
		A `WebContents` object this window owns. All web page related events and operations will be done via it.
		
		See the `webContents` documentation for its methods and events.
	**/
	var webContents : electron.remote.WebContents;
	/**
		A `Integer` property representing the unique ID of the window. Each ID is unique among all `BrowserWindow` instances of the entire Electron application.
	**/
	var id : Int;
	/**
		A `Boolean` property that determines whether the window menu bar should hide itself automatically. Once set, the menu bar will only show when users press the single `Alt` key.
		
		If the menu bar is already visible, setting this property to `true` won't hide it immediately.
	**/
	var autoHideMenuBar : Bool;
	/**
		A `Boolean` property that determines whether the window is in simple (pre-Lion) fullscreen mode.
	**/
	var simpleFullScreen : Bool;
	/**
		A `Boolean` property that determines whether the window is in fullscreen mode.
	**/
	var fullScreen : Bool;
	/**
		A `Boolean` property that determines whether the window is visible on all workspaces.
		
		**Note:** Always returns false on Windows.
	**/
	var visibleOnAllWorkspaces : Bool;
	/**
		A `Boolean` property that determines whether the window has a shadow.
	**/
	var shadow : Bool;
	/**
		A `Boolean` property that determines whether the menu bar should be visible.
		
		**Note:** If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single `Alt` key.
	**/
	var menuBarVisible : Bool;
	/**
		A `Boolean` property that determines whether the window is in kiosk mode.
	**/
	var kiosk : Bool;
	/**
		A `Boolean` property that specifies whether the window’s document has been edited.
		
		The icon in title bar will become gray when set to `true`.
	**/
	var documentEdited : Bool;
	/**
		A `String` property that determines the pathname of the file the window represents, and the icon of the file will show in window's title bar.
	**/
	var representedFilename : String;
	/**
		A `String` property that determines the title of the native window.
		
		**Note:** The title of the web page can be different from the title of the native window.
	**/
	var title : String;
	/**
		A `Boolean` property that determines whether the window can be manually minimized by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var minimizable : Bool;
	/**
		A `Boolean` property that determines whether the window can be manually maximized by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var maximizable : Bool;
	/**
		A `Boolean` property that determines whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	var fullScreenable : Bool;
	/**
		A `Boolean` property that determines whether the window can be manually resized by user.
	**/
	var resizable : Bool;
	/**
		A `Boolean` property that determines whether the window can be manually closed by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var closable : Bool;
	/**
		A `Boolean` property that determines Whether the window can be moved by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var movable : Bool;
	/**
		A `Boolean` property that determines whether the window is excluded from the application’s Windows menu. `false` by default.
	**/
	var excludedFromShownWindowsMenu : Bool;
	/**
		A `String` property that defines an alternative title provided only to accessibility tools such as screen readers. This string is not directly visible to users.
	**/
	var accessibleTitle : String;
	function new(?options:{ /**
		Window's width in pixels. Default is `800`.
	**/
	@:optional
	var width : Int; /**
		Window's height in pixels. Default is `600`.
	**/
	@:optional
	var height : Int; /**
		(**required** if y is used) Window's left offset from screen. Default is to center the window.
	**/
	@:optional
	var x : Int; /**
		(**required** if x is used) Window's top offset from screen. Default is to center the window.
	**/
	@:optional
	var y : Int; /**
		The `width` and `height` would be used as web page's size, which means the actual window's size will include window frame's size and be slightly larger. Default is `false`.
	**/
	@:optional
	var useContentSize : Bool; /**
		Show window in the center of the screen.
	**/
	@:optional
	var center : Bool; /**
		Window's minimum width. Default is `0`.
	**/
	@:optional
	var minWidth : Int; /**
		Window's minimum height. Default is `0`.
	**/
	@:optional
	var minHeight : Int; /**
		Window's maximum width. Default is no limit.
	**/
	@:optional
	var maxWidth : Int; /**
		Window's maximum height. Default is no limit.
	**/
	@:optional
	var maxHeight : Int; /**
		Whether window is resizable. Default is `true`.
	**/
	@:optional
	var resizable : Bool; /**
		Whether window is movable. This is not implemented on Linux. Default is `true`.
	**/
	@:optional
	var movable : Bool; /**
		Whether window is minimizable. This is not implemented on Linux. Default is `true`.
	**/
	@:optional
	var minimizable : Bool; /**
		Whether window is maximizable. This is not implemented on Linux. Default is `true`.
	**/
	@:optional
	var maximizable : Bool; /**
		Whether window is closable. This is not implemented on Linux. Default is `true`.
	**/
	@:optional
	var closable : Bool; /**
		Whether the window can be focused. Default is `true`. On Windows setting `focusable: false` also implies setting `skipTaskbar: true`. On Linux setting `focusable: false` makes the window stop interacting with wm, so the window will always stay on top in all workspaces.
	**/
	@:optional
	var focusable : Bool; /**
		Whether the window should always stay on top of other windows. Default is `false`.
	**/
	@:optional
	var alwaysOnTop : Bool; /**
		Whether the window should show in fullscreen. When explicitly set to `false` the fullscreen button will be hidden or disabled on macOS. Default is `false`.
	**/
	@:optional
	var fullscreen : Bool; /**
		Whether the window can be put into fullscreen mode. On macOS, also whether the maximize/zoom button should toggle full screen mode or maximize window. Default is `true`.
	**/
	@:optional
	var fullscreenable : Bool; /**
		Use pre-Lion fullscreen on macOS. Default is `false`.
	**/
	@:optional
	var simpleFullscreen : Bool; /**
		Whether to show the window in taskbar. Default is `false`.
	**/
	@:optional
	var skipTaskbar : Bool; /**
		Whether the window is in kiosk mode. Default is `false`.
	**/
	@:optional
	var kiosk : Bool; /**
		Default window title. Default is `"Electron"`. If the HTML tag `<title>` is defined in the HTML file loaded by `loadURL()`, this property will be ignored.
	**/
	@:optional
	var title : String; /**
		The window icon. On Windows it is recommended to use `ICO` icons to get best visual effects, you can also leave it undefined so the executable's icon will be used.
	**/
	@:optional
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		Whether window should be shown when created. Default is `true`.
	**/
	@:optional
	var show : Bool; /**
		Whether the renderer should be active when `show` is `false` and it has just been created.  In order for `document.visibilityState` to work correctly on first load with `show: false` you should set this to `false`.  Setting this to `false` will cause the `ready-to-show` event to not fire.  Default is `true`.
	**/
	@:optional
	var paintWhenInitiallyHidden : Bool; /**
		Specify `false` to create a Frameless Window. Default is `true`.
	**/
	@:optional
	var frame : Bool; /**
		Specify parent window. Default is `null`.
	**/
	@:optional
	var parent : electron.remote.BrowserWindow; /**
		Whether this is a modal window. This only works when the window is a child window. Default is `false`.
	**/
	@:optional
	var modal : Bool; /**
		Whether the web view accepts a single mouse-down event that simultaneously activates the window. Default is `false`.
	**/
	@:optional
	var acceptFirstMouse : Bool; /**
		Whether to hide cursor when typing. Default is `false`.
	**/
	@:optional
	var disableAutoHideCursor : Bool; /**
		Auto hide the menu bar unless the `Alt` key is pressed. Default is `false`.
	**/
	@:optional
	var autoHideMenuBar : Bool; /**
		Enable the window to be resized larger than screen. Only relevant for macOS, as other OSes allow larger-than-screen windows by default. Default is `false`.
	**/
	@:optional
	var enableLargerThanScreen : Bool; /**
		Window's background color as a hexadecimal value, like `#66CD00` or `#FFF` or `#80FFFFFF` (alpha in #AARRGGBB format is supported if `transparent` is set to `true`). Default is `#FFF` (white).
	**/
	@:optional
	var backgroundColor : String; /**
		Whether window should have a shadow. Default is `true`.
	**/
	@:optional
	var hasShadow : Bool; /**
		Set the initial opacity of the window, between 0.0 (fully transparent) and 1.0 (fully opaque). This is only implemented on Windows and macOS.
	**/
	@:optional
	var opacity : Float; /**
		Forces using dark theme for the window, only works on some GTK+3 desktop environments. Default is `false`.
	**/
	@:optional
	var darkTheme : Bool; /**
		Makes the window transparent. Default is `false`. On Windows, does not work unless the window is frameless.
	**/
	@:optional
	var transparent : Bool; /**
		The type of window, default is normal window. See more about this below.
	**/
	@:optional
	var type : String; /**
		Specify how the material appearance should reflect window activity state on macOS. Must be used with the `vibrancy` property. Possible values are:
	**/
	@:optional
	var visualEffectState : String; /**
		The style of window title bar. Default is `default`. Possible values are:
	**/
	@:optional
	var titleBarStyle : String; /**
		Set a custom position for the traffic light buttons. Can only be used with `titleBarStyle` set to `hidden`
	**/
	@:optional
	var trafficLightPosition : electron.Point; /**
		Shows the title in the title bar in full screen mode on macOS for all `titleBarStyle` options. Default is `false`.
	**/
	@:optional
	var fullscreenWindowTitle : Bool; /**
		Use `WS_THICKFRAME` style for frameless windows on Windows, which adds standard window frame. Setting it to `false` will remove window shadow and window animations. Default is `true`.
	**/
	@:optional
	var thickFrame : Bool; /**
		Add a type of vibrancy effect to the window, only on macOS. Can be `appearance-based`, `light`, `dark`, `titlebar`, `selection`, `menu`, `popover`, `sidebar`, `medium-light`, `ultra-dark`, `header`, `sheet`, `window`, `hud`, `fullscreen-ui`, `tooltip`, `content`, `under-window`, or `under-page`.  Please note that using `frame: false` in combination with a vibrancy value requires that you use a non-default `titleBarStyle` as well. Also note that `appearance-based`, `light`, `dark`, `medium-light`, and `ultra-dark` have been deprecated and will be removed in an upcoming version of macOS.
	**/
	@:optional
	var vibrancy : String; /**
		Controls the behavior on macOS when option-clicking the green stoplight button on the toolbar or by clicking the Window > Zoom menu item. If `true`, the window will grow to the preferred width of the web page when zoomed, `false` will cause it to zoom to the width of the screen. This will also affect the behavior when calling `maximize()` directly. Default is `false`.
	**/
	@:optional
	var zoomToPageWidth : Bool; /**
		Tab group name, allows opening the window as a native tab on macOS 10.12+. Windows with the same tabbing identifier will be grouped together. This also adds a native new tab button to your window's tab bar and allows your `app` and window to receive the `new-window-for-tab` event.
	**/
	@:optional
	var tabbingIdentifier : String; /**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : { /**
		Whether to enable DevTools. If it is set to `false`, can not use `BrowserWindow.webContents.openDevTools()` to open DevTools. Default is `true`.
	**/
	@:optional
	var devTools : Bool; /**
		Whether node integration is enabled. Default is `false`.
	**/
	@:optional
	var nodeIntegration : Bool; /**
		Whether node integration is enabled in web workers. Default is `false`. More about this can be found in Multithreading.
	**/
	@:optional
	var nodeIntegrationInWorker : Bool; /**
		Experimental option for enabling Node.js support in sub-frames such as iframes and child windows. All your preloads will load for every iframe, you can use `process.isMainFrame` to determine if you are in the main frame or not.
	**/
	@:optional
	var nodeIntegrationInSubFrames : Bool; /**
		Specifies a script that will be loaded before other scripts run in the page. This script will always have access to node APIs no matter whether node integration is turned on or off. The value should be the absolute file path to the script. When node integration is turned off, the preload script can reintroduce Node global symbols back to the global scope. See example here.
	**/
	@:optional
	var preload : String; /**
		If set, this will sandbox the renderer associated with the window, making it compatible with the Chromium OS-level sandbox and disabling the Node.js engine. This is not the same as the `nodeIntegration` option and the APIs available to the preload script are more limited. Read more about the option here.
	**/
	@:optional
	var sandbox : Bool; /**
		Whether to enable the `remote` module. Default is `false`.
	**/
	@:optional
	var enableRemoteModule : Bool; /**
		Sets the session used by the page. Instead of passing the Session object directly, you can also choose to use the `partition` option instead, which accepts a partition string. When both `session` and `partition` are provided, `session` will be preferred. Default is the default session.
	**/
	@:optional
	var session : electron.remote.Session; /**
		Sets the session used by the page according to the session's partition string. If `partition` starts with `persist:`, the page will use a persistent session available to all pages in the app with the same `partition`. If there is no `persist:` prefix, the page will use an in-memory session. By assigning the same `partition`, multiple pages can share the same session. Default is the default session.
	**/
	@:optional
	var partition : String; /**
		When specified, web pages with the same `affinity` will run in the same renderer process. Note that due to reusing the renderer process, certain `webPreferences` options will also be shared between the web pages even when you specified different values for them, including but not limited to `preload`, `sandbox` and `nodeIntegration`. So it is suggested to use exact same `webPreferences` for web pages with the same `affinity`. _Deprecated_
	**/
	@:optional
	var affinity : String; /**
		The default zoom factor of the page, `3.0` represents `300%`. Default is `1.0`.
	**/
	@:optional
	var zoomFactor : Float; /**
		Enables JavaScript support. Default is `true`.
	**/
	@:optional
	var javascript : Bool; /**
		When `false`, it will disable the same-origin policy (usually using testing websites by people), and set `allowRunningInsecureContent` to `true` if this options has not been set by user. Default is `true`.
	**/
	@:optional
	var webSecurity : Bool; /**
		Allow an https page to run JavaScript, CSS or plugins from http URLs. Default is `false`.
	**/
	@:optional
	var allowRunningInsecureContent : Bool; /**
		Enables image support. Default is `true`.
	**/
	@:optional
	var images : Bool; /**
		Make TextArea elements resizable. Default is `true`.
	**/
	@:optional
	var textAreasAreResizable : Bool; /**
		Enables WebGL support. Default is `true`.
	**/
	@:optional
	var webgl : Bool; /**
		Whether plugins should be enabled. Default is `false`.
	**/
	@:optional
	var plugins : Bool; /**
		Enables Chromium's experimental features. Default is `false`.
	**/
	@:optional
	var experimentalFeatures : Bool; /**
		Enables scroll bounce (rubber banding) effect on macOS. Default is `false`.
	**/
	@:optional
	var scrollBounce : Bool; /**
		A list of feature strings separated by `,`, like `CSSVariables,KeyboardEventKey` to enable. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	**/
	@:optional
	var enableBlinkFeatures : String; /**
		A list of feature strings separated by `,`, like `CSSVariables,KeyboardEventKey` to disable. The full list of supported feature strings can be found in the RuntimeEnabledFeatures.json5 file.
	**/
	@:optional
	var disableBlinkFeatures : String; /**
		Sets the default font for the font-family.
	**/
	@:optional
	var defaultFontFamily : { /**
		Defaults to `Times New Roman`.
	**/
	@:optional
	var standard : String; /**
		Defaults to `Times New Roman`.
	**/
	@:optional
	var serif : String; /**
		Defaults to `Arial`.
	**/
	@:optional
	var sansSerif : String; /**
		Defaults to `Courier New`.
	**/
	@:optional
	var monospace : String; /**
		Defaults to `Script`.
	**/
	@:optional
	var cursive : String; /**
		Defaults to `Impact`.
	**/
	@:optional
	var fantasy : String; }; /**
		Defaults to `16`.
	**/
	@:optional
	var defaultFontSize : Int; /**
		Defaults to `13`.
	**/
	@:optional
	var defaultMonospaceFontSize : Int; /**
		Defaults to `0`.
	**/
	@:optional
	var minimumFontSize : Int; /**
		Defaults to `ISO-8859-1`.
	**/
	@:optional
	var defaultEncoding : String; /**
		Whether to throttle animations and timers when the page becomes background. This also affects the Page Visibility API. Defaults to `true`.
	**/
	@:optional
	var backgroundThrottling : Bool; /**
		Whether to enable offscreen rendering for the browser window. Defaults to `false`. See the offscreen rendering tutorial for more details.
	**/
	@:optional
	var offscreen : Bool; /**
		Whether to run Electron APIs and the specified `preload` script in a separate JavaScript context. Defaults to `true`. The context that the `preload` script runs in will only have access to its own dedicated `document` and `window` globals, as well as its own set of JavaScript builtins (`Array`, `Object`, `JSON`, etc.), which are all invisible to the loaded content. The Electron API will only be available in the `preload` script and not the loaded page. This option should be used when loading potentially untrusted remote content to ensure the loaded content cannot tamper with the `preload` script and any Electron APIs being used.  This option uses the same technique used by Chrome Content Scripts.  You can access this context in the dev tools by selecting the 'Electron Isolated Context' entry in the combo box at the top of the Console tab.
	**/
	@:optional
	var contextIsolation : Bool; /**
		If true, values returned from `webFrame.executeJavaScript` will be sanitized to ensure JS values can't unsafely cross between worlds when using `contextIsolation`. Defaults to `true`. _Deprecated_
	**/
	@:optional
	var worldSafeExecuteJavaScript : Bool; /**
		Whether to use native `window.open()`. Defaults to `false`. Child windows will always have node integration disabled unless `nodeIntegrationInSubFrames` is true. **Note:** This option is currently experimental.
	**/
	@:optional
	var nativeWindowOpen : Bool; /**
		Whether to enable the `<webview>` tag. Defaults to `false`. **Note:** The `preload` script configured for the `<webview>` will have node integration enabled when it is executed so you should ensure remote/untrusted content is not able to create a `<webview>` tag with a possibly malicious `preload` script. You can use the `will-attach-webview` event on webContents to strip away the `preload` script and to validate or alter the `<webview>`'s initial settings.
	**/
	@:optional
	var webviewTag : Bool; /**
		A list of strings that will be appended to `process.argv` in the renderer process of this app.  Useful for passing small bits of data down to renderer process preload scripts.
	**/
	@:optional
	var additionalArguments : Array<String>; /**
		Whether to enable browser style consecutive dialog protection. Default is `false`.
	**/
	@:optional
	var safeDialogs : Bool; /**
		The message to display when consecutive dialog protection is triggered. If not defined the default message would be used, note that currently the default message is in English and not localized.
	**/
	@:optional
	var safeDialogsMessage : String; /**
		Whether to disable dialogs completely. Overrides `safeDialogs`. Default is `false`.
	**/
	@:optional
	var disableDialogs : Bool; /**
		Whether dragging and dropping a file or link onto the page causes a navigation. Default is `false`.
	**/
	@:optional
	var navigateOnDragDrop : Bool; /**
		Autoplay policy to apply to content in the window, can be `no-user-gesture-required`, `user-gesture-required`, `document-user-activation-required`. Defaults to `no-user-gesture-required`.
	**/
	@:optional
	var autoplayPolicy : String; /**
		Whether to prevent the window from resizing when entering HTML Fullscreen. Default is `false`.
	**/
	@:optional
	var disableHtmlFullscreenWindowResize : Bool; /**
		An alternative title string provided only to accessibility tools such as screen readers. This string is not directly visible to users.
	**/
	@:optional
	var accessibleTitle : String; /**
		Whether to enable the builtin spellchecker. Default is `true`.
	**/
	@:optional
	var spellcheck : Bool; /**
		Whether to enable the WebSQL api. Default is `true`.
	**/
	@:optional
	var enableWebSQL : Bool; /**
		Enforces the v8 code caching policy used by blink. Accepted values are
	**/
	@:optional
	var v8CacheOptions : String; /**
		Whether to enable preferred size mode. The preferred size is the minimum size needed to contain the layout of the document—without requiring scrolling. Enabling this will cause the `preferred-size-changed` event to be emitted on the `WebContents` when the preferred size changes. Default is `false`.
	**/
	@:optional
	var enablePreferredSizeMode : Bool; }; }):Void;
	/**
		Force closing the window, the `unload` and `beforeunload` event won't be emitted for the web page, and `close` event will also not be emitted for this window, but it guarantees the `closed` event will be emitted.
	**/
	function destroy():Void;
	/**
		Try to close the window. This has the same effect as a user manually clicking the close button of the window. The web page may cancel the close though. See the close event.
	**/
	function close():Void;
	/**
		Focuses on the window.
	**/
	function focus():Void;
	/**
		Removes focus from the window.
	**/
	function blur():Void;
	/**
		Whether the window is focused.
	**/
	function isFocused():Bool;
	/**
		Whether the window is destroyed.
	**/
	function isDestroyed():Bool;
	/**
		Shows and gives focus to the window.
	**/
	function show():Void;
	/**
		Shows the window but doesn't focus on it.
	**/
	function showInactive():Void;
	/**
		Hides the window.
	**/
	function hide():Void;
	/**
		Whether the window is visible to the user.
	**/
	function isVisible():Bool;
	/**
		Whether current window is a modal window.
	**/
	function isModal():Bool;
	/**
		Maximizes the window. This will also show (but not focus) the window if it isn't being displayed already.
	**/
	function maximize():Void;
	/**
		Unmaximizes the window.
	**/
	function unmaximize():Void;
	/**
		Whether the window is maximized.
	**/
	function isMaximized():Bool;
	/**
		Minimizes the window. On some platforms the minimized window will be shown in the Dock.
	**/
	function minimize():Void;
	/**
		Restores the window from minimized state to its previous state.
	**/
	function restore():Void;
	/**
		Whether the window is minimized.
	**/
	function isMinimized():Bool;
	/**
		Sets whether the window should be in fullscreen mode.
	**/
	function setFullScreen(flag:Bool):Void;
	/**
		Whether the window is in fullscreen mode.
	**/
	function isFullScreen():Bool;
	/**
		Enters or leaves simple fullscreen mode.
		
		Simple fullscreen mode emulates the native fullscreen behavior found in versions of macOS prior to Lion (10.7).
	**/
	function setSimpleFullScreen(flag:Bool):Void;
	/**
		Whether the window is in simple (pre-Lion) fullscreen mode.
	**/
	function isSimpleFullScreen():Bool;
	/**
		Whether the window is in normal state (not maximized, not minimized, not in fullscreen mode).
	**/
	function isNormal():Bool;
	/**
		This will make a window maintain an aspect ratio. The extra size allows a developer to have space, specified in pixels, not included within the aspect ratio calculations. This API already takes into account the difference between a window's size and its content size.
		
		Consider a normal window with an HD video player and associated controls. Perhaps there are 15 pixels of controls on the left edge, 25 pixels of controls on the right edge and 50 pixels of controls below the player. In order to maintain a 16:9 aspect ratio (standard aspect ratio for HD @1920x1080) within the player itself we would call this function with arguments of 16/9 and { width: 40, height: 50 }. The second argument doesn't care where the extra width and height are within the content view--only that they exist. Sum any extra width and height areas you have within the overall content view.
		
		The aspect ratio is not respected when window is resized programmingly with APIs like `win.setSize`.
	**/
	function setAspectRatio(aspectRatio:Float, ?extraSize:electron.Size):Void;
	/**
		Sets the background color of the window. See Setting `backgroundColor`.
	**/
	function setBackgroundColor(backgroundColor:String):Void;
	/**
		Uses Quick Look to preview a file at a given path.
	**/
	function previewFile(path:String, ?displayName:String):Void;
	/**
		Closes the currently open Quick Look panel.
	**/
	function closeFilePreview():Void;
	/**
		Resizes and moves the window to the supplied bounds. Any properties that are not supplied will default to their current values.
	**/
	function setBounds(bounds:Partial, ?animate:Bool):Void;
	/**
		The `bounds` of the window as `Object`.
	**/
	function getBounds():electron.Rectangle;
	/**
		Gets the background color of the window. See Setting `backgroundColor`.
	**/
	function getBackgroundColor():String;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
	**/
	function setContentBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	/**
		The `bounds` of the window's client area as `Object`.
	**/
	function getContentBounds():electron.Rectangle;
	/**
		Contains the window bounds of the normal state
		
		**Note:** whatever the current state of the window : maximized, minimized or in fullscreen, this function always returns the position and size of the window in normal state. In normal state, getBounds and getNormalBounds returns the same `Rectangle`.
	**/
	function getNormalBounds():electron.Rectangle;
	/**
		Disable or enable the window.
	**/
	function setEnabled(enable:Bool):Void;
	/**
		whether the window is enabled.
	**/
	function isEnabled():Bool;
	/**
		Resizes the window to `width` and `height`. If `width` or `height` are below any set minimum size constraints the window will snap to its minimum size.
	**/
	function setSize(width:Int, height:Int, ?animate:Bool):Void;
	/**
		Contains the window's width and height.
	**/
	function getSize():Array<Int>;
	/**
		Resizes the window's client area (e.g. the web page) to `width` and `height`.
	**/
	function setContentSize(width:Int, height:Int, ?animate:Bool):Void;
	/**
		Contains the window's client area's width and height.
	**/
	function getContentSize():Array<Int>;
	/**
		Sets the minimum size of window to `width` and `height`.
	**/
	function setMinimumSize(width:Int, height:Int):Void;
	/**
		Contains the window's minimum width and height.
	**/
	function getMinimumSize():Array<Int>;
	/**
		Sets the maximum size of window to `width` and `height`.
	**/
	function setMaximumSize(width:Int, height:Int):Void;
	/**
		Contains the window's maximum width and height.
	**/
	function getMaximumSize():Array<Int>;
	/**
		Sets whether the window can be manually resized by the user.
	**/
	function setResizable(resizable:Bool):Void;
	/**
		Whether the window can be manually resized by the user.
	**/
	function isResizable():Bool;
	/**
		Sets whether the window can be moved by user. On Linux does nothing.
	**/
	function setMovable(movable:Bool):Void;
	/**
		Whether the window can be moved by user.
		
		On Linux always returns `true`.
	**/
	function isMovable():Bool;
	/**
		Sets whether the window can be manually minimized by user. On Linux does nothing.
	**/
	function setMinimizable(minimizable:Bool):Void;
	/**
		Whether the window can be manually minimized by the user.
		
		On Linux always returns `true`.
	**/
	function isMinimizable():Bool;
	/**
		Sets whether the window can be manually maximized by user. On Linux does nothing.
	**/
	function setMaximizable(maximizable:Bool):Void;
	/**
		Whether the window can be manually maximized by user.
		
		On Linux always returns `true`.
	**/
	function isMaximizable():Bool;
	/**
		Sets whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	function setFullScreenable(fullscreenable:Bool):Void;
	/**
		Whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	function isFullScreenable():Bool;
	/**
		Sets whether the window can be manually closed by user. On Linux does nothing.
	**/
	function setClosable(closable:Bool):Void;
	/**
		Whether the window can be manually closed by user.
		
		On Linux always returns `true`.
	**/
	function isClosable():Bool;
	/**
		Sets whether the window should show always on top of other windows. After setting this, the window is still a normal window, not a toolbox window which can not be focused on.
	**/
	function setAlwaysOnTop(flag:Bool, ?level:String, ?relativeLevel:Int):Void;
	/**
		Whether the window is always on top of other windows.
	**/
	function isAlwaysOnTop():Bool;
	/**
		Moves window above the source window in the sense of z-order. If the `mediaSourceId` is not of type window or if the window does not exist then this method throws an error.
	**/
	function moveAbove(mediaSourceId:String):Void;
	/**
		Moves window to top(z-order) regardless of focus
	**/
	function moveTop():Void;
	/**
		Moves window to the center of the screen.
	**/
	function center():Void;
	/**
		Moves window to `x` and `y`.
	**/
	function setPosition(x:Int, y:Int, ?animate:Bool):Void;
	/**
		Contains the window's current position.
	**/
	function getPosition():Array<Int>;
	/**
		Changes the title of native window to `title`.
	**/
	function setTitle(title:String):Void;
	/**
		The title of the native window.
		
		**Note:** The title of the web page can be different from the title of the native window.
	**/
	function getTitle():String;
	/**
		Changes the attachment point for sheets on macOS. By default, sheets are attached just below the window frame, but you may want to display them beneath a HTML-rendered toolbar. For example:
	**/
	function setSheetOffset(offsetY:Float, ?offsetX:Float):Void;
	/**
		Starts or stops flashing the window to attract user's attention.
	**/
	function flashFrame(flag:Bool):Void;
	/**
		Makes the window not show in the taskbar.
	**/
	function setSkipTaskbar(skip:Bool):Void;
	/**
		Enters or leaves kiosk mode.
	**/
	function setKiosk(flag:Bool):Void;
	/**
		Whether the window is in kiosk mode.
	**/
	function isKiosk():Bool;
	/**
		Whether the window is in Windows 10 tablet mode.
		
		Since Windows 10 users can use their PC as tablet, under this mode apps can choose to optimize their UI for tablets, such as enlarging the titlebar and hiding titlebar buttons.
		
		This API returns whether the window is in tablet mode, and the `resize` event can be be used to listen to changes to tablet mode.
	**/
	function isTabletMode():Bool;
	/**
		Window id in the format of DesktopCapturerSource's id. For example "window:1234:0".
		
		More precisely the format is `window:id:other_id` where `id` is `HWND` on Windows, `CGWindowID` (`uint64_t`) on macOS and `Window` (`unsigned long`) on Linux. `other_id` is used to identify web contents (tabs) so within the same top level window.
	**/
	function getMediaSourceId():String;
	/**
		The platform-specific handle of the window.
		
		The native type of the handle is `HWND` on Windows, `NSView*` on macOS, and `Window` (`unsigned long`) on Linux.
	**/
	function getNativeWindowHandle():js.node.Buffer;
	/**
		Hooks a windows message. The `callback` is called when the message is received in the WndProc.
	**/
	function hookWindowMessage(message:Int, callback:haxe.Constraints.Function):Void;
	/**
		`true` or `false` depending on whether the message is hooked.
	**/
	function isWindowMessageHooked(message:Int):Bool;
	/**
		Unhook the window message.
	**/
	function unhookWindowMessage(message:Int):Void;
	/**
		Unhooks all of the window messages.
	**/
	function unhookAllWindowMessages():Void;
	/**
		Sets the pathname of the file the window represents, and the icon of the file will show in window's title bar.
	**/
	function setRepresentedFilename(filename:String):Void;
	/**
		The pathname of the file the window represents.
	**/
	function getRepresentedFilename():String;
	/**
		Specifies whether the window’s document has been edited, and the icon in title bar will become gray when set to `true`.
	**/
	function setDocumentEdited(edited:Bool):Void;
	/**
		Whether the window's document has been edited.
	**/
	function isDocumentEdited():Bool;
	function focusOnWebView():Void;
	function blurWebView():Void;
	/**
		Resolves with a NativeImage
		
		Captures a snapshot of the page within `rect`. Omitting `rect` will capture the whole visible page. If the page is not visible, `rect` may be empty.
	**/
	function capturePage(?rect:electron.Rectangle):js.lib.Promise<Any>;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`).
		
		Same as `webContents.loadURL(url[, options])`.
		
		The `url` can be a remote address (e.g. `http://`) or a path to a local HTML file using the `file://` protocol.
		
		To ensure that file URLs are properly formatted, it is recommended to use Node's `url.format` method:
		
		You can load a URL using a `POST` request with URL-encoded data by doing the following:
	**/
	function loadURL(url:String, ?options:{ /**
		An HTTP Referrer URL.
	**/
	@:optional
	var httpReferrer : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : haxe.extern.EitherType<Array<Dynamic>, Array<Dynamic>>; /**
		Base URL (with trailing path separator) for files to be loaded by the data URL. This is needed only if the specified `url` is a data URL and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):js.lib.Promise<Any>;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`).
		
		Same as `webContents.loadFile`, `filePath` should be a path to an HTML file relative to the root of your application.  See the `webContents` docs for more information.
	**/
	function loadFile(filePath:String, ?options:{ /**
		Passed to `url.format()`.
	**/
	@:optional
	var query : Record; /**
		Passed to `url.format()`.
	**/
	@:optional
	var search : String; /**
		Passed to `url.format()`.
	**/
	@:optional
	var hash : String; }):js.lib.Promise<Any>;
	/**
		Same as `webContents.reload`.
	**/
	function reload():Void;
	/**
		Sets the `menu` as the window's menu bar.
	**/
	function setMenu(menu:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Remove the window's menu bar.
	**/
	function removeMenu():Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0].
		
		Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1.
		
		On Linux platform, only supports Unity desktop environment, you need to specify the `*.desktop` file name to `desktopName` field in `package.json`. By default, it will assume `{app.name}.desktop`.
		
		On Windows, a mode can be passed. Accepted values are `none`, `normal`, `indeterminate`, `error`, and `paused`. If you call `setProgressBar` without a mode set (but with a value within the valid range), `normal` will be assumed.
	**/
	function setProgressBar(progress:Float, ?options:{ /**
		Mode for the progress bar. Can be `none`, `normal`, `indeterminate`, `error` or `paused`.
	**/
	var mode : String; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	function setOverlayIcon(overlay:haxe.extern.EitherType<Dynamic, Dynamic>, description:String):Void;
	/**
		Sets whether the window should have a shadow.
	**/
	function setHasShadow(hasShadow:Bool):Void;
	/**
		Whether the window has a shadow.
	**/
	function hasShadow():Bool;
	/**
		Sets the opacity of the window. On Linux, does nothing. Out of bound number values are clamped to the [0, 1] range.
	**/
	function setOpacity(opacity:Float):Void;
	/**
		between 0.0 (fully transparent) and 1.0 (fully opaque). On Linux, always returns 1.
	**/
	function getOpacity():Float;
	/**
		Setting a window shape determines the area within the window where the system permits drawing and user interaction. Outside of the given region, no pixels will be drawn and no mouse events will be registered. Mouse events outside of the region will not be received by that window, but will fall through to whatever is behind the window.
	**/
	function setShape(rects:Array<electron.Rectangle>):Void;
	/**
		Whether the buttons were added successfully
		
		Add a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button layout. Returns a `Boolean` object indicates whether the thumbnail has been added successfully.
		
		The number of buttons in thumbnail toolbar should be no greater than 7 due to the limited room. Once you setup the thumbnail toolbar, the toolbar cannot be removed due to the platform's limitation. But you can call the API with an empty array to clean the buttons.
		
		The `buttons` is an array of `Button` objects:
		
		* `Button` Object
		  * `icon` NativeImage - The icon showing in thumbnail toolbar.
		  * `click` Function
		  * `tooltip` String (optional) - The text of the button's tooltip.
		  * `flags` String[] (optional) - Control specific states and behaviors of the button. By default, it is `['enabled']`.
		
		The `flags` is an array that can include following `String`s:
		
		* `enabled` - The button is active and available to the user.
		* `disabled` - The button is disabled. It is present, but has a visual state indicating it will not respond to user action.
		* `dismissonclick` - When the button is clicked, the thumbnail window closes immediately.
		* `nobackground` - Do not draw a button border, use only the image.
		* `hidden` - The button is not shown to the user.
		* `noninteractive` - The button is enabled but not interactive; no pressed button state is drawn. This value is intended for instances where the button is used in a notification.
	**/
	function setThumbarButtons(buttons:Array<electron.ThumbarButton>):Bool;
	/**
		Sets the region of the window to show as the thumbnail image displayed when hovering over the window in the taskbar. You can reset the thumbnail to be the entire window by specifying an empty region: `{ x: 0, y: 0, width: 0, height: 0 }`.
	**/
	function setThumbnailClip(region:electron.Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	function setThumbnailToolTip(toolTip:String):Void;
	/**
		Sets the properties for the window's taskbar button.
		
		**Note:** `relaunchCommand` and `relaunchDisplayName` must always be set together. If one of those properties is not set, then neither will be used.
	**/
	function setAppDetails(options:{ /**
		Window's App User Model ID. It has to be set, otherwise the other options will have no effect.
	**/
	@:optional
	var appId : String; /**
		Window's Relaunch Icon.
	**/
	@:optional
	var appIconPath : String; /**
		Index of the icon in `appIconPath`. Ignored when `appIconPath` is not set. Default is `0`.
	**/
	@:optional
	var appIconIndex : Int; /**
		Window's Relaunch Command.
	**/
	@:optional
	var relaunchCommand : String; /**
		Window's Relaunch Display Name.
	**/
	@:optional
	var relaunchDisplayName : String; }):Void;
	/**
		Same as `webContents.showDefinitionForSelection()`.
	**/
	function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	function setIcon(icon:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Sets whether the window traffic light buttons should be visible.
		
		This cannot be called when `titleBarStyle` is set to `customButtonsOnHover`.
	**/
	function setWindowButtonVisibility(visible:Bool):Void;
	/**
		Sets whether the window menu bar should hide itself automatically. Once set the menu bar will only show when users press the single `Alt` key.
		
		If the menu bar is already visible, calling `setAutoHideMenuBar(true)` won't hide it immediately.
	**/
	function setAutoHideMenuBar(hide:Bool):Void;
	/**
		Whether menu bar automatically hides itself.
	**/
	function isMenuBarAutoHide():Bool;
	/**
		Sets whether the menu bar should be visible. If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single `Alt` key.
	**/
	function setMenuBarVisibility(visible:Bool):Void;
	/**
		Whether the menu bar is visible.
	**/
	function isMenuBarVisible():Bool;
	/**
		Sets whether the window should be visible on all workspaces.
		
		**Note:** This API does nothing on Windows.
	**/
	function setVisibleOnAllWorkspaces(visible:Bool, ?options:{ /**
		Sets whether the window should be visible above fullscreen windows
	**/
	@:optional
	var visibleOnFullScreen : Bool; }):Void;
	/**
		Whether the window is visible on all workspaces.
		
		**Note:** This API always returns false on Windows.
	**/
	function isVisibleOnAllWorkspaces():Bool;
	/**
		Makes the window ignore all mouse events.
		
		All mouse events happened in this window will be passed to the window below this window, but if this window has focus, it will still receive keyboard events.
	**/
	function setIgnoreMouseEvents(ignore:Bool, ?options:{ /**
		If true, forwards mouse move messages to Chromium, enabling mouse related events such as `mouseleave`. Only used when `ignore` is true. If `ignore` is false, forwarding is always disabled regardless of this value.
	**/
	@:optional
	var forward : Bool; }):Void;
	/**
		Prevents the window contents from being captured by other apps.
		
		On macOS it sets the NSWindow's sharingType to NSWindowSharingNone. On Windows it calls SetWindowDisplayAffinity with `WDA_EXCLUDEFROMCAPTURE`. For Windows 10 version 2004 and up the window will be removed from capture entirely, older Windows versions behave as if `WDA_MONITOR` is applied capturing a black window.
	**/
	function setContentProtection(enable:Bool):Void;
	/**
		Changes whether the window can be focused.
		
		On macOS it does not remove the focus from the window.
	**/
	function setFocusable(focusable:Bool):Void;
	/**
		Sets `parent` as current window's parent window, passing `null` will turn current window into a top-level window.
	**/
	function setParentWindow(parent:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		The parent window.
	**/
	function getParentWindow():electron.remote.BrowserWindow;
	/**
		All child windows.
	**/
	function getChildWindows():Array<electron.remote.BrowserWindow>;
	/**
		Controls whether to hide cursor when typing.
	**/
	function setAutoHideCursor(autoHide:Bool):Void;
	/**
		Selects the previous tab when native tabs are enabled and there are other tabs in the window.
	**/
	function selectPreviousTab():Void;
	/**
		Selects the next tab when native tabs are enabled and there are other tabs in the window.
	**/
	function selectNextTab():Void;
	/**
		Merges all windows into one window with multiple tabs when native tabs are enabled and there is more than one open window.
	**/
	function mergeAllWindows():Void;
	/**
		Moves the current tab into a new window if native tabs are enabled and there is more than one tab in the current window.
	**/
	function moveTabToNewWindow():Void;
	/**
		Toggles the visibility of the tab bar if native tabs are enabled and there is only one tab in the current window.
	**/
	function toggleTabBar():Void;
	/**
		Adds a window as a tab on this window, after the tab for the window instance.
	**/
	function addTabbedWindow(browserWindow:electron.remote.BrowserWindow):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing `null` or an empty string will remove the vibrancy effect on the window.
		
		Note that `appearance-based`, `light`, `dark`, `medium-light`, and `ultra-dark` have been deprecated and will be removed in an upcoming version of macOS.
	**/
	function setVibrancy(type:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Set a custom position for the traffic light buttons. Can only be used with `titleBarStyle` set to `hidden`.
	**/
	function setTrafficLightPosition(position:electron.Point):Void;
	/**
		The current position for the traffic light buttons. Can only be used with `titleBarStyle` set to `hidden`.
	**/
	function getTrafficLightPosition():electron.Point;
	/**
		Sets the touchBar layout for the current window. Specifying `null` or `undefined` clears the touch bar. This method only has an effect if the machine has a touch bar and is running on macOS 10.12.1+.
		
		**Note:** The TouchBar API is currently experimental and may change or be removed in future Electron releases.
	**/
	function setTouchBar(touchBar:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	function setBrowserView(browserView:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		The `BrowserView` attached to `win`. Returns `null` if one is not attached. Throws an error if multiple `BrowserView`s are attached.
	**/
	function getBrowserView():haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		Replacement API for setBrowserView supporting work with multi browser views.
	**/
	function addBrowserView(browserView:electron.remote.BrowserView):Void;
	function removeBrowserView(browserView:electron.remote.BrowserView):Void;
	/**
		Raises `browserView` above other `BrowserView`s attached to `win`. Throws an error if `browserView` is not attached to `win`.
	**/
	function setTopBrowserView(browserView:electron.remote.BrowserView):Void;
	/**
		an array of all BrowserViews that have been attached with `addBrowserView` or `setBrowserView`.
		
		**Note:** The BrowserView API is currently experimental and may change or be removed in future Electron releases.
	**/
	function getBrowserViews():Array<electron.remote.BrowserView>;
}
@:enum abstract BrowserWindowEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the document changed its title, calling `event.preventDefault()` will prevent the native window's title from changing. `explicitSet` is false when title is synthesized from file URL.
	**/
	var page_title_updated : electron.remote.BrowserWindowEvent<Void -> Void> = "page-title-updated";
	/**
		Emitted when the window is going to be closed. It's emitted before the `beforeunload` and `unload` event of the DOM. Calling `event.preventDefault()` will cancel the close.
		
		Usually you would want to use the `beforeunload` handler to decide whether the window should be closed, which will also be called when the window is reloaded. In Electron, returning any value other than `undefined` would cancel the close. For example:
		
		_**Note**: There is a subtle difference between the behaviors of `window.onbeforeunload = handler` and `window.addEventListener('beforeunload', handler)`. It is recommended to always set the `event.returnValue` explicitly, instead of only returning a value, as the former works more consistently within Electron._
	**/
	var close : electron.remote.BrowserWindowEvent<Void -> Void> = "close";
	/**
		Emitted when the window is closed. After you have received this event you should remove the reference to the window and avoid using it any more.
	**/
	var closed : electron.remote.BrowserWindowEvent<Void -> Void> = "closed";
	/**
		Emitted when window session is going to end due to force shutdown or machine restart or session log off.
	**/
	var session_end : electron.remote.BrowserWindowEvent<Void -> Void> = "session-end";
	/**
		Emitted when the web page becomes unresponsive.
	**/
	var unresponsive : electron.remote.BrowserWindowEvent<Void -> Void> = "unresponsive";
	/**
		Emitted when the unresponsive web page becomes responsive again.
	**/
	var responsive : electron.remote.BrowserWindowEvent<Void -> Void> = "responsive";
	/**
		Emitted when the window loses focus.
	**/
	var blur : electron.remote.BrowserWindowEvent<Void -> Void> = "blur";
	/**
		Emitted when the window gains focus.
	**/
	var focus : electron.remote.BrowserWindowEvent<Void -> Void> = "focus";
	/**
		Emitted when the window is shown.
	**/
	var show : electron.remote.BrowserWindowEvent<Void -> Void> = "show";
	/**
		Emitted when the window is hidden.
	**/
	var hide : electron.remote.BrowserWindowEvent<Void -> Void> = "hide";
	/**
		Emitted when the web page has been rendered (while not being shown) and window can be displayed without a visual flash.
		
		Please note that using this event implies that the renderer will be considered "visible" and paint even though `show` is false.  This event will never fire if you use `paintWhenInitiallyHidden: false`
	**/
	var ready_to_show : electron.remote.BrowserWindowEvent<Void -> Void> = "ready-to-show";
	/**
		Emitted when window is maximized.
	**/
	var maximize : electron.remote.BrowserWindowEvent<Void -> Void> = "maximize";
	/**
		Emitted when the window exits from a maximized state.
	**/
	var unmaximize : electron.remote.BrowserWindowEvent<Void -> Void> = "unmaximize";
	/**
		Emitted when the window is minimized.
	**/
	var minimize : electron.remote.BrowserWindowEvent<Void -> Void> = "minimize";
	/**
		Emitted when the window is restored from a minimized state.
	**/
	var restore : electron.remote.BrowserWindowEvent<Void -> Void> = "restore";
	/**
		Emitted before the window is resized. Calling `event.preventDefault()` will prevent the window from being resized.
		
		Note that this is only emitted when the window is being resized manually. Resizing the window with `setBounds`/`setSize` will not emit this event.
	**/
	var will_resize : electron.remote.BrowserWindowEvent<Void -> Void> = "will-resize";
	/**
		Emitted after the window has been resized.
	**/
	var resize : electron.remote.BrowserWindowEvent<Void -> Void> = "resize";
	/**
		Emitted once when the window has finished being resized.
		
		This is usually emitted when the window has been resized manually. On macOS, resizing the window with `setBounds`/`setSize` and setting the `animate` parameter to `true` will also emit this event once resizing has finished.
	**/
	var resized : electron.remote.BrowserWindowEvent<Void -> Void> = "resized";
	/**
		Emitted before the window is moved. On Windows, calling `event.preventDefault()` will prevent the window from being moved.
		
		Note that this is only emitted when the window is being resized manually. Resizing the window with `setBounds`/`setSize` will not emit this event.
	**/
	var will_move : electron.remote.BrowserWindowEvent<Void -> Void> = "will-move";
	/**
		Emitted when the window is being moved to a new position.
	**/
	var move : electron.remote.BrowserWindowEvent<Void -> Void> = "move";
	/**
		Emitted once when the window is moved to a new position.
		
		__Note__: On macOS this event is an alias of `move`.
	**/
	var moved : electron.remote.BrowserWindowEvent<Void -> Void> = "moved";
	/**
		Emitted when the window enters a full-screen state.
	**/
	var enter_full_screen : electron.remote.BrowserWindowEvent<Void -> Void> = "enter-full-screen";
	/**
		Emitted when the window leaves a full-screen state.
	**/
	var leave_full_screen : electron.remote.BrowserWindowEvent<Void -> Void> = "leave-full-screen";
	/**
		Emitted when the window enters a full-screen state triggered by HTML API.
	**/
	var enter_html_full_screen : electron.remote.BrowserWindowEvent<Void -> Void> = "enter-html-full-screen";
	/**
		Emitted when the window leaves a full-screen state triggered by HTML API.
	**/
	var leave_html_full_screen : electron.remote.BrowserWindowEvent<Void -> Void> = "leave-html-full-screen";
	/**
		Emitted when the window is set or unset to show always on top of other windows.
	**/
	var always_on_top_changed : electron.remote.BrowserWindowEvent<Void -> Void> = "always-on-top-changed";
	/**
		Emitted when an App Command is invoked. These are typically related to keyboard media keys or browser commands, as well as the "Back" button built into some mice on Windows.
		
		Commands are lowercased, underscores are replaced with hyphens, and the `APPCOMMAND_` prefix is stripped off. e.g. `APPCOMMAND_BROWSER_BACKWARD` is emitted as `browser-backward`.
		
		The following app commands are explicitly supported on Linux:
		
		* `browser-backward`
		* `browser-forward`
	**/
	var app_command : electron.remote.BrowserWindowEvent<Void -> Void> = "app-command";
	/**
		Emitted when scroll wheel event phase has begun.
	**/
	var scroll_touch_begin : electron.remote.BrowserWindowEvent<Void -> Void> = "scroll-touch-begin";
	/**
		Emitted when scroll wheel event phase has ended.
	**/
	var scroll_touch_end : electron.remote.BrowserWindowEvent<Void -> Void> = "scroll-touch-end";
	/**
		Emitted when scroll wheel event phase filed upon reaching the edge of element.
	**/
	var scroll_touch_edge : electron.remote.BrowserWindowEvent<Void -> Void> = "scroll-touch-edge";
	/**
		Emitted on 3-finger swipe. Possible directions are `up`, `right`, `down`, `left`.
		
		The method underlying this event is built to handle older macOS-style trackpad swiping, where the content on the screen doesn't move with the swipe. Most macOS trackpads are not configured to allow this kind of swiping anymore, so in order for it to emit properly the 'Swipe between pages' preference in `System Preferences > Trackpad > More Gestures` must be set to 'Swipe with two or three fingers'.
	**/
	var swipe : electron.remote.BrowserWindowEvent<Void -> Void> = "swipe";
	/**
		Emitted on trackpad rotation gesture. Continually emitted until rotation gesture is ended. The `rotation` value on each emission is the angle in degrees rotated since the last emission. The last emitted event upon a rotation gesture will always be of value `0`. Counter-clockwise rotation values are positive, while clockwise ones are negative.
	**/
	var rotate_gesture : electron.remote.BrowserWindowEvent<Void -> Void> = "rotate-gesture";
	/**
		Emitted when the window opens a sheet.
	**/
	var sheet_begin : electron.remote.BrowserWindowEvent<Void -> Void> = "sheet-begin";
	/**
		Emitted when the window has closed a sheet.
	**/
	var sheet_end : electron.remote.BrowserWindowEvent<Void -> Void> = "sheet-end";
	/**
		Emitted when the native new tab button is clicked.
	**/
	var new_window_for_tab : electron.remote.BrowserWindowEvent<Void -> Void> = "new-window-for-tab";
	/**
		Emitted when the system context menu is triggered on the window, this is normally only triggered when the user right clicks on the non-client area of your window.  This is the window titlebar or any area you have declared as `-webkit-app-region: drag` in a frameless window.
		
		Calling `event.preventDefault()` will prevent the menu from being displayed.
	**/
	var system_context_menu : electron.remote.BrowserWindowEvent<Void -> Void> = "system-context-menu";
}
