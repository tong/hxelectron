package electron;
/**
	@see https://electronjs.org/docs/api/structures/mime-typed-buffer
**/
typedef MimeTypedBuffer = {
	/**
		MIME type of the buffer.
	**/
	var mimeType : String;
	/**
		Charset of the buffer.
	**/
	var charset : String;
	/**
		The actual Buffer content.
	**/
	var data : js.node.Buffer;
}
