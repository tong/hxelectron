package electron;
@:jsRequire("electron", "desktopCapturer") @:require("electron") extern class DesktopCapturer {
	/**
		Starts gathering information about all available desktop media sources, and calls callback(error, sources) when finished. sources is an array of Source objects, each Source represents a screen or an individual window that can be captured, and has the following properties:
	**/
	static function getSources(options:{ @:optional
	var types : Array<String>; @:optional
	var thumbnailSize : { }; }, callback:haxe.Constraints.Function):Void;
}