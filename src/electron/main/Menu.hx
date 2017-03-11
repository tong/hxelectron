package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "Menu") extern class Menu {
	/**
		A MenuItem[] array containing the menu's items. Each Menu consists of multiple MenuItems and each MenuItem can have a submenu.
	**/
	var items : Array<MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the browserWindow.
	**/
	function popup(?browserWindow:BrowserWindow, ?options:{ /**
		Default is the current mouse cursor position.
	**/
	@:optional
	var x : Float; /**
		( if is used) Default is the current mouse cursor position.
	**/
	@:optional
	var y : Float; /**
		Set to to have this method return immediately called, to return after the menu has been selected or closed. Defaults to .
	**/
	@:optional
	var async : Bool; /**
		The index of the menu item to be positioned under the mouse cursor at the specified coordinates. Default is -1.
	**/
	@:optional
	var positioningItem : Float; }):Void;
	/**
		Closes the context menu in the browserWindow.
	**/
	function closePopup(?browserWindow:BrowserWindow):Void;
	/**
		Appends the menuItem to the menu.
	**/
	function append(menuItem:MenuItem):Void;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	function insert(pos:Int, menuItem:MenuItem):Void;
	/**
		Pops up this menu as a context menu in the browserWindow.
	**/
	static function popup(?browserWindow:BrowserWindow, ?options:{ /**
		Default is the current mouse cursor position.
	**/
	@:optional
	var x : Float; /**
		( if is used) Default is the current mouse cursor position.
	**/
	@:optional
	var y : Float; /**
		Set to to have this method return immediately called, to return after the menu has been selected or closed. Defaults to .
	**/
	@:optional
	var async : Bool; /**
		The index of the menu item to be positioned under the mouse cursor at the specified coordinates. Default is -1.
	**/
	@:optional
	var positioningItem : Float; }):Void;
	/**
		Closes the context menu in the browserWindow.
	**/
	static function closePopup(?browserWindow:BrowserWindow):Void;
	/**
		Appends the menuItem to the menu.
	**/
	static function append(menuItem:MenuItem):Void;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	static function insert(pos:Int, menuItem:MenuItem):Void;
}