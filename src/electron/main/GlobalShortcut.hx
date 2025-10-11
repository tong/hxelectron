package electron.main;
/**
	> Detect keyboard events when the application does not have keyboard focus.
	
	Process: Main
	
	The `globalShortcut` module can register/unregister a global keyboard shortcut with the operating system so that you can customize the operations for various shortcuts.
	
	> [!NOTE] The shortcut is global; it will work even if the app does not have the keyboard focus. This module cannot be used before the `ready` event of the app module is emitted. Please also note that it is also possible to use Chromium's `GlobalShortcutsPortal` implementation, which allows apps to bind global shortcuts when running within a Wayland session.
	
	```
	const { app, globalShortcut } = require('electron')
	
	// Enable usage of Portal's globalShortcuts. This is essential for cases when
	// the app runs in a Wayland session.
	app.commandLine.appendSwitch('enable-features', 'GlobalShortcutsPortal')
	
	app.whenReady().then(() => {
	  // Register a 'CommandOrControl+X' shortcut listener.
	  const ret = globalShortcut.register('CommandOrControl+X', () => {
	    console.log('CommandOrControl+X is pressed')
	  })
	
	  if (!ret) {
	    console.log('registration failed')
	  }
	
	  // Check whether a shortcut is registered.
	  console.log(globalShortcut.isRegistered('CommandOrControl+X'))
	})
	
	app.on('will-quit', () => {
	  // Unregister a shortcut.
	  globalShortcut.unregister('CommandOrControl+X')
	
	  // Unregister all shortcuts.
	  globalShortcut.unregisterAll()
	})
	```
	
	> [!TIP] See also: A detailed guide on Keyboard Shortcuts.
	@see https://electronjs.org/docs/api/global-shortcut
**/
@:jsRequire("electron", "globalShortcut") extern class GlobalShortcut extends js.node.events.EventEmitter<electron.main.GlobalShortcut> {
	/**
		Whether or not the shortcut was registered successfully.
		
		Registers a global shortcut of `accelerator`. The `callback` is called when the registered shortcut is pressed by the user.
		
		When the accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
		
		The following accelerators will not be registered successfully on macOS 10.14 Mojave unless the app has been authorized as a trusted accessibility client:
		
		* "Media Play/Pause"
		* "Media Next Track"
		* "Media Previous Track"
		* "Media Stop"
	**/
	static function register(accelerator:String, callback:haxe.Constraints.Function):Bool;
	/**
		Registers a global shortcut of all `accelerator` items in `accelerators`. The `callback` is called when any of the registered shortcuts are pressed by the user.
		
		When a given accelerator is already taken by other applications, this call will silently fail. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
		
		The following accelerators will not be registered successfully on macOS 10.14 Mojave unless the app has been authorized as a trusted accessibility client:
		
		* "Media Play/Pause"
		* "Media Next Track"
		* "Media Previous Track"
		* "Media Stop"
	**/
	static function registerAll(accelerators:Array<String>, callback:haxe.Constraints.Function):Void;
	/**
		Whether this application has registered `accelerator`.
		
		When the accelerator is already taken by other applications, this call will still return `false`. This behavior is intended by operating systems, since they don't want applications to fight for global shortcuts.
	**/
	static function isRegistered(accelerator:String):Bool;
	/**
		Unregisters the global shortcut of `accelerator`.
	**/
	static function unregister(accelerator:String):Void;
	/**
		Unregisters all of the global shortcuts.
	**/
	static function unregisterAll():Void;
}
enum abstract GlobalShortcutEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
