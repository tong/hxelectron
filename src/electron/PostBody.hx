package electron;
/**
	@see https://electronjs.org/docs/api/structures/post-body
**/
typedef PostBody = {
	/**
		The post data to be sent to the new window.
	**/
	var data : Array<haxe.extern.EitherType<electron.UploadRawData, electron.UploadFile>>;
	/**
		The `content-type` header used for the data. One of `application/x-www-form-urlencoded` or `multipart/form-data`. Corresponds to the `enctype` attribute of the submitted HTML form.
	**/
	var contentType : String;
	/**
		The boundary used to separate multiple parts of the message. Only valid when `contentType` is `multipart/form-data`.
	**/
	var boundary : String;
}
