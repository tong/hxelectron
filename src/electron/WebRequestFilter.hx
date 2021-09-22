package electron;
/**
	@see https://electronjs.org/docs/api/structures/web-request-filter
**/
typedef WebRequestFilter = {
	/**
		Array of URL patterns that will be used to filter out the requests that do not match the URL patterns.
	**/
	var urls : Array<String>;
}
