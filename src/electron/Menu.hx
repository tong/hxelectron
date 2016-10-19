package electron;
@:jsRequire("electron", "Menu") @:require("electron") extern class Menu {
	/**
		A MenuItem[] array containing the menu's items.
	**/
	var items : Dynamic;
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
		Sets menu as the application menu on macOS. On Windows and Linux, the menu will be set as each window's top menu. Note: This API has to be called after the ready event of app module.
	**/
	static function setApplicationMenu(menu:electron.Menu):Void;
	/**
		Returns the application menu (an instance of Menu), if set, or null, if not set.
	**/
	static function getApplicationMenu():Void;
	/**
		Sends the action to the first responder of application. This is used for emulating default Cocoa menu behaviors, usually you would just use the role property of MenuItem. See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the template is just an array of options for constructing a MenuItem. The usage can be referenced above. You can also attach other fields to the element of the template and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:Array<MenuItem>):Void;
}