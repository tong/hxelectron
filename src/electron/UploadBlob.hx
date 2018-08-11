package electron;
/**
	@see http://electron.atom.io/docs/api/structures/upload-blob
**/
typedef UploadBlob = {
	/**
		blob.
	**/
	var type : String;
	/**
		UUID of blob data to upload.
	**/
	var blobUUID : String;
}
