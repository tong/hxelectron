package electron;
/**
	@see https://electronjs.org/docs/api/structures/post-data
**/
typedef PostData = {
	/**
		One of the following:
	**/
	var type : String;
	/**
		The raw bytes of the post data in a `Buffer`. Required for the `rawData` type.
	**/
	var bytes : String;
	/**
		The path of the file being uploaded. Required for the `file` type.
	**/
	var filePath : String;
	/**
		The `UUID` of the `Blob` being uploaded. Required for the `blob` type.
	**/
	var blobUUID : String;
	/**
		The offset from the beginning of the file being uploaded, in bytes. Only valid for `file` types.
	**/
	var offset : Int;
	/**
		The length of the file being uploaded, in bytes. If set to `-1`, the whole file will be uploaded. Only valid for `file` types.
	**/
	var length : Int;
	/**
		The modification time of the file represented by a double, which is the number of seconds since the `UNIX Epoch` (Jan 1, 1970). Only valid for `file` types.
	**/
	var modificationTime : Float;
}
