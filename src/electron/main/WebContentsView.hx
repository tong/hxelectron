package electron.main;
/**
	> A View that displays a WebContents.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	### Class: WebContentsView extends `View`
	
	> A View that displays a WebContents.
	
	Process: Main
	
	`WebContentsView` inherits from `View`.
	
	`WebContentsView` is an EventEmitter.
	@see https://electronjs.org/docs/api/web-contents-view
**/
@:jsRequire("electron", "WebContentsView") extern class WebContentsView extends js.node.events.EventEmitter<electron.main.WebContentsView> {
	/**
		A `WebContents` property containing a reference to the displayed `WebContents`. Use this to interact with the `WebContents`, for instance to load a URL.
	**/
	var webContents : electron.main.WebContents;
	function new(?options:{ /**
		Settings of web page's features.
	**/
	@:optional
	var webPreferences : electron.WebPreferences; }):Void;
}
enum abstract WebContentsViewEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
