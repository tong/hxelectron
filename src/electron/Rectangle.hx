package electron;
/**
	@see https://electronjs.org/docs/api/structures/rectangle
**/
typedef Rectangle = {
	/**
		The x coordinate of the origin of the rectangle (must be an integer).
	**/
	var x : Float;
	/**
		The y coordinate of the origin of the rectangle (must be an integer).
	**/
	var y : Float;
	/**
		The width of the rectangle (must be an integer).
	**/
	var width : Float;
	/**
		The height of the rectangle (must be an integer).
	**/
	var height : Float;
}
