package electron;
/**
	@see https://electronjs.org/docs/api/structures/input-event
**/
typedef InputEvent = {
	/**
		Can be `undefined`, `mouseDown`, `mouseUp`, `mouseMove`, `mouseEnter`, `mouseLeave`, `contextMenu`, `mouseWheel`, `rawKeyDown`, `keyDown`, `keyUp`, `char`, `gestureScrollBegin`, `gestureScrollEnd`, `gestureScrollUpdate`, `gestureFlingStart`, `gestureFlingCancel`, `gesturePinchBegin`, `gesturePinchEnd`, `gesturePinchUpdate`, `gestureTapDown`, `gestureShowPress`, `gestureTap`, `gestureTapCancel`, `gestureShortPress`, `gestureLongPress`, `gestureLongTap`, `gestureTwoFingerTap`, `gestureTapUnconfirmed`, `gestureDoubleTap`, `touchStart`, `touchMove`, `touchEnd`, `touchCancel`, `touchScrollStarted`, `pointerDown`, `pointerUp`, `pointerMove`, `pointerRawUpdate`, `pointerCancel` or `pointerCausedUaAction`.
	**/
	var type : InputEventType;
	/**
		An array of modifiers of the event, can be `shift`, `control`, `ctrl`, `alt`, `meta`, `command`, `cmd`, `iskeypad`, `isautorepeat`, `leftbuttondown`, `middlebuttondown`, `rightbuttondown`, `capslock`, `numlock`, `left`, `right`.
	**/
	@:optional
	var modifiers : Array<InputEventModifiers>;
}
enum abstract InputEventType(String) from String to String {
	var undefined = "undefined";
	var mouseDown = "mouseDown";
	var mouseUp = "mouseUp";
	var mouseMove = "mouseMove";
	var mouseEnter = "mouseEnter";
	var mouseLeave = "mouseLeave";
	var contextMenu = "contextMenu";
	var mouseWheel = "mouseWheel";
	var rawKeyDown = "rawKeyDown";
	var keyDown = "keyDown";
	var keyUp = "keyUp";
	var char = "char";
	var gestureScrollBegin = "gestureScrollBegin";
	var gestureScrollEnd = "gestureScrollEnd";
	var gestureScrollUpdate = "gestureScrollUpdate";
	var gestureFlingStart = "gestureFlingStart";
	var gestureFlingCancel = "gestureFlingCancel";
	var gesturePinchBegin = "gesturePinchBegin";
	var gesturePinchEnd = "gesturePinchEnd";
	var gesturePinchUpdate = "gesturePinchUpdate";
	var gestureTapDown = "gestureTapDown";
	var gestureShowPress = "gestureShowPress";
	var gestureTap = "gestureTap";
	var gestureTapCancel = "gestureTapCancel";
	var gestureShortPress = "gestureShortPress";
	var gestureLongPress = "gestureLongPress";
	var gestureLongTap = "gestureLongTap";
	var gestureTwoFingerTap = "gestureTwoFingerTap";
	var gestureTapUnconfirmed = "gestureTapUnconfirmed";
	var gestureDoubleTap = "gestureDoubleTap";
	var touchStart = "touchStart";
	var touchMove = "touchMove";
	var touchEnd = "touchEnd";
	var touchCancel = "touchCancel";
	var touchScrollStarted = "touchScrollStarted";
	var pointerDown = "pointerDown";
	var pointerUp = "pointerUp";
	var pointerMove = "pointerMove";
	var pointerRawUpdate = "pointerRawUpdate";
	var pointerCancel = "pointerCancel";
	var pointerCausedUaAction = "pointerCausedUaAction";
}
enum abstract InputEventModifiers(String) from String to String {
	var shift = "shift";
	var control = "control";
	var ctrl = "ctrl";
	var alt = "alt";
	var meta = "meta";
	var command = "command";
	var cmd = "cmd";
	var iskeypad = "iskeypad";
	var isautorepeat = "isautorepeat";
	var leftbuttondown = "leftbuttondown";
	var middlebuttondown = "middlebuttondown";
	var rightbuttondown = "rightbuttondown";
	var capslock = "capslock";
	var numlock = "numlock";
	var left = "left";
	var right = "right";
}
