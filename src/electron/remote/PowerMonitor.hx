package electron.remote;
/**
	> Monitor power state changes.
	
	Process: Main
	@see https://electronjs.org/docs/api/power-monitor
**/
@:jsRequire("electron", "remote.powerMonitor") extern class PowerMonitor extends js.node.events.EventEmitter<electron.remote.PowerMonitor> {
	/**
		A `boolean` property. True if the system is on battery power.
		
		See `powerMonitor.isOnBatteryPower()`.
	**/
	static var onBatteryPower : Bool;
	/**
		The system's current idle state. Can be `active`, `idle`, `locked` or `unknown`.
		
		Calculate the system idle state. `idleThreshold` is the amount of time (in seconds) before considered idle.  `locked` is available on supported systems only.
	**/
	static function getSystemIdleState(idleThreshold:Int):PowerMonitorGetSystemIdleStateResult;
	/**
		Idle time in seconds
		
		Calculate system idle time in seconds.
	**/
	static function getSystemIdleTime():Int;
	/**
		The system's current thermal state. Can be `unknown`, `nominal`, `fair`, `serious`, or `critical`.
	**/
	@:electron_platforms(["macOS"])
	static function getCurrentThermalState():PowerMonitorGetCurrentThermalStateResult;
	/**
		Whether the system is on battery power.
		
		To monitor for changes in this property, use the `on-battery` and `on-ac` events.
	**/
	static function isOnBatteryPower():Bool;
	static function on<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function once<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function addListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeListener<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function off<T:(haxe.Constraints.Function)>(event:js.node.events.EventEmitter.Event<T>, listener:T):Void;
	static function removeAllListeners<T:(haxe.Constraints.Function)>(?event:js.node.events.EventEmitter.Event<T>):Void;
}
enum abstract PowerMonitorEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the system is suspending.
	**/
	var suspend : electron.remote.PowerMonitorEvent<() -> Void> = "suspend";
	/**
		Emitted when system is resuming.
	**/
	var resume : electron.remote.PowerMonitorEvent<() -> Void> = "resume";
	/**
		Emitted when the system changes to AC power.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var on_ac : electron.remote.PowerMonitorEvent<() -> Void> = "on-ac";
	/**
		Emitted when system changes to battery power.
	**/
	@:electron_platforms(["macOS"])
	var on_battery : electron.remote.PowerMonitorEvent<() -> Void> = "on-battery";
	/**
		Emitted when the thermal state of the system changes. Notification of a change in the thermal status of the system, such as entering a critical temperature range. Depending on the severity, the system might take steps to reduce said temperature, for example, throttling the CPU or switching on the fans if available.
		
		Apps may react to the new state by reducing expensive computing tasks (e.g. video encoding), or notifying the user. The same state might be received repeatedly.
		
		See https://developer.apple.com/library/archive/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/RespondToThermalStateChanges.html
	**/
	@:electron_platforms(["macOS"])
	var thermal_state_change : electron.remote.PowerMonitorEvent<js.html.Event -> Void> = "thermal-state-change";
	/**
		Notification of a change in the operating system's advertised speed limit for CPUs, in percent. Values below 100 indicate that the system is impairing processing power due to thermal management.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var speed_limit_change : electron.remote.PowerMonitorEvent<js.html.Event -> Void> = "speed-limit-change";
	/**
		Emitted when the system is about to reboot or shut down. If the event handler invokes `e.preventDefault()`, Electron will attempt to delay system shutdown in order for the app to exit cleanly. If `e.preventDefault()` is called, the app should exit as soon as possible by calling something like `app.quit()`.
	**/
	@:electron_platforms(["macOS", "Linux"])
	var shutdown : electron.remote.PowerMonitorEvent<() -> Void> = "shutdown";
	/**
		Emitted when the system is about to lock the screen.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var lock_screen : electron.remote.PowerMonitorEvent<() -> Void> = "lock-screen";
	/**
		Emitted as soon as the systems screen is unlocked.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var unlock_screen : electron.remote.PowerMonitorEvent<() -> Void> = "unlock-screen";
	/**
		Emitted when a login session is activated. See documentation for more information.
	**/
	@:electron_platforms(["macOS"])
	var user_did_become_active : electron.remote.PowerMonitorEvent<() -> Void> = "user-did-become-active";
	/**
		Emitted when a login session is deactivated. See documentation for more information.
	**/
	@:electron_platforms(["macOS"])
	var user_did_resign_active : electron.remote.PowerMonitorEvent<() -> Void> = "user-did-resign-active";
}
enum abstract PowerMonitorGetSystemIdleStateResult(String) from String to String {
	var active = "active";
	var idle = "idle";
	var locked = "locked";
	var unknown = "unknown";
}
enum abstract PowerMonitorGetCurrentThermalStateResult(String) from String to String {
	var unknown = "unknown";
	var nominal = "nominal";
	var fair = "fair";
	var serious = "serious";
	var critical = "critical";
}
