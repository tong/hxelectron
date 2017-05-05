package electron.main;

/**
	Add items to native application menus and context menus.

	See: <http://electron.atom.io/docs/api/menu-item>
**/
@:require(js, electron) @:jsRequire("electron", "MenuItem") extern class MenuItem {
	/**
		A Boolean indicating whether the item is enabled, this property can be dynamically changed.
	**/
	var enabled : Bool;
	/**
		A Boolean indicating whether the item is visible, this property can be dynamically changed.
	**/
	var visible : Bool;
	/**
		A Boolean indicating whether the item is checked, this property can be dynamically changed. A checkbox menu item will toggle the checked property on and off when selected. A radio menu item will turn on its checked property when clicked, and will turn off that property for all adjacent items in the same menu. You can add a click function for additional behavior.
	**/
	var checked : Bool;
	/**
		A String representing the menu items visible label
	**/
	var label : String;
	/**
		A Function that is fired when the MenuItem recieves a click event
	**/
	var click : haxe.Constraints.Function;
	function new(options:{ /**
		Will be called with when the menu item is clicked.
	**/
	@:optional
	var click : haxe.Constraints.Function; /**
		Define the action of the menu item, when specified the property will be ignored. See .
	**/
	@:optional
	var role : String; /**
		Can be , , , or .
	**/
	@:optional
	var type : String; /**
		(optional)
	**/
	@:optional
	var label : String; /**
		(optional)
	**/
	@:optional
	var sublabel : String; @:optional
	var accelerator : Accelerator; @:optional
	var icon : Dynamic; /**
		If false, the menu item will be greyed out and unclickable.
	**/
	@:optional
	var enabled : Bool; /**
		If false, the menu item will be entirely hidden.
	**/
	@:optional
	var visible : Bool; /**
		Should only be specified for or type menu items.
	**/
	@:optional
	var checked : Bool; /**
		Should be specified for type menu items. If is specified, the can be omitted. If the value is not a then it will be automatically converted to one using .
	**/
	@:optional
	var submenu : Dynamic; /**
		Unique within a single menu. If defined then it can be used as a reference to this item by the position attribute.
	**/
	@:optional
	var id : String; /**
		This field allows fine-grained definition of the specific location within a given menu.
	**/
	@:optional
	var position : String; }):Void;
}