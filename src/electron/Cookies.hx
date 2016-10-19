package electron;
@:jsRequire("electron", "Cookies") @:require("electron") extern class Cookies extends js.node.events.EventEmitter<electron.Cookies> {
	/**
		Sends a request to get all cookies matching details, callback will be called with callback(error, cookies) on complete. cookies is an Array of cookie objects.
	**/
	function get(filter:{ @:optional
	var url : String; @:optional
	var name : String; @:optional
	var domain : String; @:optional
	var path : String; @:optional
	var secure : Bool; @:optional
	var session : Bool; }, callback:haxe.Constraints.Function):Void;
	/**
		Sets a cookie with details, callback will be called with callback(error) on complete.
	**/
	function set(details:{ @:optional
	var url : String; @:optional
	var name : String; @:optional
	var value : String; @:optional
	var domain : String; @:optional
	var path : String; @:optional
	var secure : Bool; @:optional
	var httpOnly : Bool; @:optional
	var expirationDate : Float; }, callback:haxe.Constraints.Function):Void;
	/**
		Removes the cookies matching url and name, callback will called with callback() on complete.
	**/
	function remove(url:String, name:String, callback:haxe.Constraints.Function):Void;
}