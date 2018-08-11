package electron;
/**
	@see http://electron.atom.io/docs/api/structures/notification-action
**/
typedef NotificationAction = {
	/**
		The type of action, can be button.
	**/
	var type : String;
	/**
		The label for the given action.
	**/
	var text : String;
}
