package electron;
/**
	@see https://electronjs.org/docs/api/structures/file-path-with-headers
**/
typedef FilePathWithHeaders = {
	/**
		The path to the file to send.
	**/
	var path : String;
	/**
		Additional headers to be sent.
	**/
	var headers : Record;
}
