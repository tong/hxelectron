package electron.remote;
/**
	@see https://electronjs.org/docs/api/dock
**/
@:jsRequire("electron", "remote.Dock") extern class Dock extends js.node.events.EventEmitter<electron.remote.Dock> {
	/**
		an ID representing the request.
		
		When `critical` is passed, the dock icon will bounce until either the application becomes active or the request is canceled.
		
		When `informational` is passed, the dock icon will bounce for one second. However, the request remains active until either the application becomes active or the request is canceled.
		
		**Nota Bene:** This method can only be used while the app is not focused; when the app is focused it will return -1.
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
	**/
	function setBadge(text:String):Void;
	/**
		The badge string of the dock.
	**/
	function getBadge():String;
	/**
		Hides the dock icon.
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
		Sets the application's [dock menu][dock-menu].
	**/
	function setMenu(menu:electron.remote.Menu):Void;
	/**
		The application's [dock menu][dock-menu].
	**/
	function getMenu():haxe.extern.EitherType<Dynamic, Dynamic>;
	/**
		Sets the `image` associated with this dock icon.
	**/
	function setIcon(image:haxe.extern.EitherType<Dynamic, Dynamic>):Void;
}
@:enum abstract DockEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
