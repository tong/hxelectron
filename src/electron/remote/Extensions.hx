package electron.remote;
/**
	@see https://electronjs.org/docs/api/extensions-api
**/
@:jsRequire("electron", "remote.Extensions") extern class Extensions extends js.node.events.EventEmitter<electron.remote.Extensions> {
	/**
		resolves when the extension is loaded.
		
		This method will raise an exception if the extension could not be loaded. If there are warnings when installing the extension (e.g. if the extension requests an API that Electron does not support) then they will be logged to the console.
		
		Note that Electron does not support the full range of Chrome extensions APIs. See Supported Extensions APIs for more details on what is supported.
		
		Note that in previous versions of Electron, extensions that were loaded would be remembered for future runs of the application. This is no longer the case: `loadExtension` must be called on every boot of your app if you want the extension to be loaded.
		
		This API does not support loading packed (.crx) extensions.
		
		> [!NOTE] This API cannot be called before the `ready` event of the `app` module is emitted.
		
		> [!NOTE] Loading extensions into in-memory (non-persistent) sessions is not supported and will throw an error.
	**/
	function loadExtension(path:String, ?options:{ /**
		Whether to allow the extension to read local files over `file://` protocol and inject content scripts into `file://` pages. This is required e.g. for loading devtools extensions on `file://` URLs. Defaults to false.
	**/
	var allowFileAccess : Bool; }):js.lib.Promise<Any>;
	/**
		Unloads an extension.
		
		> [!NOTE] This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function removeExtension(extensionId:String):Void;
	/**
		The loaded extension with the given ID.
		
		> [!NOTE] This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getExtension(extensionId:String):haxe.extern.EitherType<electron.Extension, Dynamic>;
	/**
		A list of all loaded extensions.
		
		> [!NOTE] This API cannot be called before the `ready` event of the `app` module is emitted.
	**/
	function getAllExtensions():Array<electron.Extension>;
}
enum abstract ExtensionsEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted after an extension is loaded. This occurs whenever an extension is added to the "enabled" set of extensions. This includes:
		
		* Extensions being loaded from `Extensions.loadExtension`.
		* Extensions being reloaded:
		  * from a crash.
		  * if the extension requested it (`chrome.runtime.reload()`).
	**/
	var extension_loaded : electron.remote.ExtensionsEvent<Void -> Void> = "extension-loaded";
	/**
		Emitted after an extension is unloaded. This occurs when `Session.removeExtension` is called.
	**/
	var extension_unloaded : electron.remote.ExtensionsEvent<Void -> Void> = "extension-unloaded";
	/**
		Emitted after an extension is loaded and all necessary browser state is initialized to support the start of the extension's background page.
	**/
	var extension_ready : electron.remote.ExtensionsEvent<Void -> Void> = "extension-ready";
}
