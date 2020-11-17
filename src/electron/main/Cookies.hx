package electron.main;
/**
	@see https://electronjs.org/docs/api/cookies
**/
@:jsRequire("electron", "Cookies") extern class Cookies extends js.node.events.EventEmitter<electron.main.Cookies> {
	/**
		A promise which resolves an array of cookie objects.
		
		Sends a request to get all cookies matching `filter`, and resolves a promise with the response.
	**/
	function get(filter:{ /**
		Retrieves cookies which are associated with `url`. Empty implies retrieving cookies of all URLs.
	**/
	@:optional
	var url : String; /**
		Filters cookies by name.
	**/
	@:optional
	var name : String; /**
		Retrieves cookies whose domains match or are subdomains of `domains`.
	**/
	@:optional
	var domain : String; /**
		Retrieves cookies whose path matches `path`.
	**/
	@:optional
	var path : String; /**
		Filters cookies by their Secure property.
	**/
	@:optional
	var secure : Bool; /**
		Filters out session or persistent cookies.
	**/
	@:optional
	var session : Bool; }):js.lib.Promise<Any>;
	/**
		A promise which resolves when the cookie has been set
		
		Sets a cookie with `details`.
	**/
	function set(details:{ /**
		The URL to associate the cookie with. The promise will be rejected if the URL is invalid.
	**/
	var url : String; /**
		The name of the cookie. Empty by default if omitted.
	**/
	@:optional
	var name : String; /**
		The value of the cookie. Empty by default if omitted.
	**/
	@:optional
	var value : String; /**
		The domain of the cookie; this will be normalized with a preceding dot so that it's also valid for subdomains. Empty by default if omitted.
	**/
	@:optional
	var domain : String; /**
		The path of the cookie. Empty by default if omitted.
	**/
	@:optional
	var path : String; /**
		Whether the cookie should be marked as Secure. Defaults to false.
	**/
	@:optional
	var secure : Bool; /**
		Whether the cookie should be marked as HTTP only. Defaults to false.
	**/
	@:optional
	var httpOnly : Bool; /**
		The expiration date of the cookie as the number of seconds since the UNIX epoch. If omitted then the cookie becomes a session cookie and will not be retained between sessions.
	**/
	@:optional
	var expirationDate : Float; /**
		The Same Site policy to apply to this cookie.  Can be `unspecified`, `no_restriction`, `lax` or `strict`.  Default is `no_restriction`.
	**/
	@:optional
	var sameSite : String; }):js.lib.Promise<Any>;
	/**
		A promise which resolves when the cookie has been removed
		
		Removes the cookies matching `url` and `name`
	**/
	function remove(url:String, name:String):js.lib.Promise<Any>;
	/**
		A promise which resolves when the cookie store has been flushed
		
		Writes any unwritten cookies data to disk.
	**/
	function flushStore():js.lib.Promise<Any>;
}
@:enum abstract CookiesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when a cookie is changed because it was added, edited, removed, or expired.
	**/
	var changed : electron.main.CookiesEvent<Void -> Void> = "changed";
}
