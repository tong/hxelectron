package electron.main;
/**
	Get and set properties of a session.
	@see http://electronjs.org/docs/api/session
**/
@:jsRequire("electron", "Session") extern class Session extends js.node.events.EventEmitter<electron.main.Session> {
	/**
		A Session object, the default session object of the app.
	**/
	static var defaultSession : electron.main.Session;
	/**
		If partition starts with persist:, the page will use a persistent session available to all pages in the app with the same partition. if there is no persist: prefix, the page will use an in-memory session. If the partition is empty then default session of the app will be returned. To create a Session with options, you have to ensure the Session with the partition has never been used before. There is no way to change the options of an existing Session object.
	**/
	static function fromPartition(partition:String, ?options:{ /**
		Whether to enable cache.
	**/
	var cache : Bool; }):electron.main.Session;
	/**
		A Cookies object for this session.
	**/
	var cookies : electron.main.Cookies;
	/**
		A WebRequest object for this session.
	**/
	var webRequest : electron.main.WebRequest;
	/**
		A Protocol object for this session.
	**/
	var protocol : electron.main.Protocol;
	/**
		A NetLog object for this session.
	**/
	var netLog : electron.main.NetLog;
	/**
		Callback is invoked with the session's current cache size.
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
		Should follow window.location.origin’s representation scheme://host:port.
	**/
	@:optional
	var origin : String; /**
		The types of storages to clear, can contain: appcache, cookies, filesystem, indexdb, localstorage, shadercache, websql, serviceworkers, cachestorage.
	**/
	@:optional
	var storages : Array<String>; /**
		The types of quotas to clear, can contain: temporary, persistent, syncable.
	**/
	@:optional
	var quotas : Array<String>; }, ?callback:haxe.Constraints.Function):Void;
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
	var pacScript : String; /**
		Rules indicating which proxies to use.
	**/
	var proxyRules : String; /**
		Rules indicating which URLs should bypass the proxy settings.
	**/
	var proxyBypassRules : String; }, callback:haxe.Constraints.Function):Void;
	/**
		Resolves the proxy information for url. The callback will be called with callback(proxy) when the request is performed.
	**/
	function resolveProxy(url:String, callback:haxe.Constraints.Function):Void;
	/**
		Sets download saving directory. By default, the download directory will be the Downloads under the respective app folder.
	**/
	function setDownloadPath(path:String):Void;
	/**
		Emulates network with the given configuration for the session.
	**/
	function enableNetworkEmulation(options:{ /**
		Whether to emulate network outage. Defaults to false.
	**/
	@:optional
	var offline : Bool; /**
		RTT in ms. Defaults to 0 which will disable latency throttling.
	**/
	@:optional
	var latency : Float; /**
		Download rate in Bps. Defaults to 0 which will disable download throttling.
	**/
	@:optional
	var downloadThroughput : Float; /**
		Upload rate in Bps. Defaults to 0 which will disable upload throttling.
	**/
	@:optional
	var uploadThroughput : Float; }):Void;
	/**
		Disables any network emulation already active for the session. Resets to the original network configuration.
	**/
	function disableNetworkEmulation():Void;
	/**
		Sets the certificate verify proc for session, the proc will be called with proc(request, callback) whenever a server certificate verification is requested. Calling callback(0) accepts the certificate, calling callback(-2) rejects it. Calling setCertificateVerifyProc(null) will revert back to default certificate verify proc.
	**/
	function setCertificateVerifyProc(proc:haxe.Constraints.Function):Void;
	/**
		Sets the handler which can be used to respond to permission requests for the session. Calling callback(true) will allow the permission and callback(false) will reject it. To clear the handler, call setPermissionRequestHandler(null).
	**/
	function setPermissionRequestHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Sets the handler which can be used to respond to permission checks for the session. Returning true will allow the permission and false will reject it. To clear the handler, call setPermissionCheckHandler(null).
	**/
	function setPermissionCheckHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Clears the host resolver cache.
	**/
	function clearHostResolverCache(?callback:haxe.Constraints.Function):Void;
	/**
		Dynamically sets whether to always send credentials for HTTP NTLM or Negotiate authentication.
	**/
	function allowNTLMCredentialsForDomains(domains:String):Void;
	/**
		Overrides the userAgent and acceptLanguages for this session. The acceptLanguages must a comma separated ordered list of language codes, for example "en-US,fr,de,ko,zh-CN,ja". This doesn't affect existing WebContents, and each WebContents can use webContents.setUserAgent to override the session-wide user agent.
	**/
	function setUserAgent(userAgent:String, ?acceptLanguages:String):Void;
	function getUserAgent():String;
	function getBlobData(identifier:String, callback:haxe.Constraints.Function):Void;
	/**
		Allows resuming cancelled or interrupted downloads from previous Session. The API will generate a DownloadItem that can be accessed with the will-download event. The DownloadItem will not have any WebContents associated with it and the initial state will be interrupted. The download will start only when the resume API is called on the DownloadItem.
	**/
	function createInterruptedDownload(options:{ /**
		Absolute path of the download.
	**/
	var path : String; /**
		Complete URL chain for the download.
	**/
	var urlChain : Array<String>; @:optional
	var mimeType : String; /**
		Start range for the download.
	**/
	var offset : Int; /**
		Total length of the download.
	**/
	var length : Int; /**
		Last-Modified header value.
	**/
	var lastModified : String; /**
		ETag header value.
	**/
	var eTag : String; /**
		Time when download was started in number of seconds since UNIX epoch.
	**/
	@:optional
	var startTime : Float; }):Void;
	/**
		Clears the session’s HTTP authentication cache.
	**/
	function clearAuthCache(options:haxe.extern.EitherType<electron.RemovePassword, electron.RemoveClientCertificate>, ?callback:haxe.Constraints.Function):Void;
	/**
		Adds scripts that will be executed on ALL web contents that are associated with this session just before normal preload scripts run.
	**/
	function setPreloads(preloads:Array<String>):Void;
	function getPreloads():Array<String>;
}
@:enum abstract SessionEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron is about to download item in webContents. Calling event.preventDefault() will cancel the download and item will not be available from next tick of the process.
	**/
	var will_download : electron.main.SessionEvent<(js.html.Event, electron.main.DownloadItem, electron.main.WebContents) -> Void> = "will-download";
}
