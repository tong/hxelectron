package electron.main;

@:jsRequire("app")
extern class App {
  static var commandLine(default, null) : CommandLine;
  static var dock(default, null) : Dock;
  static function addRecentDocument(path : String) : Void;
  static function clearRecentDocuments() : Void;
  static function on(eventType : String, callback : Void -> Void) : Void;
  static function getPath(name : String) : String;
  static function setPath(name : String, value : String) : Void;
  static function quit() : Void;
  static function terminate() : Void;
  static function getVersion() : String;
  // TODO remove dynamic
  static function resolveProxy(rul : String, callback : Dynamic -> Void) : Void;
  // TODO
  // setUserTasks(tasks)
}
