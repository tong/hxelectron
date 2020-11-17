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
	var button : String;
	var globalX : Int;
	var globalY : Int;
	var movementX : Int;
	var movementY : Int;
	var clickCount : Int;
}
