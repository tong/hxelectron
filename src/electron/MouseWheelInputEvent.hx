package electron;
/**
	@see https://electronjs.org/docs/api/structures/mouse-wheel-input-event
**/
typedef MouseWheelInputEvent = { @:optional
	var deltaX : Int; @:optional
	var deltaY : Int; @:optional
	var wheelTicksX : Int; @:optional
	var wheelTicksY : Int; @:optional
	var accelerationRatioX : Int; @:optional
	var accelerationRatioY : Int; @:optional
	var hasPreciseScrollingDeltas : Bool; @:optional
	var canScroll : Bool; } & electron.MouseInputEvent;
