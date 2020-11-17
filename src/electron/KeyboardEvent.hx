package electron;
/**
	@see https://electronjs.org/docs/api/structures/keyboard-event
**/
typedef KeyboardEvent = {
	/**
		whether the Control key was used in an accelerator to trigger the Event
	**/
	var ctrlKey : Bool;
	/**
		whether a meta key was used in an accelerator to trigger the Event
	**/
	var metaKey : Bool;
	/**
		whether a Shift key was used in an accelerator to trigger the Event
	**/
	var shiftKey : Bool;
	/**
		whether an Alt key was used in an accelerator to trigger the Event
	**/
	var altKey : Bool;
	/**
		whether an accelerator was used to trigger the event as opposed to another user gesture like mouse click
	**/
	var triggeredByAccelerator : Bool;
}
