package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "protocol") extern class Protocol {
	/**
		A standard scheme adheres to what RFC 3986 calls generic URI syntax. For example http and https are standard schemes, while file is not. Registering a scheme as standard, will allow relative and absolute resources to be resolved correctly when served. Otherwise the scheme will behave like the file protocol, but without the ability to resolve relative URLs. For example when you load following page with custom protocol without registering it as standard scheme, the image will not be loaded because non-standard schemes can not recognize relative URLs: Registering a scheme as standard will allow access to files through the FileSystem API. Otherwise the renderer will throw a security error for the scheme. By default web storage apis (localStorage, sessionStorage, webSQL, indexedDB, cookies) are disabled for non standard schemes. So in general if you want to register a custom protocol to replace the http protocol, you have to register it as a standard scheme: Note: This method can only be used before the ready event of the app module gets emitted.
	**/
	static function registerStandardSchemes(schemes:String, ?options:{ /**
		to register the scheme as secure. Default .
	**/
	@:optional
	var secure : Bool; }):Void;
	static function registerServiceWorkerSchemes(schemes:String):Void;
	/**
		Registers a protocol of scheme that will send the file as a response. The handler will be called with handler(request, callback) when a request is going to be created with scheme. completion will be called with completion(null) when scheme is successfully registered or completion(error) when failed. To handle the request, the callback should be called with either the file's path or an object that has a path property, e.g. callback(filePath) or callback({path: filePath}). When callback is called with nothing, a number, or an object that has an error property, the request will fail with the error number you specified. For the available error numbers you can use, please see the net error list. By default the scheme is treated like http:, which is parsed differently than protocols that follow the "generic URI syntax" like file:, so you probably want to call protocol.registerStandardSchemes to have your scheme treated as a standard scheme.
	**/
	static function registerFileProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Registers a protocol of scheme that will send a Buffer as a response. The usage is the same with registerFileProtocol, except that the callback should be called with either a Buffer object or an object that has the data, mimeType, and charset properties. Example:
	**/
	static function registerBufferProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Registers a protocol of scheme that will send a String as a response. The usage is the same with registerFileProtocol, except that the callback should be called with either a String or an object that has the data, mimeType, and charset properties.
	**/
	static function registerStringProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Registers a protocol of scheme that will send an HTTP request as a response. The usage is the same with registerFileProtocol, except that the callback should be called with a redirectRequest object that has the url, method, referrer, uploadData and session properties. By default the HTTP request will reuse the current session. If you want the request to have a different session you should set session to null. For POST requests the uploadData object must be provided.
	**/
	static function registerHttpProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Unregisters the custom protocol of scheme.
	**/
	static function unregisterProtocol(scheme:String, ?completion:haxe.Constraints.Function):Void;
	/**
		The callback will be called with a boolean that indicates whether there is already a handler for scheme.
	**/
	static function isProtocolHandled(scheme:String, callback:haxe.Constraints.Function):Void;
	/**
		Intercepts scheme protocol and uses handler as the protocol's new handler which sends a file as a response.
	**/
	static function interceptFileProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Intercepts scheme protocol and uses handler as the protocol's new handler which sends a String as a response.
	**/
	static function interceptStringProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Intercepts scheme protocol and uses handler as the protocol's new handler which sends a Buffer as a response.
	**/
	static function interceptBufferProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Intercepts scheme protocol and uses handler as the protocol's new handler which sends a new HTTP request as a response.
	**/
	static function interceptHttpProtocol(scheme:String, handler:haxe.Constraints.Function, ?completion:haxe.Constraints.Function):Void;
	/**
		Remove the interceptor installed for scheme and restore its original handler.
	**/
	static function uninterceptProtocol(scheme:String, ?completion:haxe.Constraints.Function):Void;
}