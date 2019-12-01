package electron.renderer;
/**
	@see http://electronjs.org/docs/api/remote
**/
@:jsRequire("electron", "remote") extern class Remote extends js.node.events.EventEmitter<electron.renderer.Remote> {
	/**
		A `NodeJS.Process` object.  The `process` object in the main process. This is the same as `remote.getGlobal('process')` but is cached.
	**/
	static var process : js.node.Process;
	/**
		The object returned by `require(module)` in the main process. Modules specified by their relative path will resolve relative to the entrypoint of the main process.
		
		e.g.
	**/
	static function require(module:String):Any;
	/**
		The window to which this web page belongs.
		
		**Note:** Do not use `removeAllListeners` on `BrowserWindow`. Use of this can remove all `blur` listeners, disable click events on touch bar buttons, and other unintended consequences.
	**/
	static function getCurrentWindow():electron.main.BrowserWindow;
	/**
		The web contents of this web page.
	**/
	static function getCurrentWebContents():electron.main.WebContents;
	/**
		The global variable of `name` (e.g. `global[name]`) in the main process.
	**/
	static function getGlobal(name:String):Any;
}
@:enum abstract RemoteEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
