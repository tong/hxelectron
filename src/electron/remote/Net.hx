package electron.remote;
/**
	> Issue HTTP/HTTPS requests using Chromium's native networking library
	
	Process: Main, Utility
	
	The `net` module is a client-side API for issuing HTTP(S) requests. It is similar to the HTTP and HTTPS modules of Node.js but uses Chromium's native networking library instead of the Node.js implementation, offering better support for web proxies. It also supports checking network status.
	
	The following is a non-exhaustive list of why you may consider using the `net` module instead of the native Node.js modules:
	
	* Automatic management of system proxy configuration, support of the wpad protocol and proxy pac configuration files.
	* Automatic tunneling of HTTPS requests.
	* Support for authenticating proxies using basic, digest, NTLM, Kerberos or negotiate authentication schemes.
	* Support for traffic monitoring proxies: Fiddler-like proxies used for access control and monitoring.
	
	The API components (including classes, methods, properties and event names) are similar to those used in Node.js.
	
	Example usage:
	
	```
	const { app } = require('electron')
	app.whenReady().then(() => {
	  const { net } = require('electron')
	  const request = net.request('https://github.com')
	  request.on('response', (response) => {
	    console.log(`STATUS: ${response.statusCode}`)
	    console.log(`HEADERS: ${JSON.stringify(response.headers)}`)
	    response.on('data', (chunk) => {
	      console.log(`BODY: ${chunk}`)
	    })
	    response.on('end', () => {
	      console.log('No more data in response.')
	    })
	  })
	  request.end()
	})
	```
	
	The `net` API can be used only after the application emits the `ready` event. Trying to use the module before the `ready` event will throw an error.
	@see https://electronjs.org/docs/api/net
**/
@:jsRequire("electron", "remote.net") extern class Net extends js.node.events.EventEmitter<electron.remote.Net> {
	/**
		A `boolean` property. Whether there is currently internet connection.
		
		A return value of `false` is a pretty strong indicator that the user won't be able to connect to remote sites. However, a return value of `true` is inconclusive; even if some link is up, it is uncertain whether a particular connection attempt to a particular remote site will be successful.
	**/
	static var online : Bool;
	/**
		Creates a `ClientRequest` instance using the provided `options` which are directly forwarded to the `ClientRequest` constructor. The `net.request` method would be used to issue both secure and insecure HTTP requests according to the specified protocol scheme in the `options` object.
	**/
	static function request(options:haxe.extern.EitherType<ClientRequestConstructorOptions, String>):electron.remote.ClientRequest;
	/**
		see Response.
		
		Sends a request, similarly to how `fetch()` works in the renderer, using Chrome's network stack. This differs from Node's `fetch()`, which uses Node.js's HTTP stack.
		
		Example:
		
		This method will issue requests from the default session. To send a `fetch` request from another session, use ses.fetch().
		
		See the MDN documentation for `fetch()` for more details.
		
		Limitations:
		
		* `net.fetch()` does not support the `data:` or `blob:` schemes.
		* The value of the `integrity` option is ignored.
		* The `.type` and `.url` values of the returned `Response` object are incorrect.
		
		By default, requests made with `net.fetch` can be made to custom protocols as well as `file:`, and will trigger webRequest handlers if present. When the non-standard `bypassCustomProtocolHandlers` option is set in RequestInit, custom protocol handlers will not be called for this request. This allows forwarding an intercepted request to the built-in handler. webRequest handlers will still be triggered when bypassing custom protocols.
		
		Note: in the utility process custom protocols are not supported.
	**/
	static function fetch(input:haxe.extern.EitherType<String, GlobalRequest>, ?init:RequestInit):js.lib.Promise<Any>;
	/**
		Whether there is currently internet connection.
		
		A return value of `false` is a pretty strong indicator that the user won't be able to connect to remote sites. However, a return value of `true` is inconclusive; even if some link is up, it is uncertain whether a particular connection attempt to a particular remote site will be successful.
	**/
	static function isOnline():Bool;
	/**
		Resolves with the resolved IP addresses for the `host`.
		
		This method will resolve hosts from the default session. To resolve a host from another session, use ses.resolveHost().
	**/
	static function resolveHost(host:String, ?options:{ /**
		Requested DNS query type. If unspecified, resolver will pick A or AAAA (or both) based on IPv4/IPv6 settings:
	**/
	@:optional
	var queryType : String; /**
		The source to use for resolved addresses. Default allows the resolver to pick an appropriate source. Only affects use of big external sources (e.g. calling the system for resolution or using DNS). Even if a source is specified, results can still come from cache, resolving "localhost" or IP literals, etc. One of the following values:
	**/
	@:optional
	var source : String; /**
		Indicates what DNS cache entries, if any, can be used to provide a response. One of the following values:
	**/
	@:optional
	var cacheUsage : String; /**
		Controls the resolver's Secure DNS behavior for this request. One of the following values:
	**/
	@:optional
	var secureDnsPolicy : String; }):js.lib.Promise<Any>;
}
enum abstract NetEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
