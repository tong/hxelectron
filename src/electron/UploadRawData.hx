package electron;

/**
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