package electron;
/**
	@see https://electronjs.org/docs/api/structures/upload-data
**/
typedef UploadData = {
	/**
		Content being sent.
	**/
	var bytes : js.node.Buffer;
	/**
		Path of file being uploaded.
	**/
	@:optional
	var file : String;
	/**
		UUID of blob data. Use ses.getBlobData method to retrieve the data.
	**/
	@:optional
	var blobUUID : String;
}
