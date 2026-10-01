package electron.remote;
/**
	> Create WebSocket connections from the main process using Chromium's native networking library
	
	Process: Main
	
	`net.WebSocket` is a drop-in replacement for the WHATWG `WebSocket` interface that routes the connection through Chromium's network stack rather than Node.js. Use it when you want a main-process WebSocket connection that:
	
	* Uses the system or session proxy configuration (PAC, WPAD).
	* Validates TLS certificates against the platform trust store and the session's certificate verification policy.
	* Honors session-level configuration (custom CA, host resolution rules, etc.).
	* Sends the session's cookies (when `useSessionCookies` is enabled).
	
	The class implements the standard `WebSocket` interface (an `EventTarget`), so code written against the browser or Node.js global `WebSocket` works without changes:
	
	```
	const { app, net } = require('electron')
	
	app.whenReady().then(() => {
	  const ws = new net.WebSocket('wss://echo.websocket.events')
	  ws.onopen = () => ws.send('hello')
	  ws.onmessage = (event) => {
	    console.log('received', event.data)
	    ws.close()
	  }
	})
	```
	
	`net.WebSocket` can only be used after the application emits the `ready` event.
	@see https://electronjs.org/docs/api/web-socket
**/
@:jsRequire("electron", "remote.WebSocket") extern class WebSocket extends js.html.EventTarget {
	/**
		A `string` representing the resolved URL of the connection.
	**/
	var url : String;
	/**
		An `Integer` representing the current state of the connection: one of `WebSocket.CONNECTING` (`0`), `WebSocket.OPEN` (`1`), `WebSocket.CLOSING` (`2`), or `WebSocket.CLOSED` (`3`).
	**/
	var readyState : Int;
	/**
		An `Integer` representing the number of bytes of application data that have been queued via `send()` but not yet handed off to the network.
	**/
	var bufferedAmount : Int;
	/**
		A `string` containing the subprotocol selected by the server. The empty string until the connection is open or if the server did not select a subprotocol.
	**/
	var protocol : String;
	/**
		A `string` containing the extensions negotiated by the server (for example `permessage-deflate`).
	**/
	var extensions : String;
	/**
		A `string` controlling how incoming binary messages are exposed on the `message` event. Can be `nodebuffer`, `arraybuffer`, or `blob`. The default is `nodebuffer`.
		
		`'nodebuffer'` is an Electron extension that delivers binary messages as `Buffer` objects, which is generally the most convenient representation in the main process. Set `binaryType` to `'arraybuffer'` or `'blob'` for behavior identical to the renderer `WebSocket`.
	**/
	var binaryType : WebSocketBinaryType;
	/**
		A `Function | null` event handler for the `open` event. Equivalent to calling `addEventListener('open', ...)`.
	**/
	var onopen : haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>;
	/**
		A `Function | null` event handler for the `message` event. Equivalent to calling `addEventListener('message', ...)`.
	**/
	var onmessage : haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>;
	/**
		A `Function | null` event handler for the `error` event. Equivalent to calling `addEventListener('error', ...)`.
	**/
	var onerror : haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>;
	/**
		A `Function | null` event handler for the `close` event. Equivalent to calling `addEventListener('close', ...)`.
	**/
	var onclose : haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>;
	function new(url:String, ?protocols:haxe.extern.EitherType<String, electron.WebSocketOptions>):Void;
	/**
		Enqueues `data` to be transmitted to the server. Throws an `InvalidStateError` `DOMException` if `readyState` is `CONNECTING`.
	**/
	function send(data:haxe.extern.EitherType<String, haxe.extern.EitherType<js.lib.ArrayBuffer, haxe.extern.EitherType<js.lib.ArrayBufferView, js.html.Blob>>>):Void;
	/**
		Closes the connection. Calling `close()` while still `CONNECTING` aborts the handshake.
	**/
	function close(?code:Int, ?reason:String):Void;
}
enum abstract WebSocketBinaryType(String) from String to String {
	var nodebuffer = "nodebuffer";
	var arraybuffer = "arraybuffer";
	var blob = "blob";
}
