package electron.main;
/**
	> Create a popover in the touch bar for native macOS applications
	
	Process: Main<br /> _This class is not exported from the `'electron'` module. It is only available as a return value of other methods in the Electron API._
	@see https://electronjs.org/docs/api/touch-bar-popover
**/
@:jsRequire("electron", "TouchBarPopover") extern class TouchBarPopover extends js.node.events.EventEmitter<electron.main.TouchBarPopover> {
	/**
		A `string` representing the popover's current button text. Changing this value immediately updates the popover in the touch bar.
	**/
	var label : String;
	/**
		A `NativeImage` representing the popover's current button icon. Changing this value immediately updates the popover in the touch bar.
	**/
	var icon : electron.NativeImage;
	function new(options:{ /**
		Popover button text.
	**/
	@:optional
	var label : String; /**
		Popover button icon.
	**/
	@:optional
	var icon : electron.NativeImage; /**
		Items to display in the popover.
	**/
	var items : electron.main.TouchBar; /**
		`true` to display a close button on the left of the popover, `false` to not show it. Default is `true`.
	**/
	@:optional
	var showCloseButton : Bool; }):Void;
}
enum abstract TouchBarPopoverEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
