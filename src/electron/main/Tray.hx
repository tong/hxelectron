/**
  API v0.37.3
**/
package electron.main;

import electron.common.NativeImage;

typedef TrayOptions = {
  icon : NativeImage,
  title : String,
  content : String
}

@:jsRequire("tray")
extern class Tray extends js.node.events.EventEmitter<Tray> {
  static function destroy() : Void;
  static function setImage(image : NativeImage) : Void;
  static function setPressedImage(image : NativeImage) : Void;//OSX
  static function setToolTip(toolTip : String) : Void;
  static function setTitle(title : String) : Void;//OSX
  static function setHighlightMode(highlight : Bool) : Void;//OSX
  static function displayBalloon(options : TrayOptions) : Void;//Win
  static function popUpContextMenu( ?position : {x:Int,y:Int} ) : Void;//OSX, Win
  static function setContextMenu(menu : Menu) : Void;

  function new(image : NativeImage) : Void;
}