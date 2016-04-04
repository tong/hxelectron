/**
    API v0.37.3
**/
package electron.main;

@:enum abstract AppEventType(String) from String to String {
    var will_finish_launching = "will-finish-launching";
    var ready = "ready";
    var window_all_closed = "window-all-closed";
    var before_quit = "before-quit";
    var will_quit = "will-quit";
    var quit = "quit";
    var open_file = "open-file";//OSX
    var open_url = "open-url";//OSX
    var activate = "activate";//OSX
    var browser_window_blur = "browser-window-blur";
    var browser_window_focus = "browser-window-focus";
    var browser_window_created = "browser-window-created";
    var certificate_error = "certificate-error";
    var select_client_certificate = "select-client-certificate";
    var login = "login";
    var gpu_process_crashed = "gpu-process-crashed";
    var platform_theme_changed = "platform-theme-changed";
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
  static function exit(exitCode : Int) : Void;
  static function focus() : Void;
  static function hide() : Void; //OSX
  static function show() : Void; //OSX
  static function getAppPath() : String;
  static function getPath(name : String) : String;
  static function setPath(name : String, path : String) : Void;
  static function getVersion() : String;
  static function getName() : String;
  static function setName(name : String) : String;
  static function getLocale() : String;
  static function addRecentDocument(path : String) : Void; //OSX, Windows
  static function clearRecentDocuments() : Void;//OSX, Windows
  static function setUserTasks(tasks : Array<Task>) : Void;//Windows
  static function allowNTLMCredentialsForAllDomains(allow : Bool) : Void;
  static function makeSingleInstance(callback : Array<String> -> String -> Void) : Bool;
  static function setAppUserModelId(id : String) : Void;//Windows
  static function isAeroGlassEnabled() : Bool;//Windows
  static function isDarkMode() : Bool;//OSX



  // TODO remove dynamic
  // static function resolveProxy(rul : String, callback : Dynamic -> Void) : Void;
  
  static function on( eventType : AppEventType, callback : Void -> Void) : Void;
  // static function terminate() : Void;
  // TODO
  // setUserTasks(tasks)
}
