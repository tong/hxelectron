package electron.main;
/**
	@see https://electronjs.org/docs/api/session
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
		Whether to enable cache. Default is `true` unless the `--disable-http-cache` switch is used.
	**/
	var cache : Bool; }):electron.main.Session;
	/**
		A session instance from the absolute path as specified by the `path` string. When there is an existing `Session` with the same absolute path, it will be returned; otherwise a new `Session` instance will be created with `options`. The call will throw an error if the path is not an absolute path. Additionally, an error will be thrown if an empty string is provided.
		
		To create a `Session` with `options`, you have to ensure the `Session` with the `path` has never been used before. There is no way to change the `options` of an existing `Session` object.
	**/
	static function fromPath(path:String, ?options:{ /**
		Whether to enable cache. Default is `true` unless the `--disable-http-cache` switch is used.
	**/
	var cache : Bool; }):electron.main.Session;
	/**
		A `string[]` array which consists of all the known available spell checker languages.  Providing a language code to the `setSpellCheckerLanguages` API that isn't in this array will result in an error.
	**/
	var availableSpellCheckerLanguages : Array<String>;
	/**
		A `boolean` indicating whether builtin spell checker is enabled.
	**/
	var spellCheckerEnabled : Bool;
	/**
		A `string | null` indicating the absolute file system path where data for this session is persisted on disk.  For in memory sessions this returns `null`.
	**/
	var storagePath : haxe.extern.EitherType<String, Dynamic>;
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
		The types of storages to clear, can be `cookies`, `filesystem`, `indexdb`, `localstorage`, `shadercache`, `websql`, `serviceworkers`, `cachestorage`. If not specified, clear all storage types.
	**/
	@:optional
	var storages : Array<String>; /**
		The types of quotas to clear, can be `temporary`, `syncable`. If not specified, clear all quotas.
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
		
		You may need `ses.closeAllConnections` to close currently in flight connections to prevent pooled sockets using previous proxy from being reused by future requests.
	**/
	function setProxy(config:electron.ProxyConfig):js.lib.Promise<Any>;
	/**
		Resolves with the resolved IP addresses for the `host`.
	**/
	function resolveHost(host:String, ?options:{ /**
		Requested DNS query type. If unspecified, resolver will pick A or AAAA (or both) based on IPv4/IPv6 settings:
	**/
	@:optional
	var queryType : String; /**
		The source to use for resolved addresses. Default allows the resolver to pick an appropriate source. Only affects use of big external sources (e.g. calling the system for resolution or using DNS). Even if a source is specified, results can still come from cache, resolving "localhost" or IP literals, etc. One of the following values:
	**/
	@:optional
	var source : String; /**
		Indicates what DNS cache entries, if any, can be used to provide a response. One of the following values:
	**/
	@:optional
	var cacheUsage : String; /**
		Controls the resolver's Secure DNS behavior for this request. One of the following values:
	**/
	@:optional
	var secureDnsPolicy : String; }):js.lib.Promise<Any>;
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
		see Response.
		
		Sends a request, similarly to how `fetch()` works in the renderer, using Chrome's network stack. This differs from Node's `fetch()`, which uses Node.js's HTTP stack.
		
		Example:
		
		See also `net.fetch()`, a convenience method which issues requests from the default session.
		
		See the MDN documentation for `fetch()` for more details.
		
		Limitations:
		
		* `net.fetch()` does not support the `data:` or `blob:` schemes.
		* The value of the `integrity` option is ignored.
		* The `.type` and `.url` values of the returned `Response` object are incorrect.
		
		By default, requests made with `net.fetch` can be made to custom protocols as well as `file:`, and will trigger webRequest handlers if present. When the non-standard `bypassCustomProtocolHandlers` option is set in RequestInit, custom protocol handlers will not be called for this request. This allows forwarding an intercepted request to the built-in handler. webRequest handlers will still be triggered when bypassing custom protocols.
	**/
	function fetch(input:haxe.extern.EitherType<String, GlobalRequest>, ?init:RequestInit):js.lib.Promise<Any>;
	/**
		Disables any network emulation already active for the `session`. Resets to the original network configuration.
	**/
	function disableNetworkEmulation():Void;
	/**
		Sets the certificate verify proc for `session`, the `proc` will be called with `proc(request, callback)` whenever a server certificate verification is requested. Calling `callback(0)` accepts the certificate, calling `callback(-2)` rejects it.
		
		Calling `setCertificateVerifyProc(null)` will revert back to default certificate verify proc.
		
		> **NOTE:** The result of this procedure is cached by the network service.
	**/
	function setCertificateVerifyProc(proc:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Sets the handler which can be used to respond to permission requests for the `session`. Calling `callback(true)` will allow the permission and `callback(false)` will reject it. To clear the handler, call `setPermissionRequestHandler(null)`.  Please note that you must also implement `setPermissionCheckHandler` to get complete permission handling. Most web APIs do a permission check and then make a permission request if the check is denied.
	**/
	function setPermissionRequestHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Sets the handler which can be used to respond to permission checks for the `session`. Returning `true` will allow the permission and `false` will reject it.  Please note that you must also implement `setPermissionRequestHandler` to get complete permission handling. Most web APIs do a permission check and then make a permission request if the check is denied. To clear the handler, call `setPermissionCheckHandler(null)`.
	**/
	function setPermissionCheckHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		This handler will be called when web content requests access to display media via the `navigator.mediaDevices.getDisplayMedia` API. Use the desktopCapturer API to choose which stream(s) to grant access to.
		
		`useSystemPicker` allows an application to use the system picker instead of providing a specific video source from `getSources`. This option is experimental, and currently available for MacOS 15+ only. If the system picker is available and `useSystemPicker` is set to `true`, the handler will not be invoked.
		
		Passing a WebFrameMain object as a video or audio stream will capture the video or audio stream from that frame.
		
		Passing `null` instead of a function resets the handler to its default state.
	**/
	function setDisplayMediaRequestHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>, ?opts:{ /**
		true if the available native system picker should be used. Default is `false`. _macOS_ _Experimental_
	**/
	var useSystemPicker : Bool; }):Void;
	/**
		Sets the handler which can be used to respond to device permission checks for the `session`. Returning `true` will allow the device to be permitted and `false` will reject it. To clear the handler, call `setDevicePermissionHandler(null)`. This handler can be used to provide default permissioning to devices without first calling for permission to devices (eg via `navigator.hid.requestDevice`).  If this handler is not defined, the default device permissions as granted through device selection (eg via `navigator.hid.requestDevice`) will be used. Additionally, the default behavior of Electron is to store granted device permission in memory. If longer term storage is needed, a developer can store granted device permissions (eg when handling the `select-hid-device` event) and then read from that storage with `setDevicePermissionHandler`.
	**/
	function setDevicePermissionHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Sets the handler which can be used to override which USB classes are protected. The return value for the handler is a string array of USB classes which should be considered protected (eg not available in the renderer).  Valid values for the array are:
		
		* `audio`
		* `audio-video`
		* `hid`
		* `mass-storage`
		* `smart-card`
		* `video`
		* `wireless`
		
		Returning an empty string array from the handler will allow all USB classes; returning the passed in array will maintain the default list of protected USB classes (this is also the default behavior if a handler is not defined). To clear the handler, call `setUSBProtectedClassesHandler(null)`.
	**/
	function setUSBProtectedClassesHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
	/**
		Sets a handler to respond to Bluetooth pairing requests. This handler allows developers to handle devices that require additional validation before pairing.  When a handler is not defined, any pairing on Linux or Windows that requires additional validation will be automatically cancelled. macOS does not require a handler because macOS handles the pairing automatically.  To clear the handler, call `setBluetoothPairingHandler(null)`.
	**/
	function setBluetoothPairingHandler(handler:haxe.extern.EitherType<haxe.Constraints.Function, Dynamic>):Void;
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
	function downloadURL(url:String, ?options:{ /**
		HTTP request headers.
	**/
	@:optional
	var headers : Record; }):Void;
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
		Sets the directory to store the generated JS code cache for this session. The directory is not required to be created by the user before this call, the runtime will create if it does not exist otherwise will use the existing directory. If directory cannot be created, then code cache will not be used and all operations related to code cache will fail silently inside the runtime. By default, the directory will be `Code Cache` under the respective user data folder.
		
		Note that by default code cache is only enabled for http(s) URLs, to enable code cache for custom protocols, `codeCache: true` and `standard: true` must be specified when registering the protocol.
	**/
	function setCodeCachePath(path:String):Void;
	/**
		resolves when the code cache clear operation is complete.
	**/
	function clearCodeCaches(options:{ /**
		An array of url corresponding to the resource whose generated code cache needs to be removed. If the list is empty then all entries in the cache directory will be removed.
	**/
	@:optional
	var urls : Array<String>; }):js.lib.Promise<Any>;
	/**
		an array of shared dictionary information entries in Chromium's networking service's storage.
		
		Shared dictionaries are used to power advanced compression of data sent over the wire, specifically with Brotli and ZStandard. You don't need to call any of the shared dictionary APIs in Electron to make use of this advanced web feature, but if you do, they allow deeper control and inspection of the shared dictionaries used during decompression.
		
		To get detailed information about a specific shared dictionary entry, call `getSharedDictionaryInfo(options)`.
	**/
	function getSharedDictionaryUsageInfo():js.lib.Promise<Any>;
	/**
		an array of shared dictionary information entries in Chromium's networking service's storage.
		
		To get information about all present shared dictionaries, call `getSharedDictionaryUsageInfo()`.
	**/
	function getSharedDictionaryInfo(options:{ /**
		The origin of the frame where the request originates. It’s specific to the individual frame making the request and is defined by its scheme, host, and port. In practice, will look like a URL.
	**/
	var frameOrigin : String; /**
		The site of the top-level browsing context (the main frame or tab that contains the request). It’s less granular than `frameOrigin` and focuses on the broader "site" scope. In practice, will look like a URL.
	**/
	var topFrameSite : String; }):js.lib.Promise<Any>;
	/**
		resolves when the dictionary cache has been cleared, both in memory and on disk.
	**/
	function clearSharedDictionaryCache():js.lib.Promise<Any>;
	/**
		resolves when the dictionary cache has been cleared for the specified isolation key, both in memory and on disk.
	**/
	function clearSharedDictionaryCacheForIsolationKey(options:{ /**
		The origin of the frame where the request originates. It’s specific to the individual frame making the request and is defined by its scheme, host, and port. In practice, will look like a URL.
	**/
	var frameOrigin : String; /**
		The site of the top-level browsing context (the main frame or tab that contains the request). It’s less granular than `frameOrigin` and focuses on the broader "site" scope. In practice, will look like a URL.
	**/
	var topFrameSite : String; }):js.lib.Promise<Any>;
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
		
		**Note:** On macOS the OS spellchecker is used and has its own list of languages. On macOS, this API will return whichever languages have been configured by the OS.
	**/
	function getSpellCheckerLanguages():Array<String>;
	/**
		By default Electron will download hunspell dictionaries from the Chromium CDN.  If you want to override this behavior you can use this API to point the dictionary downloader at your own hosted version of the hunspell dictionaries.  We publish a `hunspell_dictionaries.zip` file with each release which contains the files you need to host here.
		
		The file server must be **case insensitive**. If you cannot do this, you must upload each file twice: once with the case it has in the ZIP file and once with the filename as all lowercase.
		
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
		The loaded extension with the given ID.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getExtension(extensionId:String):haxe.extern.EitherType<electron.Extension, Dynamic>;
	/**
		A list of all loaded extensions.
		
		**Note:** This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getAllExtensions():Array<electron.Extension>;
	/**
		The absolute file system path where data for this session is persisted on disk.  For in memory sessions this returns `null`.
	**/
	function getStoragePath():haxe.extern.EitherType<String, Dynamic>;
	/**
		resolves when all data has been cleared.
		
		Clears various different types of data.
		
		This method clears more types of data and is more thorough than the `clearStorageData` method.
		
		**Note:** Cookies are stored at a broader scope than origins. When removing cookies and filtering by `origins` (or `excludeOrigins`), the cookies will be removed at the registrable domain level. For example, clearing cookies for the origin `https://really.specific.origin.example.com/` will end up clearing all cookies for `example.com`. Clearing cookies for the origin `https://my.website.example.co.uk/` will end up clearing all cookies for `example.co.uk`.
		
		**Note:** Clearing cache data will also clear the shared dictionary cache. This means that any dictionaries used for compression may be reloaded after clearing the cache. If you wish to clear the shared dictionary cache but leave other cached data intact, you may want to use the `clearSharedDictionaryCache` method.
		
		For more information, refer to Chromium's `BrowsingDataRemover` interface.
	**/
	function clearData(?options:{ /**
		The types of data to clear. By default, this will clear all types of data. This can potentially include data types not explicitly listed here. (See Chromium's `BrowsingDataRemover` for the full list.)
	**/
	@:optional
	var dataTypes : Array<String>; /**
		Clear data for only these origins. Cannot be used with `excludeOrigins`.
	**/
	@:optional
	var origins : Array<String>; /**
		Clear data for all origins except these ones. Cannot be used with `origins`.
	**/
	@:optional
	var excludeOrigins : Array<String>; /**
		Skips deleting cookies that would close current network connections. (Default: `false`)
	**/
	@:optional
	var avoidClosingConnections : Bool; /**
		The behavior for matching data to origins.
	**/
	@:optional
	var originMatchingMode : String; }):js.lib.Promise<Any>;
}
enum abstract SessionEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when Electron is about to download `item` in `webContents`.
		
		Calling `event.preventDefault()` will cancel the download and `item` will not be available from next tick of the process.
	**/
	var will_download : electron.main.SessionEvent<Void -> Void> = "will-download";
	/**
		Emitted after an extension is loaded. This occurs whenever an extension is added to the "enabled" set of extensions. This includes:
		
		* Extensions being loaded from `Session.loadExtension`.
		* Extensions being reloaded:
		  * from a crash.
		  * if the extension requested it (`chrome.runtime.reload()`).
	**/
	var extension_loaded : electron.main.SessionEvent<Void -> Void> = "extension-loaded";
	/**
		Emitted after an extension is unloaded. This occurs when `Session.removeExtension` is called.
	**/
	var extension_unloaded : electron.main.SessionEvent<Void -> Void> = "extension-unloaded";
	/**
		Emitted after an extension is loaded and all necessary browser state is initialized to support the start of the extension's background page.
	**/
	var extension_ready : electron.main.SessionEvent<Void -> Void> = "extension-ready";
	var file_system_access_restricted : electron.main.SessionEvent<Void -> Void> = "file-system-access-restricted";
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
	/**
		Emitted when a HID device needs to be selected when a call to `navigator.hid.requestDevice` is made. `callback` should be called with `deviceId` to be selected; passing no arguments to `callback` will cancel the request.  Additionally, permissioning on `navigator.hid` can be further managed by using `ses.setPermissionCheckHandler(handler)` and `ses.setDevicePermissionHandler(handler)`.
	**/
	var select_hid_device : electron.main.SessionEvent<Void -> Void> = "select-hid-device";
	/**
		Emitted after `navigator.hid.requestDevice` has been called and `select-hid-device` has fired if a new device becomes available before the callback from `select-hid-device` is called.  This event is intended for use when using a UI to ask users to pick a device so that the UI can be updated with the newly added device.
	**/
	var hid_device_added : electron.main.SessionEvent<Void -> Void> = "hid-device-added";
	/**
		Emitted after `navigator.hid.requestDevice` has been called and `select-hid-device` has fired if a device has been removed before the callback from `select-hid-device` is called.  This event is intended for use when using a UI to ask users to pick a device so that the UI can be updated to remove the specified device.
	**/
	var hid_device_removed : electron.main.SessionEvent<Void -> Void> = "hid-device-removed";
	/**
		Emitted after `HIDDevice.forget()` has been called.  This event can be used to help maintain persistent storage of permissions when `setDevicePermissionHandler` is used.
	**/
	var hid_device_revoked : electron.main.SessionEvent<Void -> Void> = "hid-device-revoked";
	/**
		Emitted when a serial port needs to be selected when a call to `navigator.serial.requestPort` is made. `callback` should be called with `portId` to be selected, passing an empty string to `callback` will cancel the request.  Additionally, permissioning on `navigator.serial` can be managed by using ses.setPermissionCheckHandler(handler) with the `serial` permission.
	**/
	var select_serial_port : electron.main.SessionEvent<Void -> Void> = "select-serial-port";
	/**
		Emitted after `navigator.serial.requestPort` has been called and `select-serial-port` has fired if a new serial port becomes available before the callback from `select-serial-port` is called.  This event is intended for use when using a UI to ask users to pick a port so that the UI can be updated with the newly added port.
	**/
	var serial_port_added : electron.main.SessionEvent<Void -> Void> = "serial-port-added";
	/**
		Emitted after `navigator.serial.requestPort` has been called and `select-serial-port` has fired if a serial port has been removed before the callback from `select-serial-port` is called.  This event is intended for use when using a UI to ask users to pick a port so that the UI can be updated to remove the specified port.
	**/
	var serial_port_removed : electron.main.SessionEvent<Void -> Void> = "serial-port-removed";
	/**
		Emitted after `SerialPort.forget()` has been called.  This event can be used to help maintain persistent storage of permissions when `setDevicePermissionHandler` is used.
	**/
	var serial_port_revoked : electron.main.SessionEvent<Void -> Void> = "serial-port-revoked";
	/**
		Emitted when a USB device needs to be selected when a call to `navigator.usb.requestDevice` is made. `callback` should be called with `deviceId` to be selected; passing no arguments to `callback` will cancel the request.  Additionally, permissioning on `navigator.usb` can be further managed by using `ses.setPermissionCheckHandler(handler)` and `ses.setDevicePermissionHandler(handler)`.
	**/
	var select_usb_device : electron.main.SessionEvent<Void -> Void> = "select-usb-device";
	/**
		Emitted after `navigator.usb.requestDevice` has been called and `select-usb-device` has fired if a new device becomes available before the callback from `select-usb-device` is called.  This event is intended for use when using a UI to ask users to pick a device so that the UI can be updated with the newly added device.
	**/
	var usb_device_added : electron.main.SessionEvent<Void -> Void> = "usb-device-added";
	/**
		Emitted after `navigator.usb.requestDevice` has been called and `select-usb-device` has fired if a device has been removed before the callback from `select-usb-device` is called.  This event is intended for use when using a UI to ask users to pick a device so that the UI can be updated to remove the specified device.
	**/
	var usb_device_removed : electron.main.SessionEvent<Void -> Void> = "usb-device-removed";
	/**
		Emitted after `USBDevice.forget()` has been called.  This event can be used to help maintain persistent storage of permissions when `setDevicePermissionHandler` is used.
	**/
	var usb_device_revoked : electron.main.SessionEvent<Void -> Void> = "usb-device-revoked";
}
