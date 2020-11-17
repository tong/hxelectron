package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-response-upload-data
**/
typedef ProtocolResponseUploadData = {
	/**
		MIME type of the content.
	**/
	var contentType : String;
	/**
		Content to be sent.
	**/
	var data : haxe.extern.EitherType<Dynamic, Dynamic>;
}
