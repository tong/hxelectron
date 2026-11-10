package electron;
/**
	@see https://electronjs.org/docs/api/structures/media-access-permission-request
**/
typedef MediaAccessPermissionRequest = { /**
		The security origin of the request.
	**/
	@:optional
	var securityOrigin : String; /**
		The types of media access being requested - elements can be `video` or `audio`. For a `media` permission request these are the camera and microphone respectively; for a `display-capture` permission request they are the screen, window or tab video and its audio.
	**/
	@:optional
	var mediaTypes : Array<MediaAccessPermissionRequestMediaTypes>; } & electron.PermissionRequest;
enum abstract MediaAccessPermissionRequestMediaTypes(String) from String to String {
	var video = "video";
	var audio = "audio";
}
