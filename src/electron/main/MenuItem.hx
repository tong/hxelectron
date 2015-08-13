package electron.main;

@:jsRequire("menu-item")
extern class MenuItem {
  function new(options : MenuItemOptions) : Void;
}

typedef MenuItemOptions = {
  ?click : Void -> Void,
  ?selector : String,
  ?label : String,
  ?sublabel : String,
  ?icon : electron.common.NativeImage,
  ?enabled : Bool,
  ?visible : Bool,
  ?checked : Bool,
  ?id : String,
  ?position : String

  // type String - Can be normal, separator, submenu, checkbox or radio
  // accelerator Accelerator
  // submenu Menu - Should be specified for submenu type menu item, when // it's specified the type: 'submenu' can be omitted for the menu item
}
