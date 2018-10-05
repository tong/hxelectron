package electron.main;
/**
	Create TouchBar layouts for native macOS applications
	@see http://electronjs.org/docs/api/touch-bar
**/
@:jsRequire("electron", "TouchBar") extern class TouchBar {
	/**
		A TouchBarItem that will replace the "esc" button on the touch bar when set. Setting to null restores the default "esc" button. Changing this value immediately updates the escape item in the touch bar.
	**/
	var escapeItem : Dynamic;
	function new(options:{ var items : Array<haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, Dynamic>>>>>>>>>; @:optional
	var escapeItem : haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, haxe.extern.EitherType<Dynamic, Dynamic>>>>>>>>>; }):Void;
}
