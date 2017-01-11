package electron;

/**
**/
@:require(js, electron) typedef MimeTypedBuffer = {
	/**
		The mimeType of the Buffer that you are sending
	**/
	var mimeType : String;
	/**
		The actual Buffer content
	**/
	var buffer : js.node.Buffer;
}