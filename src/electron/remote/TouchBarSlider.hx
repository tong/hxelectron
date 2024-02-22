package electron.remote;
/**
	> Create a slider in the touch bar for native macOS applications
	
	Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-slider
**/
@:jsRequire("electron", "remote.TouchBarSlider") extern class TouchBarSlider extends js.node.events.EventEmitter<electron.remote.TouchBarSlider> {
	/**
		A `string` representing the slider's current text. Changing this value immediately updates the slider in the touch bar.
	**/
	var label : String;
	/**
		A `number` representing the slider's current value. Changing this value immediately updates the slider in the touch bar.
	**/
	var value : Float;
	/**
		A `number` representing the slider's current minimum value. Changing this value immediately updates the slider in the touch bar.
	**/
	var minValue : Float;
	/**
		A `number` representing the slider's current maximum value. Changing this value immediately updates the slider in the touch bar.
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
enum abstract TouchBarSliderEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
