package electron.main;
/**
	Query and modify a session's cookies.
	@see http://electronjs.org/docs/api/cookies
**/
@:jsRequire("electron", "Cookies") extern class Cookies extends js.node.events.EventEmitter<electron.main.Cookies> {
	/**
		Sends a request to get all cookies matching filter, callback will be called with callback(error, cookies) on complete.
	**/
	function get(filter:{ /**
		Retrieves cookies which are associated with url. Empty implies retrieving cookies of all urls.
	**/
	@:optional
	var url : String; /**
		Filters cookies by name.
	**/
	@:optional
	var name : String; /**
		Retrieves cookies whose domains match or are subdomains of domains.
	**/
	@:optional
	var domain : String; /**
		Retrieves cookies whose path matches path.
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
	var session : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Sets a cookie with details, callback will be called with callback(error) on complete.
	**/
	function set(details:{ /**
		The url to associate the cookie with.
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
		The domain of the cookie. Empty by default if omitted.
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
	var expirationDate : Float; }, callback:haxe.Constraints.Function):Void;
	/**
		Removes the cookies matching url and name, callback will called with callback() on complete.
	**/
	function remove(url:String, name:String, callback:haxe.Constraints.Function):Void;
	/**
		Writes any unwritten cookies data to disk.
	**/
	function flushStore(callback:haxe.Constraints.Function):Void;
}
@:enum abstract CookiesEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when a cookie is changed because it was added, edited, removed, or expired.
	**/
	var changed : electron.main.CookiesEvent<(js.html.Event, electron.Cookie, String, Bool) -> Void> = "changed";
}
