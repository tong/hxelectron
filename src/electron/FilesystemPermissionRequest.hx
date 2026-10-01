package electron;
/**
	@see https://electronjs.org/docs/api/structures/filesystem-permission-request
**/
typedef FilesystemPermissionRequest = { /**
		The path of the `fileSystem` request.
	**/
	@:optional
	var filePath : String; /**
		Whether the `fileSystem` request is a directory.
	**/
	@:optional
	var isDirectory : Bool; /**
		The access type of the `fileSystem` request. Can be `writable` or `readable`.
	**/
	@:optional
	var fileAccessType : FilesystemPermissionRequestFileAccessType; } & electron.PermissionRequest;
enum abstract FilesystemPermissionRequestFileAccessType(String) from String to String {
	var writable = "writable";
	var readable = "readable";
}
