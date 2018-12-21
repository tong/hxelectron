package electron.main;
/**
	Create and control browser windows.
	@see http://electronjs.org/docs/api/browser-window
**/
@:jsRequire("electron", "BrowserWindow") extern class BrowserWindow extends js.node.events.EventEmitter<electron.main.BrowserWindow> {
	static function getAllWindows():Array<electron.main.BrowserWindow>;
	static function getFocusedWindow():haxe.extern.EitherType<electron.main.BrowserWindow, Dynamic>;
	static function fromWebContents(webContents:electron.main.WebContents):electron.main.BrowserWindow;
	static function fromBrowserView(browserView:electron.main.BrowserView):haxe.extern.EitherType<electron.main.BrowserWindow, Dynamic>;
	static function fromId(id:Int):electron.main.BrowserWindow;
	/**
		Adds Chrome extension located at path, and returns extension's name. The method will also not return if the extension's manifest is missing or incomplete. Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function addExtension(path:String):Void;
	/**
		Remove a Chrome extension by name. Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function removeExtension(name:String):Void;
	/**
		Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function getExtensions():Any;
	/**
		Adds DevTools extension located at path, and returns extension's name. The extension will be remembered so you only need to call this API once, this API is not for programming use. If you try to add an extension that has already been loaded, this method will not return and instead log a warning to the console. The method will also not return if the extension's manifest is missing or incomplete. Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function addDevToolsExtension(path:String):Void;
	/**
		Remove a DevTools extension by name. Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function removeDevToolsExtension(name:String):Void;
	/**
		To check if a DevTools extension is installed you can run the following: Note: This API cannot be called before the ready event of the app module is emitted.
	**/
	static function getDevToolsExtensions():Any;
	/**
		A WebContents object this window owns. All web page related events and operations will be done via it. See the webContents documentation for its methods and events.
	**/
	var webContents : electron.main.WebContents;
	/**
		A Integer representing the unique ID of the window.
	**/
	var id : Int;
	function new(?options:{ /**
		Window's width in pixels. Default is 800.
	**/
	@:optional
	var width : Int; /**
		Window's height in pixels. Default is 600.
	**/
	@:optional
	var height : Int; /**
		( if y is used) Window's left offset from screen. Default is to center the window.
	**/
	@:optional
	var x : Int; /**
		( if x is used) Window's top offset from screen. Default is to center the window.
	**/
	@:optional
	var y : Int; /**
		The width and height would be used as web page's size, which means the actual window's size will include window frame's size and be slightly larger. Default is false.
	**/
	@:optional
	var useContentSize : Bool; /**
		Show window in the center of the screen.
	**/
	@:optional
	var center : Bool; /**
		Window's minimum width. Default is 0.
	**/
	@:optional
	var minWidth : Int; /**
		Window's minimum height. Default is 0.
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
		Whether window is resizable. Default is true.
	**/
	@:optional
	var resizable : Bool; /**
		Whether window is movable. This is not implemented on Linux. Default is true.
	**/
	@:optional
	var movable : Bool; /**
		Whether window is minimizable. This is not implemented on Linux. Default is true.
	**/
	@:optional
	var minimizable : Bool; /**
		Whether window is maximizable. This is not implemented on Linux. Default is true.
	**/
	@:optional
	var maximizable : Bool; /**
		Whether window is closable. This is not implemented on Linux. Default is true.
	**/
	@:optional
	var closable : Bool; /**
		Whether the window can be focused. Default is true. On Windows setting focusable: false also implies setting skipTaskbar: true. On Linux setting focusable: false makes the window stop interacting with wm, so the window will always stay on top in all workspaces.
	**/
	@:optional
	var focusable : Bool; /**
		Whether the window should always stay on top of other windows. Default is false.
	**/
	@:optional
	var alwaysOnTop : Bool; /**
		Whether the window should show in fullscreen. When explicitly set to false the fullscreen button will be hidden or disabled on macOS. Default is false.
	**/
	@:optional
	var fullscreen : Bool; /**
		Whether the window can be put into fullscreen mode. On macOS, also whether the maximize/zoom button should toggle full screen mode or maximize window. Default is true.
	**/
	@:optional
	var fullscreenable : Bool; /**
		Use pre-Lion fullscreen on macOS. Default is false.
	**/
	@:optional
	var simpleFullscreen : Bool; /**
		Whether to show the window in taskbar. Default is false.
	**/
	@:optional
	var skipTaskbar : Bool; /**
		The kiosk mode. Default is false.
	**/
	@:optional
	var kiosk : Bool; /**
		Default window title. Default is "Electron".
	**/
	@:optional
	var title : String; /**
		The window icon. On Windows it is recommended to use ICO icons to get best visual effects, you can also leave it undefined so the executable's icon will be used.
	**/
	@:optional
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; /**
		Whether window should be shown when created. Default is true.
	**/
	@:optional
	var show : Bool; /**
		Specify false to create a . Default is true.
	**/
	@:optional
	var frame : Bool; /**
		Specify parent window. Default is null.
	**/
	@:optional
	var parent : electron.main.BrowserWindow; /**
		Whether this is a modal window. This only works when the window is a child window. Default is false.
	**/
	@:optional
	var modal : Bool; /**
		Whether the web view accepts a single mouse-down event that simultaneously activates the window. Default is false.
	**/
	@:optional
	var acceptFirstMouse : Bool; /**
		Whether to hide cursor when typing. Default is false.
	**/
	@:optional
	var disableAutoHideCursor : Bool; /**
		Auto hide the menu bar unless the Alt key is pressed. Default is false.
	**/
	@:optional
	var autoHideMenuBar : Bool; /**
		Enable the window to be resized larger than screen. Default is false.
	**/
	@:optional
	var enableLargerThanScreen : Bool; /**
		Window's background color as a hexadecimal value, like #66CD00 or #FFF or #80FFFFFF (alpha is supported if transparent is set to true). Default is #FFF (white).
	**/
	@:optional
	var backgroundColor : String; /**
		Whether window should have a shadow. This is only implemented on macOS. Default is true.
	**/
	@:optional
	var hasShadow : Bool; /**
		Set the initial opacity of the window, between 0.0 (fully transparent) and 1.0 (fully opaque). This is only implemented on Windows and macOS.
	**/
	@:optional
	var opacity : Float; /**
		Forces using dark theme for the window, only works on some GTK+3 desktop environments. Default is false.
	**/
	@:optional
	var darkTheme : Bool; /**
		Makes the window . Default is false.
	**/
	@:optional
	var transparent : Bool; /**
		The type of window, default is normal window. See more about this below.
	**/
	@:optional
	var type : String; /**
		The style of window title bar. Default is default. Possible values are:
	**/
	@:optional
	var titleBarStyle : String; /**
		Shows the title in the title bar in full screen mode on macOS for all titleBarStyle options. Default is false.
	**/
	@:optional
	var fullscreenWindowTitle : Bool; /**
		Use WS_THICKFRAME style for frameless windows on Windows, which adds standard window frame. Setting it to false will remove window shadow and window animations. Default is true.
	**/
	@:optional
	var thickFrame : Bool; /**
		Add a type of vibrancy effect to the window, only on macOS. Can be appearance-based, light, dark, titlebar, selection, menu, popover, sidebar, medium-light or ultra-dark. Please note that using frame: false in combination with a vibrancy value requires that you use a non-default titleBarStyle as well.
	**/
	@:optional
	var vibrancy : String; /**
		Controls the behavior on macOS when option-clicking the green stoplight button on the toolbar or by clicking the Window > Zoom menu item. If true, the window will grow to the preferred width of the web page when zoomed, false will cause it to zoom to the width of the screen. This will also affect the behavior when calling maximize() directly. Default is false.
	**/
	@:optional
	var zoomToPageWidth : Bool; /**
		Tab group name, allows opening the window as a native tab on macOS 10.12+. Windows with the same tabbing identifier will be grouped together. This also adds a native new tab button to your window's tab bar and allows your app and window to receive the new-window-for-tab event.
	**/
	@:optional
	var tabbingIdentifier : String; /**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : { /**
		Whether to enable DevTools. If it is set to false, can not use BrowserWindow.webContents.openDevTools() to open DevTools. Default is true.
	**/
	@:optional
	var devTools : Bool; /**
		Whether node integration is enabled. Default is true.
	**/
	@:optional
	var nodeIntegration : Bool; /**
		Whether node integration is enabled in web workers. Default is false. More about this can be found in .
	**/
	@:optional
	var nodeIntegrationInWorker : Bool; /**
		Specifies a script that will be loaded before other scripts run in the page. This script will always have access to node APIs no matter whether node integration is turned on or off. The value should be the absolute file path to the script. When node integration is turned off, the preload script can reintroduce Node global symbols back to the global scope. See example .
	**/
	@:optional
	var preload : String; /**
		If set, this will sandbox the renderer associated with the window, making it compatible with the Chromium OS-level sandbox and disabling the Node.js engine. This is not the same as the nodeIntegration option and the APIs available to the preload script are more limited. Read more about the option . This option is currently experimental and may change or be removed in future Electron releases.
	**/
	@:optional
	var sandbox : Bool; /**
		Whether to enable the module. Default is true.
	**/
	@:optional
	var enableRemoteModule : Bool; /**
		Sets the session used by the page. Instead of passing the Session object directly, you can also choose to use the partition option instead, which accepts a partition string. When both session and partition are provided, session will be preferred. Default is the default session.
	**/
	@:optional
	var session : electron.main.Session; /**
		Sets the session used by the page according to the session's partition string. If partition starts with persist:, the page will use a persistent session available to all pages in the app with the same partition. If there is no persist: prefix, the page will use an in-memory session. By assigning the same partition, multiple pages can share the same session. Default is the default session.
	**/
	@:optional
	var partition : String; /**
		When specified, web pages with the same affinity will run in the same renderer process. Note that due to reusing the renderer process, certain webPreferences options will also be shared between the web pages even when you specified different values for them, including but not limited to preload, sandbox and nodeIntegration. So it is suggested to use exact same webPreferences for web pages with the same affinity.
	**/
	@:optional
	var affinity : String; /**
		The default zoom factor of the page, 3.0 represents 300%. Default is 1.0.
	**/
	@:optional
	var zoomFactor : Float; /**
		Enables JavaScript support. Default is true.
	**/
	@:optional
	var javascript : Bool; /**
		When false, it will disable the same-origin policy (usually using testing websites by people), and set allowRunningInsecureContent to true if this options has not been set by user. Default is true.
	**/
	@:optional
	var webSecurity : Bool; /**
		Allow an https page to run JavaScript, CSS or plugins from http URLs. Default is false.
	**/
	@:optional
	var allowRunningInsecureContent : Bool; /**
		Enables image support. Default is true.
	**/
	@:optional
	var images : Bool; /**
		Make TextArea elements resizable. Default is true.
	**/
	@:optional
	var textAreasAreResizable : Bool; /**
		Enables WebGL support. Default is true.
	**/
	@:optional
	var webgl : Bool; /**
		Enables WebAudio support. Default is true.
	**/
	@:optional
	var webaudio : Bool; /**
		Whether plugins should be enabled. Default is false.
	**/
	@:optional
	var plugins : Bool; /**
		Enables Chromium's experimental features. Default is false.
	**/
	@:optional
	var experimentalFeatures : Bool; /**
		Enables scroll bounce (rubber banding) effect on macOS. Default is false.
	**/
	@:optional
	var scrollBounce : Bool; /**
		A list of feature strings separated by ,, like CSSVariables,KeyboardEventKey to enable. The full list of supported feature strings can be found in the file.
	**/
	@:optional
	var enableBlinkFeatures : String; /**
		A list of feature strings separated by ,, like CSSVariables,KeyboardEventKey to disable. The full list of supported feature strings can be found in the file.
	**/
	@:optional
	var disableBlinkFeatures : String; /**
		Sets the default font for the font-family.
	**/
	@:optional
	var defaultFontFamily : { /**
		Defaults to Times New Roman.
	**/
	@:optional
	var standard : String; /**
		Defaults to Times New Roman.
	**/
	@:optional
	var serif : String; /**
		Defaults to Arial.
	**/
	@:optional
	var sansSerif : String; /**
		Defaults to Courier New.
	**/
	@:optional
	var monospace : String; /**
		Defaults to Script.
	**/
	@:optional
	var cursive : String; /**
		Defaults to Impact.
	**/
	@:optional
	var fantasy : String; }; /**
		Defaults to 16.
	**/
	@:optional
	var defaultFontSize : Int; /**
		Defaults to 13.
	**/
	@:optional
	var defaultMonospaceFontSize : Int; /**
		Defaults to 0.
	**/
	@:optional
	var minimumFontSize : Int; /**
		Defaults to ISO-8859-1.
	**/
	@:optional
	var defaultEncoding : String; /**
		Whether to throttle animations and timers when the page becomes background. This also affects the . Defaults to true.
	**/
	@:optional
	var backgroundThrottling : Bool; /**
		Whether to enable offscreen rendering for the browser window. Defaults to false. See the for more details.
	**/
	@:optional
	var offscreen : Bool; /**
		Whether to run Electron APIs and the specified preload script in a separate JavaScript context. Defaults to false. The context that the preload script runs in will still have full access to the document and window globals but it will use its own set of JavaScript builtins (Array, Object, JSON, etc.) and will be isolated from any changes made to the global environment by the loaded page. The Electron API will only be available in the preload script and not the loaded page. This option should be used when loading potentially untrusted remote content to ensure the loaded content cannot tamper with the preload script and any Electron APIs being used. This option uses the same technique used by . You can access this context in the dev tools by selecting the 'Electron Isolated Context' entry in the combo box at the top of the Console tab.
	**/
	@:optional
	var contextIsolation : Bool; /**
		Whether to use native window.open(). If set to true, the webPreferences of child window will always be the same with parent window, regardless of the parameters passed to window.open(). Defaults to false. This option is currently experimental.
	**/
	@:optional
	var nativeWindowOpen : Bool; /**
		Whether to enable the . Defaults to the value of the nodeIntegration option. The preload script configured for the will have node integration enabled when it is executed so you should ensure remote/untrusted content is not able to create a tag with a possibly malicious preload script. You can use the will-attach-webview event on to strip away the preload script and to validate or alter the 's initial settings.
	**/
	@:optional
	var webviewTag : Bool; /**
		A list of strings that will be appended to process.argv in the renderer process of this app. Useful for passing small bits of data down to renderer process preload scripts.
	**/
	@:optional
	var additionalArguments : Array<String>; /**
		Whether to enable browser style consecutive dialog protection. Default is false.
	**/
	@:optional
	var safeDialogs : Bool; /**
		The message to display when consecutive dialog protection is triggered. If not defined the default message would be used, note that currently the default message is in English and not localized.
	**/
	@:optional
	var safeDialogsMessage : String; /**
		Whether dragging and dropping a file or link onto the page causes a navigation. Default is false.
	**/
	@:optional
	var navigateOnDragDrop : Bool; }; }):Void;
	/**
		Force closing the window, the unload and beforeunload event won't be emitted for the web page, and close event will also not be emitted for this window, but it guarantees the closed event will be emitted.
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
	function isFocused():Bool;
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
	function isVisible():Bool;
	function isModal():Bool;
	/**
		Maximizes the window. This will also show (but not focus) the window if it isn't being displayed already.
	**/
	function maximize():Void;
	/**
		Unmaximizes the window.
	**/
	function unmaximize():Void;
	function isMaximized():Bool;
	/**
		Minimizes the window. On some platforms the minimized window will be shown in the Dock.
	**/
	function minimize():Void;
	/**
		Restores the window from minimized state to its previous state.
	**/
	function restore():Void;
	function isMinimized():Bool;
	/**
		Sets whether the window should be in fullscreen mode.
	**/
	function setFullScreen(flag:Bool):Void;
	function isFullScreen():Bool;
	/**
		Enters or leaves simple fullscreen mode. Simple fullscreen mode emulates the native fullscreen behavior found in versions of Mac OS X prior to Lion (10.7).
	**/
	@:electron_platforms(["macOS"])
	function setSimpleFullScreen(flag:Bool):Void;
	@:electron_platforms(["macOS"])
	function isSimpleFullScreen():Bool;
	function isNormal():Bool;
	/**
		This will make a window maintain an aspect ratio. The extra size allows a developer to have space, specified in pixels, not included within the aspect ratio calculations. This API already takes into account the difference between a window's size and its content size. Consider a normal window with an HD video player and associated controls. Perhaps there are 15 pixels of controls on the left edge, 25 pixels of controls on the right edge and 50 pixels of controls below the player. In order to maintain a 16:9 aspect ratio (standard aspect ratio for HD @1920x1080) within the player itself we would call this function with arguments of 16/9 and [ 40, 50 ]. The second argument doesn't care where the extra width and height are within the content view--only that they exist. Sum any extra width and height areas you have within the overall content view. Calling this function with a value of 0 will remove any previously set aspect ratios.
	**/
	@:electron_platforms(["macOS"])
	function setAspectRatio(aspectRatio:Float, extraSize:electron.Size):Void;
	/**
		Sets the background color of the window. See Setting backgroundColor.
	**/
	function setBackgroundColor(backgroundColor:String):Void;
	/**
		Uses Quick Look to preview a file at a given path.
	**/
	@:electron_platforms(["macOS"])
	function previewFile(path:String, ?displayName:String):Void;
	/**
		Closes the currently open Quick Look panel.
	**/
	@:electron_platforms(["macOS"])
	function closeFilePreview():Void;
	/**
		Resizes and moves the window to the supplied bounds. Any properties that are not supplied will default to their current values.
	**/
	function setBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	function getBounds():electron.Rectangle;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
	**/
	function setContentBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	function getContentBounds():electron.Rectangle;
	/**
		Note: whatever the current state of the window : maximized, minimized or in fullscreen, this function always returns the position and size of the window in normal state. In normal state, getBounds and getNormalBounds returns the same Rectangle.
	**/
	function getNormalBounds():electron.Rectangle;
	/**
		Disable or enable the window.
	**/
	function setEnabled(enable:Bool):Void;
	/**
		Resizes the window to width and height. If width or height are below any set minimum size constraints the window will snap to its minimum size.
	**/
	function setSize(width:Int, height:Int, ?animate:Bool):Void;
	function getSize():Array<Int>;
	/**
		Resizes the window's client area (e.g. the web page) to width and height.
	**/
	function setContentSize(width:Int, height:Int, ?animate:Bool):Void;
	function getContentSize():Array<Int>;
	/**
		Sets the minimum size of window to width and height.
	**/
	function setMinimumSize(width:Int, height:Int):Void;
	function getMinimumSize():Array<Int>;
	/**
		Sets the maximum size of window to width and height.
	**/
	function setMaximumSize(width:Int, height:Int):Void;
	function getMaximumSize():Array<Int>;
	/**
		Sets whether the window can be manually resized by user.
	**/
	function setResizable(resizable:Bool):Void;
	function isResizable():Bool;
	/**
		Sets whether the window can be moved by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setMovable(movable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isMovable():Bool;
	/**
		Sets whether the window can be manually minimized by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setMinimizable(minimizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isMinimizable():Bool;
	/**
		Sets whether the window can be manually maximized by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setMaximizable(maximizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isMaximizable():Bool;
	/**
		Sets whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	function setFullScreenable(fullscreenable:Bool):Void;
	function isFullScreenable():Bool;
	/**
		Sets whether the window can be manually closed by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setClosable(closable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isClosable():Bool;
	/**
		Sets whether the window should show always on top of other windows. After setting this, the window is still a normal window, not a toolbox window which can not be focused on.
	**/
	function setAlwaysOnTop(flag:Bool, ?level:String, ?relativeLevel:Int):Void;
	function isAlwaysOnTop():Bool;
	/**
		Moves window to top(z-order) regardless of focus
	**/
	@:electron_platforms(["macOS", "Windows"])
	function moveTop():Void;
	/**
		Moves window to the center of the screen.
	**/
	function center():Void;
	/**
		Moves window to x and y.
	**/
	function setPosition(x:Int, y:Int, ?animate:Bool):Void;
	function getPosition():Array<Int>;
	/**
		Changes the title of native window to title.
	**/
	function setTitle(title:String):Void;
	/**
		Note: The title of web page can be different from the title of the native window.
	**/
	function getTitle():String;
	/**
		Changes the attachment point for sheets on macOS. By default, sheets are attached just below the window frame, but you may want to display them beneath a HTML-rendered toolbar. For example:
	**/
	@:electron_platforms(["macOS"])
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
		Enters or leaves the kiosk mode.
	**/
	function setKiosk(flag:Bool):Void;
	function isKiosk():Bool;
	/**
		The native type of the handle is HWND on Windows, NSView* on macOS, and Window (unsigned long) on Linux.
	**/
	function getNativeWindowHandle():js.node.Buffer;
	/**
		Hooks a windows message. The callback is called when the message is received in the WndProc.
	**/
	@:electron_platforms(["Windows"])
	function hookWindowMessage(message:Int, callback:haxe.Constraints.Function):Void;
	@:electron_platforms(["Windows"])
	function isWindowMessageHooked(message:Int):Bool;
	/**
		Unhook the window message.
	**/
	@:electron_platforms(["Windows"])
	function unhookWindowMessage(message:Int):Void;
	/**
		Unhooks all of the window messages.
	**/
	@:electron_platforms(["Windows"])
	function unhookAllWindowMessages():Void;
	/**
		Sets the pathname of the file the window represents, and the icon of the file will show in window's title bar.
	**/
	@:electron_platforms(["macOS"])
	function setRepresentedFilename(filename:String):Void;
	@:electron_platforms(["macOS"])
	function getRepresentedFilename():String;
	/**
		Specifies whether the window’s document has been edited, and the icon in title bar will become gray when set to true.
	**/
	@:electron_platforms(["macOS"])
	function setDocumentEdited(edited:Bool):Void;
	@:electron_platforms(["macOS"])
	function isDocumentEdited():Bool;
	function focusOnWebView():Void;
	function blurWebView():Void;
	/**
		Same as webContents.capturePage([rect, ]callback).
	**/
	function capturePage(?rect:electron.Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Same as webContents.loadURL(url[, options]). The url can be a remote address (e.g. http://) or a path to a local HTML file using the file:// protocol. To ensure that file URLs are properly formatted, it is recommended to use Node's url.format method: You can load a URL using a POST request with URL-encoded data by doing the following:
	**/
	function loadURL(url:String, ?options:{ /**
		An HTTP Referrer url.
	**/
	@:optional
	var httpReferrer : haxe.extern.EitherType<String, electron.Referrer>; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; @:optional
	var postData : haxe.extern.EitherType<Array<electron.UploadRawData>, haxe.extern.EitherType<Array<electron.UploadFile>, Array<electron.UploadBlob>>>; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified url is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):Void;
	/**
		Same as webContents.loadFile, filePath should be a path to an HTML file relative to the root of your application.  See the webContents docs for more information.
	**/
	function loadFile(filePath:String, ?options:{ /**
		Passed to url.format().
	**/
	@:optional
	var query : Any; /**
		Passed to url.format().
	**/
	@:optional
	var search : String; /**
		Passed to url.format().
	**/
	@:optional
	var hash : String; }):Void;
	/**
		Same as webContents.reload.
	**/
	function reload():Void;
	/**
		Sets the menu as the window's menu bar, setting it to null will remove the menu bar.
	**/
	@:electron_platforms(["Linux", "Windows"])
	function setMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0]. Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1. On Linux platform, only supports Unity desktop environment, you need to specify the *.desktop file name to desktopName field in package.json. By default, it will assume app.getName().desktop. On Windows, a mode can be passed. Accepted values are none, normal, indeterminate, error, and paused. If you call setProgressBar without a mode set (but with a value within the valid range), normal will be assumed.
	**/
	function setProgressBar(progress:Float, ?options:{ /**
		Mode for the progress bar. Can be none, normal, indeterminate, error or paused.
	**/
	var mode : String; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	@:electron_platforms(["Windows"])
	function setOverlayIcon(overlay:haxe.extern.EitherType<electron.NativeImage, Dynamic>, description:String):Void;
	/**
		Sets whether the window should have a shadow. On Windows and Linux does nothing.
	**/
	@:electron_platforms(["macOS"])
	function setHasShadow(hasShadow:Bool):Void;
	/**
		On Windows and Linux always returns true.
	**/
	@:electron_platforms(["macOS"])
	function hasShadow():Bool;
	/**
		Sets the opacity of the window. On Linux does nothing.
	**/
	@:electron_platforms(["Windows", "macOS"])
	function setOpacity(opacity:Float):Void;
	@:electron_platforms(["Windows", "macOS"])
	function getOpacity():Float;
	/**
		Setting a window shape determines the area within the window where the system permits drawing and user interaction. Outside of the given region, no pixels will be drawn and no mouse events will be registered. Mouse events outside of the region will not be received by that window, but will fall through to whatever is behind the window.
	**/
	@:electron_platforms(["Windows", "Linux", "Experimental"])
	function setShape(rects:Array<electron.Rectangle>):Void;
	/**
		Add a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button layout. Returns a Boolean object indicates whether the thumbnail has been added successfully. The number of buttons in thumbnail toolbar should be no greater than 7 due to the limited room. Once you setup the thumbnail toolbar, the toolbar cannot be removed due to the platform's limitation. But you can call the API with an empty array to clean the buttons. The buttons is an array of Button objects: The flags is an array that can include following Strings:
	**/
	@:electron_platforms(["Windows"])
	function setThumbarButtons(buttons:Array<electron.ThumbarButton>):Bool;
	/**
		Sets the region of the window to show as the thumbnail image displayed when hovering over the window in the taskbar. You can reset the thumbnail to be the entire window by specifying an empty region: { x: 0, y: 0, width: 0, height: 0 }.
	**/
	@:electron_platforms(["Windows"])
	function setThumbnailClip(region:electron.Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	@:electron_platforms(["Windows"])
	function setThumbnailToolTip(toolTip:String):Void;
	/**
		Sets the properties for the window's taskbar button. Note: relaunchCommand and relaunchDisplayName must always be set together. If one of those properties is not set, then neither will be used.
	**/
	@:electron_platforms(["Windows"])
	function setAppDetails(options:{ /**
		Window's . It has to be set, otherwise the other options will have no effect.
	**/
	@:optional
	var appId : String; /**
		Window's .
	**/
	@:optional
	var appIconPath : String; /**
		Index of the icon in appIconPath. Ignored when appIconPath is not set. Default is 0.
	**/
	@:optional
	var appIconIndex : Int; /**
		Window's .
	**/
	@:optional
	var relaunchCommand : String; /**
		Window's .
	**/
	@:optional
	var relaunchDisplayName : String; }):Void;
	/**
		Same as webContents.showDefinitionForSelection().
	**/
	@:electron_platforms(["macOS"])
	function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setIcon(icon:electron.NativeImage):Void;
	/**
		Sets whether the window traffic light buttons should be visible. This cannot be called when titleBarStyle is set to customButtonsOnHover.
	**/
	@:electron_platforms(["macOS"])
	function setWindowButtonVisibility(visible:Bool):Void;
	/**
		Sets whether the window menu bar should hide itself automatically. Once set the menu bar will only show when users press the single Alt key. If the menu bar is already visible, calling setAutoHideMenuBar(true) won't hide it immediately.
	**/
	function setAutoHideMenuBar(hide:Bool):Void;
	function isMenuBarAutoHide():Bool;
	/**
		Sets whether the menu bar should be visible. If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single Alt key.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setMenuBarVisibility(visible:Bool):Void;
	function isMenuBarVisible():Bool;
	/**
		Sets whether the window should be visible on all workspaces. Note: This API does nothing on Windows.
	**/
	function setVisibleOnAllWorkspaces(visible:Bool, ?options:{ /**
		Sets whether the window should be visible above fullscreen windows
	**/
	@:optional
	var visibleOnFullScreen : Bool; }):Void;
	/**
		Note: This API always returns false on Windows.
	**/
	function isVisibleOnAllWorkspaces():Bool;
	/**
		Makes the window ignore all mouse events. All mouse events happened in this window will be passed to the window below this window, but if this window has focus, it will still receive keyboard events.
	**/
	function setIgnoreMouseEvents(ignore:Bool, ?options:{ /**
		If true, forwards mouse move messages to Chromium, enabling mouse related events such as mouseleave. Only used when ignore is true. If ignore is false, forwarding is always disabled regardless of this value.
	**/
	@:optional
	var forward : Bool; }):Void;
	/**
		Prevents the window contents from being captured by other apps. On macOS it sets the NSWindow's sharingType to NSWindowSharingNone. On Windows it calls SetWindowDisplayAffinity with WDA_MONITOR.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setContentProtection(enable:Bool):Void;
	/**
		Changes whether the window can be focused.
	**/
	@:electron_platforms(["Windows"])
	function setFocusable(focusable:Bool):Void;
	/**
		Sets parent as current window's parent window, passing null will turn current window into a top-level window.
	**/
	@:electron_platforms(["Linux", "macOS"])
	function setParentWindow(parent:electron.main.BrowserWindow):Void;
	function getParentWindow():electron.main.BrowserWindow;
	function getChildWindows():Array<electron.main.BrowserWindow>;
	/**
		Controls whether to hide cursor when typing.
	**/
	@:electron_platforms(["macOS"])
	function setAutoHideCursor(autoHide:Bool):Void;
	/**
		Selects the previous tab when native tabs are enabled and there are other tabs in the window.
	**/
	@:electron_platforms(["macOS"])
	function selectPreviousTab():Void;
	/**
		Selects the next tab when native tabs are enabled and there are other tabs in the window.
	**/
	@:electron_platforms(["macOS"])
	function selectNextTab():Void;
	/**
		Merges all windows into one window with multiple tabs when native tabs are enabled and there is more than one open window.
	**/
	@:electron_platforms(["macOS"])
	function mergeAllWindows():Void;
	/**
		Moves the current tab into a new window if native tabs are enabled and there is more than one tab in the current window.
	**/
	@:electron_platforms(["macOS"])
	function moveTabToNewWindow():Void;
	/**
		Toggles the visibility of the tab bar if native tabs are enabled and there is only one tab in the current window.
	**/
	@:electron_platforms(["macOS"])
	function toggleTabBar():Void;
	/**
		Adds a window as a tab on this window, after the tab for the window instance.
	**/
	@:electron_platforms(["macOS"])
	function addTabbedWindow(browserWindow:electron.main.BrowserWindow):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing null or an empty string will remove the vibrancy effect on the window.
	**/
	@:electron_platforms(["macOS"])
	function setVibrancy(type:String):Void;
	/**
		Sets the touchBar layout for the current window. Specifying null or undefined clears the touch bar. This method only has an effect if the machine has a touch bar and is running on macOS 10.12.1+. Note: The TouchBar API is currently experimental and may change or be removed in future Electron releases.
	**/
	@:electron_platforms(["macOS", "Experimental"])
	function setTouchBar(touchBar:electron.main.TouchBar):Void;
	@:electron_platforms(["Experimental"])
	function setBrowserView(browserView:electron.main.BrowserView):Void;
	/**
		Note: The BrowserView API is currently experimental and may change or be removed in future Electron releases.
	**/
	@:electron_platforms(["Experimental"])
	function getBrowserView():haxe.extern.EitherType<electron.main.BrowserView, Dynamic>;
}
@:enum abstract BrowserWindowEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the document changed its title, calling event.preventDefault() will prevent the native window's title from changing.
	**/
	var page_title_updated : electron.main.BrowserWindowEvent<(js.html.Event, String) -> Void> = "page-title-updated";
	/**
		Emitted when the window is going to be closed. It's emitted before the beforeunload and unload event of the DOM. Calling event.preventDefault() will cancel the close. Usually you would want to use the beforeunload handler to decide whether the window should be closed, which will also be called when the window is reloaded. In Electron, returning any value other than undefined would cancel the close. For example: Note: There is a subtle difference between the behaviors of window.onbeforeunload = handler and window.addEventListener('beforeunload', handler). It is recommended to always set the event.returnValue explicitly, instead of only returning a value, as the former works more consistently within Electron.
	**/
	var close : electron.main.BrowserWindowEvent<js.html.Event -> Void> = "close";
	/**
		Emitted when the window is closed. After you have received this event you should remove the reference to the window and avoid using it any more.
	**/
	var closed : electron.main.BrowserWindowEvent<Void -> Void> = "closed";
	/**
		Emitted when window session is going to end due to force shutdown or machine restart or session log off.
	**/
	@:electron_platforms(["Windows"])
	var session_end : electron.main.BrowserWindowEvent<Void -> Void> = "session-end";
	/**
		Emitted when the web page becomes unresponsive.
	**/
	var unresponsive : electron.main.BrowserWindowEvent<Void -> Void> = "unresponsive";
	/**
		Emitted when the unresponsive web page becomes responsive again.
	**/
	var responsive : electron.main.BrowserWindowEvent<Void -> Void> = "responsive";
	/**
		Emitted when the window loses focus.
	**/
	var blur : electron.main.BrowserWindowEvent<Void -> Void> = "blur";
	/**
		Emitted when the window gains focus.
	**/
	var focus : electron.main.BrowserWindowEvent<Void -> Void> = "focus";
	/**
		Emitted when the window is shown.
	**/
	var show : electron.main.BrowserWindowEvent<Void -> Void> = "show";
	/**
		Emitted when the window is hidden.
	**/
	var hide : electron.main.BrowserWindowEvent<Void -> Void> = "hide";
	/**
		Emitted when the web page has been rendered (while not being shown) and window can be displayed without a visual flash.
	**/
	var ready_to_show : electron.main.BrowserWindowEvent<Void -> Void> = "ready-to-show";
	/**
		Emitted when window is maximized.
	**/
	var maximize : electron.main.BrowserWindowEvent<Void -> Void> = "maximize";
	/**
		Emitted when the window exits from a maximized state.
	**/
	var unmaximize : electron.main.BrowserWindowEvent<Void -> Void> = "unmaximize";
	/**
		Emitted when the window is minimized.
	**/
	var minimize : electron.main.BrowserWindowEvent<Void -> Void> = "minimize";
	/**
		Emitted when the window is restored from a minimized state.
	**/
	var restore : electron.main.BrowserWindowEvent<Void -> Void> = "restore";
	/**
		Emitted before the window is resized. Calling event.preventDefault() will prevent the window from being resized. Note that this is only emitted when the window is being resized manually. Resizing the window with setBounds/setSize will not emit this event.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var will_resize : electron.main.BrowserWindowEvent<(js.html.Event, electron.Rectangle) -> Void> = "will-resize";
	/**
		Emitted after the window has been resized.
	**/
	var resize : electron.main.BrowserWindowEvent<Void -> Void> = "resize";
	/**
		Emitted before the window is moved. Calling event.preventDefault() will prevent the window from being moved. Note that this is only emitted when the window is being resized manually. Resizing the window with setBounds/setSize will not emit this event.
	**/
	@:electron_platforms(["Windows"])
	var will_move : electron.main.BrowserWindowEvent<(js.html.Event, electron.Rectangle) -> Void> = "will-move";
	/**
		Emitted when the window is being moved to a new position. Note: On macOS this event is an alias of moved.
	**/
	var move : electron.main.BrowserWindowEvent<Void -> Void> = "move";
	/**
		Emitted once when the window is moved to a new position.
	**/
	@:electron_platforms(["macOS"])
	var moved : electron.main.BrowserWindowEvent<Void -> Void> = "moved";
	/**
		Emitted when the window enters a full-screen state.
	**/
	var enter_full_screen : electron.main.BrowserWindowEvent<Void -> Void> = "enter-full-screen";
	/**
		Emitted when the window leaves a full-screen state.
	**/
	var leave_full_screen : electron.main.BrowserWindowEvent<Void -> Void> = "leave-full-screen";
	/**
		Emitted when the window enters a full-screen state triggered by HTML API.
	**/
	var enter_html_full_screen : electron.main.BrowserWindowEvent<Void -> Void> = "enter-html-full-screen";
	/**
		Emitted when the window leaves a full-screen state triggered by HTML API.
	**/
	var leave_html_full_screen : electron.main.BrowserWindowEvent<Void -> Void> = "leave-html-full-screen";
	/**
		Emitted when the window is set or unset to show always on top of other windows.
	**/
	@:electron_platforms(["macOS"])
	var always_on_top_changed : electron.main.BrowserWindowEvent<(js.html.Event, Bool) -> Void> = "always-on-top-changed";
	/**
		Emitted when an App Command is invoked. These are typically related to keyboard media keys or browser commands, as well as the "Back" button built into some mice on Windows. Commands are lowercased, underscores are replaced with hyphens, and the APPCOMMAND_ prefix is stripped off. e.g. APPCOMMAND_BROWSER_BACKWARD is emitted as browser-backward.
	**/
	@:electron_platforms(["Windows"])
	var app_command : electron.main.BrowserWindowEvent<(js.html.Event, String) -> Void> = "app-command";
	/**
		Emitted when scroll wheel event phase has begun.
	**/
	@:electron_platforms(["macOS"])
	var scroll_touch_begin : electron.main.BrowserWindowEvent<Void -> Void> = "scroll-touch-begin";
	/**
		Emitted when scroll wheel event phase has ended.
	**/
	@:electron_platforms(["macOS"])
	var scroll_touch_end : electron.main.BrowserWindowEvent<Void -> Void> = "scroll-touch-end";
	/**
		Emitted when scroll wheel event phase filed upon reaching the edge of element.
	**/
	@:electron_platforms(["macOS"])
	var scroll_touch_edge : electron.main.BrowserWindowEvent<Void -> Void> = "scroll-touch-edge";
	/**
		Emitted on 3-finger swipe. Possible directions are up, right, down, left.
	**/
	@:electron_platforms(["macOS"])
	var swipe : electron.main.BrowserWindowEvent<(js.html.Event, String) -> Void> = "swipe";
	/**
		Emitted when the window opens a sheet.
	**/
	@:electron_platforms(["macOS"])
	var sheet_begin : electron.main.BrowserWindowEvent<Void -> Void> = "sheet-begin";
	/**
		Emitted when the window has closed a sheet.
	**/
	@:electron_platforms(["macOS"])
	var sheet_end : electron.main.BrowserWindowEvent<Void -> Void> = "sheet-end";
	/**
		Emitted when the native new tab button is clicked.
	**/
	@:electron_platforms(["macOS"])
	var new_window_for_tab : electron.main.BrowserWindowEvent<Void -> Void> = "new-window-for-tab";
}
