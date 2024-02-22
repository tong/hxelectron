package electron.main;
/**
	
	
	### Class: TouchBar
	
	> Create TouchBar layouts for native macOS applications
	
	Process: Main
	@see https://electronjs.org/docs/api/touch-bar
**/
@:jsRequire("electron", "TouchBar") extern class TouchBar extends js.node.events.EventEmitter<electron.main.TouchBar> {
	/**
		A `TouchBarItem` that will replace the "esc" button on the touch bar when set. Setting to `null` restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ @:optional
	var items : Array<haxe.extern.EitherType<electron.main.TouchBarButton, haxe.extern.EitherType<electron.main.TouchBarColorPicker, haxe.extern.EitherType<electron.main.TouchBarGroup, haxe.extern.EitherType<electron.main.TouchBarLabel, haxe.extern.EitherType<electron.main.TouchBarPopover, haxe.extern.EitherType<electron.main.TouchBarScrubber, haxe.extern.EitherType<electron.main.TouchBarSegmentedControl, haxe.extern.EitherType<electron.main.TouchBarSlider, electron.main.TouchBarSpacer>>>>>>>>>; @:optional
	var escapeItem : haxe.extern.EitherType<electron.main.TouchBarButton, haxe.extern.EitherType<electron.main.TouchBarColorPicker, haxe.extern.EitherType<electron.main.TouchBarGroup, haxe.extern.EitherType<electron.main.TouchBarLabel, haxe.extern.EitherType<electron.main.TouchBarPopover, haxe.extern.EitherType<electron.main.TouchBarScrubber, haxe.extern.EitherType<electron.main.TouchBarSegmentedControl, haxe.extern.EitherType<electron.main.TouchBarSlider, haxe.extern.EitherType<electron.main.TouchBarSpacer, Dynamic>>>>>>>>>; }):Void;
}
enum abstract TouchBarEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {

}
