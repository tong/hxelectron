package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-response
**/
typedef ProtocolResponse = {
	/**
		When assigned, the `request` will fail with the `error` number . For the available error numbers you can use, please see the net error list.
	**/
	var error : Int;
	/**
		The HTTP response code, default is 200.
	**/
	var statusCode : Float;
	/**
		The charset of response body, default is `"utf-8"`.
	**/
	var charset : String;
	/**
		The MIME type of response body, default is `"text/html"`. Setting `mimeType` would implicitly set the `content-type` header in response, but if `content-type` is already set in `headers`, the `mimeType` would be ignored.
	**/
	var mimeType : String;
	/**
		An object containing the response headers. The keys must be String, and values must be either String or Array of String.
	**/
	var headers : Record;
	/**
		The response body. When returning stream as response, this is a Node.js readable stream representing the response body. When returning `Buffer` as response, this is a `Buffer`. When returning `String` as response, this is a `String`. This is ignored for other types of responses.
	**/
	var data : haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, Dynamic>>;
	/**
		Path to the file which would be sent as response body. This is only used for file responses.
	**/
	var path : String;
	/**
		Download the `url` and pipe the result as response body. This is only used for URL responses.
	**/
	var url : String;
	/**
		The `referrer` URL. This is only used for file and URL responses.
	**/
	var referrer : String;
	/**
		The HTTP `method`. This is only used for file and URL responses.
	**/
	var method : String;
	/**
		The session used for requesting URL, by default the HTTP request will reuse the current session. Setting `session` to `null` would use a random independent session. This is only used for URL responses.
	**/
	var session : electron.main.Session;
	/**
		The data used as upload data. This is only used for URL responses when `method` is `"POST"`.
	**/
	var uploadData : electron.ProtocolResponseUploadData;
}
