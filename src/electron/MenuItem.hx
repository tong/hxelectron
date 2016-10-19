package electron;
@:jsRequire("electron", "MenuItem") @:require("electron") extern class MenuItem {
	/**
		A Boolean indicating whether the item is enabled, this property can be dynamically changed.
	**/
	var enabled : Dynamic;
	/**
		A Boolean indicating whether the item is visible, this property can be dynamically changed.
	**/
	var visible : Dynamic;
	/**
		A Boolean indicating whether the item is checked, this property can be dynamically changed. A checkbox menu item will toggle the checked property on and off when selected. A radio menu item will turn on its checked property when clicked, and will turn off that property for all adjacent items in the same menu. You can add a click function for additional behavior.
	**/
	var checked : Dynamic;
	function new(options:{ @:optional
	var click : haxe.Constraints.Function; @:optional
	var role : String; @:optional
	var type : String; @:optional
	var label : String; @:optional
	var sublabel : String; @:optional
	var accelerator : electron.Accelerator; @:optional
	var icon : electron.NativeImage; @:optional
	var enabled : Bool; @:optional
	var visible : Bool; @:optional
	var checked : Bool; @:optional
	var submenu : electron.Menu; @:optional
	var id : String; @:optional
	var position : String; }):Void;
}