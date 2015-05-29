package electron.main;

@:jsRequire("auto-updater")
extern class AutoUpdater {
  function setFeedUrl(url : String) : Void;
  function checkForUpdates() : Void;
  // TODO add events
  //https://github.com/atom/electron/blob/master/docs/api/auto-updater.md
}
