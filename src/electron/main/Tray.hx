package electron.main;

import electron.common.NativeImage;

@:jsRequire("tray")
extern class Tray extends js.node.events.EventEmitter<Tray> {
  function new(image : NativeImage) : Void;
  function destroy() : Void;
  function setImage(image : NativeImage) : Void;
  function setPressedImage(image : NativeImage) : Void;
  function setToolTip(toolTip : String) : Void;
  function setTitle(title : String) : Void;
  function setHighlightMode(highlight : Bool) : Void;
  function displayBalloon(options : TrayOptions) : Void;
  function setContextMenu(menu : Menu) : Void;
}

typedef TrayOptions = {
  icon : NativeImage,
  title : String,
  content : String
}
