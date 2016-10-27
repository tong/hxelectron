package electron;

///// GENERATED - DO NOT EDIT /////

/**
	Manage browser sessions, cookies, cache, proxy settings, etc.

	[Documentation](http://electron.atom.io/docs/api/session)
**/
@:jsRequire("electron", "Session") @:require(electron_main) @:require(electron) extern class Session extends js.node.events.EventEmitter<electron.Session> {
	/**
		A Cookies object for this session.
	**/
	var cookies : electron.Cookies;
	/**
		A WebRequest object for this session.
	**/
	var webRequest : electron.WebRequest;
	/**
		A Protocol object (an instance of protocol module) for this session.
	**/
	var protocol : electron.Protocol;
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
	function clearStorageData(?options:{ /**
		Should follow ’s representation .
	**/
	@:optional
	var origin : String; /**
		The types of storages to clear, can contain: , , , , , , ,
	**/
	@:optional
	var storages : Array<String>; /**
		The types of quotas to clear, can contain: , , .
	**/
	@:optional
	var quotas : Array<String>; }, callback:haxe.Constraints.Function):Void;
	/**
		Writes any unwritten DOMStorage data to disk.
	**/
	function flushStorageData():Void;
	/**
		Sets the proxy settings. When pacScript and proxyRules are provided together, the proxyRules option is ignored and pacScript configuration is applied. The proxyRules has to follow the rules below: For example: The proxyBypassRules is a comma separated list of rules described below:
	**/
	function setProxy(config:{ /**
		The URL associated with the PAC file.
	**/
	@:optional
	var pacScript : String; /**
		Rules indicating which proxies to use.
	**/
	@:optional
	var proxyRules : String; /**
		Rules indicating which URLs should bypass the proxy settings.
	**/
	@:optional
	var proxyBypassRules : String; }, callback:haxe.Constraints.Function):Void;
}