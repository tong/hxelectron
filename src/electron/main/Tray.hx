package electron.main;
/**
	@see http://electronjs.org/docs/api/tray
**/
@:jsRequire("electron", "Tray") extern class Tray extends js.node.events.EventEmitter<electron.main.Tray> {
	function new(image:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
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
	function setTitle(title:String):Void;
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
	function displayBalloon(options:{ @:optional
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; var title : String; var content : String; }):Void;
	/**
		Pops up the context menu of the tray icon. When `menu` is passed, the `menu` will be shown instead of the tray icon's context menu.
		
		The `position` is only available on Windows, and it is (0, 0) by default.
	**/
	function popUpContextMenu(?menu:electron.main.Menu, ?position:electron.Point):Void;
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
	var click : electron.main.TrayEvent<Void -> Void> = "click";
	/**
		Emitted when the tray icon is right clicked.
	**/
	var right_click : electron.main.TrayEvent<Void -> Void> = "right-click";
	/**
		Emitted when the tray icon is double clicked.
	**/
	var double_click : electron.main.TrayEvent<Void -> Void> = "double-click";
	/**
		Emitted when the tray balloon shows.
	**/
	var balloon_show : electron.main.TrayEvent<Void -> Void> = "balloon-show";
	/**
		Emitted when the tray balloon is clicked.
	**/
	var balloon_click : electron.main.TrayEvent<Void -> Void> = "balloon-click";
	/**
		Emitted when the tray balloon is closed because of timeout or user manually closes it.
	**/
	var balloon_closed : electron.main.TrayEvent<Void -> Void> = "balloon-closed";
	/**
		Emitted when any dragged items are dropped on the tray icon.
	**/
	var drop : electron.main.TrayEvent<Void -> Void> = "drop";
	/**
		Emitted when dragged files are dropped in the tray icon.
	**/
	var drop_files : electron.main.TrayEvent<Void -> Void> = "drop-files";
	/**
		Emitted when dragged text is dropped in the tray icon.
	**/
	var drop_text : electron.main.TrayEvent<Void -> Void> = "drop-text";
	/**
		Emitted when a drag operation enters the tray icon.
	**/
	var drag_enter : electron.main.TrayEvent<Void -> Void> = "drag-enter";
	/**
		Emitted when a drag operation exits the tray icon.
	**/
	var drag_leave : electron.main.TrayEvent<Void -> Void> = "drag-leave";
	/**
		Emitted when a drag operation ends on the tray or ends at another location.
	**/
	var drag_end : electron.main.TrayEvent<Void -> Void> = "drag-end";
	/**
		Emitted when the mouse enters the tray icon.
	**/
	var mouse_enter : electron.main.TrayEvent<Void -> Void> = "mouse-enter";
	/**
		Emitted when the mouse exits the tray icon.
	**/
	var mouse_leave : electron.main.TrayEvent<Void -> Void> = "mouse-leave";
	/**
		Emitted when the mouse moves in the tray icon.
	**/
	var mouse_move : electron.main.TrayEvent<Void -> Void> = "mouse-move";
}
