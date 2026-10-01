package electron;
/**
	@see https://electronjs.org/docs/api/structures/window-state-persistence
**/
typedef WindowStatePersistence = {
	/**
		Whether to persist window position and size across application restarts. Defaults to `true` if not specified.
	**/
	@:optional
	var bounds : Bool;
	/**
		Whether to persist display modes (fullscreen, kiosk, maximized, etc.) across application restarts. Defaults to `true` if not specified.
	**/
	@:optional
	var displayMode : Bool;
}
