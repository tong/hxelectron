package electron.main;
/**
	Detect keyboard events when the application does not have keyboard focus.
	@see http://electronjs.org/docs/api/global-shortcut
**/
@:jsRequire("electron", "globalShortcut") extern class GlobalShortcut {
	/**
		Registers a global shortcut of accelerator. The callback is called when the registered shortcut is pressed by the user. When the accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts. The following accelerators will not be registered successfully on macOS 10.14 Mojave unless the app has been authorized as a trusted accessibility client:
	**/
	static function register(accelerator:electron.Accelerator, callback:haxe.Constraints.Function):Void;
	/**
		When the accelerator is already taken by other applications, this call will still return false. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
	**/
	static function isRegistered(accelerator:electron.Accelerator):Bool;
	/**
		Unregisters the global shortcut of accelerator.
	**/
	static function unregister(accelerator:electron.Accelerator):Void;
	/**
		Unregisters all of the global shortcuts.
	**/
	static function unregisterAll():Void;
}
