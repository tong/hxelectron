package electron;
/**
	@see https://electronjs.org/docs/api/structures/scrubber-item
**/
typedef ScrubberItem = {
	/**
		The text to appear in this item.
	**/
	@:optional
	var label : String;
	/**
		The image to appear in this item.
	**/
	@:optional
	var icon : electron.NativeImage;
}
