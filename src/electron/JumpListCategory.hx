package electron;

/**
**/
@:require(js, electron) typedef JumpListCategory = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		(optional) Must be set if is , otherwise it should be omitted.
	**/
	@:optional
	var name : String;
	/**
		(optional) Array of objects if is or , otherwise it should be omitted.
	**/
	@:optional
	var items : Array<JumpListItem>;
}