package electron;
/**
	@see http://electronjs.org/docs/api/structures/jump-list-category
**/
typedef JumpListCategory = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		Must be set if type is custom, otherwise it should be omitted.
	**/
	var name : String;
	/**
		Array of objects if type is tasks or custom, otherwise it should be omitted.
	**/
	var items : Array<electron.JumpListItem>;
}
