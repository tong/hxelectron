package electron;
@:require(electron) typedef JumpListCategory = {
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
	var items : Array<JumpListItem>;
}