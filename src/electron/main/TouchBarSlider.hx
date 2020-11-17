package electron.main;
/**
	> Create a slider in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-slider
**/
@:jsRequire("electron", "TouchBarSlider") extern class TouchBarSlider extends js.node.events.EventEmitter<electron.main.TouchBarSlider> {
	/**
		A `String` representing the slider's current text. Changing this value immediately updates the slider in the touch bar.
	**/
	var label : String;
	/**
		A `Number` representing the slider's current value. Changing this value immediately updates the slider in the touch bar.
	**/
	var value : Float;
	/**
		A `Number` representing the slider's current minimum value. Changing this value immediately updates the slider in the touch bar.
	**/
	var minValue : Float;
	/**
		A `Number` representing the slider's current maximum value. Changing this value immediately updates the slider in the touch bar.
	**/
	var maxValue : Float;
	function new(options:{ /**
		Label text.
	**/
	@:optional
	var label : String; /**
		Selected value.
	**/
	@:optional
	var value : Int; /**
		Minimum value.
	**/
	@:optional
	var minValue : Int; /**
		Maximum value.
	**/
	@:optional
	var maxValue : Int; /**
		Function to call when the slider is changed.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}
@:enum abstract TouchBarSliderEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
