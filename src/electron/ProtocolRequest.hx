package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-request
**/
typedef ProtocolRequest = {
	var url : String;
	var referrer : String;
	/**
		The origin that issued the request (for example `https://example.com`, or `null` for an opaque origin). Absent for requests the browser started itself. Unlike `referrer`, this is not controlled by the requesting page.
	**/
	@:optional
	var initiatorOrigin : String;
	var method : String;
	@:optional
	var uploadData : Array<electron.UploadData>;
	var headers : Dynamic;
}
