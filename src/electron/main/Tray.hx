package electron.main;

/**
	Add icons and context menus to the system's notification area.

	See: <http://electron.atom.io/docs/api/tray>
**/
@:require(js, electron) @:jsRequire("electron", "Tray") @:electron("main") extern class Tray extends js.node.events.EventEmitter<electron.main.Tray> {
	function new(image:Dynamic):Void;
	/**
		Destroys the tray icon immediately.
	**/
	function destroy():Void;
	/**
		Sets the image associated with this tray icon.
	**/
	function setImage(image:Dynamic):Void;
	/**
		Sets the image associated with this tray icon when pressed on macOS.
	**/
	@:electron_platform(["macOS"])
	function setPressedImage(image:NativeImage):Void;
	/**
		Sets the hover text for this tray icon.
	**/
	function setToolTip(toolTip:String):Void;
	/**
		Sets the title displayed aside of the tray icon in the status bar (Support ANSI colors).
	**/
	@:electron_platform(["macOS"])
	function setTitle(title:String):Void;
	/**
		Sets when the tray's icon background becomes highlighted (in blue). Note: You can use highlightMode with a BrowserWindow by toggling between 'never' and 'always' modes when the window visibility changes.
	**/
	@:electron_platform(["macOS"])
	function setHighlightMode(mode:String):Void;
	/**
		Displays a tray balloon.
	**/
	@:electron_platform(["Windows"])
	function displayBalloon(options:{ /**
		-
	**/
	@:optional
	var icon : Dynamic; @:optional
	var title : String; @:optional
	var content : String; }):Void;
	/**
		Pops up the context menu of the tray icon. When menu is passed, the menu will be shown instead of the tray icon's context menu. The position is only available on Windows, and it is (0, 0) by default.
	**/
	@:electron_platform(["macOS", "Windows"])
	function popUpContextMenu(?menu:Menu, ?position:Point):Void;
	/**
		Sets the context menu for this icon.
	**/
	function setContextMenu(menu:Menu):Void;
	/**
		The bounds of this tray icon as Object.
	**/
	@:electron_platform(["macOS", "Windows"])
	function getBounds():Rectangle;
	function isDestroyed():Bool;
}

/**
**/
@:require(js, electron) @:enum abstract TrayEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the tray icon is clicked.
	**/
	var click : electron.main.Tray.TrayEvent<js.html.Event -> Rectangle -> Point -> Void> = "click";
	/**
		Emitted when the tray icon is right clicked.
	**/
	var right_click : electron.main.Tray.TrayEvent<js.html.Event -> Rectangle -> Void> = "right-click";
	/**
		Emitted when the tray icon is double clicked.
	**/
	var double_click : electron.main.Tray.TrayEvent<js.html.Event -> Rectangle -> Void> = "double-click";
	/**
		Emitted when the tray balloon shows.
	**/
	var balloon_show : electron.main.Tray.TrayEvent<Void -> Void> = "balloon-show";
	/**
		Emitted when the tray balloon is clicked.
	**/
	var balloon_click : electron.main.Tray.TrayEvent<Void -> Void> = "balloon-click";
	/**
		Emitted when the tray balloon is closed because of timeout or user manually closes it.
	**/
	var balloon_closed : electron.main.Tray.TrayEvent<Void -> Void> = "balloon-closed";
	/**
		Emitted when any dragged items are dropped on the tray icon.
	**/
	var drop : electron.main.Tray.TrayEvent<Void -> Void> = "drop";
	/**
		Emitted when dragged files are dropped in the tray icon.
	**/
	var drop_files : electron.main.Tray.TrayEvent<js.html.Event -> Array<String> -> Void> = "drop-files";
	/**
		Emitted when dragged text is dropped in the tray icon.
	**/
	var drop_text : electron.main.Tray.TrayEvent<js.html.Event -> String -> Void> = "drop-text";
	/**
		Emitted when a drag operation enters the tray icon.
	**/
	var drag_enter : electron.main.Tray.TrayEvent<Void -> Void> = "drag-enter";
	/**
		Emitted when a drag operation exits the tray icon.
	**/
	var drag_leave : electron.main.Tray.TrayEvent<Void -> Void> = "drag-leave";
	/**
		Emitted when a drag operation ends on the tray or ends at another location.
	**/
	var drag_end : electron.main.Tray.TrayEvent<Void -> Void> = "drag-end";
	/**
		Emitted when the mouse enters the tray icon.
	**/
	var mouse_enter : electron.main.Tray.TrayEvent<js.html.Event -> Point -> Void> = "mouse-enter";
	/**
		Emitted when the mouse exits the tray icon.
	**/
	var mouse_leave : electron.main.Tray.TrayEvent<js.html.Event -> Point -> Void> = "mouse-leave";
	/**
		Emitted when the mouse moves in the tray icon.
	**/
	var mouse_move : electron.main.Tray.TrayEvent<js.html.Event -> Point -> Void> = "mouse-move";
}