package electron.main;

/**
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