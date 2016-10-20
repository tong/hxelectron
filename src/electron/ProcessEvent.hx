package electron;
@:enum @:require(electron) abstract ProcessEvent(String) from String to String {
	/**
		Emitted when Electron has loaded its internal initialization script and is beginning to load the web page or the main script. It can be used by the preload script to add removed Node global symbols back to the global scope when node integration is turned off:
	**/
	var loaded : String = "loaded";
}