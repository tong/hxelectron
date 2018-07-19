package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/referrer>
**/
@:require(js, electron) @:electron typedef Referrer = {
	/**
		HTTP Referrer URL.
	**/
	var url : String;
	/**
		Can be default, unsafe-url, no-referrer-when-downgrade, no-referrer, origin, strict-origin-when-cross-origin, same-origin or strict-origin. See the for more details on the meaning of these values.
	**/
	var policy : String;
}