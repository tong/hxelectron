/**
    API v0.37.3
**/
package electron.main;

@:enum abstract AutoUpdaterEventType(String) from String to String {
    var error = "error";
    var checking_for_update = "checking-for-update";
    var update_available = "update-available";
    var update_not_available = "update-not-available";
    var update_downloaded = "update-downloaded";
}

@:jsRequire("auto-updater")
extern class AutoUpdater {
  static function setFeedUrl(url : String) : Void;
  static function checkForUpdates() : Void;
  static function quitAndInstall() : Void;
}
