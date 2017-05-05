package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/mime-typed-buffer>
**/
@:require(js, electron) typedef MimeTypedBuffer = {
	/**
		The mimeType of the Buffer that you are sending
	**/
	var mimeType : String;
	/**
		The actual Buffer content
	**/
	var data : js.node.Buffer;
}