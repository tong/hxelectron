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
	static function getSystemIdleState(idleThreshold:Int):String;
	/**
		Idle time in seconds
		
		Calculate system idle time in seconds.
	**/
	static function getSystemIdleTime():Int;
	/**
		The system's current thermal state. Can be `unknown`, `nominal`, `fair`, `serious`, or `critical`.
	**/
	static function getCurrentThermalState():String;
	/**
		Whether the system is on battery power.
		
		To monitor for changes in this property, use the `on-battery` and `on-ac` events.
	**/
	static function isOnBatteryPower():Bool;
}
enum abstract PowerMonitorEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the system is suspending.
	**/
	var suspend : electron.remote.PowerMonitorEvent<Void -> Void> = "suspend";
	/**
		Emitted when system is resuming.
	**/
	var resume : electron.remote.PowerMonitorEvent<Void -> Void> = "resume";
	/**
		Emitted when the system changes to AC power.
	**/
	var on_ac : electron.remote.PowerMonitorEvent<Void -> Void> = "on-ac";
	/**
		Emitted when system changes to battery power.
	**/
	var on_battery : electron.remote.PowerMonitorEvent<Void -> Void> = "on-battery";
	/**
		Emitted when the thermal state of the system changes. Notification of a change in the thermal status of the system, such as entering a critical temperature range. Depending on the severity, the system might take steps to reduce said temperature, for example, throttling the CPU or switching on the fans if available.
		
		Apps may react to the new state by reducing expensive computing tasks (e.g. video encoding), or notifying the user. The same state might be received repeatedly.
		
		See https://developer.apple.com/library/archive/documentation/Performance/Conceptual/power_efficiency_guidelines_osx/RespondToThermalStateChanges.html
	**/
	var thermal_state_change : electron.remote.PowerMonitorEvent<Void -> Void> = "thermal-state-change";
	/**
		Notification of a change in the operating system's advertised speed limit for CPUs, in percent. Values below 100 indicate that the system is impairing processing power due to thermal management.
	**/
	var speed_limit_change : electron.remote.PowerMonitorEvent<Void -> Void> = "speed-limit-change";
	/**
		Emitted when the system is about to reboot or shut down. If the event handler invokes `e.preventDefault()`, Electron will attempt to delay system shutdown in order for the app to exit cleanly. If `e.preventDefault()` is called, the app should exit as soon as possible by calling something like `app.quit()`.
	**/
	var shutdown : electron.remote.PowerMonitorEvent<Void -> Void> = "shutdown";
	/**
		Emitted when the system is about to lock the screen.
	**/
	var lock_screen : electron.remote.PowerMonitorEvent<Void -> Void> = "lock-screen";
	/**
		Emitted as soon as the systems screen is unlocked.
	**/
	var unlock_screen : electron.remote.PowerMonitorEvent<Void -> Void> = "unlock-screen";
	/**
		Emitted when a login session is activated. See documentation for more information.
	**/
	var user_did_become_active : electron.remote.PowerMonitorEvent<Void -> Void> = "user-did-become-active";
	/**
		Emitted when a login session is deactivated. See documentation for more information.
	**/
	var user_did_resign_active : electron.remote.PowerMonitorEvent<Void -> Void> = "user-did-resign-active";
}
