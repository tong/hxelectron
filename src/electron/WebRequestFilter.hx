package electron;
/**
	@see https://electronjs.org/docs/api/structures/web-request-filter
**/
typedef WebRequestFilter = {
	/**
		Array of URL patterns used to include requests that match these patterns. Use the pattern `<all_urls>` to match all URLs.
	**/
	var urls : Array<String>;
	/**
		Array of URL patterns used to exclude requests that match these patterns.
	**/
	@:optional
	var excludeUrls : Array<String>;
	/**
		Array of types that will be used to filter out the requests that do not match the types. When not specified, all types will be matched. Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media` or `webSocket`.
	**/
	@:optional
	var types : Array<String>;
}
