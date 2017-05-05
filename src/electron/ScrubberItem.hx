package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/scrubber-item>
**/
@:require(js, electron) typedef ScrubberItem = {
	/**
		(Optional) The text to appear in this item
	**/
	var label : String;
	/**
		(Optional) The image to appear in this item
	**/
	var icon : NativeImage;
}