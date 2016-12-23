package electron;

/**
**/
@:require(js, electron) @:jsRequire("electron", "nativeImage") extern class NativeImage {
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