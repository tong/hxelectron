package electron;
/**
	@see https://electronjs.org/docs/api/structures/mouse-wheel-input-event
**/
typedef MouseWheelInputEvent = {
	/**
		The type of the event, can be `mouseWheel`.
	**/
	var type : String;
	var deltaX : Int;
	var deltaY : Int;
	var wheelTicksX : Int;
	var wheelTicksY : Int;
	var accelerationRatioX : Int;
	var accelerationRatioY : Int;
	var hasPreciseScrollingDeltas : Bool;
	var canScroll : Bool;
}
