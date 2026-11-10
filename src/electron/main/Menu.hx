package electron.main;
/**
	
	
	### Class: Menu
	
	> Create application menus and context menus.
	
	Process: Main
	
	The presentation of menus varies depending on the operating system:
	
	* Under Windows and Linux, menus are visually similar to Chromium.
	* Under macOS, these will be native menus.
	
	> [!TIP] See also: A detailed guide about how to implement menus in your application.
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/menu
**/
@:jsRequire("electron", "Menu") extern class Menu extends js.node.events.EventEmitter<electron.main.Menu> {
	/**
		Sets `menu` as the application menu on macOS. On Windows and Linux, the `menu` will be set as each window's top menu.
		
		On Linux, the menu bar uses GTK theme colors when GTK is available. If GTK cannot initialize, it uses Chromium's built-in light or dark menu colors, following `nativeTheme.shouldUseDarkColors`.
		
		Also on Windows and Linux, you can use a `&` in the top-level item name to indicate which letter should get a generated accelerator. For example, using `&File` for the file menu would result in a generated `Alt-F` accelerator that opens the associated menu. The indicated character in the button label then gets an underline, and the `&` character is not displayed on the button label.
		
		In order to escape the `&` character in an item name, add a preceding `&`. For example, `&&File` would result in `&File` displayed on the button label.
		
		Passing `null` will suppress the default menu. On Windows and Linux, this has the additional effect of removing the menu bar from the window.
		
		> [!NOTE] The default menu will be created automatically if the app does not set one. It contains standard items such as `File`, `Edit`, `View`, and `Window`.
	**/
	static function setApplicationMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
	/**
		The application menu, if set, or `null`, if not set.
		
		> [!NOTE] The returned `Menu` instance doesn't support dynamic addition or removal of menu items. Instance properties can still be dynamically modified.
	**/
	static function getApplicationMenu():haxe.extern.EitherType<electron.main.Menu, Dynamic>;
	/**
		Sets the colors used to highlight the hovered or keyboard-focused item in every menu the app shows, including context menus and the menu bar's dropdowns. Light and dark colors are set separately, and any color left unset keeps the default for that mode. Each call replaces the colors set by any previous call. Passing `null` restores the defaults.
		
		Menus opened after the call use the new colors. The colors are not applied while Windows high contrast mode or forced colors are active, so the user's system colors take priority.
		
		This method has no effect on macOS and Linux.
	**/
	@:electron_platforms(["Windows"])
	static function setHighlightColors(options:haxe.extern.EitherType<{ /**
		Colors used when menus are drawn with light colors.
	**/
	@:optional
	var light : { /**
		Background color of the hovered or keyboard-focused menu item, as a CSS color string (e.g. `#0067c0`).
	**/
	@:optional
	var background : String; /**
		Text color of the hovered or keyboard-focused menu item, as a CSS color string.
	**/
	@:optional
	var foreground : String; }; /**
		Colors used when menus are drawn with dark colors.
	**/
	@:optional
	var dark : { /**
		Background color of the hovered or keyboard-focused menu item, as a CSS color string.
	**/
	@:optional
	var background : String; /**
		Text color of the hovered or keyboard-focused menu item, as a CSS color string.
	**/
	@:optional
	var foreground : String; }; }, Dynamic>):Void;
	/**
		Sends the `action` to the first responder of application. This is used for emulating default macOS menu behaviors. Usually you would use the `role` property of a `MenuItem`.
		
		See the macOS Cocoa Event Handling Guide for more information on macOS' native actions.
	**/
	@:electron_platforms(["macOS"])
	static function sendActionToFirstResponder(action:String):Void;
	/**
		Generally, the `template` is an array of `options` for constructing a MenuItem. The usage can be referenced above.
		
		You can also attach other fields to the element of the `template` and they will become properties of the constructed menu items.
	**/
	static function buildFromTemplate(template:Array<haxe.extern.EitherType<Dynamic, electron.main.MenuItem>>):electron.main.Menu;
	/**
		A `MenuItem[]` array containing the menu's items.
		
		Each `Menu` consists of multiple `MenuItem` instances and each `MenuItem` can nest a `Menu` into its `submenu` property.
	**/
	var items : Array<electron.main.MenuItem>;
	function new():Void;
	/**
		Pops up this menu as a context menu in the `BaseWindow`.
		
		> [!TIP] For more details, see the Context Menu guide.
	**/
	function popup(?options:{ /**
		Default is the focused window.
	**/
	@:optional
	var window : electron.main.BaseWindow; /**
		Provide the relevant frame if you want certain OS-level features such as Writing Tools on macOS to function correctly. Typically, this should be `params.frame` from the `context-menu` event on a WebContents, or the `focusedFrame` property of a WebContents.
	**/
	@:optional
	var frame : electron.main.WebFrameMain; /**
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
	@:electron_platforms(["macOS"])
	@:optional
	var positioningItem : Float; /**
		This should map to the `menuSourceType` provided by the `context-menu` event. It is not recommended to set this value manually, only provide values you receive from other APIs or leave it `undefined`. Can be `none`, `mouse`, `keyboard`, `touch`, `touchMenu`, `longPress`, `longTap`, `touchHandle`, `stylus`, `adjustSelection`, or `adjustSelectionReset`.
	**/
	@:electron_platforms(["Windows", "Linux"])
	@:optional
	var sourceType : MenuPopupOptionsSourceType; /**
		Called when menu is closed.
	**/
	@:optional
	var callback : haxe.Constraints.Function; }):Void;
	/**
		Closes the context menu in the `window`.
	**/
	function closePopup(?window:electron.main.BaseWindow):Void;
	/**
		Appends the `menuItem` to the menu.
	**/
	function append(menuItem:electron.main.MenuItem):Void;
	/**
		the item with the specified `id`
	**/
	function getMenuItemById(id:String):haxe.extern.EitherType<electron.main.MenuItem, Dynamic>;
	/**
		Inserts the `menuItem` to the `pos` position of the menu.
	**/
	function insert(pos:Int, menuItem:electron.main.MenuItem):Void;
}
enum abstract MenuEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when `menu.popup()` is called.
	**/
	var menu_will_show : electron.main.MenuEvent<js.html.Event -> Void> = "menu-will-show";
	/**
		Emitted when a popup is closed either manually or with `menu.closePopup()`.
	**/
	var menu_will_close : electron.main.MenuEvent<js.html.Event -> Void> = "menu-will-close";
}
enum abstract MenuPopupOptionsSourceType(String) from String to String {
	var none = "none";
	var mouse = "mouse";
	var keyboard = "keyboard";
	var touch = "touch";
	var touchMenu = "touchMenu";
	var longPress = "longPress";
	var longTap = "longTap";
	var touchHandle = "touchHandle";
	var stylus = "stylus";
	var adjustSelection = "adjustSelection";
	var adjustSelectionReset = "adjustSelectionReset";
}
