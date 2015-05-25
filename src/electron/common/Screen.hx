package electron.common;

import js.node.events.EventEmitter;

@:jsRequire("screen")
extern class Screen extends EventEmitter<Screen> {
  static function getCursorScreenPoint() : { x : Int, y : Int}; // TODO check return type
  static function getPrimaryDisplay() : Display;
  static function getAllDisplays() : Array<Display>;
  static function getDisplayNearestPoint(point : { x : Int, y : Int}) : Display;
  static function getDisplayMatching(rect : { x : Int, y : Int, width : Int, height : Int}) : Display;
}
