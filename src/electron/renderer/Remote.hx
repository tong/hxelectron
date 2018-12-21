package electron.renderer;
/**
	Use main process modules from the renderer process.
	@see http://electronjs.org/docs/api/remote
**/
@:jsRequire("electron", "remote") extern class Remote {
	/**
		The process object in the main process. This is the same as remote.getGlobal('process') but is cached.
	**/
	static var process : Dynamic;
	/**
		e.g.
	**/
	static function require(module:String):Any;
	/**
		Note: Do not use removeAllListeners on BrowserWindow. Use of this can remove all blur listeners, disable click events on touch bar buttons, and other unintended consequences.
	**/
	static function getCurrentWindow():electron.main.BrowserWindow;
	static function getCurrentWebContents():electron.main.WebContents;
	static function getGlobal(name:String):Any;
}
