package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-raw-data>
**/
@:require(js, electron) typedef UploadRawData = {
	/**
		.
	**/
	var type : String;
	/**
		Data to be uploaded.
	**/
	var bytes : js.node.Buffer;
}