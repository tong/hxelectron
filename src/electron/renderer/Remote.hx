package electron.renderer;

import electron.main.BrowserWindow;

@:jsRequire("remote")
extern class Remote {
  static function require(module : String) : Dynamic;
  static function getCurrentWindow() : BrowserWindow;
  static function getCurrentWebContent() : Dynamic; // TODO WebContents
  static function getGlobal(name : String) : String;
  static var process(default, null) : js.node.Process;
}
