package electron.main;

/**
	Add icons and context menus to the system's notification area.

	See: <http://electron.atom.io/docs/api/tray>
**/
@:require(js, electron) @:jsRequire("electron", "Tray") extern class Tray extends js.node.events.EventEmitter<electron.main.Tray> {
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
	function setPressedImage(image:NativeImage):Void;
	/**
		Sets the hover text for this tray icon.
	**/
	function setToolTip(toolTip:String):Void;
	/**
		Sets the title displayed aside of the tray icon in the status bar.
	**/
	function setTitle(title:String):Void;
	/**
		Sets when the tray's icon background becomes highlighted (in blue). Note: You can use highlightMode with a BrowserWindow by toggling between 'never' and 'always' modes when the window visibility changes.
	**/
	function setHighlightMode(mode:String):Void;
	/**
		Displays a tray balloon.
	**/
	function displayBalloon(options:{ /**
		(optional)
	**/
	@:optional
	var icon : Dynamic; /**
		(optional)
	**/
	@:optional
	var title : String; /**
		(optional)
	**/
	@:optional
	var content : String; }):Void;
	/**
		Pops up the context menu of the tray icon. When menu is passed, the menu will be shown instead of the tray icon's context menu. The position is only available on Windows, and it is (0, 0) by default.
	**/
	function popUpContextMenu(?menu:Menu, ?position:Point):Void;
	/**
		Sets the context menu for this icon.
	**/
	function setContextMenu(menu:Menu):Void;
	/**
		The bounds of this tray icon as Object.
	**/
	function getBounds():Rectangle;
	function isDestroyed():Bool;
}

/**
**/
@:require(js, electron) @:enum abstract TrayEvent(String) from String to String {
	/**
		Emitted when the tray icon is clicked.
	**/
	var click : String = "click";
	/**
		Emitted when the tray icon is right clicked.
	**/
	var right_click : String = "right-click";
	/**
		Emitted when the tray icon is double clicked.
	**/
	var double_click : String = "double-click";
	/**
		Emitted when the tray balloon shows.
	**/
	var balloon_show : String = "balloon-show";
	/**
		Emitted when the tray balloon is clicked.
	**/
	var balloon_click : String = "balloon-click";
	/**
		Emitted when the tray balloon is closed because of timeout or user manually closes it.
	**/
	var balloon_closed : String = "balloon-closed";
	/**
		Emitted when any dragged items are dropped on the tray icon.
	**/
	var drop : String = "drop";
	/**
		Emitted when dragged files are dropped in the tray icon.
	**/
	var drop_files : String = "drop-files";
	/**
		Emitted when dragged text is dropped in the tray icon.
	**/
	var drop_text : String = "drop-text";
	/**
		Emitted when a drag operation enters the tray icon.
	**/
	var drag_enter : String = "drag-enter";
	/**
		Emitted when a drag operation exits the tray icon.
	**/
	var drag_leave : String = "drag-leave";
	/**
		Emitted when a drag operation ends on the tray or ends at another location.
	**/
	var drag_end : String = "drag-end";
}