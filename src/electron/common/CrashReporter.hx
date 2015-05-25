package electron.common;

@:jsRequire("crash-reporter")
extern class CrashReporter {
  static function start(options : CrashReporterOptions) : Void;
  static function getLastCrashReport() : Null<{date : Date, id : String }>; // TODO check return type
}

typedef CrashReporterOptions = {
  ?productName : String,
  ?companyName : String,
  ?submitUrl : String,
  ?autoSubmit : Bool,
  ?ignoreSystemCrashHandler : Bool,
  ?extra : {}
}
