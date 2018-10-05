package electron.renderer;
/**
	Access information about media sources that can be used to capture audio and
	video from the desktop using the navigator.mediaDevices.getUserMedia API.
	@see http://electronjs.org/docs/api/desktop-capturer
**/
@:jsRequire("electron", "desktopCapturer") extern class DesktopCapturer {
	/**
		Starts gathering information about all available desktop media sources, and calls callback(error, sources) when finished. sources is an array of DesktopCapturerSource objects, each DesktopCapturerSource represents a screen or an individual window that can be captured.
	**/
	static function getSources(options:{ /**
		An array of Strings that lists the types of desktop sources to be captured, available types are screen and window.
	**/
	var types : Array<String>; /**
		The size that the media source thumbnail should be scaled to. Default is 150 x 150.
	**/
	@:optional
	var thumbnailSize : electron.Size; }, callback:haxe.Constraints.Function):Void;
}
