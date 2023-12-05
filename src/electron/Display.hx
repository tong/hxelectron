package electron;
/**
	The `Display` object represents a physical display connected to the system. A fake `Display` may exist on a headless system, or a `Display` may correspond to a remote, virtual display.
	@see https://electronjs.org/docs/api/structures/display
**/
typedef Display = {
	/**
		Can be `available`, `unavailable`, `unknown`.
	**/
	var accelerometerSupport : String;
	/**
		the bounds of the display in DIP points.
	**/
	var bounds : electron.Rectangle;
	/**
		The number of bits per pixel.
	**/
	var colorDepth : Float;
	/**
		represent a color space (three-dimensional object which contains all realizable color combinations) for the purpose of color conversions.
	**/
	var colorSpace : String;
	/**
		The number of bits per color component.
	**/
	var depthPerComponent : Float;
	/**
		`true`` if the display is detected by the system.
	**/
	var detected : Bool;
	/**
		The display refresh rate.
	**/
	var displayFrequency : Float;
	/**
		Unique identifier associated with the display. A value of of -1 means the display is invalid or the correct `id` is not yet known, and a value of -10 means the display is a virtual display assigned to a unified desktop.
	**/
	var id : Float;
	/**
		`true` for an internal display and `false` for an external display.
	**/
	var internal : Bool;
	/**
		User-friendly label, determined by the platform.
	**/
	var label : String;
	/**
		Maximum cursor size in native pixels.
	**/
	var maximumCursorSize : electron.Size;
	/**
		Returns the display's origin in pixel coordinates. Only available on windowing systems like X11 that position displays in pixel coordinates.
	**/
	var nativeOrigin : electron.Point;
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
	var size : electron.Size;
	/**
		the work area of the display in DIP points.
	**/
	var workArea : electron.Rectangle;
	/**
		The size of the work area.
	**/
	var workAreaSize : electron.Size;
}
