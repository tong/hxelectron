package electron.main;

import electron.common.NativeImage;

@:jsRequire("dialog")
extern class Dialog {
  function showOpenDialog(?browserWindow : BrowserWindow, ?options : OpenDialogOptions, ?callback : Array<String> -> Void) : Void;
  function showSaveDialog(?browserWindow : BrowserWindow, ?options : SaveDialogOptions, ?callback : String -> Void) : Void;
  function showMessageBox(?browserWindow : BrowserWindow, options : MessageBoxOptions, ?callback : Int -> Void) : Void;
  function showErrorBox(title : String, content : String) : Void;
}

typedef OpenDialogOptions = {
  title : String,
  defaultPath : String,
  filters : Array<{ name : String, extensions : Array<String>}>,
  properties : Array<String>, // openFile, openDirectory, multiSelections and createDirectory
}

typedef SaveDialogOptions = {
  title : String,
  defaultPath : String,
  filters : Array<{ name : String, extensions : Array<String>}>
}

typedef MessageBoxOptions = {
  type : String, // "none", "info" or "warning"
  buttons : Array<String>,
  title : String,
  message : String,
  detail : String,
  icon : NativeImage
}
