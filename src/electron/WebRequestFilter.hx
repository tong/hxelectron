package electron;
/**
	@see https://electronjs.org/docs/api/structures/web-request-filter
**/
typedef WebRequestFilter = {
	/**
		Array of URL patterns that will be used to filter out the requests that do not match the URL patterns.
	**/
	var urls : Array<String>;
	/**
		Array of types that will be used to filter out the requests that do not match the types. When not specified, all types will be matched. Can be `mainFrame`, `subFrame`, `stylesheet`, `script`, `image`, `font`, `object`, `xhr`, `ping`, `cspReport`, `media` or `webSocket`.
	**/
	@:optional
	var types : Array<String>;
}
