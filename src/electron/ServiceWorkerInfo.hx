package electron;
/**
	@see https://electronjs.org/docs/api/structures/service-worker-info
**/
typedef ServiceWorkerInfo = {
	/**
		The full URL to the script that this service worker runs
	**/
	var scriptUrl : String;
	/**
		The base URL that this service worker is active for.
	**/
	var scope : String;
	/**
		The virtual ID of the process that this service worker is running in.  This is not an OS level PID.  This aligns with the ID set used for `webContents.getProcessId()`.
	**/
	var renderProcessId : Float;
}
