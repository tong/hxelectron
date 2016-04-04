/**
  API v0.37.3
**/
package electron.main;

@:enum abstract MenuItemType(String) from String to String {
  var normal = "normal";
  var seperator = "seperator";
  var submenu = "submenu";
  var checkbox = "checkbox";
  var radio = "radio";
}

@:enum abstract MenuItemRole(String) from String to String {
  var undo = "undo";
  var redo = "redo";
  var cut = "cut";
  var copy = "copy";
  var paste = "paste";
  var selectall = "selectall";
  var minimize = "minimize";
  var close = "close";
  // -- OSX
  var about = "about";
  var hide = "hide";
  var hideothers = "hideothers";
  var unhide = "unhide";
  var front = "front";
  var window = "window";
  var help = "help";
  var services = "services";
  // -- OSX End
}

typedef MenuItemOptions = {
  ?click : Void -> Void,
  ?role : String,
  ?type : MenuItemType,
  ?label : String,
  ?sublabel : String,
  ?icon : electron.common.NativeImage,
  ?enabled : Bool,
  ?visible : Bool,
  ?checked : Bool,
  ?submenu : Menu,
  ?id : String,
  ?position : String
}

@:jsRequire("menu-item")
extern class MenuItem {
  function new(options : MenuItemOptions) : Void;
}
