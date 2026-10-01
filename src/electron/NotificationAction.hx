package electron;
/**
	@see https://electronjs.org/docs/api/structures/notification-action
**/
typedef NotificationAction = {
	/**
		The type of action, can be `button` or `selection`. `selection` is only supported on Windows.
	**/
	var type : String;
	/**
		The label for the given action.
	**/
	@:optional
	var text : String;
	/**
		The list of items for the `selection` action `type`.
	**/
	@:optional
	var items : Array<String>;
}
