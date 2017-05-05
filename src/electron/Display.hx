package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/display>
**/
@:require(js, electron) typedef Display = {
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
		Can be , , .
	**/
	var touchSupport : String;
	var bounds : Rectangle;
	var size : Size;
	var workArea : Rectangle;
	var workAreaSize : Size;
}