package electron.main;

/**
**/
@:require(js, electron) @:enum abstract ClientRequestEvent(String) from String to String {
	var response : String = "response";
	/**
		Emitted when an authenticating proxy is asking for user credentials. The callback function is expected to be called back with user credentials: Providing empty credentials will cancel the request and report an authentication error on the response object:
	**/
	var login : String = "login";
	/**
		Emitted just after the last chunk of the request's data has been written into the request object.
	**/
	var finish : String = "finish";
	/**
		Emitted when the request is aborted. The abort event will not be fired if the request is already closed.
	**/
	var abort : String = "abort";
	/**
		Emitted when the net module fails to issue a network request. Typically when the request object emits an error event, a close event will subsequently follow and no response object will be provided.
	**/
	var error : String = "error";
	/**
		Emitted as the last event in the HTTP request-response transaction. The close event indicates that no more events will be emitted on either the request or response objects.
	**/
	var close : String = "close";
}