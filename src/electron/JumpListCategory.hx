package electron;
/**
	> [!NOTE] If a `JumpListCategory` object has neither the `type` nor the `name` property set then its `type` is assumed to be `tasks`. If the `name` property is set but the `type` property is omitted then the `type` is assumed to be `custom`.
	
	> [!NOTE] The maximum length of a Jump List item's `description` property is 260 characters. Beyond this limit, the item will not be added to the Jump List, nor will it be displayed.
	@see https://electronjs.org/docs/api/structures/jump-list-category
**/
typedef JumpListCategory = {
	/**
		One of the following:
	**/
	@:optional
	var type : JumpListCategoryType;
	/**
		Must be set if `type` is `custom`, otherwise it should be omitted.
	**/
	@:optional
	var name : String;
	/**
		Array of `JumpListItem` objects if `type` is `tasks` or `custom`, otherwise it should be omitted.
	**/
	@:optional
	var items : Array<electron.JumpListItem>;
}
enum abstract JumpListCategoryType(String) from String to String {
	/**
		Items in this category will be placed into the standard `Tasks` category. There can be only one such category, and it will always be displayed at the bottom of the Jump List.
	**/
	var tasks = "tasks";
	/**
		Displays a list of files frequently opened by the app, the name of the category and its items are set by Windows.
	**/
	var frequent = "frequent";
	/**
		Displays a list of files recently opened by the app, the name of the category and its items are set by Windows. Items may be added to this category indirectly using `app.addRecentDocument(path)`.
	**/
	var recent = "recent";
	/**
		Displays tasks or file links, `name` must be set by the app.
	**/
	var custom = "custom";
}
