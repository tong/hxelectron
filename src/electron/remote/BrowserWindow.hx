package electron.remote;
/**
	> Create and control browser windows.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	### Window customization
	
	The `BrowserWindow` class exposes various ways to modify the look and behavior of your app's windows. For more details, see the Window Customization tutorial.
	
	### Showing the window gracefully
	
	When loading a page in the window directly, users may see the page load incrementally, which is not a good experience for a native app. To make the window display without a visual flash, there are two solutions for different situations.
	
	### Using the `ready-to-show` event
	
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
	
	### Setting the `backgroundColor` property
	
	For a complex app, the `ready-to-show` event could be emitted too late, making the app feel slow. In this case, it is recommended to show the window immediately, and use a `backgroundColor` close to your app's background:
	
	```
	const { BrowserWindow } = require('electron')
	
	const win = new BrowserWindow({ backgroundColor: '#2e2c29' })
	win.loadURL('https://github.com')
	```
	
	Note that even for apps that use `ready-to-show` event, it is still recommended to set `backgroundColor` to make the app feel more native.
	
	Some examples of valid `backgroundColor` values include:
	
	```
	const win = new BrowserWindow()
	win.setBackgroundColor('hsl(230, 100%, 50%)')
	win.setBackgroundColor('rgb(255, 145, 145)')
	win.setBackgroundColor('#ff00a3')
	win.setBackgroundColor('blueviolet')
	```
	
	For more information about these color types see valid options in win.setBackgroundColor.
	
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
	
	A modal window is a child window that disables parent window. To create a modal window, you have to set both the `parent` and `modal` options:
	
	```
	const { BrowserWindow } = require('electron')
	
	const top = new BrowserWindow()
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
	* On Wayland (Linux) it is generally not possible to programmatically resize windows after creation, or to position, move, focus, or blur windows without user input. If your app needs these capabilities, run it in Xwayland by appending the flag `--ozone-platform=x11`.
	
	### Class: BrowserWindow extends `BaseWindow`
	
	> Create and control browser windows.
	
	Process: Main
	
	`BrowserWindow` is an EventEmitter.
	
	It creates a new `BrowserWindow` with native properties as set by the `options`.
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/browser-window
**/
@:jsRequire("electron", "remote.BrowserWindow") extern class BrowserWindow extends electron.remote.BaseWindow {
	/**
		An array of all opened browser windows.
	**/
	static function getAllWindows():Array<electron.remote.BrowserWindow>;
	/**
		The window that is focused in this application, otherwise returns `null`.
	**/
	static function getFocusedWindow():haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>;
	/**
		The window that owns the given `webContents` or `null` if the contents are not owned by a window.
	**/
	static function fromWebContents(webContents:electron.remote.WebContents):haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>;
	/**
		> [!NOTE] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
		
		The window that owns the given `browserView`. If the given view is not attached to any window, returns `null`.
	**/
	@:deprecated
	static function fromBrowserView(browserView:electron.remote.BrowserView):haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>;
	/**
		The window with the given `id`.
	**/
	static function fromId(id:Int):haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>;
	/**
		A `WebContents` object this window owns. All web page related events and operations will be done via it.
		
		See the `webContents` documentation for its methods and events.
		
		> [!NOTE] Reading this property throws `Object has been destroyed` once the window has been destroyed; see `win.isDestroyed()`.
	**/
	var webContents : electron.remote.WebContents;
	function new(?options:electron.BrowserWindowConstructorOptions):Void;
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
		
		On Wayland (Linux), the desktop environment may show a notification or flash the app icon if the window or app is not already focused.
	**/
	function focus():Void;
	/**
		Removes focus from the window.
		
		Not supported on Wayland (Linux).
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
		
		Not supported on Wayland (Linux).
	**/
	function showInactive():Void;
	/**
		Hides the window.
	**/
	function hide():Void;
	/**
		Whether the window is visible to the user in the foreground of the app.
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
		
		> [!NOTE] On macOS, fullscreen transitions take place asynchronously. If further actions depend on the fullscreen state, use the 'enter-full-screen' or 'leave-full-screen' events.
	**/
	function setFullScreen(flag:Bool):Void;
	/**
		Whether the window is in fullscreen mode.
		
		> [!NOTE] On macOS, fullscreen transitions take place asynchronously. When querying for a BrowserWindow's fullscreen status, you should ensure that either the 'enter-full-screen' or 'leave-full-screen' events have been emitted.
	**/
	function isFullScreen():Bool;
	/**
		Enters or leaves simple fullscreen mode.
		
		Simple fullscreen mode emulates the native fullscreen behavior found in versions of macOS prior to Lion (10.7).
	**/
	@:electron_platforms(["macOS"])
	function setSimpleFullScreen(flag:Bool):Void;
	/**
		Whether the window is in simple (pre-Lion) fullscreen mode.
	**/
	@:electron_platforms(["macOS"])
	function isSimpleFullScreen():Bool;
	/**
		Whether the window is in normal state (not maximized, not minimized, not in fullscreen mode).
	**/
	function isNormal():Bool;
	/**
		This will make a window maintain an aspect ratio. The extra size allows a developer to have space, specified in pixels, not included within the aspect ratio calculations. This API already takes into account the difference between a window's size and its content size.
		
		Consider a normal window with an HD video player and associated controls. Perhaps there are 15 pixels of controls on the left edge, 25 pixels of controls on the right edge and 50 pixels of controls below the player. In order to maintain a 16:9 aspect ratio (standard aspect ratio for HD @1920x1080) within the player itself we would call this function with arguments of 16/9 and { width: 40, height: 50 }. The second argument doesn't care where the extra width and height are within the content view--only that they exist. Sum any extra width and height areas you have within the overall content view.
		
		The aspect ratio is not respected when window is resized programmatically with APIs like `win.setSize`.
		
		To reset an aspect ratio, pass 0 as the `aspectRatio` value: `win.setAspectRatio(0)`.
	**/
	function setAspectRatio(aspectRatio:Float, ?extraSize:electron.Size):Void;
	/**
		Examples of valid `backgroundColor` values:
		
		* Hex
		  * #fff (shorthand RGB)
		  * #ffff (shorthand ARGB)
		  * #ffffff (RGB)
		  * #ffffffff (ARGB)
		* RGB
		  * `rgb\(([\d]+),\s*([\d]+),\s*([\d]+)\)`
		    * e.g. rgb(255, 255, 255)
		* RGBA
		  * `rgba\(([\d]+),\s*([\d]+),\s*([\d]+),\s*([\d.]+)\)`
		    * e.g. rgba(255, 255, 255, 1.0)
		* HSL
		  * `hsl\((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%\)`
		    * e.g. hsl(200, 20%, 50%)
		* HSLA
		  * `hsla\((-?[\d.]+),\s*([\d.]+)%,\s*([\d.]+)%,\s*([\d.]+)\)`
		    * e.g. hsla(200, 20%, 50%, 0.5)
		* Color name
		  * Options are listed in SkParseColor.cpp
		  * Similar to CSS Color Module Level 3 keywords, but case-sensitive.
		    * e.g. `blueviolet` or `red`
		
		Sets the background color of the window. See Setting `backgroundColor`.
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
		
		On Wayland (Linux), has the same limitations as `setSize` and `setPosition`.
		
		> [!NOTE] On macOS, the y-coordinate value cannot be smaller than the Tray height. The tray height has changed over time and depends on the operating system, but is between 20-40px. Passing a value lower than the tray height will result in a window that is flush to the tray.
	**/
	function setBounds(bounds:electron.Partial, ?animate:Bool):Void;
	/**
		The `bounds` of the window as `Object`.
		
		> [!NOTE] On macOS, the y-coordinate value returned will be at minimum the Tray height. For example, calling `win.setBounds({ x: 25, y: 20, width: 800, height: 600 })` with a tray height of 38 means that `win.getBounds()` will return `{ x: 25, y: 38, width: 800, height: 600 }`.
		
		> [!NOTE] On Wayland, this method will return `{ x: 0, y: 0, ... }` as introspecting or programmatically changing the global window coordinates is prohibited.
	**/
	function getBounds():electron.Rectangle;
	/**
		Gets the background color of the window in Hex (`#RRGGBB`) format.
		
		See Setting `backgroundColor`.
		
		> [!NOTE] The alpha value is _not_ returned alongside the red, green, and blue values.
	**/
	function getBackgroundColor():String;
	/**
		Resizes and moves the window's client area (e.g. the web page) to the supplied bounds.
		
		On Wayland (Linux), has the same limitations as `setContentSize` and `setPosition`.
	**/
	function setContentBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	/**
		The `bounds` of the window's client area as `Object`.
	**/
	function getContentBounds():electron.Rectangle;
	/**
		Contains the window bounds of the normal state
		
		> [!NOTE] Whatever the current state of the window (maximized, minimized or in fullscreen), this function always returns the position and size of the window in normal state. In normal state, `getBounds` and `getNormalBounds` return the same `Rectangle`.
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
		
		On Wayland (Linux), may not work as some window managers restrict programmatic window resizing.
	**/
	function setSize(width:Int, height:Int, ?animate:Bool):Void;
	/**
		Contains the window's width and height.
	**/
	function getSize():Array<Int>;
	/**
		Resizes the window's client area (e.g. the web page) to `width` and `height`.
		
		On Wayland (Linux), may not work as some window managers restrict programmatic window resizing.
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
	@:electron_platforms(["macOS", "Windows"])
	function setMovable(movable:Bool):Void;
	/**
		Whether the window can be moved by user.
		
		On Linux always returns `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isMovable():Bool;
	/**
		Sets whether the window can be manually minimized by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setMinimizable(minimizable:Bool):Void;
	/**
		Whether the window can be manually minimized by the user.
		
		On Linux always returns `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isMinimizable():Bool;
	/**
		Sets whether the window can be manually maximized by user. On Linux does nothing.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setMaximizable(maximizable:Bool):Void;
	/**
		Whether the window can be manually maximized by user.
		
		On Linux always returns `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
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
	@:electron_platforms(["macOS", "Windows"])
	function setClosable(closable:Bool):Void;
	/**
		Whether the window can be manually closed by user.
		
		On Linux always returns `true`.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isClosable():Bool;
	/**
		Sets whether the window will be hidden when the user toggles into mission control.
	**/
	@:electron_platforms(["macOS"])
	function setHiddenInMissionControl(hidden:Bool):Void;
	/**
		Whether the window will be hidden when the user toggles into mission control.
	**/
	@:electron_platforms(["macOS"])
	function isHiddenInMissionControl():Bool;
	/**
		Sets whether the window should show always on top of other windows. After setting this, the window is still a normal window, not a toolbox window which can not be focused on.
		
		Not supported on Wayland (Linux).
	**/
	function setAlwaysOnTop(flag:Bool, ?level:BrowserWindowSetAlwaysOnTopLevel, ?relativeLevel:Int):Void;
	/**
		Whether the window is always on top of other windows.
		
		Not supported on Wayland (Linux).
	**/
	function isAlwaysOnTop():Bool;
	/**
		Moves window above the source window in the sense of z-order. If the `mediaSourceId` is not of type window or if the window does not exist then this method throws an error.
	**/
	function moveAbove(mediaSourceId:String):Void;
	/**
		Moves window to top(z-order) regardless of focus.
		
		Not supported on Wayland (Linux).
	**/
	function moveTop():Void;
	/**
		Moves window to the center of the screen.
		
		Not supported on Wayland (Linux).
	**/
	function center():Void;
	/**
		Moves window to `x` and `y`.
		
		Not supported on Wayland (Linux).
	**/
	function setPosition(x:Int, y:Int, ?animate:Bool):Void;
	/**
		Contains the window's current position.
		
		> [!NOTE] On Wayland, this method will return `[0, 0]` as introspecting or programmatically changing the global window coordinates is prohibited.
	**/
	function getPosition():Array<Int>;
	/**
		Changes the title of native window to `title`.
	**/
	function setTitle(title:String):Void;
	/**
		The title of the native window.
		
		> [!NOTE] The title of the web page can be different from the title of the native window.
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
	@:electron_platforms(["macOS", "Windows"])
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
		
		This API returns whether the window is in tablet mode, and the `resize` event can be used to listen to changes to tablet mode.
	**/
	@:electron_platforms(["Windows"])
	function isTabletMode():Bool;
	/**
		Window id in the format of DesktopCapturerSource's id. For example "window:1324:0".
		
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
	@:electron_platforms(["Windows"])
	function hookWindowMessage(message:Int, callback:haxe.Constraints.Function):Void;
	/**
		`true` or `false` depending on whether the message is hooked.
	**/
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
	/**
		The pathname of the file the window represents.
	**/
	@:electron_platforms(["macOS"])
	function getRepresentedFilename():String;
	/**
		Specifies whether the window’s document has been edited, and the icon in title bar will become gray when set to `true`.
	**/
	@:electron_platforms(["macOS"])
	function setDocumentEdited(edited:Bool):Void;
	/**
		Whether the window's document has been edited.
	**/
	@:electron_platforms(["macOS"])
	function isDocumentEdited():Bool;
	function focusOnWebView():Void;
	function blurWebView():Void;
	/**
		Resolves with a NativeImage
		
		Captures a snapshot of the page within `rect`. Omitting `rect` will capture the whole visible page. If the page is not visible, `rect` may be empty. The page is considered visible when its browser window is hidden and the capturer count is non-zero. If you would like the page to stay hidden, you should ensure that `stayHidden` is set to true.
	**/
	function capturePage(?rect:electron.Rectangle, ?opts:{ /**
		Keep the page hidden instead of visible. Default is `false`.
	**/
	@:optional
	var stayHidden : Bool; /**
		Keep the system awake instead of allowing it to sleep. Default is `false`.
	**/
	@:optional
	var stayAwake : Bool; }):js.lib.Promise<electron.NativeImage>;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`). A noop rejection handler is already attached, which avoids unhandled rejection errors. If the existing page has a beforeUnload handler, `did-fail-load` will be called unless `will-prevent-unload` is handled.
		
		Same as `webContents.loadURL(url[, options])`.
		
		The `url` can be a remote address (e.g. `http://`) or a path to a local HTML file using the `file://` protocol.
		
		To ensure that file URLs are properly formatted, it is recommended to use Node's `url.format` method:
		
		You can load a URL using a `POST` request with URL-encoded data by doing the following:
	**/
	function loadURL(url:String, ?options:{ /**
		An HTTP Referrer URL.
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
	var postData : Array<haxe.extern.EitherType<electron.UploadRawData, electron.UploadFile>>; /**
		Base URL (with trailing path separator) for files to be loaded by the data URL. This is needed only if the specified `url` is a data URL and needs to load other files.
	**/
	@:optional
	var baseURLForDataURL : String; }):js.lib.Promise<Void>;
	/**
		the promise will resolve when the page has finished loading (see `did-finish-load`), and rejects if the page fails to load (see `did-fail-load`).
		
		Same as `webContents.loadFile`, `filePath` should be a path to an HTML file relative to the root of your application.  See the `webContents` docs for more information.
	**/
	function loadFile(filePath:String, ?options:{ /**
		Passed to `url.format()`.
	**/
	@:optional
	var query : haxe.DynamicAccess<String>; /**
		Passed to `url.format()`.
	**/
	@:optional
	var search : String; /**
		Passed to `url.format()`.
	**/
	@:optional
	var hash : String; }):js.lib.Promise<Void>;
	/**
		Same as `webContents.reload`.
	**/
	function reload():Void;
	/**
		Sets the `menu` as the window's menu bar.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setMenu(menu:haxe.extern.EitherType<electron.remote.Menu, Dynamic>):Void;
	/**
		Remove the window's menu bar.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function removeMenu():Void;
	/**
		Sets progress value in progress bar. Valid range is [0, 1.0].
		
		Remove progress bar when progress < 0; Change to indeterminate mode when progress > 1.
		
		On Windows, a mode can be passed. Accepted values are `none`, `normal`, `indeterminate`, `error`, and `paused`. If you call `setProgressBar` without a mode set (but with a value within the valid range), `normal` will be assumed.
		
		On Linux, the progress bar shows on docks and taskbars that support the LauncherEntry D-Bus API. It is associated with the app's `.desktop` file, so `app.setDesktopName` must match the name of the app's actual `.desktop` file. Indeterminate mode is not supported.
	**/
	function setProgressBar(progress:Float, ?options:{ /**
		Mode for the progress bar. Can be `none`, `normal`, `indeterminate`, `error` or `paused`.
	**/
	@:electron_platforms(["Windows"])
	var mode : BrowserWindowSetProgressBarOptionsMode; }):Void;
	/**
		Sets a 16 x 16 pixel overlay onto the current taskbar icon, usually used to convey some sort of application status or to passively notify the user.
	**/
	@:electron_platforms(["Windows"])
	function setOverlayIcon(overlay:haxe.extern.EitherType<electron.NativeImage, Dynamic>, description:String):Void;
	/**
		Invalidates the window shadow so that it is recomputed based on the current window shape.
		
		`BrowserWindows` that are transparent can sometimes leave behind visual artifacts on macOS. This method can be used to clear these artifacts when, for example, performing an animation.
	**/
	@:electron_platforms(["macOS"])
	function invalidateShadow():Void;
	/**
		Sets whether the window should have a shadow.
	**/
	function setHasShadow(hasShadow:Bool):Void;
	/**
		Whether the window has a shadow.
	**/
	function hasShadow():Bool;
	/**
		Sets the opacity of the window. Out of bound number values are clamped to the [0, 1] range.
	**/
	function setOpacity(opacity:Float):Void;
	/**
		between 0.0 (fully transparent) and 1.0 (fully opaque).
	**/
	function getOpacity():Float;
	/**
		Setting a window shape determines the area within the window where the system permits drawing and user interaction. Outside of the given region, no pixels will be drawn and no mouse events will be registered. Mouse events outside of the region will not be received by that window, but will fall through to whatever is behind the window.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:electron_experimental
	function setShape(rects:Array<electron.Rectangle>):Void;
	/**
		Whether the buttons were added successfully
		
		Add a thumbnail toolbar with a specified set of buttons to the thumbnail image of a window in a taskbar button layout. Returns a `boolean` object indicates whether the thumbnail has been added successfully.
		
		The number of buttons in thumbnail toolbar should be no greater than 7 due to the limited room. Once you setup the thumbnail toolbar, the toolbar cannot be removed due to the platform's limitation. But you can call the API with an empty array to clean the buttons.
		
		The `buttons` is an array of `Button` objects:
		
		* `Button` Object
		  * `icon` NativeImage - The icon showing in thumbnail toolbar.
		  * `click` Function
		  * `tooltip` string (optional) - The text of the button's tooltip.
		  * `flags` string[] (optional) - Control specific states and behaviors of the button. By default, it is `['enabled']`.
		
		The `flags` is an array that can include following `string`s:
		
		* `enabled` - The button is active and available to the user.
		* `disabled` - The button is disabled. It is present, but has a visual state indicating it will not respond to user action.
		* `dismissonclick` - When the button is clicked, the thumbnail window closes immediately.
		* `nobackground` - Do not draw a button border, use only the image.
		* `hidden` - The button is not shown to the user.
		* `noninteractive` - The button is enabled but not interactive; no pressed button state is drawn. This value is intended for instances where the button is used in a notification.
	**/
	@:electron_platforms(["Windows"])
	function setThumbarButtons(buttons:Array<electron.ThumbarButton>):Bool;
	/**
		Sets the region of the window to show as the thumbnail image displayed when hovering over the window in the taskbar. You can reset the thumbnail to be the entire window by specifying an empty region: `{ x: 0, y: 0, width: 0, height: 0 }`.
	**/
	@:electron_platforms(["Windows"])
	function setThumbnailClip(region:electron.Rectangle):Void;
	/**
		Sets the toolTip that is displayed when hovering over the window thumbnail in the taskbar.
	**/
	@:electron_platforms(["Windows"])
	function setThumbnailToolTip(toolTip:String):Void;
	/**
		Sets the properties for the window's taskbar button.
		
		> [!NOTE] `relaunchCommand` and `relaunchDisplayName` must always be set together. If one of those properties is not set, then neither will be used.
	**/
	@:electron_platforms(["Windows"])
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
		Sets the system accent color and highlighting of active window border.
		
		The `accentColor` parameter accepts the following values:
		
		* **Color string** - Like `true`, but sets a custom accent color using standard CSS color formats (Hex, RGB, RGBA, HSL, HSLA, or named colors). Alpha values in RGBA/HSLA formats are ignored and the color is treated as fully opaque.
		* **`true`** - Enable accent color highlighting for the window with the system accent color regardless of whether accent colors are enabled for windows in System `Settings.`
		* **`false`** - Disable accent color highlighting for the window regardless of whether accent colors are currently enabled for windows in System Settings.
		* **`null`** - Reset window accent color behavior to follow behavior set in System Settings.
		
		Examples:
	**/
	@:electron_platforms(["Windows"])
	function setAccentColor(accentColor:haxe.extern.EitherType<Bool, haxe.extern.EitherType<String, Dynamic>>):Void;
	/**
		the system accent color and highlighting of active window border in Hex RGB format.
		
		If a color has been set for the window that differs from the system accent color, the window accent color will be returned. Otherwise, a boolean will be returned, with `true` indicating that the window uses the global system accent color, and `false` indicating that accent color highlighting is disabled for this window.
	**/
	@:electron_platforms(["Windows"])
	function getAccentColor():haxe.extern.EitherType<String, Bool>;
	/**
		Same as `webContents.showDefinitionForSelection()`.
	**/
	@:electron_platforms(["macOS"])
	function showDefinitionForSelection():Void;
	/**
		Changes window icon.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setIcon(icon:haxe.extern.EitherType<electron.NativeImage, String>):Void;
	/**
		Sets whether the window traffic light buttons should be visible.
	**/
	@:electron_platforms(["macOS"])
	function setWindowButtonVisibility(visible:Bool):Void;
	/**
		Sets whether the window menu bar should hide itself automatically. Once set the menu bar will only show when users press the single `Alt` key.
		
		If the menu bar is already visible, calling `setAutoHideMenuBar(true)` won't hide it immediately.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setAutoHideMenuBar(hide:Bool):Void;
	/**
		Whether menu bar automatically hides itself.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function isMenuBarAutoHide():Bool;
	/**
		Sets whether the menu bar should be visible. If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single `Alt` key.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setMenuBarVisibility(visible:Bool):Void;
	/**
		Whether the menu bar is visible.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function isMenuBarVisible():Bool;
	/**
		whether the window is arranged via Snap.
		
		The window is snapped via buttons shown when the mouse is hovered over window maximize button, or by dragging it to the edges of the screen.
	**/
	@:electron_platforms(["Windows"])
	function isSnapped():Bool;
	/**
		Sets whether the window should be visible on all workspaces.
		
		> [!NOTE] This API does nothing on Windows.
	**/
	@:electron_platforms(["macOS", "Linux"])
	function setVisibleOnAllWorkspaces(visible:Bool, ?options:{ /**
		Sets whether the window should be visible above fullscreen windows.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var visibleOnFullScreen : Bool; /**
		Calling setVisibleOnAllWorkspaces will by default transform the process type between UIElementApplication and ForegroundApplication to ensure the correct behavior. However, this will hide the window and dock for a short time every time it is called. If your window is already of type UIElementApplication, you can bypass this transformation by passing true to skipTransformProcessType.
	**/
	@:electron_platforms(["macOS"])
	@:optional
	var skipTransformProcessType : Bool; }):Void;
	/**
		Whether the window is visible on all workspaces.
		
		> [!NOTE] This API always returns false on Windows.
	**/
	@:electron_platforms(["macOS", "Linux"])
	function isVisibleOnAllWorkspaces():Bool;
	/**
		Makes the window ignore all mouse events.
		
		All mouse events happened in this window will be passed to the window below this window, but if this window has focus, it will still receive keyboard events. On Linux this is supported on both X11 and Wayland. On X11 the X server has applied the window's new input shape when the call returns; on Wayland the new input region is applied with the window's next frame.
	**/
	function setIgnoreMouseEvents(ignore:Bool, ?options:{ /**
		If true, forwards mouse move messages to Chromium, enabling mouse related events such as `mouseleave`. Only used when `ignore` is true. If `ignore` is false, forwarding is always disabled regardless of this value.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var forward : Bool; }):Void;
	/**
		Prevents the window contents from being captured by other apps.
		
		On Windows, it calls `SetWindowDisplayAffinity` with `WDA_EXCLUDEFROMCAPTURE`. For Windows 10 version 2004 and up the window will be removed from capture entirely, older Windows versions behave as if `WDA_MONITOR` is applied capturing a black window. The change takes effect with the next desktop composition, not when the call returns, so a capture started immediately afterwards can still contain the window.
		
		Protection also applies in a Windows remote session. A Remote Desktop client still shows the window to the remote user, but remote access software that works by capturing the desktop cannot. To leave windows unprotected in remote sessions instead, disable the `AllowWindowCaptureExclusionInRemoteSessions` Chromium feature at the start of your main script. `win.isContentProtected()` still returns `true` in that case.
		
		On macOS, it sets the `NSWindow`'s `sharingType` to `NSWindowSharingNone`. Unfortunately, due to an intentional change in macOS, newer Mac applications that use `ScreenCaptureKit` will capture your window despite `win.setContentProtection(true)`. See here.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setContentProtection(enable:Bool):Void;
	/**
		whether or not content protection is currently enabled.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isContentProtected():Bool;
	/**
		Changes whether the window can be focused.
		
		On macOS it does not remove the focus from the window.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function setFocusable(focusable:Bool):Void;
	/**
		Whether the window can be focused.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function isFocusable():Bool;
	/**
		Sets `parent` as current window's parent window, passing `null` will turn current window into a top-level window.
	**/
	function setParentWindow(parent:haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>):Void;
	/**
		The parent window or `null` if there is no parent.
	**/
	function getParentWindow():haxe.extern.EitherType<electron.remote.BrowserWindow, Dynamic>;
	/**
		All child windows.
	**/
	function getChildWindows():Array<electron.remote.BrowserWindow>;
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
		Shows or hides the tab overview when native tabs are enabled.
	**/
	@:electron_platforms(["macOS"])
	function showAllTabs():Void;
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
	function addTabbedWindow(browserWindow:electron.remote.BrowserWindow):Void;
	/**
		Adds a vibrancy effect to the browser window. Passing `null` or an empty string will remove the vibrancy effect on the window. The `animationDuration` parameter only animates fading in or fading out the vibrancy effect. Animating between different types of vibrancy is not supported.
	**/
	@:electron_platforms(["macOS"])
	function setVibrancy(type:haxe.extern.EitherType<String, Dynamic>, ?options:{ /**
		if greater than zero, the change to vibrancy will be animated over the given duration (in milliseconds).
	**/
	@:optional
	var animationDuration : Float; }):Void;
	/**
		This method sets the browser window's system-drawn background material, including behind the non-client area.
		
		See the Windows documentation for more details.
		
		> [!NOTE] This method is only supported on Windows 11 22H2 and up.
	**/
	@:electron_platforms(["Windows"])
	function setBackgroundMaterial(material:BrowserWindowSetBackgroundMaterialMaterial):Void;
	/**
		Set a custom position for the traffic light buttons in frameless window. Passing `null` will reset the position to default.
	**/
	@:electron_platforms(["macOS"])
	function setWindowButtonPosition(position:haxe.extern.EitherType<electron.Point, Dynamic>):Void;
	/**
		The custom position for the traffic light buttons in frameless window, `null` will be returned when there is no custom position.
	**/
	@:electron_platforms(["macOS"])
	function getWindowButtonPosition():haxe.extern.EitherType<electron.Point, Dynamic>;
	/**
		Sets the touchBar layout for the current window. Specifying `null` or `undefined` clears the touch bar. This method only has an effect if the machine has a touch bar.
		
		> [!NOTE] The TouchBar API is currently experimental and may change or be removed in future Electron releases.
	**/
	@:electron_platforms(["macOS"])
	function setTouchBar(touchBar:haxe.extern.EitherType<electron.remote.TouchBar, Dynamic>):Void;
	/**
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function setBrowserView(browserView:haxe.extern.EitherType<electron.remote.BrowserView, Dynamic>):Void;
	/**
		The `BrowserView` attached to `win`. Returns `null` if one is not attached. Throws an error if multiple `BrowserView`s are attached.
		
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function getBrowserView():haxe.extern.EitherType<electron.remote.BrowserView, Dynamic>;
	/**
		Replacement API for setBrowserView supporting work with multi browser views.
		
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function addBrowserView(browserView:electron.remote.BrowserView):Void;
	/**
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function removeBrowserView(browserView:electron.remote.BrowserView):Void;
	/**
		Raises `browserView` above other `BrowserView`s attached to `win`. Throws an error if `browserView` is not attached to `win`.
		
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function setTopBrowserView(browserView:electron.remote.BrowserView):Void;
	/**
		a sorted by z-index array of all BrowserViews that have been attached with `addBrowserView` or `setBrowserView`. The top-most BrowserView is the last element of the array.
		
		> [!WARNING] The `BrowserView` class is deprecated, and replaced by the new `WebContentsView` class.
	**/
	@:deprecated
	@:electron_experimental
	function getBrowserViews():Array<electron.remote.BrowserView>;
	/**
		On a window with Window Controls Overlay already enabled, this method updates the style of the title bar overlay.
		
		On Linux, the `symbolColor` is automatically calculated to have minimum accessible contrast to the `color` if not explicitly set.
	**/
	@:electron_platforms(["Windows", "Linux"])
	function setTitleBarOverlay(options:{ /**
		The CSS color of the Window Controls Overlay when enabled.
	**/
	@:optional
	var color : String; /**
		The CSS color of the symbols on the Window Controls Overlay when enabled.
	**/
	@:optional
	var symbolColor : String; /**
		The height of the title bar and Window Controls Overlay in pixels.
	**/
	@:optional
	var height : Int; }):Void;
}
enum abstract BrowserWindowSetAlwaysOnTopLevel(String) from String to String {
	var normal = "normal";
	var floating = "floating";
	var torn_off_menu = "torn-off-menu";
	var modal_panel = "modal-panel";
	var main_menu = "main-menu";
	var status = "status";
	var pop_up_menu = "pop-up-menu";
	var screen_saver = "screen-saver";
	var dock = "dock";
}
enum abstract BrowserWindowSetProgressBarOptionsMode(String) from String to String {
	var none = "none";
	var normal = "normal";
	var indeterminate = "indeterminate";
	var error = "error";
	var paused = "paused";
}
enum abstract BrowserWindowSetBackgroundMaterialMaterial(String) from String to String {
	/**
		Let the Desktop Window Manager (DWM) automatically decide the system-drawn backdrop material for this window. This is the default.
	**/
	var auto = "auto";
	/**
		Don't draw any system backdrop.
	**/
	var none = "none";
	/**
		Draw the backdrop material effect corresponding to a long-lived window.
	**/
	var mica = "mica";
	/**
		Draw the backdrop material effect corresponding to a transient window.
	**/
	var acrylic = "acrylic";
	/**
		Draw the backdrop material effect corresponding to a window with a tabbed title bar.
	**/
	var tabbed = "tabbed";
}
