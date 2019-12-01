package electron;
/**
	@see http://electronjs.org/docs/api/structures/string-protocol-response
**/
typedef StringProtocolResponse = {
	/**
		MIME type of the response.
	**/
	var mimeType : String;
	/**
		Charset of the response.
	**/
	var charset : String;
	/**
		A string representing the response body.
	**/
	var data : haxe.extern.EitherType<Dynamic, Dynamic>;
}
