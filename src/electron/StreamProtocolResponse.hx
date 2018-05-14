package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/stream-protocol-response>
**/
@:require(js, electron) typedef StreamProtocolResponse = {
	/**
		The HTTP response code
	**/
	var statusCode : Float;
	/**
		An object containing the response headers
	**/
	var headers : { };
	/**
		A Node.js readable stream representing the response body
	**/
	var data : ReadableStream;
}