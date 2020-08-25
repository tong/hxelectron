package electron.main;
/**
	@see http://electronjs.org/docs/api/session
**/
@:jsRequire("electron", "Session") extern class Session extends js.node.events.EventEmitter<electron.main.Session> {
	/**
		A `Session` object, the default session object of the app.
	**/
	static var defaultSession : electron.main.Session;
	/**
		A session instance from `partition` string. When there is an existing `Session` with the same `partition`, it will be returned; otherwise a new `Session` instance will be created with `options`.
		
		If `partition` starts with `persist:`, the page will use a persistent session available to all pages in the app with the same `partition`. if there is no `persist:` prefix, the page will use an in-memory session. If the `partition` is empty then default session of the app will be returned.
		
		To create a `Session` with `options`, you have to ensure the `Session` with the `partition` has never been used before. There is no way to change the `options` of an existing `Session` object.
	**/
	static function fromPartition(partition:String, ?options:{ /**
		Whether to enable cache.
	**/
	var cache : Bool; }):electron.main.Session;
	/**
		A `String[]` array which consists of all the known available spell checker languages.  Providing a language code to the `setSpellCheckerLanaguages` API that isn't in this array will result in an error.
	**/
	var availableSpellCheckerLanguages : Array<String>;
	/**
		A `Cookies` object for this session.
	**/
	var cookies : electron.main.Cookies;
	/**
		A `ServiceWorkers` object for this session.
	**/
	var serviceWorkers : electron.main.ServiceWorkers;
	/**
		A `WebRequest` object for this session.
	**/
	var webRequest : electron.main.WebRequest;
	/**
		A `Protocol` object for this session.
	**/
	var protocol : electron.main.Protocol;
	/**
		A `NetLog` object for this session.
	**/
	var netLog : electron.main.NetLog;
	/**
		the session's current cache size, in bytes.
	**/
	function getCacheSize():js.lib.Promise<Any>;
	/**
		resolves when the cache clear operation is complete.
		
		Clears the session’s HTTP cache.
	**/
	function clearCache():js.lib.Promise<Any>;
	/**
		resolves when the storage data has been cleared.
	**/
	function clearStorageData(?options:{ /**
		Should follow `window.location.origin`’s representation `scheme://host:port`.
	**/
	@:optional
	var origin : String; /**
		The types of storages to clear, can contain: `appcache`, `cookies`, `filesystem`, `indexdb`, `localstorage`, `shadercache`, `websql`, `serviceworkers`, `cachestorage`. If not specified, clear all storage types.
	**/
	@:optional
	var storages : Array<String>; /**
		The types of quotas to clear, can contain: `temporary`, `persistent`, `syncable`. If not specified, clear all quotas.
	**/
	@:optional
	var quotas : Array<String>; }):js.lib.Promise<Any>;
	/**
		Writes any unwritten DOMStorage data to disk.
	**/
	function flushStorageData():Void;
	/**
		Resolves when the proxy setting process is complete.
		
		Sets the proxy settings.
		
		When `pacScript` and `proxyRules` are provided together, the `proxyRules` option is ignored and `pacScript` configuration is applied.
		
		The `proxyRules` has to follow the rules below:
		
		For example:
		
		* `http=foopy:80;ftp=foopy2` - Use HTTP proxy `foopy:80` for `http://` URLs, and HTTP proxy `foopy2:80` for `ftp://` URLs.
		* `foopy:80` - Use HTTP proxy `foopy:80` for all URLs.
		* `foopy:80,bar,direct://` - Use HTTP proxy `foopy:80` for all URLs, failing over to `bar` if `foopy:80` is unavailable, and after that using no proxy.
		* `socks4://foopy` - Use SOCKS v4 proxy `foopy:1080` for all URLs.
		* `http=foopy,socks5://bar.com` - Use HTTP proxy `foopy` for http URLs, and fail over to the SOCKS5 proxy `bar.com` if `foopy` is unavailable.
		* `http=foopy,direct://` - Use HTTP proxy `foopy` for http URLs, and use no proxy if `foopy` is unavailable.
		* `http=foopy;socks=foopy2` - Use HTTP proxy `foopy` for http URLs, and use `socks4://foopy2` for all other URLs.
		
		The `proxyBypassRules` is a comma separated list of rules described below:
		
		* `[ URL_SCHEME "://" ] HOSTNAME_PATTERN [ ":" <port> ]`
		
		Match all hostnames that match the pattern HOSTNAME_PATTERN.
		
		Examples: "foobar.com", "*foobar.com", "*.foobar.com", "*foobar.com:99", "https://x.*.y.com:99"
		* `"." HOSTNAME_SUFFIX_PATTERN [ ":" PORT ]`
		
		Match a particular domain suffix.
		
		Examples: ".google.com", ".com", "http://.google.com"
		* `[ SCHEME "://" ] IP_LITERAL [ ":" PORT ]`
		
		Match URLs which are IP address literals.
		
		Examples: "127.0.1", "[0:0::1]", "[::1]", "http://[::1]:99"
		* `IP_LITERAL "/" PREFIX_LENGTH_IN_BITS`
		
		Match any URL that is to an IP literal that falls between the given range. IP range is specified using CIDR notation.
		
		Examples: "192.168.1.1/16", "fefe:13::abc/33".
		* `<local>`
		
		Match local addresses. The meaning of `<local>` is whether the host matches one of: "127.0.0.1", "::1", "localhost".
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
	var proxyBypassRules : String; }):js.lib.Promise<Any>;
	/**
		Resolves with the proxy information for `url`.
	**/
	function resolveProxy(url:String):js.lib.Promise<Any>;
	/**
		Sets download saving directory. By default, the download directory will be the `Downloads` under the respective app folder.
	**/
	function setDownloadPath(path:String):Void;
	/**
		Emulates network with the given configuration for the `session`.
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
		Preconnects the given number of sockets to an origin.
	**/
	function preconnect(options:{ /**
		URL for preconnect. Only the origin is relevant for opening the socket.
	**/
	var url : String; /**
		number of sockets to preconnect. Must be between 1 and 6. Defaults to 1.
	**/
	@:optional
	var numSockets : Float; }):Void;
	/**
		Disables any network emulation already active for the `session`. Resets to the original network configuration.
	**/
	function disableNetworkEmulation():Void;
	/**
		Sets the certificate verify proc for `session`, the `proc` will be called with `proc(request, callback)` whenever a server certificate verification is requested. Calling `callback(0)` accepts the certificate, calling `callback(-2)` rejects it.
		
		Calling `setCertificateVerifyProc(null)` will revert back to default certificate verify proc.
	**/
	function setCertificateVerifyProc(proc:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Sets the handler which can be used to respond to permission requests for the `session`. Calling `callback(true)` will allow the permission and `callback(false)` will reject it. To clear the handler, call `setPermissionRequestHandler(null)`.
	**/
	function setPermissionRequestHandler(handler:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Sets the handler which can be used to respond to permission checks for the `session`. Returning `true` will allow the permission and `false` will reject it. To clear the handler, call `setPermissionCheckHandler(null)`.
	**/
	function setPermissionCheckHandler(handler:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
	/**
		Resolves when the operation is complete.
		
		Clears the host resolver cache.
	**/
	function clearHostResolverCache():js.lib.Promise<Any>;
	/**
		Dynamically sets whether to always send credentials for HTTP NTLM or Negotiate authentication.
	**/
	function allowNTLMCredentialsForDomains(domains:String):Void;
	/**
		Overrides the `userAgent` and `acceptLanguages` for this session.
		
		The `acceptLanguages` must a comma separated ordered list of language codes, for example `"en-US,fr,de,ko,zh-CN,ja"`.
		
		This doesn't affect existing `WebContents`, and each `WebContents` can use `webContents.setUserAgent` to override the session-wide user agent.
	**/
	function setUserAgent(userAgent:String, ?acceptLanguages:String):Void;
	/**
		Whether or not this session is a persistent one. The default `webContents` session of a `BrowserWindow` is persistent. When creating a session from a partition, session prefixed with `persist:` will be persistent, while others will be temporary.
	**/
	function isPersistent():Bool;
	/**
		The user agent for this session.
	**/
	function getUserAgent():String;
	/**
		resolves with blob data.
	**/
	function getBlobData(identifier:String):js.lib.Promise<Any>;
	/**
		Initiates a download of the resource at `url`. The API will generate a DownloadItem that can be accessed with the will-download event.
		
		**Note:** This does not perform any security checks that relate to a page's origin, unlike `webContents.downloadURL`.
	**/
	function downloadURL(url:String):Void;
	/**
		Allows resuming `cancelled` or `interrupted` downloads from previous `Session`. The API will generate a DownloadItem that can be accessed with the will-download event. The DownloadItem will not have any `WebContents` associated with it and the initial state will be `interrupted`. The download will start only when the `resume` API is called on the DownloadItem.
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
	@:optional
	var lastModified : String; /**
		ETag header value.
	**/
	@:optional
	var eTag : String; /**
		Time when download was started in number of seconds since UNIX epoch.
	**/
	@:optional
	var startTime : Float; }):Void;
	/**
		resolves when the session’s HTTP authentication cache has been cleared.
	**/
	function clearAuthCache():js.lib.Promise<Any>;
	/**
		Adds scripts that will be executed on ALL web contents that are associated with this session just before normal `preload` scripts run.
	**/
	function setPreloads(preloads:Array<String>):Void;
	/**
		an array of paths to preload scripts that have been registered.
	**/
	function getPreloads():Array<String>;
	/**
		The built in spellchecker does not automatically detect what language a user is typing in.  In order for the spell checker to correctly check their words you must call this API with an array of language codes.  You can get the list of supported language codes with the `ses.availableSpellCheckerLanguages` property.
		
		**Note:** On macOS the OS spellchecker is used and will detect your language automatically.  This API is a no-op on macOS.
	**/
	function setSpellCheckerLanguages(languages:Array<String>):Void;
	/**
		An array of language codes the spellchecker is enabled for.  If this list is empty the spellchecker will fallback to using `en-US`.  By default on launch if this setting is an empty list Electron will try to populate this setting with the current OS locale.  This setting is persisted across restarts.
		
		**Note:** On macOS the OS spellchecker is used and has it's own list of languages.  This API is a no-op on macOS.
	**/
	function getSpellCheckerLanguages():Array<String>;
	/**
		By default Electron will download hunspell dictionaries from the Chromium CDN.  If you want to override this behavior you can use this API to point the dictionary downloader at your own hosted version of the hunspell dictionaries.  We publish a `hunspell_dictionaries.zip` file with each release which contains the files you need to host here, the file server must be **case insensitive** you must upload each file twice, once with the case it has in the ZIP file and once with the filename as all lower case.
		
		If the files present in `hunspell_dictionaries.zip` are available at `https://example.com/dictionaries/language-code.bdic` then you should call this api with `ses.setSpellCheckerDictionaryDownloadURL('https://example.com/dictionaries/')`.  Please note the trailing slash.  The URL to the dictionaries is formed as `${url}${filename}`.
		
		**Note:** On macOS the OS spellchecker is used and therefore we do not download any dictionary files.  This API is a no-op on macOS.
	**/
	function setSpellCheckerDictionaryDownloadURL(url:String):Void;
	/**
		An array of all words in app's custom dictionary. Resolves when the full dictionary is loaded from disk.
	**/
	function listWordsInSpellCheckerDictionary():js.lib.Promise<Any>;
	/**
		Whether the word was successfully written to the custom dictionary. This API will not work on non-persistent (in-memory) sessions.
		
		**Note:** On macOS and Windows 10 this word will be written to the OS custom dictionary as well
	**/
	function addWordToSpellCheckerDictionary(word:String):Bool;
	/**
		Whether the word was successfully removed from the custom dictionary. This API will not work on non-persistent (in-memory) sessions.
		
		**Note:** On macOS and Windows 10 this word will be removed from the OS custom dictionary as well
	**/
	function removeWordFromSpellCheckerDictionary(word:String):Bool;
	/**
		resolves when the extension is loaded.
		
		This method will raise an exception if the extension could not be loaded. If there are warnings when installing the extension (e.g. if the extension requests an API that Electron does not support) then they will be logged to the console.
		
		Note that Electron does not support the full range of Chrome extensions APIs. See Supported Extensions APIs for more details on what is supported.
		
		Note that in previous versions of Electron, extensions that were loaded would be remembered for future runs of the application. This is no longer the case: `loadExtension` must be called on every boot of your app if you want the extension to be loaded.
		
		This API does not support loading packed (.crx) extensions.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
		
		**Note:** Loading extensions into in-memory (non-persistent) sessions is not supported and will throw an error.
	**/
	function loadExtension(path:String):js.lib.Promise<Any>;
	/**
		Unloads an extension.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function removeExtension(extensionId:String):Void;
	/**
		| `null` - The loaded extension with the given ID.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getExtension(extensionId:String):electron.Extension;
	/**
		A list of all loaded extensions.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getAllExtensions():Array<electron.Extension>;
}
@:enum abstract SessionEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron is about to download `item` in `webContents`.
		
		Calling `event.preventDefault()` will cancel the download and `item` will not be available from next tick of the process.
	**/
	var will_download : electron.main.SessionEvent<Void -> Void> = "will-download";
	/**
		Emitted when a render process requests preconnection to a URL, generally due to a resource hint.
	**/
	var preconnect : electron.main.SessionEvent<Void -> Void> = "preconnect";
	/**
		Emitted when a hunspell dictionary file has been successfully initialized. This occurs after the file has been downloaded.
	**/
	var spellcheck_dictionary_initialized : electron.main.SessionEvent<Void -> Void> = "spellcheck-dictionary-initialized";
	/**
		Emitted when a hunspell dictionary file starts downloading
	**/
	var spellcheck_dictionary_download_begin : electron.main.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-begin";
	/**
		Emitted when a hunspell dictionary file has been successfully downloaded
	**/
	var spellcheck_dictionary_download_success : electron.main.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-success";
	/**
		Emitted when a hunspell dictionary file download fails.  For details on the failure you should collect a netlog and inspect the download request.
	**/
	var spellcheck_dictionary_download_failure : electron.main.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-failure";
}
