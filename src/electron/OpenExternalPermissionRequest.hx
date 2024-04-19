package electron;
/**
	@see https://electronjs.org/docs/api/structures/open-external-permission-request
**/
typedef OpenExternalPermissionRequest = {
	/**
		The url of the `openExternal` request.
	**/
	@:optional
	var externalURL : String;
}
