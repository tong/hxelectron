package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/upload-data>
**/
@:require(js, electron) typedef UploadData = {
	/**
		Content being sent.
	**/
	var bytes : js.node.Buffer;
	/**
		Path of file being uploaded.
	**/
	var file : String;
	/**
		UUID of blob data. Use method to retrieve the data.
	**/
	var blobUUID : String;
}