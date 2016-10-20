package electron;
@:jsRequire("electron", "Cookies") @:require("electron") extern class Cookies extends js.node.events.EventEmitter<electron.Cookies> {
	/**
		Sends a request to get all cookies matching details, callback will be called with callback(error, cookies) on complete. cookies is an Array of cookie objects.
	**/
	function get(filter:{ /**
		(optional) - Retrieves cookies which are associated with . Empty implies retrieving cookies of all urls.
	**/
	@:optional
	var url : String; /**
		(optional) - Filters cookies by name.
	**/
	@:optional
	var name : String; /**
		(optional) - Retrieves cookies whose domains match or are subdomains of
	**/
	@:optional
	var domain : String; /**
		(optional) - Retrieves cookies whose path matches .
	**/
	@:optional
	var path : String; /**
		(optional) - Filters cookies by their Secure property.
	**/
	@:optional
	var secure : Bool; /**
		(optional) - Filters out session or persistent cookies.
	**/
	@:optional
	var session : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Sets a cookie with details, callback will be called with callback(error) on complete.
	**/
	function set(details:{ /**
		The url to associate the cookie with.
	**/
	@:optional
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
		- The expiration date of the cookie as the number of seconds since the UNIX epoch. If omitted then the cookie becomes a session cookie and will not be retained between sessions.
	**/
	@:optional
	var expirationDate : Float; }, callback:haxe.Constraints.Function):Void;
	/**
		Removes the cookies matching url and name, callback will called with callback() on complete.
	**/
	function remove(url:String, name:String, callback:haxe.Constraints.Function):Void;
}