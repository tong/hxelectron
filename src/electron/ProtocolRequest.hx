package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-request
**/
typedef ProtocolRequest = {
	var url : String;
	var referrer : String;
	var method : String;
	@:optional
	var uploadData : Array<electron.UploadData>;
	var headers : Record;
}
