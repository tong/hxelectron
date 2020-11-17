package electron;
/**
	@see https://electronjs.org/docs/api/native-image
**/
@:jsRequire("electron", "NativeImage") extern class NativeImage extends js.node.events.EventEmitter<electron.NativeImage> {
	/**
		Creates an empty `NativeImage` instance.
	**/
	static function createEmpty():electron.NativeImage;
	/**
		fulfilled with the file's thumbnail preview image, which is a NativeImage.
	**/
	static function createThumbnailFromPath(path:String, maxSize:electron.Size):js.lib.Promise<Any>;
	/**
		Creates a new `NativeImage` instance from a file located at `path`. This method returns an empty image if the `path` does not exist, cannot be read, or is not a valid image.
	**/
	static function createFromPath(path:String):electron.NativeImage;
	/**
		Creates a new `NativeImage` instance from `buffer` that contains the raw bitmap pixel data returned by `toBitmap()`. The specific format is platform-dependent.
	**/
	static function createFromBitmap(buffer:js.node.Buffer, options:{ var width : Int; var height : Int; /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):electron.NativeImage;
	/**
		Creates a new `NativeImage` instance from `buffer`. Tries to decode as PNG or JPEG first.
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
	var scaleFactor : Float; }):electron.NativeImage;
	/**
		Creates a new `NativeImage` instance from `dataURL`.
	**/
	static function createFromDataURL(dataURL:String):electron.NativeImage;
	/**
		Creates a new `NativeImage` instance from the NSImage that maps to the given image name. See `System Icons` for a list of possible values.
		
		The `hslShift` is applied to the image with the following rules:
		
		* `hsl_shift[0]` (hue): The absolute hue value for the image - 0 and 1 map to 0 and 360 on the hue color wheel (red).
		* `hsl_shift[1]` (saturation): A saturation shift for the image, with the following key values: 0 = remove all color. 0.5 = leave unchanged. 1 = fully saturate the image.
		* `hsl_shift[2]` (lightness): A lightness shift for the image, with the following key values: 0 = remove all lightness (make all pixels black). 0.5 = leave unchanged. 1 = full lightness (make all pixels white).
		
		This means that `[-1, 0, 1]` will make the image completely white and `[-1, 1, 0]` will make the image completely black.
		
		In some cases, the `NSImageName` doesn't match its string representation; one example of this is `NSFolderImageName`, whose string representation would actually be `NSFolder`. Therefore, you'll need to determine the correct string representation for your image before passing it in. This can be done with the following:
		
		`echo -e '#import <Cocoa/Cocoa.h>\nint main() { NSLog(@"%@", SYSTEM_IMAGE_NAME); }' | clang -otest -x objective-c -framework Cocoa - && ./test`
		
		where `SYSTEM_IMAGE_NAME` should be replaced with any value from this list.
	**/
	static function createFromNamedImage(imageName:String, ?hslShift:Array<Float>):electron.NativeImage;
	/**
		A `Boolean` property that determines whether the image is considered a template image.
		
		Please note that this property only has an effect on macOS.
	**/
	var isMacTemplateImage : Bool;
	/**
		A Buffer that contains the image's `PNG` encoded data.
	**/
	function toPNG(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		A Buffer that contains the image's `JPEG` encoded data.
	**/
	function toJPEG(quality:Int):js.node.Buffer;
	/**
		A Buffer that contains a copy of the image's raw bitmap pixel data.
	**/
	function toBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		The data URL of the image.
	**/
	function toDataURL(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):String;
	/**
		A Buffer that contains the image's raw bitmap pixel data.
		
		The difference between `getBitmap()` and `toBitmap()` is that `getBitmap()` does not copy the bitmap data, so you have to use the returned Buffer immediately in current event loop tick; otherwise the data might be changed or destroyed.
	**/
	function getBitmap(?options:{ /**
		Defaults to 1.0.
	**/
	@:optional
	var scaleFactor : Float; }):js.node.Buffer;
	/**
		A Buffer that stores C pointer to underlying native handle of the image. On macOS, a pointer to `NSImage` instance would be returned.
		
		Notice that the returned pointer is a weak pointer to the underlying native image instead of a copy, so you _must_ ensure that the associated `nativeImage` instance is kept around.
	**/
	function getNativeHandle():js.node.Buffer;
	/**
		Whether the image is empty.
	**/
	function isEmpty():Bool;
	/**
		If `scaleFactor` is passed, this will return the size corresponding to the image representation most closely matching the passed value.
	**/
	function getSize(?scaleFactor:Float):electron.Size;
	/**
		Marks the image as a template image.
	**/
	function setTemplateImage(option:Bool):Void;
	/**
		Whether the image is a template image.
	**/
	function isTemplateImage():Bool;
	/**
		The cropped image.
	**/
	function crop(rect:electron.Rectangle):electron.NativeImage;
	/**
		The resized image.
		
		If only the `height` or the `width` are specified then the current aspect ratio will be preserved in the resized image.
	**/
	function resize(options:{ /**
		Defaults to the image's width.
	**/
	@:optional
	var width : Int; /**
		Defaults to the image's height.
	**/
	@:optional
	var height : Int; /**
		The desired quality of the resize image. Possible values are `good`, `better`, or `best`. The default is `best`. These values express a desired quality/speed tradeoff. They are translated into an algorithm-specific method that depends on the capabilities (CPU, GPU) of the underlying platform. It is possible for all three methods to be mapped to the same algorithm on a given platform.
	**/
	@:optional
	var quality : String; }):electron.NativeImage;
	/**
		The image's aspect ratio.
		
		If `scaleFactor` is passed, this will return the aspect ratio corresponding to the image representation most closely matching the passed value.
	**/
	function getAspectRatio(?scaleFactor:Float):Float;
	/**
		An array of all scale factors corresponding to representations for a given nativeImage.
	**/
	function getScaleFactors():Array<Float>;
	/**
		Add an image representation for a specific scale factor. This can be used to explicitly add different scale factor representations to an image. This can be called on empty images.
	**/
	function addRepresentation(options:{ /**
		The scale factor to add the image representation for.
	**/
	var scaleFactor : Float; /**
		Defaults to 0. Required if a bitmap buffer is specified as `buffer`.
	**/
	@:optional
	var width : Int; /**
		Defaults to 0. Required if a bitmap buffer is specified as `buffer`.
	**/
	@:optional
	var height : Int; /**
		The buffer containing the raw image data.
	**/
	@:optional
	var buffer : js.node.Buffer; /**
		The data URL containing either a base 64 encoded PNG or JPEG image.
	**/
	@:optional
	var dataURL : String; }):Void;
}
@:enum abstract NativeImageEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {

}
