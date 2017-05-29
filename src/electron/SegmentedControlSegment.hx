package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/segmented-control-segment>
**/
@:require(js, electron) typedef SegmentedControlSegment = {
	/**
		The text to appear in this segment
	**/
	var label : String;
	/**
		The image to appear in this segment
	**/
	var icon : NativeImage;
	/**
		Whether this segment is selectable. Default: true
	**/
	var enabled : Bool;
}