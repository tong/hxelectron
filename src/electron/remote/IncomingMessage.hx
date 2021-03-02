package electron.remote;
/**
	@see https://electronjs.org/docs/api/incoming-message
**/
@:jsRequire("electron", "remote.IncomingMessage") extern class IncomingMessage extends js.node.events.EventEmitter<electron.remote.IncomingMessage> {
	/**
		An `Integer` indicating the HTTP response status code.
	**/
	var statusCode : Int;
	/**
		A `String` representing the HTTP status message.
	**/
	var statusMessage : String;
	/**
		A `Record<string, string | string[]>` representing the HTTP response headers. The `headers` object is formatted as follows:
		
		* All header names are lowercased.
		* Duplicates of `age`, `authorization`, `content-length`, `content-type`, `etag`, `expires`, `from`, `host`, `if-modified-since`, `if-unmodified-since`, `last-modified`, `location`, `max-forwards`, `proxy-authorization`, `referer`, `retry-after`, `server`, or `user-agent` are discarded.
		* `set-cookie` is always an array. Duplicates are added to the array.
		* For duplicate `cookie` headers, the values are joined together with '; '.
		* For all other headers, the values are joined together with ', '.
	**/
	var headers : Record;
	/**
		A `String` indicating the HTTP protocol version number. Typical values are '1.0' or '1.1'. Additionally `httpVersionMajor` and `httpVersionMinor` are two Integer-valued readable properties that return respectively the HTTP major and minor version numbers.
	**/
	var httpVersion : String;
	/**
		An `Integer` indicating the HTTP protocol major version number.
	**/
	var httpVersionMajor : Int;
	/**
		An `Integer` indicating the HTTP protocol minor version number.
	**/
	var httpVersionMinor : Int;
}
@:enum abstract IncomingMessageEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		The `data` event is the usual method of transferring response data into applicative code.
	**/
	var data : electron.remote.IncomingMessageEvent<Void -> Void> = "data";
	/**
		Indicates that response body has ended. Must be placed before 'data' event.
	**/
	var end : electron.remote.IncomingMessageEvent<Void -> Void> = "end";
	/**
		Emitted when a request has been canceled during an ongoing HTTP transaction.
	**/
	var aborted : electron.remote.IncomingMessageEvent<Void -> Void> = "aborted";
	/**
		Returns:
		
		`error` Error - Typically holds an error string identifying failure root cause.
		
		Emitted when an error was encountered while streaming response data events. For instance, if the server closes the underlying while the response is still streaming, an `error` event will be emitted on the response object and a `close` event will subsequently follow on the request object.
	**/
	var error : electron.remote.IncomingMessageEvent<Void -> Void> = "error";
}
