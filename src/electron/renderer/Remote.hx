package electron.renderer;

/**
**/
@:require(js, electron) @:jsRequire("electron", "remote") extern class Remote {
	/**
		The process object in the main process. This is the same as remote.getGlobal('process') but is cached.
	**/
	var process : Dynamic;
	/**
		e.g.
	**/
	static function require(module:String):Any;
	static function getCurrentWindow():electron.main.BrowserWindow;
	static function getCurrentWebContents():electron.main.WebContents;
	static function getGlobal(name:String):Any;
}