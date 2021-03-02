package electron;
/**
	@see https://electronjs.org/docs/api/structures/sharing-item
**/
typedef SharingItem = {
	/**
		An array of text to share.
	**/
	var texts : Array<String>;
	/**
		An array of files to share.
	**/
	var filePaths : Array<String>;
	/**
		An array of URLs to share.
	**/
	var urls : Array<String>;
}
