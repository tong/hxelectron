/**
    API v0.37.3
**/
package electron.common;

typedef CrashReporterOptions = {
    var companyName : String;
    var submitURL : String;
    @:optional productName : String;
    var autoSubmit : Bool;
    var ignoreSystemCrashHandler : Bool;
    @:optional extra : {};
}

@:jsRequire("crash-reporter")
extern class CrashReporter {
  static function start(options : CrashReporterOptions) : Void;
  static function getLastCrashReport() : Null<{date : Date, id : String }>; // TODO check return type
  static function getUploadedReports() : Null<Array<{date : Date, id : String }>>; // TODO check return type
}