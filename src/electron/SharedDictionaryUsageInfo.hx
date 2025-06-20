package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-dictionary-usage-info
**/
typedef SharedDictionaryUsageInfo = {
	/**
		The origin of the frame where the request originates. It’s specific to the individual frame making the request and is defined by its scheme, host, and port. In practice, will look like a URL.
	**/
	var frameOrigin : String;
	/**
		The site of the top-level browsing context (the main frame or tab that contains the request). It’s less granular than `frameOrigin` and focuses on the broader "site" scope. In practice, will look like a URL.
	**/
	var topFrameSite : String;
	/**
		The amount of bytes stored for this shared dictionary information object in Chromium's internal storage (usually Sqlite).
	**/
	var totalSizeBytes : Float;
}
