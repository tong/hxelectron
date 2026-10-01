package electron.remote;
/**
	> Block the system from entering low-power (sleep) mode.
	
	Process: Main
	
	For example:
	@see https://electronjs.org/docs/api/power-save-blocker
**/
@:jsRequire("electron", "remote.powerSaveBlocker") extern class PowerSaveBlocker extends js.node.events.EventEmitter<electron.remote.PowerSaveBlocker> {
	/**
		The blocker ID that is assigned to this power blocker.
		
		Starts preventing the system from entering lower-power mode. Returns an integer identifying the power save blocker.
		
		> [!NOTE] `prevent-display-sleep` has higher precedence over `prevent-app-suspension`. Only the highest precedence type takes effect. In other words, `prevent-display-sleep` always takes precedence over `prevent-app-suspension`.
		
		For example, an API calling A requests for `prevent-app-suspension`, and another calling B requests for `prevent-display-sleep`. `prevent-display-sleep` will be used until B stops its request. After that, `prevent-app-suspension` is used.
	**/
	static function start(type:PowerSaveBlockerStartType):Int;
	/**
		Stops the specified power save blocker.
		
		Whether the specified `powerSaveBlocker` has been stopped.
	**/
	static function stop(id:Int):Bool;
	/**
		Whether the corresponding `powerSaveBlocker` has started.
	**/
	static function isStarted(id:Int):Bool;
}
enum abstract PowerSaveBlockerEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {

}
enum abstract PowerSaveBlockerStartType(String) from String to String {
	/**
		Prevent the application from being suspended. Keeps system active but allows screen to be turned off. Example use cases: downloading a file or playing audio.
	**/
	var prevent_app_suspension = "prevent-app-suspension";
	/**
		Prevent the display from going to sleep. Keeps system and screen active. Example use case: playing video.
	**/
	var prevent_display_sleep = "prevent-display-sleep";
}
