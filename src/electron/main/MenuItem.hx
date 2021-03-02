package electron.main;
/**
	> Add items to native application menus and context menus.
	
	Process: Main
	
	See `Menu` for examples.
	@see https://electronjs.org/docs/api/menu-item
**/
@:jsRequire("electron", "MenuItem") extern class MenuItem extends js.node.events.EventEmitter<electron.main.MenuItem> {
	/**
		A `String` indicating the item's unique id, this property can be dynamically changed.
	**/
	var id : String;
	/**
		A `String` indicating the item's visible label.
	**/
	var label : String;
	/**
		A `Function` that is fired when the MenuItem receives a click event. It can be called with `menuItem.click(event, focusedWindow, focusedWebContents)`.
		
		* `event` KeyboardEvent
		* `focusedWindow` BrowserWindow
		* `focusedWebContents` WebContents
	**/
	var click : haxe.Constraints.Function;
	/**
		A `Menu` (optional) containing the menu item's submenu, if present.
	**/
	var submenu : electron.main.Menu;
	/**
		A `String` indicating the type of the item. Can be `normal`, `separator`, `submenu`, `checkbox` or `radio`.
	**/
	var type : String;
	/**
		A `String` (optional) indicating the item's role, if set. Can be `undo`, `redo`, `cut`, `copy`, `paste`, `pasteAndMatchStyle`, `delete`, `selectAll`, `reload`, `forceReload`, `toggleDevTools`, `resetZoom`, `zoomIn`, `zoomOut`, `togglefullscreen`, `window`, `minimize`, `close`, `help`, `about`, `services`, `hide`, `hideOthers`, `unhide`, `quit`, `startSpeaking`, `stopSpeaking`, `zoom`, `front`, `appMenu`, `fileMenu`, `editMenu`, `viewMenu`, `recentDocuments`, `toggleTabBar`, `selectNextTab`, `selectPreviousTab`, `mergeAllWindows`, `clearRecentDocuments`, `moveTabToNewWindow` or `windowMenu`
	**/
	var role : String;
	/**
		A `Accelerator` (optional) indicating the item's accelerator, if set.
	**/
	var accelerator : electron.Accelerator;
	/**
		A `NativeImage | String` (optional) indicating the item's icon, if set.
	**/
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		A `String` indicating the item's sublabel.
	**/
	var sublabel : String;
	/**
		A `String` indicating the item's hover text.
	**/
	var toolTip : String;
	/**
		A `Boolean` indicating whether the item is enabled, this property can be dynamically changed.
	**/
	var enabled : Bool;
	/**
		A `Boolean` indicating whether the item is visible, this property can be dynamically changed.
	**/
	var visible : Bool;
	/**
		A `Boolean` indicating whether the item is checked, this property can be dynamically changed.
		
		A `checkbox` menu item will toggle the `checked` property on and off when selected.
		
		A `radio` menu item will turn on its `checked` property when clicked, and will turn off that property for all adjacent items in the same menu.
		
		You can add a `click` function for additional behavior.
	**/
	var checked : Bool;
	/**
		A `Boolean` indicating if the accelerator should be registered with the system or just displayed.
		
		This property can be dynamically changed.
	**/
	var registerAccelerator : Bool;
	/**
		A `SharingItem` indicating the item to share when the `role` is `shareMenu`.
		
		This property can be dynamically changed.
	**/
	var sharingItem : electron.SharingItem;
	/**
		A `Number` indicating an item's sequential unique id.
	**/
	var commandId : Float;
	/**
		A `Menu` that the item is a part of.
	**/
	var menu : electron.main.Menu;
	function new(options:{ /**
		Will be called with `click(menuItem, browserWindow, event)` when the menu item is clicked.
	**/
	@:optional
	var click : haxe.Constraints.Function; /**
		Can be `undo`, `redo`, `cut`, `copy`, `paste`, `pasteAndMatchStyle`, `delete`, `selectAll`, `reload`, `forceReload`, `toggleDevTools`, `resetZoom`, `zoomIn`, `zoomOut`, `togglefullscreen`, `window`, `minimize`, `close`, `help`, `about`, `services`, `hide`, `hideOthers`, `unhide`, `quit`, `startSpeaking`, `stopSpeaking`, `zoom`, `front`, `appMenu`, `fileMenu`, `editMenu`, `viewMenu`, `shareMenu`, `recentDocuments`, `toggleTabBar`, `selectNextTab`, `selectPreviousTab`, `mergeAllWindows`, `clearRecentDocuments`, `moveTabToNewWindow` or `windowMenu` - Define the action of the menu item, when specified the `click` property will be ignored. See roles.
	**/
	@:optional
	var role : String; /**
		Can be `normal`, `separator`, `submenu`, `checkbox` or `radio`.
	**/
	@:optional
	var type : String; @:optional
	var label : String; @:optional
	var sublabel : String; /**
		Hover text for this menu item.
	**/
	@:optional
	var toolTip : String; @:optional
	var accelerator : electron.Accelerator; @:optional
	var icon : haxe.extern.EitherType<Dynamic, Dynamic>; /**
		If false, the menu item will be greyed out and unclickable.
	**/
	@:optional
	var enabled : Bool; /**
		default is `true`, and when `false` will prevent the accelerator from triggering the item if the item is not visible`.
	**/
	@:optional
	var acceleratorWorksWhenHidden : Bool; /**
		If false, the menu item will be entirely hidden.
	**/
	@:optional
	var visible : Bool; /**
		Should only be specified for `checkbox` or `radio` type menu items.
	**/
	@:optional
	var checked : Bool; /**
		If false, the accelerator won't be registered with the system, but it will still be displayed. Defaults to true.
	**/
	@:optional
	var registerAccelerator : Bool; /**
		The item to share when the `role` is `shareMenu`.
	**/
	@:optional
	var sharingItem : electron.SharingItem; /**
		Should be specified for `submenu` type menu items. If `submenu` is specified, the `type: 'submenu'` can be omitted. If the value is not a `Menu` then it will be automatically converted to one using `Menu.buildFromTemplate`.
	**/
	@:optional
	var submenu : haxe.extern.EitherType<Array<Dynamic>, Dynamic>; /**
		Unique within a single menu. If defined then it can be used as a reference to this item by the position attribute.
	**/
	@:optional
	var id : String; /**
		Inserts this item before the item with the specified label. If the referenced item doesn't exist the item will be inserted at the end of  the menu. Also implies that the menu item in question should be placed in the same “group” as the item.
	**/
	@:optional
	var before : Array<String>; /**
		Inserts this item after the item with the specified label. If the referenced item doesn't exist the item will be inserted at the end of the menu.
	**/
	@:optional
	var after : Array<String>; /**
		Provides a means for a single context menu to declare the placement of their containing group before the containing group of the item with the specified label.
	**/
	@:optional
	var beforeGroupContaining : Array<String>; /**
		Provides a means for a single context menu to declare the placement of their containing group after the containing group of the item with the specified label.
	**/
	@:optional
	var afterGroupContaining : Array<String>; }):Void;
}
@:enum abstract MenuItemEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
