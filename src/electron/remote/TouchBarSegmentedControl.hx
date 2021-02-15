package electron.remote;
/**
	> Create a segmented control (a button group) where one button has a selected state
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-segmented-control
**/
@:jsRequire("electron", "remote.TouchBarSegmentedControl") extern class TouchBarSegmentedControl extends js.node.events.EventEmitter<electron.remote.TouchBarSegmentedControl> {
	/**
		A `String` representing the controls current segment style. Updating this value immediately updates the control in the touch bar.
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
		A `String` representing the current selection mode of the control.  Can be `single`, `multiple` or `buttons`.
	**/
	var mode : String;
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
		The index of the currently selected segment, will update automatically with user interaction. When the mode is `multiple` it will be the last selected item.
	**/
	@:optional
	var selectedIndex : Int; /**
		Called when the user selects a new segment.
	**/
	@:optional
	var change : haxe.Constraints.Function; }):Void;
}
@:enum abstract TouchBarSegmentedControlEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
