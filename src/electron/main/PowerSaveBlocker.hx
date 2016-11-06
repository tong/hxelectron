package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "powerSaveBlocker") extern class PowerSaveBlocker {
	/**
		Starts preventing the system from entering lower-power mode. Returns an integer identifying the power save blocker. Note: prevent-display-sleep has higher precedence over prevent-app-suspension. Only the highest precedence type takes effect. In other words, prevent-display-sleep always takes precedence over prevent-app-suspension. For example, an API calling A requests for prevent-app-suspension, and another calling B requests for prevent-display-sleep. prevent-display-sleep will be used until B stops its request. After that, prevent-app-suspension is used.
	**/
	static function start(type:String):Int;
	/**
		Stops the specified power save blocker.
	**/
	static function stop(id:Int):Void;
	static function isStarted(id:Int):Bool;
}