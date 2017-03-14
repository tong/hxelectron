package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-file-system>
**/
@:require(js, electron) typedef UploadFileSystem = {
	/**
		.
	**/
	var type : String;
	/**
		FileSystem url to read data for upload.
	**/
	var filsSystemURL : String;
	/**
		Defaults to .
	**/
	var offset : Int;
	/**
		Number of bytes to read from . Defaults to .
	**/
	var length : Int;
	/**
		Last Modification time in number of seconds sine the UNIX epoch.
	**/
	var modificationTime : Float;
}