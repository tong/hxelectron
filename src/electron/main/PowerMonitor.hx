package electron.main;
/**
	Monitor power state changes.
	@see http://electronjs.org/docs/api/power-monitor
**/
@:jsRequire("electron", "powerMonitor") extern class PowerMonitor extends js.node.events.EventEmitter<electron.main.PowerMonitor> {

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
	@:electron_platforms(["Windows"])
	var on_ac : electron.main.PowerMonitorEvent<Void -> Void> = "on-ac";
	/**
		Emitted when system changes to battery power.
	**/
	@:electron_platforms(["Windows"])
	var on_battery : electron.main.PowerMonitorEvent<Void -> Void> = "on-battery";
	/**
		Emitted when the system is about to reboot or shut down. If the event handler invokes e.preventDefault(), Electron will attempt to delay system shutdown in order for the app to exit cleanly. If e.preventDefault() is called, the app should exit as soon as possible by calling something like app.quit().
	**/
	@:electron_platforms(["Linux", "macOS"])
	var shutdown : electron.main.PowerMonitorEvent<Void -> Void> = "shutdown";
	/**
		Emitted when the system is about to lock the screen.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var lock_screen : electron.main.PowerMonitorEvent<Void -> Void> = "lock-screen";
	/**
		Emitted as soon as the systems screen is unlocked.
	**/
	@:electron_platforms(["macOS", "Windows"])
	var unlock_screen : electron.main.PowerMonitorEvent<Void -> Void> = "unlock-screen";
}
