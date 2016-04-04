/**
  API v0.37.3
**/
package electron.main;

import electron.common.NativeImage;

@:enum abstract OpenDialogOptionsProperties(String) from String to String {
    var openFile = "openFile";
    var openDirectory = "openDirectory";
    var multiSelections = "multiSelections";
    var createDirectory = "createDirectory";
}

typedef OpenDialogOptions = {
  ?title : String,
  ?defaultPath : String,
  ?filters : Array<{ name : String, extensions : Array<String>}>,
  ?properties : Array<OpenDialogOptionsProperties>
}

typedef SaveDialogOptions = {
  ?title : String,
  ?defaultPath : String,
  ?filters : Array<{ name : String, extensions : Array<String>}>
}

@:enum abstract MessageBoxOptionsType(String) from String to String {
    var none = "none";
    var info = "info";
    var error = "error";
    var question = "question";
    var warning = "warning";
}

typedef MessageBoxOptions = {
  ?type : MessageBoxOptionsType,
  ?buttons : Array<String>,
  ?defaultId : Int,
  ?title : String,
  ?message : String,
  ?detail : String,
  ?icon : NativeImage,
  ?cancelId : Int,
  ?noLink : Bool
}

@:jsRequire("dialog")
extern class Dialog {
  static function showOpenDialog(?browserWindow : BrowserWindow, options : OpenDialogOptions, ?callback : Array<String> -> Void) : Void;
  static function showSaveDialog(?browserWindow : BrowserWindow, options : SaveDialogOptions, ?callback : String -> Void) : Void;
  static function showMessageBox(?browserWindow : BrowserWindow, options : MessageBoxOptions, ?callback : Int -> Void) : Void;
  static function showErrorBox(title : String, content : String) : Void;
}