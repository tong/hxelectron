package electron;
/**
	@see http://electronjs.org/docs/api/structures/display
**/
typedef Display = {
	/**
		Unique identifier associated with the display.
	**/
	var id : Float;
	/**
		Can be 0, 90, 180, 270, represents screen rotation in clock-wise degrees.
	**/
	var rotation : Float;
	/**
		Output device's pixel scale factor.
	**/
	var scaleFactor : Float;
	/**
		Can be available, unavailable, unknown.
	**/
	var touchSupport : String;
	var bounds : electron.Rectangle;
	var size : electron.Size;
	var workArea : electron.Rectangle;
	var workAreaSize : electron.Size;
}
