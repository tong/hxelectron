package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-texture-import-texture-info
**/
typedef SharedTextureImportTextureInfo = {
	/**
		The pixel format of the texture.
	**/
	var pixelFormat : SharedTextureImportTextureInfoPixelFormat;
	/**
		The color space of the texture.
	**/
	@:optional
	var colorSpace : electron.ColorSpace;
	/**
		The full dimensions of the shared texture.
	**/
	var codedSize : electron.Size;
	/**
		A subsection of [0, 0, codedSize.width, codedSize.height]. In common cases, it is the full section area.
	**/
	@:optional
	var visibleRect : electron.Rectangle;
	/**
		A timestamp in microseconds that will be reflected to `VideoFrame`.
	**/
	@:optional
	var timestamp : Float;
	/**
		The shared texture handle.
	**/
	var handle : electron.SharedTextureHandle;
}
enum abstract SharedTextureImportTextureInfoPixelFormat(String) from String to String {
	/**
		32bpp BGRA (byte-order), 1 plane.
	**/
	var bgra = "bgra";
	/**
		32bpp RGBA (byte-order), 1 plane.
	**/
	var rgba = "rgba";
	/**
		Half float RGBA, 1 plane.
	**/
	var rgbaf16 = "rgbaf16";
	/**
		12bpp with Y plane followed by a 2x2 interleaved UV plane.
	**/
	var nv12 = "nv12";
	/**
		16bpp with Y plane followed by a 2x1 interleaved UV plane.
	**/
	var nv16 = "nv16";
	/**
		4:2:0 10-bit YUV (little-endian), Y plane followed by a 2x2 interleaved UV plane.
	**/
	var p010le = "p010le";
}
