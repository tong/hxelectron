package electron;
@:jsRequire("electron", "BrowserWindow") @:require("electron") extern class BrowserWindow extends js.node.events.EventEmitter<electron.BrowserWindow> {
	/**
		A WebContents object this window owns. All web page related events and operations will be done via it. See the webContents documentation for its methods and events.
	**/
	var webContents : Dynamic;
	/**
		A Integer representing the unique ID of the window.
	**/
	var id : Dynamic;
	function new(options:{ @:optional
	var width : Int; @:optional
	var height : Int; @:optional
	var x : Int; @:optional
	var y : Int; @:optional
	var useContentSize : Bool; @:optional
	var center : Bool; @:optional
	var minWidth : Int; @:optional
	var minHeight : Int; @:optional
	var maxWidth : Int; @:optional
	var maxHeight : Int; @:optional
	var resizable : Bool; @:optional
	var movable : Bool; @:optional
	var minimizable : Bool; @:optional
	var maximizable : Bool; @:optional
	var closable : Bool; @:optional
	var focusable : Bool; @:optional
	var alwaysOnTop : Bool; @:optional
	var fullscreen : Bool; @:optional
	var fullscreenable : Bool; @:optional
	var skipTaskbar : Bool; @:optional
	var kiosk : Bool; @:optional
	var title : String; @:optional
	var icon : electron.NativeImage; @:optional
	var show : Bool; @:optional
	var frame : Bool; @:optional
	var parent : electron.BrowserWindow; @:optional
	var modal : Bool; @:optional
	var acceptFirstMouse : Bool; @:optional
	var disableAutoHideCursor : Bool; @:optional
	var autoHideMenuBar : Bool; @:optional
	var enableLargerThanScreen : Bool; @:optional
	var backgroundColor : String; @:optional
	var hasShadow : Bool; @:optional
	var darkTheme : Bool; @:optional
	var transparent : Bool; @:optional
	var type : String; @:optional
	var titleBarStyle : String; @:optional
	var thickFrame : Bool; @:optional
	var webPreferences : { }; }):Void;
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
	function setAspectRatio(aspectRatio:Float, extraSize:{ @:optional
	var width : Int; @:optional
	var height : Int; }):Void;
	/**
		Resizes and moves the window to the supplied bounds
	**/
	function setBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	function getBounds():electron.Rectangle;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
	**/
	function setContentBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	function getContentBounds():electron.Rectangle;
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
	function setAlwaysOnTop(flag:Bool, level:String):Void;
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
	/**
		Whether Boolean - Whether the window's document has been edited.
	**/
	function isDocumentEdited():Void;
	function focusOnWebView():Void;
	function blurWebView():Void;
	/**
		Same as webContents.capturePage([rect, ]callback).
	**/
	function capturePage(rect:electron.Rectangle, callback:haxe.Constraints.Function):Void;
	/**
		Same as webContents.loadURL(url[, options]). The url can be a remote address (e.g. http://) or a path to a local HTML file using the file:// protocol. To ensure that file URLs are properly formatted, it is recommended to use Node's url.format method:
	**/
	function loadURL(url:String, ?options:{ @:optional
	var httpReferrer : String; @:optional
	var userAgent : String; @:optional
	var extraHeaders : String; }):Void;
	/**
		Same as webContents.reload.
	**/
	function reload():Void;
	/**
		Sets the menu as the window's menu bar, setting it to null will remove the menu bar.
	**/
	function setMenu(menu:electron.Menu):Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0]. Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1. On Linux platform, only supports Unity desktop environment, you need to specify the *.desktop file name to desktopName field in package.json. By default, it will assume app.getName().desktop. On Windows, a mode can be passed. Accepted values are none, normal, indeterminate, error, and paused. If you call setProgressBar without a mode set (but with a value within the valid range), normal will be assumed.
	**/
	function setProgressBar(progress:Float, ?options:{ @:optional
	var mode : String; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	function setOverlayIcon(overlay:electron.NativeImage, description:String):Void;
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
	function setThumbnailClip(region:electron.Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	function setThumbnailToolTip(toolTip:String):Void;
	/**
		Same as webContents.showDefinitionForSelection().
	**/
	function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	function setIcon(icon:electron.NativeImage):Void;
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
	function setParentWindow(parent:electron.BrowserWindow):Void;
	function getParentWindow():electron.BrowserWindow;
	function getChildWindows():Array<BrowserWindow>;
	static function getAllWindows():Array<BrowserWindow>;
	static function getFocusedWindow():electron.BrowserWindow;
	static function fromWebContents(webContents:electron.WebContents):electron.BrowserWindow;
	static function fromId(id:Int):electron.BrowserWindow;
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