package electron.remote;
/**
	> Make HTTP/HTTPS requests.
	
	Process: Main, Utility<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	
	`ClientRequest` implements the Writable Stream interface and is therefore an EventEmitter.
	@see https://electronjs.org/docs/api/client-request
**/
@:jsRequire("electron", "remote.ClientRequest") extern class ClientRequest extends js.node.events.EventEmitter<electron.remote.ClientRequest> {
	/**
		A `boolean` specifying whether the request will use HTTP chunked transfer encoding or not. Defaults to false. The property is readable and writable, however it can be set only before the first write operation as the HTTP headers are not yet put on the wire. Trying to set the `chunkedEncoding` property after the first write will throw an error.
		
		Using chunked encoding is strongly recommended if you need to send a large request body as data will be streamed in small chunks instead of being internally buffered inside Electron process memory.
	**/
	var chunkedEncoding : Bool;
	function new(options:haxe.extern.EitherType<{ /**
		The HTTP request method. Defaults to the GET method.
	**/
	@:optional
	var method : String; /**
		The request URL. Must be provided in the absolute form with the protocol scheme specified as http or https.
	**/
	@:optional
	var url : String; /**
		The `Session` instance with which the request is associated.
	**/
	@:optional
	var session : electron.remote.Session; /**
		The name of the `partition` with which the request is associated. Defaults to the empty string. The `session` option supersedes `partition`. Thus if a `session` is explicitly specified, `partition` is ignored.
	**/
	@:optional
	var partition : String; /**
		Can be `include`, `omit` or `same-origin`. Whether to send credentials with this request. If set to `include`, credentials from the session associated with the request will be used. If set to `omit`, credentials will not be sent with the request (and the `'login'` event will not be triggered in the event of a 401). If set to `same-origin`, `origin` must also be specified. This matches the behavior of the fetch option of the same name. If this option is not specified, authentication data from the session will be sent, and cookies will not be sent (unless `useSessionCookies` is set).
	**/
	@:optional
	var credentials : String; /**
		Whether to send cookies with this request from the provided session. If `credentials` is specified, this option has no effect. Default is `false`.
	**/
	@:optional
	var useSessionCookies : Bool; /**
		Can be `http:` or `https:`. The protocol scheme in the form 'scheme:'. Defaults to 'http:'.
	**/
	@:optional
	var protocol : String; /**
		The server host provided as a concatenation of the hostname and the port number 'hostname:port'.
	**/
	@:optional
	var host : String; /**
		The server host name.
	**/
	@:optional
	var hostname : String; /**
		The server's listening port number.
	**/
	@:optional
	var port : Int; /**
		The path part of the request URL.
	**/
	@:optional
	var path : String; /**
		Can be `follow`, `error` or `manual`. The redirect mode for this request. When mode is `error`, any redirection will be aborted. When mode is `manual` the redirection will be cancelled unless `request.followRedirect` is invoked synchronously during the `redirect` event.  Defaults to `follow`.
	**/
	@:optional
	var redirect : String; /**
		The origin URL of the request.
	**/
	@:optional
	var origin : String; /**
		can be `""`, `no-referrer`, `no-referrer-when-downgrade`, `origin`, `origin-when-cross-origin`, `unsafe-url`, `same-origin`, `strict-origin`, or `strict-origin-when-cross-origin`. Defaults to `strict-origin-when-cross-origin`.
	**/
	@:optional
	var referrerPolicy : String; /**
		can be `default`, `no-store`, `reload`, `no-cache`, `force-cache` or `only-if-cached`.
	**/
	@:optional
	var cache : String; }, String>):Void;
	/**
		Adds an extra HTTP header. The header name will be issued as-is without lowercasing. It can be called only before first write. Calling this method after the first write will throw an error. If the passed value is not a `string`, its `toString()` method will be called to obtain the final value.
		
		Certain headers are restricted from being set by apps. These headers are listed below. More information on restricted headers can be found in Chromium's header utils.
		
		* `Content-Length`
		* `Host`
		* `Trailer` or `Te`
		* `Upgrade`
		* `Cookie2`
		* `Keep-Alive`
		* `Transfer-Encoding`
		
		Additionally, setting the `Connection` header to the value `upgrade` is also disallowed.
	**/
	function setHeader(name:String, value:String):Void;
	/**
		The value of a previously set extra header name.
	**/
	function getHeader(name:String):String;
	/**
		Removes a previously set extra header name. This method can be called only before first write. Trying to call it after the first write will throw an error.
	**/
	function removeHeader(name:String):Void;
	/**
		`callback` is essentially a dummy function introduced in the purpose of keeping similarity with the Node.js API. It is called asynchronously in the next tick after `chunk` content have been delivered to the Chromium networking layer. Contrary to the Node.js implementation, it is not guaranteed that `chunk` content have been flushed on the wire before `callback` is called.
		
		Adds a chunk of data to the request body. The first write operation may cause the request headers to be issued on the wire. After the first write operation, it is not allowed to add or remove a custom header.
	**/
	function write(chunk:haxe.extern.EitherType<String, js.node.Buffer>, ?encoding:String, ?callback:haxe.Constraints.Function):Void;
	/**
		Sends the last chunk of the request data. Subsequent write or end operations will not be allowed. The `finish` event is emitted just after the end operation.
	**/
	function end(?chunk:haxe.extern.EitherType<String, js.node.Buffer>, ?encoding:String, ?callback:haxe.Constraints.Function):Dynamic;
	/**
		Cancels an ongoing HTTP transaction. If the request has already emitted the `close` event, the abort operation will have no effect. Otherwise an ongoing event will emit `abort` and `close` events. Additionally, if there is an ongoing response object,it will emit the `aborted` event.
	**/
	function abort():Void;
	/**
		Continues any pending redirection. Can only be called during a `'redirect'` event.
	**/
	function followRedirect():Void;
	/**
		* `active` boolean - Whether the request is currently active. If this is false no other properties will be set
		* `started` boolean - Whether the upload has started. If this is false both `current` and `total` will be set to 0.
		* `current` Integer - The number of bytes that have been uploaded so far
		* `total` Integer - The number of bytes that will be uploaded this request
		
		You can use this method in conjunction with `POST` requests to get the progress of a file upload or other data transfer.
	**/
	function getUploadProgress():Any;
}
enum abstract ClientRequestEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	var response : electron.remote.ClientRequestEvent<Void -> Void> = "response";
	/**
		Emitted when an authenticating proxy is asking for user credentials.
		
		The `callback` function is expected to be called back with user credentials:
		
		* `username` string
		* `password` string
		
		Providing empty credentials will cancel the request and report an authentication error on the response object:
	**/
	var login : electron.remote.ClientRequestEvent<Void -> Void> = "login";
	/**
		Emitted just after the last chunk of the `request`'s data has been written into the `request` object.
	**/
	var finish : electron.remote.ClientRequestEvent<Void -> Void> = "finish";
	/**
		Emitted when the `request` is aborted. The `abort` event will not be fired if the `request` is already closed.
	**/
	var abort : electron.remote.ClientRequestEvent<Void -> Void> = "abort";
	/**
		Emitted when the `net` module fails to issue a network request. Typically when the `request` object emits an `error` event, a `close` event will subsequently follow and no response object will be provided.
	**/
	var error : electron.remote.ClientRequestEvent<Void -> Void> = "error";
	/**
		Emitted as the last event in the HTTP request-response transaction. The `close` event indicates that no more events will be emitted on either the `request` or `response` objects.
	**/
	var close : electron.remote.ClientRequestEvent<Void -> Void> = "close";
	/**
		Emitted when the server returns a redirect response (e.g. 301 Moved Permanently). Calling `request.followRedirect` will continue with the redirection.  If this event is handled, `request.followRedirect` must be called **synchronously**, otherwise the request will be cancelled.
	**/
	var redirect : electron.remote.ClientRequestEvent<Void -> Void> = "redirect";
}
