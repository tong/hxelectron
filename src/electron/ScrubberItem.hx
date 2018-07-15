package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/scrubber-item>
**/
@:require(js, electron) @:electron typedef ScrubberItem = {
	/**
		The text to appear in this item
	**/
	var label : String;
	/**
		The image to appear in this item
	**/
	var icon : NativeImage;
}