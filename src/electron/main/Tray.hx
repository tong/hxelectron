package electron.main;

import electron.common.NativeImage;

@:jsRequire("tray")
extern class Tray {
  function new(image : NativeImage) : Void;
  // Tray.destroy()
  // Tray.setImage(image)
  // Tray.setPressedImage(image)
  // Tray.setToolTip(toolTip)
  // Tray.setTitle(title)
  // Tray.setHighlightMode(highlight)
  // Tray.displayBalloon(options)
  // Tray.setContextMenu(menu)
}
