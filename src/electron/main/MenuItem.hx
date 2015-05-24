package electron.main;

@:jsRequire("menu-item")
extern class MenuItem {
  function new(options : MenuItemOptions) : Void;
}

typedef MenuItemOptions = {
  // click Function - Callback when the menu item is clicked
  // selector String - Call the selector of first responder when clicked // (OS X only)
  // type String - Can be normal, separator, submenu, checkbox or radio
  // label String
  // sublabel String
  // accelerator Accelerator
  // icon NativeImage
  // enabled Boolean
  // visible Boolean
  // checked Boolean
  // submenu Menu - Should be specified for submenu type menu item, when // it's specified the type: 'submenu' can be omitted for the menu item
  // id String - Unique within a single menu. If defined then it can be // used as a reference to this item by the position attribute.
  // position String - This field allows fine-grained definition of the // specific location within a given menu.
}
