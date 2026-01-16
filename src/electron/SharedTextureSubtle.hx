package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-texture-subtle
**/
typedef SharedTextureSubtle = {
	/**
		Imports the shared texture from the given options. Returns the imported shared texture.
	**/
	var importSharedTexture : haxe.Constraints.Function;
	/**
		Finishes the transfer of the shared texture and gets the transferred shared texture. Returns the imported shared texture from the transfer object.
	**/
	var finishTransferSharedTexture : haxe.Constraints.Function;
}
