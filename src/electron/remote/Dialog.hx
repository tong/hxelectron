package electron.remote;

import electron.main.Dialog;
import electron.main.BrowserWindow;

@:jsRequire("remote", "dialog")
extern class Dialog {
  static function showOpenDialog(?browserWindow : BrowserWindow, ?options : OpenDialogOptions, ?callback : Array<String> -> Void) : Void;
  static function showSaveDialog(?browserWindow : BrowserWindow, ?options : SaveDialogOptions, ?callback : String -> Void) : Void;
  static function showMessageBox(?browserWindow : BrowserWindow, ?options : MessageBoxOptions, ?callback : Int -> Void) : Void;
  static function showErrorBox(title : String, content : String) : Void;
}
