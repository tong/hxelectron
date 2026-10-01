package electron.remote;
/**
	> Create a segmented control (a button group) where one button has a selected state
	
	Process: Main
	 _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-segmented-control
**/
@:jsRequire("electron", "remote.TouchBarSegmentedControl") extern class TouchBarSegmentedControl extends js.node.events.EventEmitter<electron.remote.TouchBarSegmentedControl> {
	/**
		A `string` representing the controls current segment style. Updating this value immediately updates the control in the touch bar.
	**/
	var segmentStyle : String;
	/**
		A `SegmentedControlSegment[]` array representing the segments in this control. Updating this value immediately updates the control in the touch bar. Updating deep properties inside this array **does not update the touch bar**.
	**/
	var segments : Array<electron.SegmentedControlSegment>;
	/**
		An `Integer` representing the currently selected segment. Changing this value immediately updates the control in the touch bar. User interaction with the touch bar will update this value automatically.
	**/
	var selectedIndex : Int;
	/**
		A `string` representing the current selection mode of the control.  Can be `single`, `multiple` or `buttons`.
	**/
	var mode : TouchBarSegmentedControlMode;
	function new(options:{ /**
		Style of the segments:
	**/
	@:optional
	var segmentStyle : TouchBarSegmentedControlNewOptionsSegmentStyle; /**
		The selection mode of the control:
	**/
	@:optional
	var mode : TouchBarSegmentedControlMode; /**
		An array of segments to place in this control.
	**/
	var segments : Array<electron.SegmentedControlSegment>; /**
		The index of the currently selected segment, will update automatically with user interaction. When the mode is `multiple` it will be the last selected item.
	**/
	@:optional
	var selectedIndex : Int; /**
		Called when the user selects a new segment.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}
enum abstract TouchBarSegmentedControlEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
enum abstract TouchBarSegmentedControlMode(String) from String to String {
	var single = "single";
	var multiple = "multiple";
	var buttons = "buttons";
}
enum abstract TouchBarSegmentedControlNewOptionsSegmentStyle(String) from String to String {
	/**
		Default. The appearance of the segmented control is automatically determined based on the type of window in which the control is displayed and the position within the window. Maps to `NSSegmentStyleAutomatic`.
	**/
	var automatic = "automatic";
	/**
		The control is displayed using the rounded style. Maps to `NSSegmentStyleRounded`.
	**/
	var rounded = "rounded";
	/**
		The control is displayed using the textured rounded style. Maps to `NSSegmentStyleTexturedRounded`.
	**/
	var textured_rounded = "textured-rounded";
	/**
		The control is displayed using the round rect style. Maps to `NSSegmentStyleRoundRect`.
	**/
	var round_rect = "round-rect";
	/**
		The control is displayed using the textured square style. Maps to `NSSegmentStyleTexturedSquare`.
	**/
	var textured_square = "textured-square";
	/**
		The control is displayed using the capsule style. Maps to `NSSegmentStyleCapsule`.
	**/
	var capsule = "capsule";
	/**
		The control is displayed using the small square style. Maps to `NSSegmentStyleSmallSquare`.
	**/
	var small_square = "small-square";
	/**
		The segments in the control are displayed very close to each other but not touching. Maps to `NSSegmentStyleSeparated`.
	**/
	var separated = "separated";
}
