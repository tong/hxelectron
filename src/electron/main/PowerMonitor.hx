package electron.main;
/**
	> Monitor power state changes.
	
	Process: Main
	@see https://electronjs.org/docs/api/power-monitor
**/
@:jsRequire("electron", "powerMonitor") extern class PowerMonitor extends js.node.events.EventEmitter<electron.main.PowerMonitor> {
	/**
		A `Boolean` property. True if the system is on battery power.
		
		See `powerMonitor.isOnBatteryPower()`.
	**/
	static var onBatteryPower : Bool;
	/**
		The system's current state. Can be `active`, `idle`, `locked` or `unknown`.
		
		Calculate the system idle state. `idleThreshold` is the amount of time (in seconds) before considered idle.  `locked` is available on supported systems only.
	**/
	static function getSystemIdleState(idleThreshold:Int):String;
	/**
		Idle time in seconds
		
		Calculate system idle time in seconds.
	**/
	static function getSystemIdleTime():Int;
	/**
		Whether the system is on battery power.
		
		To monitor for changes in this property, use the `on-battery` and `on-ac` events.
	**/
	static function isOnBatteryPower():Bool;
}
@:enum abstract PowerMonitorEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the system is suspending.
	**/
	var suspend : electron.main.PowerMonitorEvent<Void -> Void> = "suspend";
	/**
		Emitted when system is resuming.
	**/
	var resume : electron.main.PowerMonitorEvent<Void -> Void> = "resume";
	/**
		Emitted when the system changes to AC power.
	**/
	var on_ac : electron.main.PowerMonitorEvent<Void -> Void> = "on-ac";
	/**
		Emitted when system changes to battery power.
	**/
	var on_battery : electron.main.PowerMonitorEvent<Void -> Void> = "on-battery";
	/**
		Emitted when the system is about to reboot or shut down. If the event handler invokes `e.preventDefault()`, Electron will attempt to delay system shutdown in order for the app to exit cleanly. If `e.preventDefault()` is called, the app should exit as soon as possible by calling something like `app.quit()`.
	**/
	var shutdown : electron.main.PowerMonitorEvent<Void -> Void> = "shutdown";
	/**
		Emitted when the system is about to lock the screen.
	**/
	var lock_screen : electron.main.PowerMonitorEvent<Void -> Void> = "lock-screen";
	/**
		Emitted as soon as the systems screen is unlocked.
	**/
	var unlock_screen : electron.main.PowerMonitorEvent<Void -> Void> = "unlock-screen";
	/**
		Emitted when a login session is activated. See documentation for more information.
	**/
	var user_did_become_active : electron.main.PowerMonitorEvent<Void -> Void> = "user-did-become-active";
	/**
		Emitted when a login session is deactivated. See documentation for more information.
	**/
	var user_did_resign_active : electron.main.PowerMonitorEvent<Void -> Void> = "user-did-resign-active";
}
