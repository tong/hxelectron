package electron.main;
/**
	> Create a color picker in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-color-picker
**/
@:jsRequire("electron", "TouchBarColorPicker") extern class TouchBarColorPicker extends js.node.events.EventEmitter<electron.main.TouchBarColorPicker> {
	/**
		A `String[]` array representing the color picker's available colors to select. Changing this value immediately updates the color picker in the touch bar.
	**/
	var availableColors : Array<String>;
	/**
		A `String` hex code representing the color picker's currently selected color. Changing this value immediately updates the color picker in the touch bar.
	**/
	var selectedColor : String;
	function new(options:{ /**
		Array of hex color strings to appear as possible colors to select.
	**/
	@:optional
	var availableColors : Array<String>; /**
		The selected hex color in the picker, i.e `#ABCDEF`.
	**/
	@:optional
	var selectedColor : String; /**
		Function to call when a color is selected.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}
@:enum abstract TouchBarColorPickerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
