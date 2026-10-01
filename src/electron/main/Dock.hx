package electron.main;
/**
	@see https://electronjs.org/docs/api/dock
**/
@:jsRequire("electron", "Dock") extern class Dock extends js.node.events.EventEmitter<electron.main.Dock> {
	/**
		an ID representing the request.
		
		When `critical` is passed, the dock icon will bounce until either the application becomes active or the request is canceled.
		
		When `informational` is passed, the dock icon will bounce for one second. However, the request remains active until either the application becomes active or the request is canceled.
		
		> [!NOTE] This method can only be used while the app is not focused; when the app is focused it will return -1.
	**/
	function bounce(?type:String):Int;
	/**
		Cancel the bounce of `id`.
	**/
	function cancelBounce(id:Int):Void;
	/**
		Bounces the Downloads stack if the filePath is inside the Downloads folder.
	**/
	function downloadFinished(filePath:String):Void;
	/**
		Sets the string to be displayed in the dock’s badging area.
		
		> [!IMPORTANT] You need to ensure that your application has the permission to display notifications for this method to work.
	**/
	function setBadge(text:String):Void;
	/**
		The badge string of the dock.
	**/
	function getBadge():String;
	/**
		Hides the dock icon.
		
		> [!IMPORTANT] **Known issue:** Calling `dock.hide()` within one second of a previous call will have no effect. As a workaround, ensure at least one second has elapsed between calls — for example, by deferring with a `setTimeout` of 1100ms or more after a previous call.
	**/
	function hide():Void;
	/**
		Resolves when the dock icon is shown.
	**/
	function show():js.lib.Promise<Any>;
	/**
		Whether the dock icon is visible.
	**/
	function isVisible():Bool;
	/**
		Sets the application's dock menu.
	**/
	function setMenu(menu:electron.main.Menu):Void;
	/**
		The application's dock menu.
	**/
	function getMenu():haxe.extern.EitherType<electron.main.Menu, Dynamic>;
	/**
		Sets the `image` associated with this dock icon.
	**/
	function setIcon(image:haxe.extern.EitherType<electron.NativeImage, String>):Void;
}
enum abstract DockEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
