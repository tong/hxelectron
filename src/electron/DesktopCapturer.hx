package electron;
@:jsRequire("electron", "desktopCapturer") @:require(electron_renderer) @:require(electron) extern class DesktopCapturer {
	/**
		Starts gathering information about all available desktop media sources, and calls callback(error, sources) when finished. sources is an array of Source objects, each Source represents a screen or an individual window that can be captured, and has the following properties:
	**/
	static function getSources(options:{ /**
		An array of Strings that lists the types of desktop sources to be captured, available types are and .
	**/
	@:optional
	var types : Array<String>; /**
		(optional) - The suggested size that the media source thumbnail should be scaled to, defaults to .
	**/
	@:optional
	var thumbnailSize : { }; }, callback:haxe.Constraints.Function):Void;
}