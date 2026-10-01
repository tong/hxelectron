package electron;
/**
	@see https://electronjs.org/docs/api/structures/preload-script-registration
**/
typedef PreloadScriptRegistration = {
	/**
		Context type where the preload script will be executed. Possible values include `frame` or `service-worker`.
	**/
	var type : PreloadScriptRegistrationType;
	/**
		Unique ID of preload script. Defaults to a random UUID.
	**/
	@:optional
	var id : String;
	/**
		Path of the script file. Must be an absolute path.
	**/
	var filePath : String;
}
enum abstract PreloadScriptRegistrationType(String) from String to String {
	var frame = "frame";
	var service_worker = "service-worker";
}
