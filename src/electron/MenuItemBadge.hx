package electron;
/**
	If you use one of the predefined badge types (not `none`), the system localizes and pluralizes the badge for you. If you create your own custom badge string, you need to localize and pluralize that string yourself.
	@see https://electronjs.org/docs/api/structures/menu-item-badge
**/
typedef MenuItemBadge = {
	/**
		Can be `alerts`, `updates`, `new-items` or `none`. Default is `none`. See Creating badges of a specific type for further explanation of these types.
	**/
	@:optional
	var type : MenuItemBadgeType;
	/**
		The number of items the badge displays. Required for the `alerts`, `updates` and `new-items` types; cannot be used with `none`.
	**/
	@:optional
	var count : Float;
	/**
		A custom string to display in the badge. Required for, and only usable with, the `none` type.
	**/
	@:optional
	var content : String;
}
enum abstract MenuItemBadgeType(String) from String to String {
	var alerts = "alerts";
	var updates = "updates";
	var new_items = "new-items";
	var none = "none";
}
