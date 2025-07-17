package electron.main;
/**
	> Create and control windows.
	
	Process: Main
	
	> [!NOTE] `BaseWindow` provides a flexible way to compose multiple web views in a single window. For windows with only a single, full-size web view, the `BrowserWindow` class may be a simpler option.
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	### Parent and child windows
	
	By using `parent` option, you can create child windows:
	
	```
	const { BaseWindow } = require('electron')
	
	const parent = new BaseWindow()
	const child = new BaseWindow({ parent })
	```
	
	The `child` window will always show on top of the `parent` window.
	
	### Modal windows
	
	A modal window is a child window that disables parent window. To create a modal window, you have to set both the `parent` and `modal` options:
	
	```
	const { BaseWindow } = require('electron')
	
	const parent = new BaseWindow()
	const child = new BaseWindow({ parent, modal: true })
	```
	
	### Platform notices
	
	* On macOS modal windows will be displayed as sheets attached to the parent window.
	* On macOS the child windows will keep the relative position to parent window when parent window moves, while on Windows and Linux child windows will not move.
	* On Linux the type of modal windows will be changed to `dialog`.
	* On Linux many desktop environments do not support hiding a modal window.
	
	### Resource management
	
	When you add a `WebContentsView` to a `BaseWindow` and the `BaseWindow` is closed, the `webContents` of the `WebContentsView` are not destroyed automatically.
	
	It is your responsibility to close the `webContents` when you no longer need them, e.g. when the `BaseWindow` is closed:
	
	```
	const { BaseWindow, WebContentsView } = require('electron')
	
	const win = new BaseWindow({ width: 800, height: 600 })
	
	const view = new WebContentsView()
	win.contentView.addChildView(view)
	
	win.on('closed', () => {
	  view.webContents.close()
	})
	```
	
	Unlike with a `BrowserWindow`, if you don't explicitly close the `webContents`, you'll encounter memory leaks.
	
	### Class: BaseWindow
	
	> Create and control windows.
	
	Process: Main
	
	`BaseWindow` is an EventEmitter.
	
	It creates a new `BaseWindow` with native properties as set by the `options`.
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/base-window
**/
@:jsRequire("electron", "BaseWindow") extern class BaseWindow extends js.node.events.EventEmitter<electron.main.BaseWindow> {
	/**
		An array of all opened browser windows.
	**/
	static function getAllWindows():Array<electron.main.BaseWindow>;
	/**
		The window that is focused in this application, otherwise returns `null`.
	**/
	static function getFocusedWindow():haxe.extern.EitherType<electron.main.BaseWindow, Dynamic>;
	/**
		The window with the given `id`.
	**/
	static function fromId(id:Int):haxe.extern.EitherType<electron.main.BaseWindow, Dynamic>;
	/**
		A `Integer` property representing the unique ID of the window. Each ID is unique among all `BaseWindow` instances of the entire Electron application.
	**/
	var id : Int;
	/**
		A `View` property for the content view of the window.
	**/
	var contentView : electron.main.View;
	/**
		A `string` (optional) property that is equal to the `tabbingIdentifier` passed to the `BrowserWindow` constructor or `undefined` if none was set.
	**/
	@:optional
	var tabbingIdentifier : String;
	/**
		A `boolean` property that determines whether the window menu bar should hide itself automatically. Once set, the menu bar will only show when users press the single `Alt` key.
		
		If the menu bar is already visible, setting this property to `true` won't hide it immediately.
	**/
	var autoHideMenuBar : Bool;
	/**
		A `boolean` property that determines whether the window is in simple (pre-Lion) fullscreen mode.
	**/
	var simpleFullScreen : Bool;
	/**
		A `boolean` property that determines whether the window is in fullscreen mode.
	**/
	var fullScreen : Bool;
	/**
		A `boolean` property that determines whether the window is focusable.
	**/
	var focusable : Bool;
	/**
		A `boolean` property that determines whether the window is visible on all workspaces.
		
		> [!NOTE] Always returns false on Windows.
	**/
	var visibleOnAllWorkspaces : Bool;
	/**
		A `boolean` property that determines whether the window has a shadow.
	**/
	var shadow : Bool;
	/**
		A `boolean` property that determines whether the menu bar should be visible.
		
		> [!NOTE] If the menu bar is auto-hide, users can still bring up the menu bar by pressing the single `Alt` key.
	**/
	var menuBarVisible : Bool;
	/**
		A `boolean` property that determines whether the window is in kiosk mode.
	**/
	var kiosk : Bool;
	/**
		A `boolean` property that specifies whether the window’s document has been edited.
		
		The icon in title bar will become gray when set to `true`.
	**/
	var documentEdited : Bool;
	/**
		A `string` property that determines the pathname of the file the window represents, and the icon of the file will show in window's title bar.
	**/
	var representedFilename : String;
	/**
		A `string` property that determines the title of the native window.
		
		> [!NOTE] The title of the web page can be different from the title of the native window.
	**/
	var title : String;
	/**
		A `boolean` property that determines whether the window can be manually minimized by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var minimizable : Bool;
	/**
		A `boolean` property that determines whether the window can be manually maximized by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var maximizable : Bool;
	/**
		A `boolean` property that determines whether the maximize/zoom window button toggles fullscreen mode or maximizes the window.
	**/
	var fullScreenable : Bool;
	/**
		A `boolean` property that determines whether the window can be manually resized by user.
	**/
	var resizable : Bool;
	/**
		A `boolean` property that determines whether the window can be manually closed by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var closable : Bool;
	/**
		A `boolean` property that determines Whether the window can be moved by user.
		
		On Linux the setter is a no-op, although the getter returns `true`.
	**/
	var movable : Bool;
	/**
		A `boolean` property that determines whether the window is excluded from the application’s Windows menu. `false` by default.
	**/
	var excludedFromShownWindowsMenu : Bool;
	/**
		A `string` property that defines an alternative title provided only to accessibility tools such as screen readers. This string is not directly visible to users.
	**/
	var accessibleTitle : String;
	/**
		A `boolean` property that indicates whether the window is arranged via Snap.
	**/
	var snapped : Bool;
	function new(?options:electron.BaseWindowConstructorOptions):Void;
	/**
		Sets the content view of the window.
	**/
	function setContentView(view:electron.main.View):Void;
	/**
		The content view of the window.
	**/
	function getContentView():electron.main.View;
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
		
		> [!NOTE] On macOS, fullscreen transitions take place asynchronously. If further actions depend on the fullscreen state, use the 'enter-full-screen' or > 'leave-full-screen' events.
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
	function previewFile(path:String, ?displayName:String):Void;
	/**
		Closes the currently open Quick Look panel.
	**/
	function closeFilePreview():Void;
	/**
		Resizes and moves the window to the supplied bounds. Any properties that are not supplied will default to their current values.
		
		> [!NOTE] On macOS, the y-coordinate value cannot be smaller than the Tray height. The tray height has changed over time and depends on the operating system, but is between 20-40px. Passing a value lower than the tray height will result in a window that is flush to the tray.
	**/
	function setBounds(bounds:Partial, ?animate:Bool):Void;
	/**
		The `bounds` of the window as `Object`.
		
		> [!NOTE] On macOS, the y-coordinate value returned will be at minimum the Tray height. For example, calling `win.setBounds({ x: 25, y: 20, width: 800, height: 600 })` with a tray height of 38 means that `win.getBounds()` will return `{ x: 25, y: 38, width: 800, height: 600 }`.
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
	**/
	function setContentBounds(bounds:electron.Rectangle, ?animate:Bool):Void;
	/**
		The `bounds` of the window's client area as `Object`.
	**/
	function getContentBounds():electron.Rectangle;
	/**
		Contains the window bounds of the normal state
		
		> [!NOTE] Whatever the current state of the window : maximized, minimized or in fullscreen, this function always returns the position and size of the window in normal state. In normal state, getBounds and getNormalBounds returns the same `Rectangle`.
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
		Sets whether the window will be hidden when the user toggles into mission control.
	**/
	function setHiddenInMissionControl(hidden:Bool):Void;
	/**
		Whether the window will be hidden when the user toggles into mission control.
	**/
	function isHiddenInMissionControl():Bool;
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
		
		> [!NOTE] The title of the web page can be different from the title of the native window.
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
	/**
		Sets the `menu` as the window's menu bar.
	**/
	function setMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
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
	function setOverlayIcon(overlay:haxe.extern.EitherType<electron.NativeImage, Dynamic>, description:String):Void;
	/**
		Invalidates the window shadow so that it is recomputed based on the current window shape.
		
		`BaseWindow`s that are transparent can sometimes leave behind visual artifacts on macOS. This method can be used to clear these artifacts when, for example, performing an animation.
	**/
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
		
		> [!NOTE] `relaunchCommand` and `relaunchDisplayName` must always be set together. If one of those properties is not set, then neither will be used.
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
		Changes window icon.
	**/
	function setIcon(icon:haxe.extern.EitherType<electron.NativeImage, String>):Void;
	/**
		Sets whether the window traffic light buttons should be visible.
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
		whether the window is arranged via Snap.
		
		The window is snapped via buttons shown when the mouse is hovered over window maximize button, or by dragging it to the edges of the screen.
	**/
	function isSnapped():Bool;
	/**
		Sets whether the window should be visible on all workspaces.
		
		> [!NOTE] This API does nothing on Windows.
	**/
	function setVisibleOnAllWorkspaces(visible:Bool, ?options:{ /**
		Sets whether the window should be visible above fullscreen windows.
	**/
	@:optional
	var visibleOnFullScreen : Bool; /**
		Calling setVisibleOnAllWorkspaces will by default transform the process type between UIElementApplication and ForegroundApplication to ensure the correct behavior. However, this will hide the window and dock for a short time every time it is called. If your window is already of type UIElementApplication, you can bypass this transformation by passing true to skipTransformProcessType.
	**/
	@:optional
	var skipTransformProcessType : Bool; }):Void;
	/**
		Whether the window is visible on all workspaces.
		
		> [!NOTE] This API always returns false on Windows.
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
		whether or not content protection is currently enabled.
	**/
	function isContentProtected():Bool;
	/**
		Changes whether the window can be focused.
		
		On macOS it does not remove the focus from the window.
	**/
	function setFocusable(focusable:Bool):Void;
	/**
		Whether the window can be focused.
	**/
	function isFocusable():Bool;
	/**
		Sets `parent` as current window's parent window, passing `null` will turn current window into a top-level window.
	**/
	function setParentWindow(parent:haxe.extern.EitherType<electron.main.BaseWindow, Dynamic>):Void;
	/**
		The parent window or `null` if there is no parent.
	**/
	function getParentWindow():haxe.extern.EitherType<electron.main.BaseWindow, Dynamic>;
	/**
		All child windows.
	**/
	function getChildWindows():Array<electron.main.BaseWindow>;
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
		Shows or hides the tab overview when native tabs are enabled.
	**/
	function showAllTabs():Void;
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
	function addTabbedWindow(baseWindow:electron.main.BaseWindow):Void;
	/**
		Adds a vibrancy effect to the window. Passing `null` or an empty string will remove the vibrancy effect on the window.
	**/
	function setVibrancy(type:haxe.extern.EitherType<String, Dynamic>):Void;
	/**
		This method sets the browser window's system-drawn background material, including behind the non-client area.
		
		See the Windows documentation for more details.
		
		> [!NOTE] This method is only supported on Windows 11 22H2 and up.
	**/
	function setBackgroundMaterial(material:String):Void;
	/**
		Set a custom position for the traffic light buttons in frameless window. Passing `null` will reset the position to default.
	**/
	function setWindowButtonPosition(position:haxe.extern.EitherType<electron.Point, Dynamic>):Void;
	/**
		The custom position for the traffic light buttons in frameless window, `null` will be returned when there is no custom position.
	**/
	function getWindowButtonPosition():haxe.extern.EitherType<electron.Point, Dynamic>;
	/**
		Sets the touchBar layout for the current window. Specifying `null` or `undefined` clears the touch bar. This method only has an effect if the machine has a touch bar.
		
		> [!NOTE] The TouchBar API is currently experimental and may change or be removed in future Electron releases.
	**/
	function setTouchBar(touchBar:haxe.extern.EitherType<electron.main.TouchBar, Dynamic>):Void;
	/**
		On a Window with Window Controls Overlay already enabled, this method updates the style of the title bar overlay.
		
		On Linux, the `symbolColor` is automatically calculated to have minimum accessible contrast to the `color` if not explicitly set.
	**/
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
enum abstract BaseWindowEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the window is going to be closed. It's emitted before the `beforeunload` and `unload` event of the DOM. Calling `event.preventDefault()` will cancel the close.
		
		Usually you would want to use the `beforeunload` handler to decide whether the window should be closed, which will also be called when the window is reloaded. In Electron, returning any value other than `undefined` would cancel the close. For example:
		
		> [!NOTE] There is a subtle difference between the behaviors of `window.onbeforeunload = handler` and `window.addEventListener('beforeunload', handler)`. It is recommended to always set the `event.returnValue` explicitly, instead of only returning a value, as the former works more consistently within Electron.
	**/
	var close : electron.main.BaseWindowEvent<Void -> Void> = "close";
	/**
		Emitted when the window is closed. After you have received this event you should remove the reference to the window and avoid using it any more.
	**/
	var closed : electron.main.BaseWindowEvent<Void -> Void> = "closed";
	/**
		Emitted when a session is about to end due to a shutdown, machine restart, or user log-off. Calling `event.preventDefault()` can delay the system shutdown, though it’s generally best to respect the user’s choice to end the session. However, you may choose to use it if ending the session puts the user at risk of losing data.
	**/
	var query_session_end : electron.main.BaseWindowEvent<Void -> Void> = "query-session-end";
	/**
		Emitted when a session is about to end due to a shutdown, machine restart, or user log-off. Once this event fires, there is no way to prevent the session from ending.
	**/
	var session_end : electron.main.BaseWindowEvent<Void -> Void> = "session-end";
	/**
		Emitted when the window loses focus.
	**/
	var blur : electron.main.BaseWindowEvent<Void -> Void> = "blur";
	/**
		Emitted when the window gains focus.
	**/
	var focus : electron.main.BaseWindowEvent<Void -> Void> = "focus";
	/**
		Emitted when the window is shown.
	**/
	var show : electron.main.BaseWindowEvent<Void -> Void> = "show";
	/**
		Emitted when the window is hidden.
	**/
	var hide : electron.main.BaseWindowEvent<Void -> Void> = "hide";
	/**
		Emitted when window is maximized.
	**/
	var maximize : electron.main.BaseWindowEvent<Void -> Void> = "maximize";
	/**
		Emitted when the window exits from a maximized state.
	**/
	var unmaximize : electron.main.BaseWindowEvent<Void -> Void> = "unmaximize";
	/**
		Emitted when the window is minimized.
	**/
	var minimize : electron.main.BaseWindowEvent<Void -> Void> = "minimize";
	/**
		Emitted when the window is restored from a minimized state.
	**/
	var restore : electron.main.BaseWindowEvent<Void -> Void> = "restore";
	/**
		Emitted before the window is resized. Calling `event.preventDefault()` will prevent the window from being resized.
		
		Note that this is only emitted when the window is being resized manually. Resizing the window with `setBounds`/`setSize` will not emit this event.
		
		The possible values and behaviors of the `edge` option are platform dependent. Possible values are:
		
		* On Windows, possible values are `bottom`, `top`, `left`, `right`, `top-left`, `top-right`, `bottom-left`, `bottom-right`.
		* On macOS, possible values are `bottom` and `right`.
		  * The value `bottom` is used to denote vertical resizing.
		  * The value `right` is used to denote horizontal resizing.
	**/
	var will_resize : electron.main.BaseWindowEvent<Void -> Void> = "will-resize";
	/**
		Emitted after the window has been resized.
	**/
	var resize : electron.main.BaseWindowEvent<Void -> Void> = "resize";
	/**
		Emitted once when the window has finished being resized.
		
		This is usually emitted when the window has been resized manually. On macOS, resizing the window with `setBounds`/`setSize` and setting the `animate` parameter to `true` will also emit this event once resizing has finished.
	**/
	var resized : electron.main.BaseWindowEvent<Void -> Void> = "resized";
	/**
		Emitted before the window is moved. On Windows, calling `event.preventDefault()` will prevent the window from being moved.
		
		Note that this is only emitted when the window is being moved manually. Moving the window with `setPosition`/`setBounds`/`center` will not emit this event.
	**/
	var will_move : electron.main.BaseWindowEvent<Void -> Void> = "will-move";
	/**
		Emitted when the window is being moved to a new position.
	**/
	var move : electron.main.BaseWindowEvent<Void -> Void> = "move";
	/**
		Emitted once when the window is moved to a new position.
		
		> [!NOTE] On macOS, this event is an alias of `move`.
	**/
	var moved : electron.main.BaseWindowEvent<Void -> Void> = "moved";
	/**
		Emitted when the window enters a full-screen state.
	**/
	var enter_full_screen : electron.main.BaseWindowEvent<Void -> Void> = "enter-full-screen";
	/**
		Emitted when the window leaves a full-screen state.
	**/
	var leave_full_screen : electron.main.BaseWindowEvent<Void -> Void> = "leave-full-screen";
	/**
		Emitted when the window is set or unset to show always on top of other windows.
	**/
	var always_on_top_changed : electron.main.BaseWindowEvent<Void -> Void> = "always-on-top-changed";
	/**
		Emitted when an App Command is invoked. These are typically related to keyboard media keys or browser commands, as well as the "Back" button built into some mice on Windows.
		
		Commands are lowercased, underscores are replaced with hyphens, and the `APPCOMMAND_` prefix is stripped off. e.g. `APPCOMMAND_BROWSER_BACKWARD` is emitted as `browser-backward`.
		
		The following app commands are explicitly supported on Linux:
		
		* `browser-backward`
		* `browser-forward`
	**/
	var app_command : electron.main.BaseWindowEvent<Void -> Void> = "app-command";
	/**
		Emitted on 3-finger swipe. Possible directions are `up`, `right`, `down`, `left`.
		
		The method underlying this event is built to handle older macOS-style trackpad swiping, where the content on the screen doesn't move with the swipe. Most macOS trackpads are not configured to allow this kind of swiping anymore, so in order for it to emit properly the 'Swipe between pages' preference in `System Preferences > Trackpad > More Gestures` must be set to 'Swipe with two or three fingers'.
	**/
	var swipe : electron.main.BaseWindowEvent<Void -> Void> = "swipe";
	/**
		Emitted on trackpad rotation gesture. Continually emitted until rotation gesture is ended. The `rotation` value on each emission is the angle in degrees rotated since the last emission. The last emitted event upon a rotation gesture will always be of value `0`. Counter-clockwise rotation values are positive, while clockwise ones are negative.
	**/
	var rotate_gesture : electron.main.BaseWindowEvent<Void -> Void> = "rotate-gesture";
	/**
		Emitted when the window opens a sheet.
	**/
	var sheet_begin : electron.main.BaseWindowEvent<Void -> Void> = "sheet-begin";
	/**
		Emitted when the window has closed a sheet.
	**/
	var sheet_end : electron.main.BaseWindowEvent<Void -> Void> = "sheet-end";
	/**
		Emitted when the native new tab button is clicked.
	**/
	var new_window_for_tab : electron.main.BaseWindowEvent<Void -> Void> = "new-window-for-tab";
	/**
		Emitted when the system context menu is triggered on the window, this is normally only triggered when the user right clicks on the non-client area of your window.  This is the window titlebar or any area you have declared as `-webkit-app-region: drag` in a frameless window.
		
		Calling `event.preventDefault()` will prevent the menu from being displayed.
		
		To convert `point` to DIP, use `screen.screenToDipPoint(point)`.
	**/
	var system_context_menu : electron.main.BaseWindowEvent<Void -> Void> = "system-context-menu";
}
