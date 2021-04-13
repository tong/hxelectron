package electron;
/**
	**Note:** If a `JumpListCategory` object has neither the `type` nor the `name` property set then its `type` is assumed to be `tasks`. If the `name` property is set but the `type` property is omitted then the `type` is assumed to be `custom`.
	
	**Note:** The maximum length of a Jump List item's `description` property is 260 characters. Beyond this limit, the item will not be added to the Jump List, nor will it be displayed.
	@see https://electronjs.org/docs/api/structures/jump-list-category
**/
typedef JumpListCategory = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		Must be set if `type` is `custom`, otherwise it should be omitted.
	**/
	var name : String;
	/**
		Array of `JumpListItem` objects if `type` is `tasks` or `custom`, otherwise it should be omitted.
	**/
	var items : Array<electron.JumpListItem>;
}
