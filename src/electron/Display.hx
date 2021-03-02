package electron;
/**
	The `Display` object represents a physical display connected to the system. A fake `Display` may exist on a headless system, or a `Display` may correspond to a remote, virtual display.
	@see https://electronjs.org/docs/api/structures/display
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
		Can be `available`, `unavailable`, `unknown`.
	**/
	var touchSupport : String;
	/**
		Whether or not the display is a monochrome display.
	**/
	var monochrome : Bool;
	/**
		Can be `available`, `unavailable`, `unknown`.
	**/
	var accelerometerSupport : String;
	/**
		represent a color space (three-dimensional object which contains all realizable color combinations) for the purpose of color conversions
	**/
	var colorSpace : String;
	/**
		The number of bits per pixel.
	**/
	var colorDepth : Float;
	/**
		The number of bits per color component.
	**/
	var depthPerComponent : Float;
	/**
		The display refresh rate.
	**/
	var displayFrequency : Float;
	var bounds : electron.Rectangle;
	var size : electron.Size;
	var workArea : electron.Rectangle;
	var workAreaSize : electron.Size;
	/**
		`true` for an internal display and `false` for an external display
	**/
	var internal : Bool;
}
