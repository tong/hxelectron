package electron;
/**
	@see http://electronjs.org/docs/api/structures/stream-protocol-response
**/
typedef StreamProtocolResponse = {
	/**
		The HTTP response code.
	**/
	var statusCode : Float;
	/**
		An object containing the response headers.
	**/
	var headers : Record;
	/**
		A Node.js readable stream representing the response body.
	**/
	var data : haxe.extern.EitherType<Dynamic, Dynamic>;
}
