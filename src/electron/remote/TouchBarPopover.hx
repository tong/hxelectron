package electron.remote;
/**
	> Create a popover in the touch bar for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar-popover
**/
@:jsRequire("electron", "remote.TouchBarPopover") extern class TouchBarPopover extends js.node.events.EventEmitter<electron.remote.TouchBarPopover> {
	/**
		A `String` representing the popover's current button text. Changing this value immediately updates the popover in the touch bar.
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
	var items : electron.remote.TouchBar; /**
		`true` to display a close button on the left of the popover, `false` to not show it. Default is `true`.
	**/
	@:optional
	var showCloseButton : Bool; }):Void;
}
@:enum abstract TouchBarPopoverEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
