package electron;
/**
	@see https://electronjs.org/docs/api/structures/keyboard-input-event
**/
typedef KeyboardInputEvent = { /**
		The character that will be sent as the keyboard event. Should only use valid Accelerator key codes.
	**/
	var keyCode : String; } & electron.InputEvent;
