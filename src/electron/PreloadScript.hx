package electron;
/**
	@see https://electronjs.org/docs/api/structures/preload-script
**/
typedef PreloadScript = {
	/**
		Context type where the preload script will be executed. Possible values include `frame` or `service-worker`.
	**/
	var type : String;
	/**
		Unique ID of preload script.
	**/
	var id : String;
	/**
		Path of the script file. Must be an absolute path.
	**/
	var filePath : String;
}
