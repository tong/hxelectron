package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/rectangle>
**/
@:require(js, electron) typedef Rectangle = {
	/**
		The x coordinate of the origin of the rectangle
	**/
	var x : Float;
	/**
		The y coordinate of the origin of the rectangle
	**/
	var y : Float;
	var width : Float;
	var height : Float;
}