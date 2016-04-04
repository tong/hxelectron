/**
    API v0.37.3
**/
package electron.renderer;

import electron.main.BrowserWindow;
import electron.main.WebContents;

@:jsRequire("remote")
extern class Remote {
    static var process(default, null) : js.node.Process;
    static function require(module : String) : Dynamic;
    static function getCurrentWindow() : BrowserWindow;
    static function getCurrentWebContents() : WebContents;
    static function getGlobal(name : String) : String;
}
