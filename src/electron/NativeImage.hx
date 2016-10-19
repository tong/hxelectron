package electron;
@:jsRequire("electron", "NativeImage") @:require("electron") extern class NativeImage {
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
	function getSize():Dynamic;
	/**
		Marks the image as a template image.
	**/
	function setTemplateImage(option:Bool):Void;
	function isTemplateImage():Bool;
	function crop(rect:{ @:optional
	var x : Int; @:optional
	var y : Int; @:optional
	var width : Int; @:optional
	var height : Int; }):electron.NativeImage;
	/**
		If only the height or the width are specified then the current aspect ratio will be preserved in the resized image.
	**/
	function resize(options:{ @:optional
	var width : Int; @:optional
	var height : Int; @:optional
	var quality : String; }):electron.NativeImage;
	function getAspectRatio():Float;
}