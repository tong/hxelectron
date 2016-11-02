package electron.main;

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