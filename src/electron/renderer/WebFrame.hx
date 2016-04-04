/**
  API v0.37.3
**/
package electron.renderer;

typedef Spellcheck = {
  var spellcheck : String -> Bool;
}

@:jsRequire("web-frame")
extern class WebFrame {
  static function setZoomFactor(factor : Float) : Void;
  static function getZoomFactor() : Float;
  static function setZoomLevel(level : Float) : Void;
  static function getZoomLevel() : Float;
  static function setZoomLevelLimits( minimumLevel : Float, maximumLevel : Float ) : Void;
  static function setSpellCheckProvider(language : String, autoCorrectWord : Bool, provider : Spellcheck) : Void;
  static function registerUrlSchemeAsSecure(scheme : String) : Void;
  static function registerUrlSchemeAsBypassingCsp(scheme : String) : Void;
  static function registerUrlSchemeAsPrivileged(scheme : String) : Void;
  static function insertText(text : String) : Void;
  static function executeJavaScript( code:String, ?useGesture:Bool ) : Void;
}