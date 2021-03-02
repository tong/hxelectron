package electron.remote;
/**
	> Create share menu on macOS.
	
	Process: Main
	
	The `ShareMenu` class creates Share Menu on macOS, which can be used to share information from the current context to apps, social media accounts, and other services.
	
	For including the share menu as a submenu of other menus, please use the `shareMenu` role of `MenuItem`.
	@see https://electronjs.org/docs/api/share-menu
**/
@:jsRequire("electron", "remote.ShareMenu") extern class ShareMenu extends js.node.events.EventEmitter<electron.remote.ShareMenu> {
	function new(sharingItem:electron.SharingItem):Void;
	/**
		Pops up this menu as a context menu in the `BrowserWindow`.
	**/
	function popup(?options:PopupOptions):Void;
	/**
		Closes the context menu in the `browserWindow`.
	**/
	function closePopup(?browserWindow:electron.remote.BrowserWindow):Void;
}
@:enum abstract ShareMenuEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
