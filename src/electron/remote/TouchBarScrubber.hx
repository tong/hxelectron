package electron.remote;
/**
	> Create a scrubber (a scrollable selector)
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-scrubber
**/
@:jsRequire("electron", "remote.TouchBarScrubber") extern class TouchBarScrubber extends js.node.events.EventEmitter<electron.remote.TouchBarScrubber> {
	/**
		A `ScrubberItem[]` array representing the items in this scrubber. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array **does not update the touch bar**.
	**/
	var items : Array<electron.ScrubberItem>;
	/**
		A `String` representing the style that selected items in the scrubber should have. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `background` - Maps to `[NSScrubberSelectionStyle roundedBackgroundStyle]`.
		* `outline` - Maps to `[NSScrubberSelectionStyle outlineOverlayStyle]`.
		* `none` - Removes all styles.
	**/
	var selectedStyle : String;
	/**
		A `String` representing the style that selected items in the scrubber should have. This style is overlayed on top of the scrubber item instead of being placed behind it. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `background` - Maps to `[NSScrubberSelectionStyle roundedBackgroundStyle]`.
		* `outline` - Maps to `[NSScrubberSelectionStyle outlineOverlayStyle]`.
		* `none` - Removes all styles.
	**/
	var overlayStyle : String;
	/**
		A `Boolean` representing whether to show the left / right selection arrows in this scrubber. Updating this value immediately updates the control in the touch bar.
	**/
	var showArrowButtons : Bool;
	/**
		A `String` representing the mode of this scrubber. Updating this value immediately updates the control in the touch bar. Possible values:
		
		* `fixed` - Maps to `NSScrubberModeFixed`.
		* `free` - Maps to `NSScrubberModeFree`.
	**/
	var mode : String;
	/**
		A `Boolean` representing whether this scrubber is continuous or not. Updating this value immediately updates the control in the touch bar.
	**/
	var continuous : Bool;
	function new(options:{ /**
		An array of items to place in this scrubber.
	**/
	var items : Array<electron.ScrubberItem>; /**
		Called when the user taps an item that was not the last tapped item.
	**/
	@:optional
	var select : haxe.Constraints.Function; /**
		Called when the user taps any item.
	**/
	@:optional
	var highlight : haxe.Constraints.Function; /**
		Selected item style. Can be `background`, `outline` or `none`. Defaults to `none`.
	**/
	@:optional
	var selectedStyle : String; /**
		Selected overlay item style. Can be `background`, `outline` or `none`. Defaults to `none`.
	**/
	@:optional
	var overlayStyle : String; /**
		Defaults to `false`.
	**/
	@:optional
	var showArrowButtons : Bool; /**
		Can be `fixed` or `free`. The default is `free`.
	**/
	@:optional
	var mode : String; /**
		Defaults to `true`.
	**/
	@:optional
	var continuous : Bool; }):Void;
}
@:enum abstract TouchBarScrubberEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
