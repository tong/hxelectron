package electron.remote;
/**
	
	
	### Class: TouchBar
	
	> Create TouchBar layouts for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar
**/
@:jsRequire("electron", "remote.TouchBar") extern class TouchBar extends js.node.events.EventEmitter<electron.remote.TouchBar> {
	/**
		A `TouchBarItem` that will replace the "esc" button on the touch bar when set. Setting to `null` restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ @:optional
	var items : Array<haxe.extern.EitherType<electron.remote.TouchBarButton, haxe.extern.EitherType<electron.remote.TouchBarColorPicker, haxe.extern.EitherType<electron.remote.TouchBarGroup, haxe.extern.EitherType<electron.remote.TouchBarLabel, haxe.extern.EitherType<electron.remote.TouchBarPopover, haxe.extern.EitherType<electron.remote.TouchBarScrubber, haxe.extern.EitherType<electron.remote.TouchBarSegmentedControl, haxe.extern.EitherType<electron.remote.TouchBarSlider, electron.remote.TouchBarSpacer>>>>>>>>>; @:optional
	var escapeItem : haxe.extern.EitherType<electron.remote.TouchBarButton, haxe.extern.EitherType<electron.remote.TouchBarColorPicker, haxe.extern.EitherType<electron.remote.TouchBarGroup, haxe.extern.EitherType<electron.remote.TouchBarLabel, haxe.extern.EitherType<electron.remote.TouchBarPopover, haxe.extern.EitherType<electron.remote.TouchBarScrubber, haxe.extern.EitherType<electron.remote.TouchBarSegmentedControl, haxe.extern.EitherType<electron.remote.TouchBarSlider, haxe.extern.EitherType<electron.remote.TouchBarSpacer, Dynamic>>>>>>>>>; }):Void;
}
enum abstract TouchBarEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
