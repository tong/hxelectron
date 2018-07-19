package electron.renderer;

/**
**/
@:require(js, electron) @:jsRequire("electron", "remote") @:electron("renderer") extern class Remote {
	/**
		The process object in the main process. This is the same as remote.getGlobal('process') but is cached.
	**/
	var process : Dynamic;
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