package electron.main;

/**
	Create native application menus and context menus.

	See: <http://electron.atom.io/docs/api/menu>
**/
@:require(js, electron) @:jsRequire("electron", "Menu") extern class Menu {
	/**
		A MenuItem[] array containing the menu's items. Each Menu consists of multiple MenuItems and each MenuItem can have a submenu.
	**/
	var items : MenuItem;
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
		Sets menu as the application menu on macOS. On Windows and Linux, the menu will be set as each window's top menu. Passing null will remove the menu bar on Windows and Linux but has no effect on macOS. Note: This API has to be called after the ready event of app module.
	**/
	static function setApplicationMenu(menu:Menu):Void;
	static function getApplicationMenu():Menu;
	/**
		Sends the action to the first responder of application. This is used for emulating default macOS menu behaviors. Usually you would just use the role property of a MenuItem. See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the template is just an array of options for constructing a MenuItem. The usage can be referenced above. You can also attach other fields to the element of the template and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:MenuItemConstructorOptions):Menu;
}