package electron;
/**
	@see https://electronjs.org/docs/api/structures/notification-action
**/
typedef NotificationAction = {
	/**
		The type of action, can be `button`.
	**/
	var type : String;
	/**
		The label for the given action.
	**/
	var text : String;
}
