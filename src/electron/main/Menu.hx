package electron.main;

@:jsRequire("menu") // require("remote").require("menu")
extern class Menu {
  static function setApplicationMenu(menu : Menu) : Void;
  static function buildFromTemplate(template : Array<Dynamic>) : Menu;
  function new() : Void;
  function append(menuItem : MenuItem) : Void;
  // Class Method: Menu.buildFromTemplate(template)
  // Menu.popup(browserWindow, [x, y])
  // Menu.insert(pos, menuItem)
  // Menu.items
}
