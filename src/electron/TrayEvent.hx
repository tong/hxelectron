package electron;
@:enum @:require("electron") abstract TrayEvent(String) from String to String {
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