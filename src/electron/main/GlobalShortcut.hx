package electron.main;

@:jsRequire("global-shortcut")
extern class GlobalShortcut {
  static function register(accelerator : String, callback : Void -> Void) : Void;
  static function isRegistered(accelerator : String) : Void;
  static function unregister(accelerator : String) : Void;
  static function unregisterAll() : Void;
}
