package electron;
/**
	@see https://electronjs.org/docs/api/structures/permission-request
**/
typedef PermissionRequest = {
	/**
		The last URL the requesting frame loaded.
	**/
	var requestingUrl : String;
	/**
		Whether the frame making the request is the main frame.
	**/
	var isMainFrame : Bool;
}
