package electron.remote;
/**
	@see https://electronjs.org/docs/api/session
**/
@:jsRequire("electron", "remote.Session") extern class Session extends js.node.events.EventEmitter<electron.remote.Session> {
	/**
		A `Session` object, the default session object of the app.
	**/
	static var defaultSession : electron.remote.Session;
	/**
		A session instance from `partition` string. When there is an existing `Session` with the same `partition`, it will be returned; otherwise a new `Session` instance will be created with `options`.
		
		If `partition` starts with `persist:`, the page will use a persistent session available to all pages in the app with the same `partition`. if there is no `persist:` prefix, the page will use an in-memory session. If the `partition` is empty then default session of the app will be returned.
		
		To create a `Session` with `options`, you have to ensure the `Session` with the `partition` has never been used before. There is no way to change the `options` of an existing `Session` object.
	**/
	static function fromPartition(partition:String, ?options:{ /**
		Whether to enable cache.
	**/
	var cache : Bool; }):electron.remote.Session;
	/**
		A `String[]` array which consists of all the known available spell checker languages.  Providing a language code to the `setSpellCheckerLanguages` API that isn't in this array will result in an error.
	**/
	var availableSpellCheckerLanguages : Array<String>;
	/**
		A `Boolean` indicating whether builtin spell checker is enabled.
	**/
	var spellCheckerEnabled : Bool;
	/**
		A `Cookies` object for this session.
	**/
	var cookies : electron.remote.Cookies;
	/**
		A `ServiceWorkers` object for this session.
	**/
	var serviceWorkers : electron.remote.ServiceWorkers;
	/**
		A `WebRequest` object for this session.
	**/
	var webRequest : electron.remote.WebRequest;
	/**
		A `Protocol` object for this session.
	**/
	var protocol : electron.remote.Protocol;
	/**
		A `NetLog` object for this session.
	**/
	var netLog : electron.remote.NetLog;
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
		
		When `mode` is unspecified, `pacScript` and `proxyRules` are provided together, the `proxyRules` option is ignored and `pacScript` configuration is applied.
		
		You may need `ses.closeAllConnections` to close currently in flight connections to prevent pooled sockets using previous proxy from being reused by future requests.
		
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
		The proxy mode. Should be one of `direct`, `auto_detect`, `pac_script`, `fixed_servers` or `system`. If it's unspecified, it will be automatically determined based on other specified options.
	**/
	@:optional
	var mode : String; /**
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
		Resolves when the all internal states of proxy service is reset and the latest proxy configuration is reapplied if it's already available. The pac script will be fetched from `pacScript` again if the proxy mode is `pac_script`.
	**/
	function forceReloadProxyConfig():js.lib.Promise<Any>;
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
		Resolves when all connections are closed.
		
		**Note:** It will terminate / fail all requests currently in flight.
	**/
	function closeAllConnections():js.lib.Promise<Any>;
	/**
		Disables any network emulation already active for the `session`. Resets to the original network configuration.
	**/
	function disableNetworkEmulation():Void;
	/**
		Sets the certificate verify proc for `session`, the `proc` will be called with `proc(request, callback)` whenever a server certificate verification is requested. Calling `callback(0)` accepts the certificate, calling `callback(-2)` rejects it.
		
		Calling `setCertificateVerifyProc(null)` will revert back to default certificate verify proc.
		
		> **NOTE:** The result of this procedure is cached by the network service.
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
		Sets the SSL configuration for the session. All subsequent network requests will use the new configuration. Existing network connections (such as WebSocket connections) will not be terminated, but old sockets in the pool will not be reused for new connections.
	**/
	function setSSLConfig(config:{ /**
		Can be `tls1`, `tls1.1`, `tls1.2` or `tls1.3`. The minimum SSL version to allow when connecting to remote servers. Defaults to `tls1`.
	**/
	@:optional
	var minVersion : String; /**
		Can be `tls1.2` or `tls1.3`. The maximum SSL version to allow when connecting to remote servers. Defaults to `tls1.3`.
	**/
	@:optional
	var maxVersion : String; /**
		List of cipher suites which should be explicitly prevented from being used in addition to those disabled by the net built-in policy. Supported literal forms: 0xAABB, where AA is `cipher_suite[0]` and BB is `cipher_suite[1]`, as defined in RFC 2246, Section 7.4.1.2. Unrecognized but parsable cipher suites in this form will not return an error. Ex: To disable TLS_RSA_WITH_RC4_128_MD5, specify 0x0004, while to disable TLS_ECDH_ECDSA_WITH_RC4_128_SHA, specify 0xC002. Note that TLSv1.3 ciphers cannot be disabled using this mechanism.
	**/
	@:optional
	var disabledCipherSuites : Array<Int>; }):Void;
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
		Sets whether to enable the builtin spell checker.
	**/
	function setSpellCheckerEnabled(enable:Bool):Void;
	/**
		Whether the builtin spell checker is enabled.
	**/
	function isSpellCheckerEnabled():Bool;
	/**
		The built in spellchecker does not automatically detect what language a user is typing in.  In order for the spell checker to correctly check their words you must call this API with an array of language codes.  You can get the list of supported language codes with the `ses.availableSpellCheckerLanguages` property.
		
		**Note:** On macOS the OS spellchecker is used and will detect your language automatically.  This API is a no-op on macOS.
	**/
	function setSpellCheckerLanguages(languages:Array<String>):Void;
	/**
		An array of language codes the spellchecker is enabled for.  If this list is empty the spellchecker will fallback to using `en-US`.  By default on launch if this setting is an empty list Electron will try to populate this setting with the current OS locale.  This setting is persisted across restarts.
		
		**Note:** On macOS the OS spellchecker is used and has its own list of languages.  This API is a no-op on macOS.
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
	function loadExtension(path:String, ?options:{ /**
		Whether to allow the extension to read local files over `file://` protocol and inject content scripts into `file://` pages. This is required e.g. for loading devtools extensions on `file://` URLs. Defaults to false.
	**/
	var allowFileAccess : Bool; }):js.lib.Promise<Any>;
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
	var will_download : electron.remote.SessionEvent<Void -> Void> = "will-download";
	/**
		Emitted after an extension is loaded. This occurs whenever an extension is added to the "enabled" set of extensions. This includes:
		
		* Extensions being loaded from `Session.loadExtension`.
		* Extensions being reloaded:
		  * from a crash.
		  * if the extension requested it (`chrome.runtime.reload()`).
	**/
	var extension_loaded : electron.remote.SessionEvent<Void -> Void> = "extension-loaded";
	/**
		Emitted after an extension is unloaded. This occurs when `Session.removeExtension` is called.
	**/
	var extension_unloaded : electron.remote.SessionEvent<Void -> Void> = "extension-unloaded";
	/**
		Emitted after an extension is loaded and all necessary browser state is initialized to support the start of the extension's background page.
	**/
	var extension_ready : electron.remote.SessionEvent<Void -> Void> = "extension-ready";
	/**
		Emitted when a render process requests preconnection to a URL, generally due to a resource hint.
	**/
	var preconnect : electron.remote.SessionEvent<Void -> Void> = "preconnect";
	/**
		Emitted when a hunspell dictionary file has been successfully initialized. This occurs after the file has been downloaded.
	**/
	var spellcheck_dictionary_initialized : electron.remote.SessionEvent<Void -> Void> = "spellcheck-dictionary-initialized";
	/**
		Emitted when a hunspell dictionary file starts downloading
	**/
	var spellcheck_dictionary_download_begin : electron.remote.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-begin";
	/**
		Emitted when a hunspell dictionary file has been successfully downloaded
	**/
	var spellcheck_dictionary_download_success : electron.remote.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-success";
	/**
		Emitted when a hunspell dictionary file download fails.  For details on the failure you should collect a netlog and inspect the download request.
	**/
	var spellcheck_dictionary_download_failure : electron.remote.SessionEvent<Void -> Void> = "spellcheck-dictionary-download-failure";
	/**
		Emitted when a serial port needs to be selected when a call to `navigator.serial.requestPort` is made. `callback` should be called with `portId` to be selected, passing an empty string to `callback` will cancel the request.  Additionally, permissioning on `navigator.serial` can be managed by using ses.setPermissionCheckHandler(handler) with the `serial` permission.
		
		Because this is an experimental feature it is disabled by default.  To enable this feature, you will need to use the `--enable-features=ElectronSerialChooser` command line switch.  Additionally because this is an experimental Chromium feature you will need to set `enableBlinkFeatures: 'Serial'` on the `webPreferences` property when opening a BrowserWindow.
	**/
	var select_serial_port : electron.remote.SessionEvent<Void -> Void> = "select-serial-port";
	/**
		Emitted after `navigator.serial.requestPort` has been called and `select-serial-port` has fired if a new serial port becomes available.  For example, this event will fire when a new USB device is plugged in.
	**/
	var serial_port_added : electron.remote.SessionEvent<Void -> Void> = "serial-port-added";
	/**
		Emitted after `navigator.serial.requestPort` has been called and `select-serial-port` has fired if a serial port has been removed.  For example, this event will fire when a USB device is unplugged.
	**/
	var serial_port_removed : electron.remote.SessionEvent<Void -> Void> = "serial-port-removed";
}
