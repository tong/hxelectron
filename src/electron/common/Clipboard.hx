package electron.common;

@:jsRequire("clipboard")
extern class Clipboard {
  static function readText(?type : String) : String;
  static function writeText(text : String, ?type : String) : Void;
  static function readHtml( ?type : String ) : Void;
  static function writeHtml( markup : String, ?type : String ) : Void;
  static function readImage(?type : String) : NativeImage;
  static function writeImage(image : NativeImage, ?type : String) : Void;
  static function clear(?type : String) : Void;
  static function availableFormats( ?type : String ) : Array<String>;
  static function has( data : String, ?type : String) : Bool;
  static function read( data : String, ?type : String ) : Dynamic;
  static function write( data : {?text:String,?html:String,?image:NativeImage}, ?type : String ) : Void;
}
