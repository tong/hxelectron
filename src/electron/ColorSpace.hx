package electron;
/**
	@see https://electronjs.org/docs/api/structures/color-space
**/
typedef ColorSpace = {
	/**
		The color primaries of the color space. Can be one of the following values:
	**/
	var primaries : String;
	/**
		The transfer function of the color space. Can be one of the following values:
	**/
	var transfer : String;
	/**
		The color matrix of the color space. Can be one of the following values:
	**/
	var matrix : String;
	/**
		The color range of the color space. Can be one of the following values:
	**/
	var range : String;
}
