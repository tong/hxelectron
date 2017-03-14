package electron;

/**
	Natively wrap images such as tray, dock, and application icons.

	See: <http://electron.atom.io/docs/api/native-image>
**/
@:require(js, electron) @:jsRequire("electron", "NativeImage") extern class NativeImage {
	function toPNG():js.node.Buffer;
	function toJPEG(quality:Int):js.node.Buffer;
	function toBitmap():js.node.Buffer;
	function toDataURL():String;
	/**
		The difference between getBitmap() and toBitmap() is, getBitmap() does not copy the bitmap data, so you have to use the returned Buffer immediately in current event loop tick, otherwise the data might be changed or destroyed.
	**/
	function getBitmap():js.node.Buffer;
	/**
		Notice that the returned pointer is a weak pointer to the underlying native image instead of a copy, so you must ensure that the associated nativeImage instance is kept around.
	**/
	function getNativeHandle():js.node.Buffer;
	function isEmpty():Bool;
	function getSize():{ @:optional
	var width : Int; @:optional
	var height : Int; };
	/**
		Marks the image as a template image.
	**/
	function setTemplateImage(option:Bool):Void;
	function isTemplateImage():Bool;
	function crop(rect:{ @:optional
	var x : Int; @:optional
	var y : Int; @:optional
	var width : Int; @:optional
	var height : Int; }):NativeImage;
	/**
		If only the height or the width are specified then the current aspect ratio will be preserved in the resized image.
	**/
	function resize(options:{ @:optional
	var width : Int; @:optional
	var height : Int; /**
		The desired quality of the resize image. Possible values are , or . The default is . These values express a desired quality/speed tradeoff. They are translated into an algorithm-specific method that depends on the capabilities (CPU, GPU) of the underlying platform. It is possible for all three methods to be mapped to the same algorithm on a given platform.
	**/
	@:optional
	var quality : String; }):NativeImage;
	function getAspectRatio():Float;
	/**
		Creates an empty NativeImage instance.
	**/
	static function createEmpty():NativeImage;
	/**
		Creates a new NativeImage instance from a file located at path. This method returns an empty image if the path does not exist, cannot be read, or is not a valid image.
	**/
	static function createFromPath(path:String):NativeImage;
	/**
		Creates a new NativeImage instance from buffer.
	**/
	static function createFromBuffer(buffer:js.node.Buffer, ?options:{ /**
		Required for bitmap buffers.
	**/
	@:optional
	var width : Int; /**
		Required for bitmap buffers.
	**/
	@:optional
	var height : Int; /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):NativeImage;
	/**
		Creates a new NativeImage instance from dataURL.
	**/
	static function createFromDataURL(dataURL:String):Void;
}