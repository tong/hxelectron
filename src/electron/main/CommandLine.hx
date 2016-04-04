/**
    API v0.37.3
**/
package electron.main;

extern class CommandLine {
  static function appendSwitch(name : String, ?value : String) : Void;
  static function appendArgument(value : String) : Void;
}
