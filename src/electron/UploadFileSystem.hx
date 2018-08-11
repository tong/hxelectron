package electron;
/**
	@see http://electron.atom.io/docs/api/structures/upload-file-system
**/
typedef UploadFileSystem = {
	/**
		fileSystem.
	**/
	var type : String;
	/**
		FileSystem url to read data for upload.
	**/
	var filsSystemURL : String;
	/**
		Defaults to 0.
	**/
	var offset : Int;
	/**
		Number of bytes to read from offset. Defaults to 0.
	**/
	var length : Int;
	/**
		Last Modification time in number of seconds since the UNIX epoch.
	**/
	var modificationTime : Float;
}
