package electron;
/**
	@see https://electronjs.org/docs/api/structures/scrubber-item
**/
typedef ScrubberItem = {
	/**
		The text to appear in this item.
	**/
	var label : String;
	/**
		The image to appear in this item.
	**/
	var icon : electron.NativeImage;
}
