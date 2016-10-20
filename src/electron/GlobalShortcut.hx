package electron;
@:jsRequire("electron", "globalShortcut") @:require("electron") extern class GlobalShortcut {
	/**
		Registers a global shortcut of accelerator. The callback is called when the registered shortcut is pressed by the user. When the accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
	**/
	static function register(accelerator:electron.Accelerator, callback:haxe.Constraints.Function):Dynamic;
	/**
		When the accelerator is already taken by other applications, this call will still return false. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
	**/
	static function isRegistered(accelerator:electron.Accelerator):Bool;
	/**
		Unregisters the global shortcut of accelerator.
	**/
	static function unregister(accelerator:electron.Accelerator):Dynamic;
	/**
		Unregisters all of the global shortcuts.
	**/
	static function unregisterAll():Dynamic;
}