package electron.remote;
/**
	> Add icons and context menus to the system's notification area.
	
	Process: Main
	
	`Tray` is an EventEmitter.
	
	```
	const { app, Menu, Tray } = require('electron')
	
	let tray = null
	app.whenReady().then(() => {
	  tray = new Tray('/path/to/my/icon')
	  const contextMenu = Menu.buildFromTemplate([
	    { label: 'Item1', type: 'radio' },
	    { label: 'Item2', type: 'radio' },
	    { label: 'Item3', type: 'radio', checked: true },
	    { label: 'Item4', type: 'radio' }
	  ])
	  tray.setToolTip('This is my application.')
	  tray.setContextMenu(contextMenu)
	})
	```
	
	__Platform limitations:__
	
	* On Linux the app indicator will be used if it is supported, otherwise `GtkStatusIcon` will be used instead.
	* On Linux distributions that only have app indicator support, you have to install `libappindicator1` to make the tray icon work.
	* App indicator will only be shown when it has a context menu.
	* When app indicator is used on Linux, the `click` event is ignored.
	* On Linux in order for changes made to individual `MenuItem`s to take effect, you have to call `setContextMenu` again. For example:
	
	```
	const { app, Menu, Tray } = require('electron')
	
	let appIcon = null
	app.whenReady().then(() => {
	  appIcon = new Tray('/path/to/my/icon')
	  const contextMenu = Menu.buildFromTemplate([
	    { label: 'Item1', type: 'radio' },
	    { label: 'Item2', type: 'radio' }
	  ])
	
	  // Make a change to the context menu
	  contextMenu.items[1].checked = false
	
	  // Call this again for Linux because we modified the context menu
	  appIcon.setContextMenu(contextMenu)
	})
	```
	
	* On Windows it is recommended to use `ICO` icons to get best visual effects.
	
	If you want to keep exact same behaviors on all platforms, you should not rely on the `click` event and always attach a context menu to the tray icon.
	@see https://electronjs.org/docs/api/tray
**/
@:jsRequire("electron", "remote.Tray") extern class Tray extends js.node.events.EventEmitter<electron.remote.Tray> {
	function new(image:haxe.extern.EitherType<Dynamic, Dynamic>, ?guid:String):Void;
	/**
		Destroys the tray icon immediately.
	**/
	function destroy():Void;
	/**
		Sets the `image` associated with this tray icon.
	**/
	function setImage(image:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Sets the `image` associated with this tray icon when pressed on macOS.
	**/
	function setPressedImage(image:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Sets the hover text for this tray icon.
	**/
	function setToolTip(toolTip:String):Void;
	/**
		Sets the title displayed next to the tray icon in the status bar (Support ANSI colors).
	**/
	function setTitle(title:String, ?options:{ /**
		The font family variant to display, can be `monospaced` or `monospacedDigit`. `monospaced` is available in macOS 10.15+ and `monospacedDigit` is available in macOS 10.11+.  When left blank, the title uses the default system font.
	**/
	@:optional
	var fontType : String; }):Void;
	/**
		the title displayed next to the tray icon in the status bar
	**/
	function getTitle():String;
	/**
		Sets the option to ignore double click events. Ignoring these events allows you to detect every individual click of the tray icon.
		
		This value is set to false by default.
	**/
	function setIgnoreDoubleClickEvents(ignore:Bool):Void;
	/**
		Whether double click events will be ignored.
	**/
	function getIgnoreDoubleClickEvents():Bool;
	/**
		Displays a tray balloon.
	**/
	function displayBalloon(options:{ /**
		Icon to use when `iconType` is `custom`.
	**/
	@:optional
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		Can be `none`, `info`, `warning`, `error` or `custom`. Default is `custom`.
	**/
	@:optional
	var iconType : String; var title : String; var content : String; /**
		The large version of the icon should be used. Default is `true`. Maps to `NIIF_LARGE_ICON`.
	**/
	@:optional
	var largeIcon : Bool; /**
		Do not play the associated sound. Default is `false`. Maps to `NIIF_NOSOUND`.
	**/
	@:optional
	var noSound : Bool; /**
		Do not display the balloon notification if the current user is in "quiet time". Default is `false`. Maps to `NIIF_RESPECT_QUIET_TIME`.
	**/
	@:optional
	var respectQuietTime : Bool; }):Void;
	/**
		Removes a tray balloon.
	**/
	function removeBalloon():Void;
	/**
		Returns focus to the taskbar notification area. Notification area icons should use this message when they have completed their UI operation. For example, if the icon displays a shortcut menu, but the user presses ESC to cancel it, use `tray.focus()` to return focus to the notification area.
	**/
	function focus():Void;
	/**
		Pops up the context menu of the tray icon. When `menu` is passed, the `menu` will be shown instead of the tray icon's context menu.
		
		The `position` is only available on Windows, and it is (0, 0) by default.
	**/
	function popUpContextMenu(?menu:electron.remote.Menu, ?position:electron.Point):Void;
	/**
		Closes an open context menu, as set by `tray.setContextMenu()`.
	**/
	function closeContextMenu():Void;
	/**
		Sets the context menu for this icon.
	**/
	function setContextMenu(menu:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		The `bounds` of this tray icon as `Object`.
	**/
	function getBounds():electron.Rectangle;
	/**
		Whether the tray icon is destroyed.
	**/
	function isDestroyed():Bool;
}
@:enum abstract TrayEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the tray icon is clicked.
	**/
	var click : electron.remote.TrayEvent<Void -> Void> = "click";
	/**
		Emitted when the tray icon is right clicked.
	**/
	var right_click : electron.remote.TrayEvent<Void -> Void> = "right-click";
	/**
		Emitted when the tray icon is double clicked.
	**/
	var double_click : electron.remote.TrayEvent<Void -> Void> = "double-click";
	/**
		Emitted when the tray balloon shows.
	**/
	var balloon_show : electron.remote.TrayEvent<Void -> Void> = "balloon-show";
	/**
		Emitted when the tray balloon is clicked.
	**/
	var balloon_click : electron.remote.TrayEvent<Void -> Void> = "balloon-click";
	/**
		Emitted when the tray balloon is closed because of timeout or user manually closes it.
	**/
	var balloon_closed : electron.remote.TrayEvent<Void -> Void> = "balloon-closed";
	/**
		Emitted when any dragged items are dropped on the tray icon.
	**/
	var drop : electron.remote.TrayEvent<Void -> Void> = "drop";
	/**
		Emitted when dragged files are dropped in the tray icon.
	**/
	var drop_files : electron.remote.TrayEvent<Void -> Void> = "drop-files";
	/**
		Emitted when dragged text is dropped in the tray icon.
	**/
	var drop_text : electron.remote.TrayEvent<Void -> Void> = "drop-text";
	/**
		Emitted when a drag operation enters the tray icon.
	**/
	var drag_enter : electron.remote.TrayEvent<Void -> Void> = "drag-enter";
	/**
		Emitted when a drag operation exits the tray icon.
	**/
	var drag_leave : electron.remote.TrayEvent<Void -> Void> = "drag-leave";
	/**
		Emitted when a drag operation ends on the tray or ends at another location.
	**/
	var drag_end : electron.remote.TrayEvent<Void -> Void> = "drag-end";
	/**
		Emitted when the mouse is released from clicking the tray icon.
		
		Note: This will not be emitted if you have set a context menu for your Tray using `tray.setContextMenu`, as a result of macOS-level constraints.
	**/
	var mouse_up : electron.remote.TrayEvent<Void -> Void> = "mouse-up";
	/**
		Emitted when the mouse clicks the tray icon.
	**/
	var mouse_down : electron.remote.TrayEvent<Void -> Void> = "mouse-down";
	/**
		Emitted when the mouse enters the tray icon.
	**/
	var mouse_enter : electron.remote.TrayEvent<Void -> Void> = "mouse-enter";
	/**
		Emitted when the mouse exits the tray icon.
	**/
	var mouse_leave : electron.remote.TrayEvent<Void -> Void> = "mouse-leave";
	/**
		Emitted when the mouse moves in the tray icon.
	**/
	var mouse_move : electron.remote.TrayEvent<Void -> Void> = "mouse-move";
}
