package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-texture-import-texture-info
**/
typedef SharedTextureImportTextureInfo = {
	/**
		The pixel format of the texture.
	**/
	var pixelFormat : String;
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
