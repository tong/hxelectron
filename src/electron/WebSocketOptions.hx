package electron;
/**
	@see https://electronjs.org/docs/api/structures/web-socket-options
**/
typedef WebSocketOptions = {
	/**
		Requested WebSocket subprotocols.
	**/
	@:optional
	var protocols : String;
	/**
		Extra HTTP headers to send with the opening handshake.
	**/
	@:optional
	var headers : Dynamic;
	/**
		Value of the `Origin` header to send with the opening handshake. Defaults to the `http(s)` equivalent of the WebSocket URL's origin (e.g. connecting to `wss://api.example.com` sends `Origin: https://api.example.com`), so that the connection is treated as same-origin by the server and by SameSite cookie rules.
	**/
	@:optional
	var origin : String;
	/**
		Whether to send cookies from the session with the opening handshake and store cookies received in the handshake response. Default is `false`.
	**/
	@:optional
	var useSessionCookies : Bool;
	/**
		The `Session` the connection is associated with.
	**/
	@:optional
	var session : electron.main.Session;
	/**
		The name of the `partition` the connection is associated with. Defaults to the empty string, which corresponds to the default session. If `session` is provided, `partition` is ignored.
	**/
	@:optional
	var partition : String;
}
