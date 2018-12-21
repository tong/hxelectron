package electron.main;
/**
	Add icons and context menus to the system's notification area.
	@see http://electronjs.org/docs/api/tray
**/
@:jsRequire("electron", "Tray") extern class Tray extends js.node.events.EventEmitter<electron.main.Tray> {
	function new(image:haxe.extern.EitherType<electron.NativeImage, String>):Void;
	/**
		Destroys the tray icon immediately.
	**/
	function destroy():Void;
	/**
		Sets the image associated with this tray icon.
	**/
	function setImage(image:haxe.extern.EitherType<electron.NativeImage, String>):Void;
	/**
		Sets the image associated with this tray icon when pressed on macOS.
	**/
	@:electron_platforms(["macOS"])
	function setPressedImage(image:haxe.extern.EitherType<electron.NativeImage, String>):Void;
	/**
		Sets the hover text for this tray icon.
	**/
	function setToolTip(toolTip:String):Void;
	/**
		Sets the title displayed aside of the tray icon in the status bar (Support ANSI colors).
	**/
	@:electron_platforms(["macOS"])
	function setTitle(title:String):Void;
	/**
		Sets when the tray's icon background becomes highlighted (in blue). Note: You can use highlightMode with a BrowserWindow by toggling between 'never' and 'always' modes when the window visibility changes.
	**/
	@:electron_platforms(["macOS"])
	function setHighlightMode(mode:String):Void;
	/**
		Sets the option to ignore double click events. Ignoring these events allows you to detect every individual click of the tray icon. This value is set to false by default.
	**/
	@:electron_platforms(["macOS"])
	function setIgnoreDoubleClickEvents(ignore:Bool):Void;
	@:electron_platforms(["macOS"])
	function getIgnoreDoubleClickEvents():Bool;
	/**
		Displays a tray balloon.
	**/
	@:electron_platforms(["Windows"])
	function displayBalloon(options:{ /**
		-
	**/
	@:optional
	var icon : haxe.extern.EitherType<electron.NativeImage, String>; var title : String; var content : String; }):Void;
	/**
		Pops up the context menu of the tray icon. When menu is passed, the menu will be shown instead of the tray icon's context menu. The position is only available on Windows, and it is (0, 0) by default.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function popUpContextMenu(?menu:electron.main.Menu, ?position:electron.Point):Void;
	/**
		Sets the context menu for this icon.
	**/
	function setContextMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
	/**
		The bounds of this tray icon as Object.
	**/
	@:electron_platforms(["macOS", "Windows"])
	function getBounds():electron.Rectangle;
	function isDestroyed():Bool;
}
@:enum abstract TrayEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the tray icon is clicked.
	**/
	var click : electron.main.TrayEvent<(js.html.Event, electron.Rectangle, electron.Point) -> Void> = "click";
	/**
		Emitted when the tray icon is right clicked.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var right_click : electron.main.TrayEvent<(js.html.Event, electron.Rectangle) -> Void> = "right-click";
	/**
		Emitted when the tray icon is double clicked.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var double_click : electron.main.TrayEvent<(js.html.Event, electron.Rectangle) -> Void> = "double-click";
	/**
		Emitted when the tray balloon shows.
	**/
	@:electron_platforms(["Windows"])
	var balloon_show : electron.main.TrayEvent<Void -> Void> = "balloon-show";
	/**
		Emitted when the tray balloon is clicked.
	**/
	@:electron_platforms(["Windows"])
	var balloon_click : electron.main.TrayEvent<Void -> Void> = "balloon-click";
	/**
		Emitted when the tray balloon is closed because of timeout or user manually closes it.
	**/
	@:electron_platforms(["Windows"])
	var balloon_closed : electron.main.TrayEvent<Void -> Void> = "balloon-closed";
	/**
		Emitted when any dragged items are dropped on the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var drop : electron.main.TrayEvent<Void -> Void> = "drop";
	/**
		Emitted when dragged files are dropped in the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var drop_files : electron.main.TrayEvent<(js.html.Event, Array<String>) -> Void> = "drop-files";
	/**
		Emitted when dragged text is dropped in the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var drop_text : electron.main.TrayEvent<(js.html.Event, String) -> Void> = "drop-text";
	/**
		Emitted when a drag operation enters the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var drag_enter : electron.main.TrayEvent<Void -> Void> = "drag-enter";
	/**
		Emitted when a drag operation exits the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var drag_leave : electron.main.TrayEvent<Void -> Void> = "drag-leave";
	/**
		Emitted when a drag operation ends on the tray or ends at another location.
	**/
	@:electron_platforms(["macOS"])
	var drag_end : electron.main.TrayEvent<Void -> Void> = "drag-end";
	/**
		Emitted when the mouse enters the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var mouse_enter : electron.main.TrayEvent<(js.html.Event, electron.Point) -> Void> = "mouse-enter";
	/**
		Emitted when the mouse exits the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var mouse_leave : electron.main.TrayEvent<(js.html.Event, electron.Point) -> Void> = "mouse-leave";
	/**
		Emitted when the mouse moves in the tray icon.
	**/
	@:electron_platforms(["macOS"])
	var mouse_move : electron.main.TrayEvent<(js.html.Event, electron.Point) -> Void> = "mouse-move";
}
