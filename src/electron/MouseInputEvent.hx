package electron;
/**
	@see https://electronjs.org/docs/api/structures/mouse-input-event
**/
typedef MouseInputEvent = {
	/**
		The type of the event, can be `mouseDown`, `mouseUp`, `mouseEnter`, `mouseLeave`, `contextMenu`, `mouseWheel` or `mouseMove`.
	**/
	var type : String;
	var x : Int;
	var y : Int;
	/**
		The button pressed, can be `left`, `middle`, `right`.
	**/
	@:optional
	var button : String;
	@:optional
	var globalX : Int;
	@:optional
	var globalY : Int;
	@:optional
	var movementX : Int;
	@:optional
	var movementY : Int;
	@:optional
	var clickCount : Int;
}
