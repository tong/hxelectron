package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/rectangle>
**/
@:require(js, electron) @:electron typedef Rectangle = {
	/**
		The x coordinate of the origin of the rectangle (must be an integer)
	**/
	var x : Float;
	/**
		The y coordinate of the origin of the rectangle (must be an integer)
	**/
	var y : Float;
	/**
		The width of the rectangle (must be an integer)
	**/
	var width : Float;
	/**
		The height of the rectangle (must be an integer)
	**/
	var height : Float;
}