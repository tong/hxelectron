package electron;
@:jsRequire("electron", "remote") @:require("electron") extern class Remote {
	static function require(module:String):Dynamic;
	static function getCurrentWindow():electron.BrowserWindow;
	static function getCurrentWebContents():electron.WebContents;
	static function getGlobal(name:String):electron.Any;
}