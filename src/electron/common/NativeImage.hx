package electron.common;

import js.node.Buffer;

@:jsRequire("native-image")
extern class NativeImage {
  static function createEmpty() : NativeImage;
  static function createFromPath(path : String) : NativeImage;
  static function createFromBuffer(buffer : Buffer, ?scaleFactor : Float) : NativeImage;
  static function createFromDataUrl(dataUrl : String) : NativeImage;
  function toPng() : Buffer;
  function toJpeg(quality : Int) : Buffer;
  function toDataUrl() : String;
  function isEmpty() : Bool;
  function getSize() : { width : Int, height : Int }; // TODO check return type
  function setTemplateImage(option : Bool) : Void;
}
