package electron;
/**
	@see https://electronjs.org/docs/api/structures/upload-file
**/
typedef UploadFile = {
	/**
		`file`.
	**/
	var type : String;
	/**
		Path of file to be uploaded.
	**/
	var filePath : String;
	/**
		Defaults to `0`.
	**/
	var offset : Int;
	/**
		Number of bytes to read from `offset`. Defaults to `0`.
	**/
	var length : Int;
	/**
		Last Modification time in number of seconds since the UNIX epoch.
	**/
	var modificationTime : Float;
}
