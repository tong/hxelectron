package electron;
/**
	@see https://electronjs.org/docs/api/structures/activation-arguments
**/
typedef ActivationArguments = {
	/**
		The type of activation that launched the app: `'click'`, `'action'`, or `'reply'`.
	**/
	var type : String;
	/**
		The raw activation arguments string from Windows.
	**/
	var arguments : String;
	/**
		For `'action'` type, the index of the button that was clicked.
	**/
	@:optional
	var actionIndex : Float;
	/**
		For `'reply'` type, the text the user entered in the reply field.
	**/
	@:optional
	var reply : String;
	/**
		A dictionary of all user inputs from the notification.
	**/
	@:optional
	var userInputs : Dynamic;
}
