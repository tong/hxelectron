package electron.main;
/**
	Issue HTTP/HTTPS requests using Chromium's native networking library
	@see http://electronjs.org/docs/api/net
**/
@:jsRequire("electron", "net") extern class Net {
	/**
		Creates a ClientRequest instance using the provided options which are directly forwarded to the ClientRequest constructor. The net.request method would be used to issue both secure and insecure HTTP requests according to the specified protocol scheme in the options object.
	**/
	static function request(options:haxe.extern.EitherType<Any, String>):electron.main.ClientRequest;
}
