package electron;
/**
	@see https://electronjs.org/docs/api/structures/web-source
**/
typedef WebSource = {
	var code : String;
	var url : String;
	/**
		Default is 1.
	**/
	var startLine : Int;
}
