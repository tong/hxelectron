package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "Menu") extern class Menu {
	/**
		A MenuItem[] array containing the menu's items.
	**/
	var items : Array<MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the browserWindow.
	**/
	function popup(?browserWindow:BrowserWindow, ?x:Float, y:Float, ?positioningItem:Float):Void;
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
	static function popup(?browserWindow:BrowserWindow, ?x:Float, y:Float, ?positioningItem:Float):Void;
	/**
		Appends the menuItem to the menu.
	**/
	static function append(menuItem:MenuItem):Void;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	static function insert(pos:Int, menuItem:MenuItem):Void;
}