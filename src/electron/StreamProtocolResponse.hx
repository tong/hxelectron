package electron;
/**
	@see http://electron.atom.io/docs/api/structures/stream-protocol-response
**/
typedef StreamProtocolResponse = {
	/**
		The HTTP response code
	**/
	var statusCode : Float;
	/**
		An object containing the response headers
	**/
	var headers : Any;
	/**
		A Node.js readable stream representing the response body
	**/
	var data : Dynamic;
}
