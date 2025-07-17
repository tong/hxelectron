package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-response
**/
typedef ProtocolResponse = {
	/**
		When assigned, the `request` will fail with the `error` number . For the available error numbers you can use, please see the net error list.
	**/
	@:optional
	var error : Int;
	/**
		The HTTP response code, default is 200.
	**/
	@:optional
	var statusCode : Float;
	/**
		The charset of response body, default is `"utf-8"`.
	**/
	@:optional
	var charset : String;
	/**
		The MIME type of response body, default is `"text/html"`. Setting `mimeType` would implicitly set the `content-type` header in response, but if `content-type` is already set in `headers`, the `mimeType` would be ignored.
	**/
	@:optional
	var mimeType : String;
	/**
		An object containing the response headers. The keys must be string, and values must be either string or Array of string.
	**/
	@:optional
	var headers : Record;
	/**
		The response body. When returning stream as response, this is a Node.js readable stream representing the response body. When returning `Buffer` as response, this is a `Buffer`. When returning `string` as response, this is a `string`. This is ignored for other types of responses.
	**/
	@:optional
	var data : haxe.extern.EitherType<js.node.Buffer, haxe.extern.EitherType<String, js.node.stream.Readable<Dynamic>>>;
	/**
		Path to the file which would be sent as response body. This is only used for file responses.
	**/
	@:optional
	var path : String;
	/**
		Download the `url` and pipe the result as response body. This is only used for URL responses.
	**/
	@:optional
	var url : String;
	/**
		The `referrer` URL. This is only used for file and URL responses.
	**/
	@:optional
	var referrer : String;
	/**
		The HTTP `method`. This is only used for file and URL responses.
	**/
	@:optional
	var method : String;
	/**
		The session used for requesting URL. The HTTP request will reuse the current session by default.
	**/
	@:optional
	var session : electron.main.Session;
	/**
		The data used as upload data. This is only used for URL responses when `method` is `"POST"`.
	**/
	@:optional
	var uploadData : electron.ProtocolResponseUploadData;
}
