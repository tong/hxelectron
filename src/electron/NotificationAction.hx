package electron;
/**
	@see https://electronjs.org/docs/api/structures/notification-action
**/
typedef NotificationAction = {
	/**
		The type of action, can be `button` or `selection`. `selection` is only supported on Windows.
	**/
	var type : NotificationActionType;
	/**
		The label for the given action.
	**/
	@:optional
	var text : String;
	/**
		The list of items for the `selection` action `type`.
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var items : Array<String>;
}
enum abstract NotificationActionType(String) from String to String {
	var button = "button";
	var selection = "selection";
}
