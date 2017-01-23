package electron.main;

/**
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
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; /**
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
		Specifies a script that will be loaded before other scripts run in the page. This script will always have access to node APIs no matter whether node integration is turned on or off. The value should be the absolute file path to the script. When node integration is turned off, the preload script can reintroduce Node global symbols back to the global scope. See example .
	**/
	@:optional
	var preload : String; /**
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
		When , it will disable the same-origin policy (usually using testing websites by people), and set and to if these two options are not set by user. Default is .
	**/
	@:optional
	var webSecurity : Bool; /**
		Allow an https page to display content like images from http URLs. Default is .
	**/
	@:optional
	var allowDisplayingInsecureContent : Bool; /**
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
		Whether to enable Chromium OS-level sandbox.
	**/
	@:optional
	var sandbox : Bool; /**
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
		Maximizes the window.
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
	function setAspectRatio(aspectRatio:Float, ?extraSize:{ @:optional
	var width : Int; @:optional
	var height : Int; }):Void;
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
	function setAlwaysOnTop(flag:Bool, ?level:String):Void;
	function isAlwaysOnTop():Bool;
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
		[] (optional)
	**/
	@:optional
	var postData : haxe.extern.EitherType<electron.UploadRawData, haxe.extern.EitherType<electron.UploadFile, haxe.extern.EitherType<electron.UploadFileSystem, electron.UploadBlob>>>; }):Void;
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
	function setThumbarButtons(buttons:Array<ThumbarButton>):Bool;
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
	function getChildWindows():Array<BrowserWindow>;
	/**
		Controls whether to hide cursor when typing.
	**/
	function setAutoHideCursor(autoHide:Bool):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing null or an empty string will remove the vibrancy effect on the window.
	**/
	function setVibrancy(type:String):Void;
	/**
		Force closing the window, the unload and beforeunload event won't be emitted for the web page, and close event will also not be emitted for this window, but it guarantees the closed event will be emitted.
	**/
	static function destroy():Void;
	/**
		Try to close the window. This has the same effect as a user manually clicking the close button of the window. The web page may cancel the close though. See the close event.
	**/
	static function close():Void;
	/**
		Focuses on the window.
	**/
	static function focus():Void;
	/**
		Removes focus from the window.
	**/
	static function blur():Void;
	static function isFocused():Bool;
	static function isDestroyed():Bool;
	/**
		Shows and gives focus to the window.
	**/
	static function show():Void;
	/**
		Shows the window but doesn't focus on it.
	**/
	static function showInactive():Void;
	/**
		Hides the window.
	**/
	static function hide():Void;
	static function isVisible():Bool;
	static function isModal():Bool;
	/**
		Maximizes the window.
	**/
	static function maximize():Void;
	/**
		Unmaximizes the window.
	**/
	static function unmaximize():Void;
	static function isMaximized():Bool;
	/**
		Minimizes the window. On some platforms the minimized window will be shown in the Dock.
	**/
	static function minimize():Void;
	/**
		Restores the window from minimized state to its previous state.
	**/
	static function restore():Void;
	static function isMinimized():Bool;
	/**
		Sets whether the window should be in fullscreen mode.
	**/
	static function setFullScreen(flag:Bool):Void;
	static function isFullScreen():Bool;
	/**
		This will make a window maintain an aspect ratio. The extra size allows a developer to have space, specified in pixels, not included within the aspect ratio calculations. This API already takes into account the difference between a window's size and its content size. Consider a normal window with an HD video player and associated controls. Perhaps there are 15 pixels of controls on the left edge, 25 pixels of controls on the right edge and 50 pixels of controls below the player. In order to maintain a 16:9 aspect ratio (standard aspect ratio for HD @1920x1080) within the player itself we would call this function with arguments of 16/9 and [ 40, 50 ]. The second argument doesn't care where the extra width and height are within the content view--only that they exist. Just sum any extra width and height areas you have within the overall content view.
	**/
	static function setAspectRatio(aspectRatio:Float, ?extraSize:{ @:optional
	var width : Int; @:optional
	var height : Int; }):Void;
	/**
		Uses Quick Look to preview a file at a given path.
	**/
	static function previewFile(path:String, ?displayName:String):Void;
	/**
		Closes the currently open Quick Look panel.
	**/
	static function closeFilePreview():Void;
	/**
		Resizes and moves the window to the supplied bounds
	**/
	static function setBounds(bounds:Rectangle, ?animate:Bool):Void;
	static function getBounds():Rectangle;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
	**/
	static function setContentBounds(bounds:Rectangle, ?animate:Bool):Void;
	static function getContentBounds():Rectangle;
	/**
		Resizes the window to width and height.
	**/
	static function setSize(width:Int, height:Int, ?animate:Bool):Void;
	static function getSize():Array<Int>;
	/**
		Resizes the window's client area (e.g. the web page) to width and height.
	**/
	static function setContentSize(width:Int, height:Int, ?animate:Bool):Void;
	static function getContentSize():Array<Int>;
	/**
		Sets the minimum size of window to width and height.
	**/
	static function setMinimumSize(width:Int, height:Int):Void;
	static function getMinimumSize():Array<Int>;
	/**
		Sets the maximum size of window to width and height.
	**/
	static function setMaximumSize(width:Int, height:Int):Void;
	static function getMaximumSize():Array<Int>;
	/**
		Sets whether the window can be manually resized by user.
	**/
	static function setResizable(resizable:Bool):Void;
	static function isResizable():Bool;
	/**
		Sets whether the window can be moved by user. On Linux does nothing.
	**/
	static function setMovable(movable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	static function isMovable():Bool;
	/**
		Sets whether the window can be manually minimized by user. On Linux does nothing.
	**/
	static function setMinimizable(minimizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	static function isMinimizable():Bool;
	/**
		Sets whether the window can be manually maximized by user. On Linux does nothing.
	**/
	static function setMaximizable(maximizable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	static function isMaximizable():Bool;
	/**
		Sets whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	static function setFullScreenable(fullscreenable:Bool):Void;
	static function isFullScreenable():Bool;
	/**
		Sets whether the window can be manually closed by user. On Linux does nothing.
	**/
	static function setClosable(closable:Bool):Void;
	/**
		On Linux always returns true.
	**/
	static function isClosable():Bool;
	/**
		Sets whether the window should show always on top of other windows. After setting this, the window is still a normal window, not a toolbox window which can not be focused on.
	**/
	static function setAlwaysOnTop(flag:Bool, ?level:String):Void;
	static function isAlwaysOnTop():Bool;
	/**
		Moves window to the center of the screen.
	**/
	static function center():Void;
	/**
		Moves window to x and y.
	**/
	static function setPosition(x:Int, y:Int, ?animate:Bool):Void;
	static function getPosition():Array<Int>;
	/**
		Changes the title of native window to title.
	**/
	static function setTitle(title:String):Void;
	/**
		Note: The title of web page can be different from the title of the native window.
	**/
	static function getTitle():String;
	/**
		Changes the attachment point for sheets on macOS. By default, sheets are attached just below the window frame, but you may want to display them beneath a HTML-rendered toolbar. For example:
	**/
	static function setSheetOffset(offsetY:Float, ?offsetX:Float):Void;
	/**
		Starts or stops flashing the window to attract user's attention.
	**/
	static function flashFrame(flag:Bool):Void;
	/**
		Makes the window not show in the taskbar.
	**/
	static function setSkipTaskbar(skip:Bool):Void;
	/**
		Enters or leaves the kiosk mode.
	**/
	static function setKiosk(flag:Bool):Void;
	static function isKiosk():Bool;
	/**
		The native type of the handle is HWND on Windows, NSView* on macOS, and Window (unsigned long) on Linux.
	**/
	static function getNativeWindowHandle():js.node.Buffer;
	/**
		Hooks a windows message. The callback is called when the message is received in the WndProc.
	**/
	static function hookWindowMessage(message:Int, callback:haxe.Constraints.Function):Void;
	static function isWindowMessageHooked(message:Int):Bool;
	/**
		Unhook the window message.
	**/
	static function unhookWindowMessage(message:Int):Void;
	/**
		Unhooks all of the window messages.
	**/
	static function unhookAllWindowMessages():Void;
	/**
		Sets the pathname of the file the window represents, and the icon of the file will show in window's title bar.
	**/
	static function setRepresentedFilename(filename:String):Void;
	static function getRepresentedFilename():String;
	/**
		Specifies whether the window’s document has been edited, and the icon in title bar will become gray when set to true.
	**/
	static function setDocumentEdited(edited:Bool):Void;
	static function isDocumentEdited():Bool;
	static function focusOnWebView():Void;
	static function blurWebView():Void;
	/**
		Same as webContents.capturePage([rect, ]callback).
	**/
	static function capturePage(?rect:Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Same as webContents.loadURL(url[, options]). The url can be a remote address (e.g. http://) or a path to a local HTML file using the file:// protocol. To ensure that file URLs are properly formatted, it is recommended to use Node's url.format method: You can load a URL using a POST request with URL-encoded data by doing the following:
	**/
	static function loadURL(url:String, ?options:{ /**
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
		[] (optional)
	**/
	@:optional
	var postData : haxe.extern.EitherType<electron.UploadRawData, haxe.extern.EitherType<electron.UploadFile, haxe.extern.EitherType<electron.UploadFileSystem, electron.UploadBlob>>>; }):Void;
	/**
		Same as webContents.reload.
	**/
	static function reload():Void;
	/**
		Sets the menu as the window's menu bar, setting it to null will remove the menu bar.
	**/
	static function setMenu(menu:Menu):Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0]. Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1. On Linux platform, only supports Unity desktop environment, you need to specify the *.desktop file name to desktopName field in package.json. By default, it will assume app.getName().desktop. On Windows, a mode can be passed. Accepted values are none, normal, indeterminate, error, and paused. If you call setProgressBar without a mode set (but with a value within the valid range), normal will be assumed.
	**/
	static function setProgressBar(progress:Float, ?options:{ /**
		Mode for the progress bar. Can be , , , , or .
	**/
	@:optional
	var mode : String; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	static function setOverlayIcon(overlay:NativeImage, description:String):Void;
	/**
		Sets whether the window should have a shadow. On Windows and Linux does nothing.
	**/
	static function setHasShadow(hasShadow:Bool):Void;
	/**
		On Windows and Linux always returns true.
	**/
	static function hasShadow():Bool;
	/**
		Add a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button layout. Returns a Boolean object indicates whether the thumbnail has been added successfully. The number of buttons in thumbnail toolbar should be no greater than 7 due to the limited room. Once you setup the thumbnail toolbar, the toolbar cannot be removed due to the platform's limitation. But you can call the API with an empty array to clean the buttons. The buttons is an array of Button objects: The flags is an array that can include following Strings:
	**/
	static function setThumbarButtons(buttons:Array<ThumbarButton>):Bool;
	/**
		Sets the region of the window to show as the thumbnail image displayed when hovering over the window in the taskbar. You can reset the thumbnail to be the entire window by specifying an empty region: {x: 0, y: 0, width: 0, height: 0}.
	**/
	static function setThumbnailClip(region:Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	static function setThumbnailToolTip(toolTip:String):Void;
	/**
		Sets the properties for the window's taskbar button. Note: relaunchCommand and relaunchDisplayName must always be set together. If one of those properties is not set, then neither will be used.
	**/
	static function setAppDetails(options:{ /**
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
	static function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	static function setIcon(icon:NativeImage):Void;
	/**
		Sets whether the window menu bar should hide itself automatically. Once set the menu bar will only show when users press the single Alt key. If the menu bar is already visible, calling setAutoHideMenuBar(true) won't hide it immediately.
	**/
	static function setAutoHideMenuBar(hide:Bool):Void;
	static function isMenuBarAutoHide():Bool;
	/**
		Sets whether the menu bar should be visible. If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single Alt key.
	**/
	static function setMenuBarVisibility(visible:Bool):Void;
	static function isMenuBarVisible():Bool;
	/**
		Sets whether the window should be visible on all workspaces. Note: This API does nothing on Windows.
	**/
	static function setVisibleOnAllWorkspaces(visible:Bool):Void;
	/**
		Note: This API always returns false on Windows.
	**/
	static function isVisibleOnAllWorkspaces():Bool;
	/**
		Makes the window ignore all mouse events. All mouse events happened in this window will be passed to the window below this window, but if this window has focus, it will still receive keyboard events.
	**/
	static function setIgnoreMouseEvents(ignore:Bool):Void;
	/**
		Prevents the window contents from being captured by other apps. On macOS it sets the NSWindow's sharingType to NSWindowSharingNone. On Windows it calls SetWindowDisplayAffinity with WDA_MONITOR.
	**/
	static function setContentProtection(enable:Bool):Void;
	/**
		Changes whether the window can be focused.
	**/
	static function setFocusable(focusable:Bool):Void;
	/**
		Sets parent as current window's parent window, passing null will turn current window into a top-level window.
	**/
	static function setParentWindow(parent:BrowserWindow):Void;
	static function getParentWindow():BrowserWindow;
	static function getChildWindows():Array<BrowserWindow>;
	/**
		Controls whether to hide cursor when typing.
	**/
	static function setAutoHideCursor(autoHide:Bool):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing null or an empty string will remove the vibrancy effect on the window.
	**/
	static function setVibrancy(type:String):Void;
}