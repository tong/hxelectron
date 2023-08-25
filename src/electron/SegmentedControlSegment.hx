package electron;
/**
	@see https://electronjs.org/docs/api/structures/segmented-control-segment
**/
typedef SegmentedControlSegment = {
	/**
		The text to appear in this segment.
	**/
	@:optional
	var label : String;
	/**
		The image to appear in this segment.
	**/
	@:optional
	var icon : electron.NativeImage;
	/**
		Whether this segment is selectable. Default: true.
	**/
	@:optional
	var enabled : Bool;
}
