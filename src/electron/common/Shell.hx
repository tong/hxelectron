/**
    API v0.37.3
**/
package electron.common;

@:jsRequire("shell")
extern class Shell {
  static function showItemInFolder(fullPath : String) : Void;
  static function openItem(fullPath : String) : Void;
  static function openExternal(url : String, ?options:{activate:Bool}) : Void;
  static function moveItemToTrash(fullPath : String) : Bool;
  static function beep() : Void;
}
