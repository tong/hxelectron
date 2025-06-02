package electron;
/**
	@see https://electronjs.org/docs/api/structures/window-open-handler-response
**/
typedef WindowOpenHandlerResponse = {
	/**
		Can be `allow` or `deny`. Controls whether new window should be created.
	**/
	var action : String;
	/**
		Allows customization of the created window.
	**/
	@:optional
	var overrideBrowserWindowOptions : electron.BrowserWindowConstructorOptions;
	/**
		By default, child windows are closed when their opener is closed. This can be changed by specifying `outlivesOpener: true`, in which case the opened window will not be closed when its opener is closed.
	**/
	@:optional
	var outlivesOpener : Bool;
	/**
		If specified, will be called instead of `new BrowserWindow` to create the new child window and event `did-create-window` will not be emitted. Constructed child window should use passed `options` object. This can be used for example to have the new window open as a BrowserView instead of in a separate window.
	**/
	@:optional
	var createWindow : (options: BrowserWindowConstructorOptions) -> Dynamic;
}
