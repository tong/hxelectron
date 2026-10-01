package electron;
/**
	@see https://electronjs.org/docs/api/structures/mouse-input-event
**/
typedef MouseInputEvent = { var x : Int; var y : Int; /**
		The button pressed, can be `left`, `middle`, `right`.
	**/
	@:optional
	var button : MouseInputEventButton; @:optional
	var globalX : Int; @:optional
	var globalY : Int; @:optional
	var movementX : Int; @:optional
	var movementY : Int; @:optional
	var clickCount : Int; } & electron.InputEvent;
enum abstract MouseInputEventButton(String) from String to String {
	var left = "left";
	var middle = "middle";
	var right = "right";
}
