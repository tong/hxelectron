/**
    API v0.37.3
**/
package electron.common;

@:enum abstract TouchSupport(String) from String to String {
    var available = "available";
    var unavailable = "unavailable";
    var unknown = "unknown";
}

extern class Display {
  var id : Int;
  var rotation : Int;
  var scaleFactor : Float;
  var touchSupport : TouchSupport;
  var workAreaSize : { width : Int, height : Int };
  var bounds : { x : Int, y : Int };
  var size : { width : Int, height : Int};//TODO: check format
  var workArea : { x : Int, y : Int, width : Int, height : Int};
  var workAreaSize : { width : Int, height : Int};
}
