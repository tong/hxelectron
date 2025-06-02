package electron;
/**
	@see https://electronjs.org/docs/api/structures/input-event
**/
typedef InputEvent = {
	/**
		Can be `undefined`, `mouseDown`, `mouseUp`, `mouseMove`, `mouseEnter`, `mouseLeave`, `contextMenu`, `mouseWheel`, `rawKeyDown`, `keyDown`, `keyUp`, `char`, `gestureScrollBegin`, `gestureScrollEnd`, `gestureScrollUpdate`, `gestureFlingStart`, `gestureFlingCancel`, `gesturePinchBegin`, `gesturePinchEnd`, `gesturePinchUpdate`, `gestureTapDown`, `gestureShowPress`, `gestureTap`, `gestureTapCancel`, `gestureShortPress`, `gestureLongPress`, `gestureLongTap`, `gestureTwoFingerTap`, `gestureTapUnconfirmed`, `gestureDoubleTap`, `touchStart`, `touchMove`, `touchEnd`, `touchCancel`, `touchScrollStarted`, `pointerDown`, `pointerUp`, `pointerMove`, `pointerRawUpdate`, `pointerCancel` or `pointerCausedUaAction`.
	**/
	var type : String;
	/**
		An array of modifiers of the event, can be `shift`, `control`, `ctrl`, `alt`, `meta`, `command`, `cmd`, `iskeypad`, `isautorepeat`, `leftbuttondown`, `middlebuttondown`, `rightbuttondown`, `capslock`, `numlock`, `left`, `right`.
	**/
	@:optional
	var modifiers : Array<String>;
}
