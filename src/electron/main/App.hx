package electron.main;

@:enum abstract AppEventType(String) from String to String {
    var will_finish_launching = "will-finish-launching";
    var ready = "ready";
    var window_all_closed = "window-all-closed";
    var before_quit = "before-quit";
    var will_quit = "will-quit";
    var quit = "quit";
    var open_file = "open-file";
    var open_url = "open-url";
    var activate = "activate";
    var browser_window_blur = "browser-window-blur";
    var browser_window_focus = "browser-window-focus";
    var browser_window_created = "browser-window-created";
    var select_certificate = "select-certificate";
    var gpu_process_crashed = "gpu-process-crashed";
}

typedef Task = {
    var program : String;
    var arguments : String;
    var title : String;
    var description : String;
    var iconPath : String;
    var iconIndex : Int;
}

@:jsRequire("app")
extern class App {
  static var commandLine(default, null) : CommandLine;
  static var dock(default, null) : Dock;
  static function quit() : Void;
  static function getAppPath() : String;
  static function getPath(name : String) : String;
  static function setPath(name : String, value : String) : Void;
  static function getVersion() : String;
  static function getName() : String;
  static function getLocale() : String;
  // TODO remove dynamic
  static function resolveProxy(rul : String, callback : Dynamic -> Void) : Void;
  static function addRecentDocument(path : String) : Void;
  static function clearRecentDocuments() : Void;
  static function setUserTasks( tasks : Array<Task> ) : Void;
  static function allowNTLMCredentialsForAllDomains( allow : Bool ) : Void;
  static function on( eventType : AppEventType, callback : Void -> Void) : Void;
  static function terminate() : Void;
  // TODO
  // setUserTasks(tasks)
}
