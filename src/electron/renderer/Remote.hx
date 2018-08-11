package electron.renderer;
/**
	Use main process modules from the renderer process.
	@see http://electron.atom.io/docs/api/remote
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
	static function getCurrentWindow():electron.main.BrowserWindow;
	static function getCurrentWebContents():electron.main.WebContents;
	static function getGlobal(name:String):Any;
}
