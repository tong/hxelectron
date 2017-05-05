package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/jump-list-category>
**/
@:require(js, electron) typedef JumpListCategory = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		Must be set if is , otherwise it should be omitted.
	**/
	var name : String;
	/**
		Array of objects if is or , otherwise it should be omitted.
	**/
	var items : JumpListItem;
}