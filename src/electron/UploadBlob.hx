package electron;

/**
**/
@:require(js, electron) typedef UploadBlob = {
	/**
		.
	**/
	var type : String;
	/**
		UUID of blob data to upload.
	**/
	var blobUUID : String;
}