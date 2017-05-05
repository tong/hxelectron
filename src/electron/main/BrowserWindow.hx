package electron.main;

/**
	Create and control browser windows.

	See: <http://electron.atom.io/docs/api/browser-window>
**/
@:require(js, electron) @:jsRequire("electron", "BrowserWindow") extern class BrowserWindow extends js.node.events.EventEmitter<electron.main.BrowserWindow> {
	/**
		A WebContents object this window owns. All web page related events and operations will be done via it. See the webContents documentation for its methods and events.
	**/
	var webContents : WebContents;
	/**
		A Integer representing the unique ID of the window.
	**/
	var id : Int;
	function new(?options:{ /**
		Window's width in pixels. Default is .
	**/
	@:optional
	var width : Int; /**
		Window's height in pixels. Default is .
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
		The and would be used as web page's size, which means the actual window's size will include window frame's size and be slightly larger. Default is .
	**/
	@:optional
	var useContentSize : Bool; /**
		Show window in the center of the screen.
	**/
	@:optional
	var center : Bool; /**
		Window's minimum width. Default is .
	**/
	@:optional
	var minWidth : Int; /**
		Window's minimum height. Default is .
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
		Whether window is resizable. Default is .
	**/
	@:optional
	var resizable : Bool; /**
		Whether window is movable. This is not implemented on Linux. Default is .
	**/
	@:optional
	var movable : Bool; /**
		Whether window is minimizable. This is not implemented on Linux. Default is .
	**/
	@:optional
	var minimizable : Bool; /**
		Whether window is maximizable. This is not implemented on Linux. Default is .
	**/
	@:optional
	var maximizable : Bool; /**
		Whether window is closable. This is not implemented on Linux. Default is .
	**/
	@:optional
	var closable : Bool; /**
		Whether the window can be focused. Default is . On Windows setting also implies setting . On Linux setting makes the window stop interacting with wm, so the window will always stay on top in all workspaces.
	**/
	@:optional
	var focusable : Bool; /**
		Whether the window should always stay on top of other windows. Default is .
	**/
	@:optional
	var alwaysOnTop : Bool; /**
		Whether the window should show in fullscreen. When explicitly set to the fullscreen button will be hidden or disabled on macOS. Default is .
	**/
	@:optional
	var fullscreen : Bool; /**
		Whether the window can be put into fullscreen mode. On macOS, also whether the maximize/zoom button should toggle full screen mode or maximize window. Default is .
	**/
	@:optional
	var fullscreenable : Bool; /**
		Whether to show the window in taskbar. Default is .
	**/
	@:optional
	var skipTaskbar : Bool; /**
		The kiosk mode. Default is .
	**/
	@:optional
	var kiosk : Bool; /**
		Default window title. Default is .
	**/
	@:optional
	var title : String; /**
		The window icon. On Windows it is recommended to use icons to get best visual effects, you can also leave it undefined so the executable's icon will be used.
	**/
	@:optional
	var icon : Dynamic; /**
		Whether window should be shown when created. Default is .
	**/
	@:optional
	var show : Bool; /**
		Specify to create a . Default is .
	**/
	@:optional
	var frame : Bool; /**
		Specify parent window. Default is .
	**/
	@:optional
	var parent : BrowserWindow; /**
		Whether this is a modal window. This only works when the window is a child window. Default is .
	**/
	@:optional
	var modal : Bool; /**
		Whether the web view accepts a single mouse-down event that simultaneously activates the window. Default is .
	**/
	@:optional
	var acceptFirstMouse : Bool; /**
		Whether to hide cursor when typing. Default is .
	**/
	@:optional
	var disableAutoHideCursor : Bool; /**
		Auto hide the menu bar unless the key is pressed. Default is .
	**/
	@:optional
	var autoHideMenuBar : Bool; /**
		Enable the window to be resized larger than screen. Default is .
	**/
	@:optional
	var enableLargerThanScreen : Bool; /**
		Window's background color as Hexadecimal value, like or or (alpha is supported). Default is (white).
	**/
	@:optional
	var backgroundColor : String; /**
		Whether window should have a shadow. This is only implemented on macOS. Default is .
	**/
	@:optional
	var hasShadow : Bool; /**
		Forces using dark theme for the window, only works on some GTK+3 desktop environments. Default is .
	**/
	@:optional
	var darkTheme : Bool; /**
		Makes the window . Default is .
	**/
	@:optional
	var transparent : Bool; /**
		The type of window, default is normal window. See more about this below.
	**/
	@:optional
	var type : String; /**
		The style of window title bar. Default is . Possible values are:
	**/
	@:optional
	var titleBarStyle : String; /**
		Use style for frameless windows on Windows, which adds standard window frame. Setting it to will remove window shadow and window animations. Default is .
	**/
	@:optional
	var thickFrame : Bool; /**
		Add a type of vibrancy effect to the window, only on macOS. Can be , , , , , , , , or .
	**/
	@:optional
	var vibrancy : String; /**
		Controls the behavior on macOS when option-clicking the green stoplight button on the toolbar or by clicking the Window > Zoom menu item. If , the window will grow to the preferred width of the web page when zoomed, will cause it to zoom to the width of the screen. This will also affect the behavior when calling directly. Default is .
	**/
	@:optional
	var zoomToPageWidth : Bool; /**
		Tab group name, allows opening the window as a native tab on macOS 10.12+. Windows with the same tabbing identifier will be grouped together.
	**/
	@:optional
	var tabbingIdentifier : String; /**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : { /**
		Whether to enable DevTools. If it is set to , can not use to open DevTools. Default is .
	**/
	@:optional
	var devTools : Bool; /**
		Whether node integration is enabled. Default is .
	**/
	@:optional
	var nodeIntegration : Bool; /**
		Whether node integration is enabled in web workers. Default is . More about this can be found in .
	**/
	@:optional
	var nodeIntegrationInWorker : Bool; /**
		Specifies a script that will be loaded before other scripts run in the page. This script will always have access to node APIs no matter whether node integration is turned on or off. The value should be the absolute file path to the script. When node integration is turned off, the preload script can reintroduce Node global symbols back to the global scope. See example .
	**/
	@:optional
	var preload : String; /**
		If set, this will sandbox the renderer associated with the window, making it compatible with the Chromium OS-level sandbox and disabling the Node.js engine. This is not the same as the option and the APIs available to the preload script are more limited. Read more about the option . This option is currently experimental and may change or be removed in future Electron releases.
	**/
	@:optional
	var sandbox : Bool; /**
		Sets the session used by the page. Instead of passing the Session object directly, you can also choose to use the option instead, which accepts a partition string. When both and are provided, will be preferred. Default is the default session.
	**/
	@:optional
	var session : Session; /**
		Sets the session used by the page according to the session's partition string. If starts with , the page will use a persistent session available to all pages in the app with the same . If there is no prefix, the page will use an in-memory session. By assigning the same , multiple pages can share the same session. Default is the default session.
	**/
	@:optional
	var partition : String; /**
		The default zoom factor of the page, represents . Default is .
	**/
	@:optional
	var zoomFactor : Float; /**
		Enables JavaScript support. Default is .
	**/
	@:optional
	var javascript : Bool; /**
		When , it will disable the same-origin policy (usually using testing websites by people), and set to if this options has not been set by user. Default is .
	**/
	@:optional
	var webSecurity : Bool; /**
		Allow an https page to run JavaScript, CSS or plugins from http URLs. Default is .
	**/
	@:optional
	var allowRunningInsecureContent : Bool; /**
		Enables image support. Default is .
	**/
	@:optional
	var images : Bool; /**
		Make TextArea elements resizable. Default is .
	**/
	@:optional
	var textAreasAreResizable : Bool; /**
		Enables WebGL support. Default is .
	**/
	@:optional
	var webgl : Bool; /**
		Enables WebAudio support. Default is .
	**/
	@:optional
	var webaudio : Bool; /**
		Whether plugins should be enabled. Default is .
	**/
	@:optional
	var plugins : Bool; /**
		Enables Chromium's experimental features. Default is .
	**/
	@:optional
	var experimentalFeatures : Bool; /**
		Enables Chromium's experimental canvas features. Default is .
	**/
	@:optional
	var experimentalCanvasFeatures : Bool; /**
		Enables scroll bounce (rubber banding) effect on macOS. Default is .
	**/
	@:optional
	var scrollBounce : Bool; /**
		A list of feature strings separated by , like to enable. The full list of supported feature strings can be found in the file.
	**/
	@:optional
	var blinkFeatures : String; /**
		A list of feature strings separated by , like to disable. The full list of supported feature strings can be found in the file.
	**/
	@:optional
	var disableBlinkFeatures : String; /**
		Sets the default font for the font-family.
	**/
	@:optional
	var defaultFontFamily : { /**
		Defaults to .
	**/
	@:optional
	var standard : String; /**
		Defaults to .
	**/
	@:optional
	var serif : String; /**
		Defaults to .
	**/
	@:optional
	var sansSerif : String; /**
		Defaults to .
	**/
	@:optional
	var monospace : String; /**
		Defaults to .
	**/
	@:optional
	var cursive : String; /**
		Defaults to .
	**/
	@:optional
	var fantasy : String; }; /**
		Defaults to .
	**/
	@:optional
	var defaultFontSize : Int; /**
		Defaults to .
	**/
	@:optional
	var defaultMonospaceFontSize : Int; /**
		Defaults to .
	**/
	@:optional
	var minimumFontSize : Int; /**
		Defaults to .
	**/
	@:optional
	var defaultEncoding : String; /**
		Whether to throttle animations and timers when the page becomes background. Defaults to .
	**/
	@:optional
	var backgroundThrottling : Bool; /**
		Whether to enable offscreen rendering for the browser window. Defaults to . See the for more details.
	**/
	@:optional
	var offscreen : Bool; /**
		Whether to run Electron APIs and the specified script in a separate JavaScript context. Defaults to . The context that the script runs in will still have full access to the and globals but it will use its own set of JavaScript builtins (, , , etc.) and will be isolated from any changes made to the global environment by the loaded page. The Electron API will only be available in the script and not the loaded page. This option should be used when loading potentially untrusted remote content to ensure the loaded content cannot tamper with the script and any Electron APIs being used. This option uses the same technique used by . You can access this context in the dev tools by selecting the 'Electron Isolated Context' entry in the combo box at the top of the Console tab. This option is currently experimental and may change or be removed in future Electron releases.
	**/
	@:optional
	var contextIsolation : Bool; }; }):Void;
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
		This will make a window maintain an aspect ratio. The extra size allows a developer to have space, specified in pixels, not included within the aspect ratio calculations. This API already takes into account the difference between a window's size and its content size. Consider a normal window with an HD video player and associated controls. Perhaps there are 15 pixels of controls on the left edge, 25 pixels of controls on the right edge and 50 pixels of controls below the player. In order to maintain a 16:9 aspect ratio (standard aspect ratio for HD @1920x1080) within the player itself we would call this function with arguments of 16/9 and [ 40, 50 ]. The second argument doesn't care where the extra width and height are within the content view--only that they exist. Just sum any extra width and height areas you have within the overall content view.
	**/
	function setAspectRatio(aspectRatio:Float, extraSize:Size):Void;
	/**
		Uses Quick Look to preview a file at a given path.
	**/
	function previewFile(path:String, ?displayName:String):Void;
	/**
		Closes the currently open Quick Look panel.
	**/
	function closeFilePreview():Void;
	/**
		Resizes and moves the window to the supplied bounds
	**/
	function setBounds(bounds:Rectangle, ?animate:Bool):Void;
	function getBounds():Rectangle;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
	**/
	function setContentBounds(bounds:Rectangle, ?animate:Bool):Void;
	function getContentBounds():Rectangle;
	/**
		Resizes the window to width and height.
	**/
	function setSize(width:Int, height:Int, ?animate:Bool):Void;
	function getSize():Int;
	/**
		Resizes the window's client area (e.g. the web page) to width and height.
	**/
	function setContentSize(width:Int, height:Int, ?animate:Bool):Void;
	function getContentSize():Int;
	/**
		Sets the minimum size of window to width and height.
	**/
	function setMinimumSize(width:Int, height:Int):Void;
	function getMinimumSize():Int;
	/**
		Sets the maximum size of window to width and height.
	**/
	function setMaximumSize(width:Int, height:Int):Void;
	function getMaximumSize():Int;
	/**
		Sets whether the window can be manually resized by user.
	**/
	function setResizable(resizable:Bool):Void;
	function isResizable():Bool;
	/**
		Sets whether the window can be moved by user. On Linux does nothing.
	**/
	function setMovable(movable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	function isMovable():Bool;
	/**
		Sets whether the window can be manually minimized by user. On Linux does nothing.
	**/
	function setMinimizable(minimizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	function isMinimizable():Bool;
	/**
		Sets whether the window can be manually maximized by user. On Linux does nothing.
	**/
	function setMaximizable(maximizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	function isMaximizable():Bool;
	/**
		Sets whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	function setFullScreenable(fullscreenable:Bool):Void;
	function isFullScreenable():Bool;
	/**
		Sets whether the window can be manually closed by user. On Linux does nothing.
	**/
	function setClosable(closable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	function isClosable():Bool;
	/**
		Sets whether the window should show always on top of other windows. After setting this, the window is still a normal window, not a toolbox window which can not be focused on.
	**/
	function setAlwaysOnTop(flag:Bool, ?level:String, ?relativeLevel:Int):Void;
	function isAlwaysOnTop():Bool;
	/**
		Moves window to the center of the screen.
	**/
	function center():Void;
	/**
		Moves window to x and y.
	**/
	function setPosition(x:Int, y:Int, ?animate:Bool):Void;
	function getPosition():Int;
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
	function hookWindowMessage(message:Int, callback:haxe.Constraints.Function):Void;
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
	function getRepresentedFilename():String;
	/**
		Specifies whether the window’s document has been edited, and the icon in title bar will become gray when set to true.
	**/
	function setDocumentEdited(edited:Bool):Void;
	function isDocumentEdited():Bool;
	function focusOnWebView():Void;
	function blurWebView():Void;
	/**
		Same as webContents.capturePage([rect, ]callback).
	**/
	function capturePage(?rect:Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Same as webContents.loadURL(url[, options]). The url can be a remote address (e.g. http://) or a path to a local HTML file using the file:// protocol. To ensure that file URLs are properly formatted, it is recommended to use Node's url.format method: You can load a URL using a POST request with URL-encoded data by doing the following:
	**/
	function loadURL(url:String, ?options:{ /**
		A HTTP Referrer url.
	**/
	@:optional
	var httpReferrer : String; /**
		A user agent originating the request.
	**/
	@:optional
	var userAgent : String; /**
		Extra headers separated by "\n"
	**/
	@:optional
	var extraHeaders : String; /**
		(optional)
	**/
	@:optional
	var postData : Dynamic; /**
		Base url (with trailing path separator) for files to be loaded by the data url. This is needed only if the specified is a data url and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):Void;
	/**
		Same as webContents.reload.
	**/
	function reload():Void;
	/**
		Sets the menu as the window's menu bar, setting it to null will remove the menu bar.
	**/
	function setMenu(menu:Menu):Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0]. Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1. On Linux platform, only supports Unity desktop environment, you need to specify the *.desktop file name to desktopName field in package.json. By default, it will assume app.getName().desktop. On Windows, a mode can be passed. Accepted values are none, normal, indeterminate, error, and paused. If you call setProgressBar without a mode set (but with a value within the valid range), normal will be assumed.
	**/
	function setProgressBar(progress:Float, ?options:{ /**
		Mode for the progress bar. Can be , , , , or .
	**/
	@:optional
	var mode : String; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	function setOverlayIcon(overlay:NativeImage, description:String):Void;
	/**
		Sets whether the window should have a shadow. On Windows and Linux does nothing.
	**/
	function setHasShadow(hasShadow:Bool):Void;
	/**
		On Windows and Linux always returns true.
	**/
	function hasShadow():Bool;
	/**
		Add a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button layout. Returns a Boolean object indicates whether the thumbnail has been added successfully. The number of buttons in thumbnail toolbar should be no greater than 7 due to the limited room. Once you setup the thumbnail toolbar, the toolbar cannot be removed due to the platform's limitation. But you can call the API with an empty array to clean the buttons. The buttons is an array of Button objects: The flags is an array that can include following Strings:
	**/
	function setThumbarButtons(buttons:ThumbarButton):Bool;
	/**
		Sets the region of the window to show as the thumbnail image displayed when hovering over the window in the taskbar. You can reset the thumbnail to be the entire window by specifying an empty region: {x: 0, y: 0, width: 0, height: 0}.
	**/
	function setThumbnailClip(region:Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	function setThumbnailToolTip(toolTip:String):Void;
	/**
		Sets the properties for the window's taskbar button. Note: relaunchCommand and relaunchDisplayName must always be set together. If one of those properties is not set, then neither will be used.
	**/
	function setAppDetails(options:{ /**
		Window's . It has to be set, otherwise the other options will have no effect.
	**/
	@:optional
	var appId : String; /**
		Window's .
	**/
	@:optional
	var appIconPath : String; /**
		Index of the icon in . Ignored when is not set. Default is .
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
	function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	function setIcon(icon:NativeImage):Void;
	/**
		Sets whether the window menu bar should hide itself automatically. Once set the menu bar will only show when users press the single Alt key. If the menu bar is already visible, calling setAutoHideMenuBar(true) won't hide it immediately.
	**/
	function setAutoHideMenuBar(hide:Bool):Void;
	function isMenuBarAutoHide():Bool;
	/**
		Sets whether the menu bar should be visible. If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single Alt key.
	**/
	function setMenuBarVisibility(visible:Bool):Void;
	function isMenuBarVisible():Bool;
	/**
		Sets whether the window should be visible on all workspaces. Note: This API does nothing on Windows.
	**/
	function setVisibleOnAllWorkspaces(visible:Bool):Void;
	/**
		Note: This API always returns false on Windows.
	**/
	function isVisibleOnAllWorkspaces():Bool;
	/**
		Makes the window ignore all mouse events. All mouse events happened in this window will be passed to the window below this window, but if this window has focus, it will still receive keyboard events.
	**/
	function setIgnoreMouseEvents(ignore:Bool):Void;
	/**
		Prevents the window contents from being captured by other apps. On macOS it sets the NSWindow's sharingType to NSWindowSharingNone. On Windows it calls SetWindowDisplayAffinity with WDA_MONITOR.
	**/
	function setContentProtection(enable:Bool):Void;
	/**
		Changes whether the window can be focused.
	**/
	function setFocusable(focusable:Bool):Void;
	/**
		Sets parent as current window's parent window, passing null will turn current window into a top-level window.
	**/
	function setParentWindow(parent:BrowserWindow):Void;
	function getParentWindow():BrowserWindow;
	function getChildWindows():BrowserWindow;
	/**
		Controls whether to hide cursor when typing.
	**/
	function setAutoHideCursor(autoHide:Bool):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing null or an empty string will remove the vibrancy effect on the window.
	**/
	function setVibrancy(type:String):Void;
	/**
		Sets the touchBar layout for the current window. Specifying null or undefined clears the touch bar. This method only has an effect if the machine has a touch bar and is running on macOS 10.12.1+. Note: The TouchBar API is currently experimental and may change or be removed in future Electron releases.
	**/
	function setTouchBar(touchBar:TouchBar):Void;
	static function getAllWindows():BrowserWindow;
	static function getFocusedWindow():BrowserWindow;
	static function fromWebContents(webContents:WebContents):BrowserWindow;
	static function fromId(id:Int):BrowserWindow;
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
	static function getDevToolsExtensions():Dynamic;
}

/**
**/
@:require(js, electron) @:enum abstract BrowserWindowEvent(String) from String to String {
	/**
		Emitted when the document changed its title, calling event.preventDefault() will prevent the native window's title from changing.
	**/
	var page_title_updated : String = "page-title-updated";
	/**
		Emitted when the window is going to be closed. It's emitted before the beforeunload and unload event of the DOM. Calling event.preventDefault() will cancel the close. Usually you would want to use the beforeunload handler to decide whether the window should be closed, which will also be called when the window is reloaded. In Electron, returning any value other than undefined would cancel the close. For example:
	**/
	var close : String = "close";
	/**
		Emitted when the window is closed. After you have received this event you should remove the reference to the window and avoid using it any more.
	**/
	var closed : String = "closed";
	/**
		Emitted when the web page becomes unresponsive.
	**/
	var unresponsive : String = "unresponsive";
	/**
		Emitted when the unresponsive web page becomes responsive again.
	**/
	var responsive : String = "responsive";
	/**
		Emitted when the window loses focus.
	**/
	var blur : String = "blur";
	/**
		Emitted when the window gains focus.
	**/
	var focus : String = "focus";
	/**
		Emitted when the window is shown.
	**/
	var show : String = "show";
	/**
		Emitted when the window is hidden.
	**/
	var hide : String = "hide";
	/**
		Emitted when the web page has been rendered (while not being shown) and window can be displayed without a visual flash.
	**/
	var ready_to_show : String = "ready-to-show";
	/**
		Emitted when window is maximized.
	**/
	var maximize : String = "maximize";
	/**
		Emitted when the window exits from a maximized state.
	**/
	var unmaximize : String = "unmaximize";
	/**
		Emitted when the window is minimized.
	**/
	var minimize : String = "minimize";
	/**
		Emitted when the window is restored from a minimized state.
	**/
	var restore : String = "restore";
	/**
		Emitted when the window is being resized.
	**/
	var resize : String = "resize";
	/**
		Emitted when the window is being moved to a new position. Note: On macOS this event is just an alias of moved.
	**/
	var move : String = "move";
	/**
		Emitted once when the window is moved to a new position.
	**/
	var moved : String = "moved";
	/**
		Emitted when the window enters a full-screen state.
	**/
	var enter_full_screen : String = "enter-full-screen";
	/**
		Emitted when the window leaves a full-screen state.
	**/
	var leave_full_screen : String = "leave-full-screen";
	/**
		Emitted when the window enters a full-screen state triggered by HTML API.
	**/
	var enter_html_full_screen : String = "enter-html-full-screen";
	/**
		Emitted when the window leaves a full-screen state triggered by HTML API.
	**/
	var leave_html_full_screen : String = "leave-html-full-screen";
	/**
		Emitted when an App Command is invoked. These are typically related to keyboard media keys or browser commands, as well as the "Back" button built into some mice on Windows. Commands are lowercased, underscores are replaced with hyphens, and the APPCOMMAND_ prefix is stripped off. e.g. APPCOMMAND_BROWSER_BACKWARD is emitted as browser-backward.
	**/
	var app_command : String = "app-command";
	/**
		Emitted when scroll wheel event phase has begun.
	**/
	var scroll_touch_begin : String = "scroll-touch-begin";
	/**
		Emitted when scroll wheel event phase has ended.
	**/
	var scroll_touch_end : String = "scroll-touch-end";
	/**
		Emitted when scroll wheel event phase filed upon reaching the edge of element.
	**/
	var scroll_touch_edge : String = "scroll-touch-edge";
	/**
		Emitted on 3-finger swipe. Possible directions are up, right, down, left.
	**/
	var swipe : String = "swipe";
}