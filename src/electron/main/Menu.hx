package electron.main;

// require("remote").require("menu")
@:jsRequire("menu")
extern class Menu {
  static function setApplicationMenu(menu : Menu) : Void;
  static function buildFromTemplate(template : Array<Dynamic>) : Menu;
  function new() : Void;
  function append(menuItem : MenuItem) : Void;
  function popup(browserWindow : BrowserWindow, coords : Array<Float>) : Void;
  function insert(pos : Int, menuItem : MenuItem) : Void;
  var item(default, null) : Array<MenuItem>;
}
