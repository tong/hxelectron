package electron.main;
/**
	Create native application menus and context menus.
	@see http://electronjs.org/docs/api/menu
**/
@:jsRequire("electron", "Menu") extern class Menu extends js.node.events.EventEmitter<electron.main.Menu> {
	/**
		Sets menu as the application menu on macOS. On Windows and Linux, the menu will be set as each window's top menu. Passing null will remove the menu bar on Windows and Linux but has no effect on macOS. Note: This API has to be called after the ready event of app module.
	**/
	static function setApplicationMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
	/**
		Note: The returned Menu instance doesn't support dynamic addition or removal of menu items. Instance properties can still be dynamically modified.
	**/
	static function getApplicationMenu():haxe.extern.EitherType<electron.main.Menu, Dynamic>;
	/**
		Sends the action to the first responder of application. This is used for emulating default macOS menu behaviors. Usually you would use the role property of a MenuItem. See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	@:electron_platforms(["macOS"])
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the template is an array of options for constructing a MenuItem. The usage can be referenced above. You can also attach other fields to the element of the template and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:Array<Dynamic>):electron.main.Menu;
	/**
		A MenuItem[] array containing the menu's items. Each Menu consists of multiple MenuItems and each MenuItem can have a submenu.
	**/
	var items : Array<electron.main.MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the BrowserWindow.
	**/
	function popup(?options:{ /**
		Default is the focused window.
	**/
	@:optional
	var window : electron.main.BrowserWindow; /**
		Default is the current mouse cursor position. Must be declared if y is declared.
	**/
	@:optional
	var x : Float; /**
		Default is the current mouse cursor position. Must be declared if x is declared.
	**/
	@:optional
	var y : Float; /**
		The index of the menu item to be positioned under the mouse cursor at the specified coordinates. Default is -1.
	**/
	@:optional
	var positioningItem : Float; /**
		Called when menu is closed.
	**/
	@:optional
	var callback : haxe.Constraints.Function; }):Void;
	/**
		Closes the context menu in the browserWindow.
	**/
	function closePopup(?browserWindow:electron.main.BrowserWindow):Void;
	/**
		Appends the menuItem to the menu.
	**/
	function append(menuItem:electron.main.MenuItem):Void;
	function getMenuItemById(id:String):electron.main.MenuItem;
	/**
		Inserts the menuItem to the pos position of the menu.
	**/
	function insert(pos:Int, menuItem:electron.main.MenuItem):Void;
}
@:enum abstract MenuEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when menu.popup() is called.
	**/
	var menu_will_show : electron.main.MenuEvent<js.html.Event -> Void> = "menu-will-show";
	/**
		Emitted when a popup is closed either manually or with menu.closePopup().
	**/
	var menu_will_close : electron.main.MenuEvent<js.html.Event -> Void> = "menu-will-close";
}
