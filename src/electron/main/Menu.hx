/**
    API v0.37.3
**/
package electron.main;

// require("remote").require("menu")
@:jsRequire("menu")
extern class Menu {
  static function setApplicationMenu(menu : Menu) : Void;
  static function sendActionToFirstResponder(action : String) : Void;//OSX
  static function buildFromTemplate(template : Array<Dynamic>) : Menu;

  function popup(browserWindow : BrowserWindow, coords : Array<Float>) : Void;
  function append(menuItem : MenuItem) : Void;
  function insert(pos : Int, menuItem : MenuItem) : Void;
  var items(default, null) : Array<MenuItem>;
}
