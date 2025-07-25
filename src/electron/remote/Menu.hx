package electron.remote;
/**
	
	
	### Class: Menu
	
	> Create native application menus and context menus.
	
	Process: Main
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/menu
**/
@:jsRequire("electron", "remote.Menu") extern class Menu extends js.node.events.EventEmitter<electron.remote.Menu> {
	/**
		Sets `menu` as the application menu on macOS. On Windows and Linux, the `menu` will be set as each window's top menu.
		
		Also on Windows and Linux, you can use a `&` in the top-level item name to indicate which letter should get a generated accelerator. For example, using `&File` for the file menu would result in a generated `Alt-F` accelerator that opens the associated menu. The indicated character in the button label then gets an underline, and the `&` character is not displayed on the button label.
		
		In order to escape the `&` character in an item name, add a proceeding `&`. For example, `&&File` would result in `&File` displayed on the button label.
		
		Passing `null` will suppress the default menu. On Windows and Linux, this has the additional effect of removing the menu bar from the window.
		
		> [!NOTE] The default menu will be created automatically if the app does not set one. It contains standard items such as `File`, `Edit`, `View`, `Window` and `Help`.
	**/
	static function setApplicationMenu(menu:haxe.extern.EitherType<electron.remote.Menu, Dynamic>):Void;
	/**
		The application menu, if set, or `null`, if not set.
		
		> [!NOTE] The returned `Menu` instance doesn't support dynamic addition or removal of menu items. Instance properties can still be dynamically modified.
	**/
	static function getApplicationMenu():haxe.extern.EitherType<electron.remote.Menu, Dynamic>;
	/**
		Sends the `action` to the first responder of application. This is used for emulating default macOS menu behaviors. Usually you would use the `role` property of a `MenuItem`.
		
		See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the `template` is an array of `options` for constructing a MenuItem. The usage can be referenced above.
		
		You can also attach other fields to the element of the `template` and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:Array<haxe.extern.EitherType<Dynamic, electron.remote.MenuItem>>):electron.remote.Menu;
	/**
		A `MenuItem[]` array containing the menu's items.
		
		Each `Menu` consists of multiple `MenuItem`s and each `MenuItem` can have a submenu.
	**/
	var items : Array<electron.remote.MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the `BaseWindow`.
	**/
	function popup(?options:{ /**
		Default is the focused window.
	**/
	@:optional
	var window : electron.remote.BaseWindow; /**
		Provide the relevant frame if you want certain OS-level features such as Writing Tools on macOS to function correctly. Typically, this should be `params.frame` from the `context-menu` event on a WebContents, or the `focusedFrame` property of a WebContents.
	**/
	@:optional
	var frame : electron.remote.WebFrameMain; /**
		Default is the current mouse cursor position. Must be declared if `y` is declared.
	**/
	@:optional
	var x : Float; /**
		Default is the current mouse cursor position. Must be declared if `x` is declared.
	**/
	@:optional
	var y : Float; /**
		The index of the menu item to be positioned under the mouse cursor at the specified coordinates. Default is -1.
	**/
	@:optional
	var positioningItem : Float; /**
		This should map to the `menuSourceType` provided by the `context-menu` event. It is not recommended to set this value manually, only provide values you receive from other APIs or leave it `undefined`. Can be `none`, `mouse`, `keyboard`, `touch`, `touchMenu`, `longPress`, `longTap`, `touchHandle`, `stylus`, `adjustSelection`, or `adjustSelectionReset`.
	**/
	@:optional
	var sourceType : String; /**
		Called when menu is closed.
	**/
	@:optional
	var callback : haxe.Constraints.Function; }):Void;
	/**
		Closes the context menu in the `window`.
	**/
	function closePopup(?window:electron.remote.BaseWindow):Void;
	/**
		Appends the `menuItem` to the menu.
	**/
	function append(menuItem:electron.remote.MenuItem):Void;
	/**
		the item with the specified `id`
	**/
	function getMenuItemById(id:String):haxe.extern.EitherType<electron.remote.MenuItem, Dynamic>;
	/**
		Inserts the `menuItem` to the `pos` position of the menu.
	**/
	function insert(pos:Int, menuItem:electron.remote.MenuItem):Void;
}
enum abstract MenuEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when `menu.popup()` is called.
	**/
	var menu_will_show : electron.remote.MenuEvent<Void -> Void> = "menu-will-show";
	/**
		Emitted when a popup is closed either manually or with `menu.closePopup()`.
	**/
	var menu_will_close : electron.remote.MenuEvent<Void -> Void> = "menu-will-close";
}
