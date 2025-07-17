package electron.main;
/**
	> A View that displays an image.
	
	Process: Main
	
	This module cannot be used until the `ready` event of the `app` module is emitted.
	
	Useful for showing splash screens that will be swapped for `WebContentsView`s when the content finishes loading.
	
	Note that `ImageView` is experimental and may be changed or removed in the future.
	
	### Class: ImageView extends `View`
	
	> A View that displays an image.
	
	Process: Main
	
	`ImageView` inherits from `View`.
	
	`ImageView` is an EventEmitter.
	
	> [!WARNING] Electron's built-in classes cannot be subclassed in user code. For more information, see the FAQ.
	@see https://electronjs.org/docs/api/image-view
**/
@:jsRequire("electron", "ImageView") extern class ImageView extends js.node.events.EventEmitter<electron.main.ImageView> {
	function new():Void;
	/**
		Sets the image for this `ImageView`. Note that only image formats supported by `NativeImage` can be used with an `ImageView`.
	**/
	function setImage(image:electron.NativeImage):Void;
}
enum abstract ImageViewEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
