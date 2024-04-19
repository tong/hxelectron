package electron;
/**
	@see https://electronjs.org/docs/api/structures/filesystem-permission-request
**/
typedef FilesystemPermissionRequest = {
	/**
		The path of the `fileSystem` request.
	**/
	@:optional
	var filePath : String;
	/**
		Whether the `fileSystem` request is a directory.
	**/
	@:optional
	var isDirectory : Bool;
	/**
		The access type of the `fileSystem` request. Can be `writable` or `readable`.
	**/
	@:optional
	var fileAccessType : String;
}
