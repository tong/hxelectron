package electron.main;
/**
	@see https://electronjs.org/docs/api/app-shim-host
**/
@:jsRequire("electron", "AppShimHost") extern class AppShimHost extends js.node.events.EventEmitter<electron.main.AppShimHost> {
	/**
		A `number` representing the process ID of the shim.
	**/
	@:electron_experimental
	var pid : Float;
	/**
		A `string` representing the path of the app bundle that the shim's process was launched from.
	**/
	@:electron_experimental
	var bundlePath : String;
	/**
		A `string` representing the bundle identifier from that bundle's `Info.plist`. This value is not verified, so do not use it to decide whether to trust the shim. Use `shim.satisfiesCodeRequirement()` instead.
	**/
	@:electron_experimental
	var bundleId : String;
	/**
		Whether the shim's process is still connected.
	**/
	@:electron_experimental
	function isConnected():Bool;
	/**
		Whether the code signature of the shim's process satisfies `requirement`. The check is performed on the running process that connected, not on the bundle at `shim.bundlePath`.
		
		Throws if `requirement` cannot be parsed.
	**/
	@:electron_experimental
	function satisfiesCodeRequirement(requirement:String):Bool;
	/**
		Sets the text displayed on the shim's Dock icon. An empty string clears it.
	**/
	@:electron_experimental
	function setBadge(text:String):Void;
	/**
		Bounces the shim's Dock icon, in the same way that `dock.bounce()` bounces your app's.
	**/
	@:electron_experimental
	function bounce(?type:AppShimHostBounceType):Void;
	/**
		Cancels a bounce started by `shim.bounce()`.
	**/
	@:electron_experimental
	function cancelBounce():Void;
	/**
		Sets the menu bar that is shown while the shim is the active app. This is the shim's equivalent of `Menu.setApplicationMenu()`. Passing `null` restores the shim's minimal default menu.
		
		The `click` handlers of the menu's items and the menu's `menu-will-show` event run in your app's main process. Items with a `role` act on the shim instead of your app: for example, the `quit` role quits the shim. The default labels of the `about`, `hide` and `quit` roles use the shim's name.
		
		The shim displays the menu's items as they were when this method was called. Later changes to an item's `label`, `enabled`, `checked` or `visible` properties are applied when the shim becomes the active app, when one of its menus is opened, and after an item is clicked.
	**/
	@:electron_experimental
	function setApplicationMenu(menu:haxe.extern.EitherType<electron.main.Menu, Dynamic>):Void;
	/**
		Quits the shim's process and closes its windows. The windows do not emit `close` events. They emit `closed` shortly after this method returns. `shim.isConnected()` returns `false` as soon as this method returns.
	**/
	@:electron_experimental
	function quit():Void;
}
enum abstract AppShimHostEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> to js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when the user clicks the shim's Dock icon, or launches the shim again while it is already running.
	**/
	@:electron_experimental
	var activate : electron.main.AppShimHostEvent<(js.html.Event, Bool) -> Void> = "activate";
	/**
		Emitted when the user opens a file with the shim.
	**/
	@:electron_experimental
	var open_file : electron.main.AppShimHostEvent<(js.html.Event, String) -> Void> = "open-file";
	/**
		Emitted when the user opens a URL with the shim.
	**/
	@:electron_experimental
	var open_url : electron.main.AppShimHostEvent<(js.html.Event, String) -> Void> = "open-url";
	/**
		Emitted when the shim is asked to quit: by the user, for example with Cmd+Q or from its Dock menu, or by macOS at logout.
		
		By default, the shim quits and its windows are closed without emitting their `close` events. To keep the shim running, call `event.preventDefault()`. You can then close its windows yourself and call `shim.quit()` when you are done.
		
		`event.preventDefault()` must be called synchronously in the listener. If your app's main process is unresponsive for more than five seconds, the shim quits without waiting for it.
	**/
	@:electron_experimental
	var quit_requested : electron.main.AppShimHostEvent<js.html.Event -> Void> = "quit-requested";
	/**
		Emitted when the shim's process has exited or its connection was lost. All windows that were created in the shim have already been closed.
	**/
	@:electron_experimental
	var disconnected : electron.main.AppShimHostEvent<js.html.Event -> Void> = "disconnected";
}
enum abstract AppShimHostBounceType(String) from String to String {
	var critical = "critical";
	var informational = "informational";
}
