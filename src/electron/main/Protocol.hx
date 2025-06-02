package electron.main;
/**
	> Register a custom protocol and intercept existing protocol requests.
	
	Process: Main
	
	An example of implementing a protocol that has the same effect as the `file://` protocol:
	
	```
	const { app, protocol, net } = require('electron')
	const path = require('node:path')
	const url = require('node:url')
	
	app.whenReady().then(() => {
	  protocol.handle('atom', (request) => {
	    const filePath = request.url.slice('atom://'.length)
	    return net.fetch(url.pathToFileURL(path.join(__dirname, filePath)).toString())
	  })
	})
	```
	
	> [!NOTE] All methods unless specified can only be used after the `ready` event of the `app` module gets emitted.
	
	### Using `protocol` with a custom `partition` or `session`
	
	A protocol is registered to a specific Electron `session` object. If you don't specify a session, then your `protocol` will be applied to the default session that Electron uses. However, if you define a `partition` or `session` on your `browserWindow`'s `webPreferences`, then that window will use a different session and your custom protocol will not work if you just use `electron.protocol.XXX`.
	
	To have your custom protocol work in combination with a custom session, you need to register it to that session explicitly.
	
	```
	const { app, BrowserWindow, net, protocol, session } = require('electron')
	const path = require('node:path')
	const url = require('url')
	
	app.whenReady().then(() => {
	  const partition = 'persist:example'
	  const ses = session.fromPartition(partition)
	
	  ses.protocol.handle('atom', (request) => {
	    const filePath = request.url.slice('atom://'.length)
	    return net.fetch(url.pathToFileURL(path.resolve(__dirname, filePath)).toString())
	  })
	
	  const mainWindow = new BrowserWindow({ webPreferences: { partition } })
	})
	```
	@see https://electronjs.org/docs/api/protocol
**/
@:jsRequire("electron", "protocol") extern class Protocol extends js.node.events.EventEmitter<electron.main.Protocol> {
	/**
		> [!NOTE] This method can only be used before the `ready` event of the `app` module gets emitted and can be called only once.
		
		Registers the `scheme` as standard, secure, bypasses content security policy for resources, allows registering ServiceWorker, supports fetch API, streaming video/audio, and V8 code cache. Specify a privilege with the value of `true` to enable the capability.
		
		An example of registering a privileged scheme, that bypasses Content Security Policy:
		
		A standard scheme adheres to what RFC 3986 calls generic URI syntax. For example `http` and `https` are standard schemes, while `file` is not.
		
		Registering a scheme as standard allows relative and absolute resources to be resolved correctly when served. Otherwise the scheme will behave like the `file` protocol, but without the ability to resolve relative URLs.
		
		For example when you load following page with custom protocol without registering it as standard scheme, the image will not be loaded because non-standard schemes can not recognize relative URLs:
		
		Registering a scheme as standard will allow access to files through the FileSystem API. Otherwise the renderer will throw a security error for the scheme.
		
		By default web storage apis (localStorage, sessionStorage, webSQL, indexedDB, cookies) are disabled for non standard schemes. So in general if you want to register a custom protocol to replace the `http` protocol, you have to register it as a standard scheme.
		
		Protocols that use streams (http and stream protocols) should set `stream: true`. The `<video>` and `<audio>` HTML elements expect protocols to buffer their responses by default. The `stream` flag configures those elements to correctly expect streaming responses.
	**/
	static function registerSchemesAsPrivileged(customSchemes:Array<electron.CustomScheme>):Void;
	/**
		Register a protocol handler for `scheme`. Requests made to URLs with this scheme will delegate to this handler to determine what response should be sent.
		
		Either a `Response` or a `Promise<Response>` can be returned.
		
		Example:
		
		See the MDN docs for `Request` and `Response` for more details.
	**/
	static function handle(scheme:String, handler:haxe.Constraints.Function):Void;
	/**
		Removes a protocol handler registered with `protocol.handle`.
	**/
	static function unhandle(scheme:String):Void;
	/**
		Whether `scheme` is already handled.
	**/
	static function isProtocolHandled(scheme:String):Bool;
	/**
		Whether the protocol was successfully registered
		
		Registers a protocol of `scheme` that will send a file as the response. The `handler` will be called with `request` and `callback` where `request` is an incoming request for the `scheme`.
		
		To handle the `request`, the `callback` should be called with either the file's path or an object that has a `path` property, e.g. `callback(filePath)` or `callback({ path: filePath })`. The `filePath` must be an absolute path.
		
		By default the `scheme` is treated like `http:`, which is parsed differently from protocols that follow the "generic URI syntax" like `file:`.
	**/
	static function registerFileProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully registered
		
		Registers a protocol of `scheme` that will send a `Buffer` as a response.
		
		The usage is the same with `registerFileProtocol`, except that the `callback` should be called with either a `Buffer` object or an object that has the `data` property.
		
		Example:
	**/
	static function registerBufferProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully registered
		
		Registers a protocol of `scheme` that will send a `string` as a response.
		
		The usage is the same with `registerFileProtocol`, except that the `callback` should be called with either a `string` or an object that has the `data` property.
	**/
	static function registerStringProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully registered
		
		Registers a protocol of `scheme` that will send an HTTP request as a response.
		
		The usage is the same with `registerFileProtocol`, except that the `callback` should be called with an object that has the `url` property.
	**/
	static function registerHttpProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully registered
		
		Registers a protocol of `scheme` that will send a stream as a response.
		
		The usage is the same with `registerFileProtocol`, except that the `callback` should be called with either a `ReadableStream` object or an object that has the `data` property.
		
		Example:
		
		It is possible to pass any object that implements the readable stream API (emits `data`/`end`/`error` events). For example, here's how a file could be returned:
	**/
	static function registerStreamProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully unregistered
		
		Unregisters the custom protocol of `scheme`.
	**/
	static function unregisterProtocol(scheme:String):Bool;
	/**
		Whether `scheme` is already registered.
	**/
	static function isProtocolRegistered(scheme:String):Bool;
	/**
		Whether the protocol was successfully intercepted
		
		Intercepts `scheme` protocol and uses `handler` as the protocol's new handler which sends a file as a response.
	**/
	static function interceptFileProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully intercepted
		
		Intercepts `scheme` protocol and uses `handler` as the protocol's new handler which sends a `string` as a response.
	**/
	static function interceptStringProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully intercepted
		
		Intercepts `scheme` protocol and uses `handler` as the protocol's new handler which sends a `Buffer` as a response.
	**/
	static function interceptBufferProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully intercepted
		
		Intercepts `scheme` protocol and uses `handler` as the protocol's new handler which sends a new HTTP request as a response.
	**/
	static function interceptHttpProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully intercepted
		
		Same as `protocol.registerStreamProtocol`, except that it replaces an existing protocol handler.
	**/
	static function interceptStreamProtocol(scheme:String, handler:haxe.Constraints.Function):Bool;
	/**
		Whether the protocol was successfully unintercepted
		
		Remove the interceptor installed for `scheme` and restore its original handler.
	**/
	static function uninterceptProtocol(scheme:String):Bool;
	/**
		Whether `scheme` is already intercepted.
	**/
	static function isProtocolIntercepted(scheme:String):Bool;
}
enum abstract ProtocolEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
