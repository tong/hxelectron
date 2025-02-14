package electron;
/**
	@see https://electronjs.org/docs/api/structures/navigation-entry
**/
typedef NavigationEntry = {
	var url : String;
	var title : String;
	/**
		A base64 encoded data string containing Chromium page state including information like the current scroll position or form values. It is committed by Chromium before a navigation event and on a regular interval.
	**/
	@:optional
	var pageState : String;
}
