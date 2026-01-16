package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-texture-imported
**/
typedef SharedTextureImported = {
	/**
		The unique identifier of the imported shared texture.
	**/
	var textureId : String;
	/**
		Create a `VideoFrame` that uses the imported shared texture in the current process. You can call `VideoFrame.close()` once you've finished using the object. The underlying resources will wait for GPU finish internally.
	**/
	var getVideoFrame : haxe.Constraints.Function;
	/**
		Release this object's reference of the imported shared texture. The underlying resource will be alive until every reference is released.
	**/
	var release : haxe.Constraints.Function;
	/**
		Provides subtle APIs to interact with the imported shared texture for advanced users.
	**/
	var subtle : electron.SharedTextureImportedSubtle;
}
