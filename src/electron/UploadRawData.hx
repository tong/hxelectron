package electron;
/**
	@see https://electronjs.org/docs/api/structures/upload-raw-data
**/
typedef UploadRawData = {
	/**
		`rawData`.
	**/
	var type : js.node.Buffer;
	/**
		Data to be uploaded.
	**/
	var bytes : js.node.Buffer;
}
