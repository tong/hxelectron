package electron;
/**
	@see http://electron.atom.io/docs/api/structures/upload-raw-data
**/
typedef UploadRawData = {
	/**
		rawData.
	**/
	var type : String;
	/**
		Data to be uploaded.
	**/
	var bytes : js.node.Buffer;
}
