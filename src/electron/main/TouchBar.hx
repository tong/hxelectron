package electron.main;
/**
	Create TouchBar layouts for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar
**/
@:jsRequire("electron", "TouchBar") extern class TouchBar {
	/**
		A TouchBarItem that will replace the "esc" button on the touch bar when set. Setting to null restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ var items : Array<haxe.extern.EitherType<TouchBarButton, haxe.extern.EitherType<TouchBarColorPicker, haxe.extern.EitherType<TouchBarGroup, haxe.extern.EitherType<TouchBarLabel, haxe.extern.EitherType<TouchBarPopover, haxe.extern.EitherType<TouchBarScrubber, haxe.extern.EitherType<TouchBarSegmentedControl, haxe.extern.EitherType<TouchBarSlider, TouchBarSpacer>>>>>>>>>; @:optional
	var escapeItem : haxe.extern.EitherType<TouchBarButton, haxe.extern.EitherType<TouchBarColorPicker, haxe.extern.EitherType<TouchBarGroup, haxe.extern.EitherType<TouchBarLabel, haxe.extern.EitherType<TouchBarPopover, haxe.extern.EitherType<TouchBarScrubber, haxe.extern.EitherType<TouchBarSegmentedControl, haxe.extern.EitherType<TouchBarSlider, haxe.extern.EitherType<TouchBarSpacer, Dynamic>>>>>>>>>; }):Void;
}
/**
	Create a button in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-button
**/
@:jsRequire("electron", "TouchBar.TouchBarButton") extern class TouchBarButton {
	/**
		A String representing the button's current text. Changing this value immediately updates the button in the touch bar.
	**/
	var label : String;
	/**
		A String hex code representing the button's current background color. Changing this value immediately updates the button in the touch bar.
	**/
	var backgroundColor : String;
	/**
		A NativeImage representing the button's current icon. Changing this value immediately updates the button in the touch bar.
	**/
	var icon : electron.NativeImage;
	function new(options:{ /**
		Button text.
	**/
	@:optional
	var label : String; /**
		Button background color in hex format, i.e #ABCDEF.
	**/
	@:optional
	var backgroundColor : String; /**
		Button icon.
	**/
	@:optional
	var icon : electron.NativeImage; /**
		Can be left, right or overlay.
	**/
	@:optional
	var iconPosition : String; /**
		Function to call when the button is clicked.
	**/
	@:optional
	var click : haxe.Constraints.Function; }):Void;
}
/**
	Create a color picker in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-color-picker
**/
@:jsRequire("electron", "TouchBar.TouchBarColorPicker") extern class TouchBarColorPicker {
	/**
		A String[] array representing the color picker's available colors to select. Changing this value immediately updates the color picker in the touch bar.
	**/
	var availableColors : Array<String>;
	/**
		A String hex code representing the color picker's currently selected color. Changing this value immediately updates the color picker in the touch bar.
	**/
	var selectedColor : String;
	function new(options:{ /**
		Array of hex color strings to appear as possible colors to select.
	**/
	@:optional
	var availableColors : Array<String>; /**
		The selected hex color in the picker, i.e #ABCDEF.
	**/
	@:optional
	var selectedColor : String; /**
		Function to call when a color is selected.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}
/**
	Create a group in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-group
**/
@:jsRequire("electron", "TouchBar.TouchBarGroup") extern class TouchBarGroup {
	function new(options:{ /**
		Items to display as a group.
	**/
	var items : electron.main.TouchBar; }):Void;
}
/**
	Create a label in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-label
**/
@:jsRequire("electron", "TouchBar.TouchBarLabel") extern class TouchBarLabel {
	/**
		A String representing the label's current text. Changing this value immediately updates the label in the touch bar.
	**/
	var label : String;
	/**
		A String hex code representing the label's current text color. Changing this value immediately updates the label in the touch bar.
	**/
	var textColor : String;
	function new(options:{ /**
		Text to display.
	**/
	@:optional
	var label : String; /**
		Hex color of text, i.e #ABCDEF.
	**/
	@:optional
	var textColor : String; }):Void;
}
/**
	Create a popover in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-popover
**/
@:jsRequire("electron", "TouchBar.TouchBarPopover") extern class TouchBarPopover {
	/**
		A String representing the popover's current button text. Changing this value immediately updates the popover in the touch bar.
	**/
	var label : String;
	/**
		A NativeImage representing the popover's current button icon. Changing this value immediately updates the popover in the touch bar.
	**/
	var icon : electron.NativeImage;
	function new(options:{ /**
		Popover button text.
	**/
	@:optional
	var label : String; /**
		Popover button icon.
	**/
	@:optional
	var icon : electron.NativeImage; /**
		Items to display in the popover.
	**/
	@:optional
	var items : electron.main.TouchBar; /**
		true to display a close button on the left of the popover, false to not show it. Default is true.
	**/
	@:optional
	var showCloseButton : Bool; }):Void;
}
/**
	Create a scrubber (a scrollable selector)
	@see http://electronjs.org/docs/api/touch-bar-scrubber
**/
@:jsRequire("electron", "TouchBar.TouchBarScrubber") extern class TouchBarScrubber {
	/**
		A ScrubberItem[] array representing the items in this scrubber. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array does not update the touch bar.
	**/
	var items : Array<electron.ScrubberItem>;
	/**
		A String representing the style that selected items in the scrubber should have. Updating this value immediately updates the control in the touch bar. Possible values:
	**/
	var selectedStyle : String;
	/**
		A String representing the style that selected items in the scrubber should have. This style is overlayed on top of the scrubber item instead of being placed behind it. Updating this value immediately updates the control in the touch bar. Possible values:
	**/
	var overlayStyle : String;
	/**
		A Boolean representing whether to show the left / right selection arrows in this scrubber. Updating this value immediately updates the control in the touch bar.
	**/
	var showArrowButtons : Bool;
	/**
		A String representing the mode of this scrubber. Updating this value immediately updates the control in the touch bar. Possible values:
	**/
	var mode : String;
	/**
		A Boolean representing whether this scrubber is continuous or not. Updating this value immediately updates the control in the touch bar.
	**/
	var continuous : Bool;
	function new(options:{ /**
		An array of items to place in this scrubber.
	**/
	var items : Array<electron.ScrubberItem>; /**
		Called when the user taps an item that was not the last tapped item.
	**/
	var select : haxe.Constraints.Function; /**
		Called when the user taps any item.
	**/
	var highlight : haxe.Constraints.Function; /**
		Selected item style. Defaults to null.
	**/
	var selectedStyle : String; /**
		Selected overlay item style. Defaults to null.
	**/
	var overlayStyle : String; /**
		Defaults to false.
	**/
	var showArrowButtons : Bool; /**
		Defaults to free.
	**/
	var mode : String; /**
		Defaults to true.
	**/
	var continuous : Bool; }):Void;
}
/**
	Create a segmented control (a button group) where one button has a selected state
	@see http://electronjs.org/docs/api/touch-bar-segmented-control
**/
@:jsRequire("electron", "TouchBar.TouchBarSegmentedControl") extern class TouchBarSegmentedControl {
	/**
		A String representing the controls current segment style. Updating this value immediately updates the control in the touch bar.
	**/
	var segmentStyle : String;
	/**
		A SegmentedControlSegment[] array representing the segments in this control. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array does not update the touch bar.
	**/
	var segments : Array<electron.SegmentedControlSegment>;
	/**
		An Integer representing the currently selected segment. Changing this value immediately updates the control in the touch bar. User interaction with the touch bar will update this value automatically.
	**/
	var selectedIndex : Int;
	function new(options:{ /**
		Style of the segments:
	**/
	@:optional
	var segmentStyle : String; /**
		The selection mode of the control:
	**/
	@:optional
	var mode : String; /**
		An array of segments to place in this control.
	**/
	var segments : Array<electron.SegmentedControlSegment>; /**
		The index of the currently selected segment, will update automatically with user interaction. When the mode is multiple it will be the last selected item.
	**/
	@:optional
	var selectedIndex : Int; /**
		Called when the user selects a new segment.
	**/
	var change : haxe.Constraints.Function; }):Void;
}
/**
	Create a slider in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-slider
**/
@:jsRequire("electron", "TouchBar.TouchBarSlider") extern class TouchBarSlider {
	/**
		A String representing the slider's current text. Changing this value immediately updates the slider in the touch bar.
	**/
	var label : String;
	/**
		A Number representing the slider's current value. Changing this value immediately updates the slider in the touch bar.
	**/
	var value : Float;
	/**
		A Number representing the slider's current minimum value. Changing this value immediately updates the slider in the touch bar.
	**/
	var minValue : Float;
	/**
		A Number representing the slider's current maximum value. Changing this value immediately updates the slider in the touch bar.
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
/**
	Create a spacer between two items in the touch bar for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar-spacer
**/
@:jsRequire("electron", "TouchBar.TouchBarSpacer") extern class TouchBarSpacer {
	function new(options:{ /**
		Size of spacer, possible values are:
	**/
	@:optional
	var size : String; }):Void;
}
