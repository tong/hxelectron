package electron.main;

/**
	Handle responses to HTTP/HTTPS requests.

	See: <http://electron.atom.io/docs/api/incoming-message>
**/
@:require(js, electron) @:jsRequire("electron", "IncomingMessage") extern class IncomingMessage extends js.node.events.EventEmitter<electron.main.IncomingMessage> {
	/**
		An Integer indicating the HTTP response status code.
	**/
	var statusCode : Int;
	/**
		A String representing the HTTP status message.
	**/
	var statusMessage : String;
	/**
		An Object representing the response HTTP headers. The headers object is formatted as follows:
	**/
	var headers : Dynamic;
	/**
		A String indicating the HTTP protocol version number. Typical values are '1.0' or '1.1'. Additionally httpVersionMajor and httpVersionMinor are two Integer-valued readable properties that return respectively the HTTP major and minor version numbers.
	**/
	var httpVersion : String;
	/**
		An Integer indicating the HTTP protocol major version number.
	**/
	var httpVersionMajor : Int;
	/**
		An Integer indicating the HTTP protocol minor version number.
	**/
	var httpVersionMinor : Int;
}

/**
**/
@:require(js, electron) @:enum abstract IncomingMessageEvent(String) from String to String {
	/**
		The data event is the usual method of transferring response data into applicative code.
	**/
	var data : String = "data";
	/**
		Indicates that response body has ended.
	**/
	var end : String = "end";
	/**
		Emitted when a request has been canceled during an ongoing HTTP transaction.
	**/
	var aborted : String = "aborted";
	/**
		error Error - Typically holds an error string identifying failure root cause. Emitted when an error was encountered while streaming response data events. For instance, if the server closes the underlying while the response is still streaming, an error event will be emitted on the response object and a close event will subsequently follow on the request object.
	**/
	var error : String = "error";
}