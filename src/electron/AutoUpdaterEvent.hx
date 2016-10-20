package electron;
@:enum @:require(electron) abstract AutoUpdaterEvent(String) from String to String {
	/**
		Emitted when there is an error while updating.
	**/
	var error : String = "error";
	/**
		Emitted when checking if an update has started.
	**/
	var checking_for_update : String = "checking-for-update";
	/**
		Emitted when there is an available update. The update is downloaded automatically.
	**/
	var update_available : String = "update-available";
	/**
		Emitted when there is no available update.
	**/
	var update_not_available : String = "update-not-available";
	/**
		Emitted when an update has been downloaded. On Windows only releaseName is available.
	**/
	var update_downloaded : String = "update-downloaded";
}