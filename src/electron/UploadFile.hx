package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-file>
**/
@:require(js, electron) typedef UploadFile = {
	/**
		.
	**/
	var type : String;
	/**
		Path of file to be uploaded.
	**/
	var filePath : String;
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