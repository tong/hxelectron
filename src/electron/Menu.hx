package electron;

///// GENERATED - DO NOT EDIT /////

/**
**/
@:jsRequire("electron", "Menu") @:require(electron_main) @:require(electron) extern class Menu {
	/**
		A MenuItem[] array containing the menu's items.
	**/
	var items : Array<MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the browserWindow.
	**/
	function popup(browserWindow:electron.BrowserWindow, x:Float, y:Float, positioningItem:Float):Void;
	/**
		Appends the menuItem to the menu.
	**/
	function append(menuItem:electron.MenuItem):Void;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	function insert(pos:Int, menuItem:electron.MenuItem):Void;
	/**
		Pops up this menu as a context menu in the browserWindow.
	**/
	static function popup(browserWindow:electron.BrowserWindow, x:Float, y:Float, positioningItem:Float):Void;
	/**
		Appends the menuItem to the menu.
	**/
	static function append(menuItem:electron.MenuItem):Void;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	static function insert(pos:Int, menuItem:electron.MenuItem):Void;
}