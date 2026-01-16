package electron;
/**
	Use `sharedTexture.subtle.finishTransferSharedTexture` to get `SharedTextureImportedSubtle` back.
	@see https://electronjs.org/docs/api/structures/shared-texture-transfer
**/
typedef SharedTextureTransfer = {
	/**
		The opaque transfer data of the shared texture. This can be transferred across Electron processes.
	**/
	var transfer : String;
	/**
		The opaque sync token data for frame creation.
	**/
	var syncToken : String;
	/**
		The pixel format of the transferring texture.
	**/
	var pixelFormat : String;
	/**
		The full dimensions of the shared texture.
	**/
	var codedSize : electron.Size;
	/**
		A subsection of [0, 0, codedSize.width(), codedSize.height()]. In common cases, it is the full section area.
	**/
	var visibleRect : electron.Rectangle;
	/**
		A timestamp in microseconds that will be reflected to `VideoFrame`.
	**/
	var timestamp : Float;
}
