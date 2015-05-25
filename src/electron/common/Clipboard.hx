package electron.common;

@:jsRequire("clipboard")
extern class Clipboard {
  static function readText(?type : String) : String;
  static function writeText(text : String, ?type : String) : Void;
  static function readImage(?type : String) : NativeImage;
  static function writeImage(image : NativeImage, ?type : String) : Void;
  static function clear(?type : String) : Void;
  static function has(format : String, ?type : String) : Bool;
  static function read(format : String, ?type : String) : Dynamic;
}
