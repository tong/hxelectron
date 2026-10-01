package electron;
/**
	@see https://electronjs.org/docs/api/structures/print-to-pdf-margins
**/
typedef PrintToPDFMargins = {
	/**
		Top margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var top : Float;
	/**
		Bottom margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var bottom : Float;
	/**
		Left margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var left : Float;
	/**
		Right margin in inches. Defaults to 1cm (~0.4 inches).
	**/
	@:optional
	var right : Float;
}
