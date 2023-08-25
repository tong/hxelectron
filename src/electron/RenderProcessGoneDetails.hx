package electron;
/**
	@see https://electronjs.org/docs/api/structures/render-process-gone-details
**/
typedef RenderProcessGoneDetails = {
	/**
		The reason the render process is gone.  Possible values:
	**/
	var reason : String;
	/**
		The exit code of the process, unless `reason` is `launch-failed`, in which case `exitCode` will be a platform-specific launch failure error code.
	**/
	var exitCode : Int;
}
