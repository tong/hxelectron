package electron.main;

/**
**/
@:require(js, electron) @:enum abstract CookiesEvent(String) from String to String {
	/**
		Emitted when a cookie is changed because it was added, edited, removed, or expired.
	**/
	var changed : String = "changed";
}