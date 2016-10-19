package electron;
@:jsRequire("electron", "Session") @:require("electron") extern class Session extends js.node.events.EventEmitter<electron.Session> {
	/**
		A Cookies object for this session.
	**/
	var cookies : Dynamic;
	/**
		A WebRequest object for this session.
	**/
	var webRequest : Dynamic;
	/**
		A Protocol object (an instance of protocol module) for this session.
	**/
	var protocol : Dynamic;
	/**
		Returns the session's current cache size.
	**/
	function getCacheSize(callback:haxe.Constraints.Function):Void;
	/**
		Clears the session’s HTTP cache.
	**/
	function clearCache(callback:haxe.Constraints.Function):Void;
	/**
		Clears the data of web storages.
	**/
	function clearStorageData(?options:{ @:optional
	var origin : String; @:optional
	var storages : Array<String>; @:optional
	var quotas : Array<String>; }, callback:haxe.Constraints.Function):Void;
	/**
		Writes any unwritten DOMStorage data to disk.
	**/
	function flushStorageData():Void;
	/**
		Sets the proxy settings. When pacScript and proxyRules are provided together, the proxyRules option is ignored and pacScript configuration is applied. The proxyRules has to follow the rules below: For example: The proxyBypassRules is a comma separated list of rules described below:
	**/
	function setProxy(config:{ @:optional
	var pacScript : String; @:optional
	var proxyRules : String; @:optional
	var proxyBypassRules : String; }, callback:haxe.Constraints.Function):Void;
}