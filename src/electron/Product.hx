package electron;
/**
	@see https://electronjs.org/docs/api/structures/product
**/
typedef Product = {
	/**
		The string that identifies the product to the Apple App Store.
	**/
	var productIdentifier : String;
	/**
		A description of the product.
	**/
	var localizedDescription : String;
	/**
		The name of the product.
	**/
	var localizedTitle : String;
	/**
		A string that identifies the version of the content.
	**/
	var contentVersion : String;
	/**
		The total size of the content, in bytes.
	**/
	var contentLengths : Array<Float>;
	/**
		The cost of the product in the local currency.
	**/
	var price : Float;
	/**
		The locale formatted price of the product.
	**/
	var formattedPrice : String;
	/**
		3 character code presenting a product's currency based on the ISO 4217 standard.
	**/
	var currencyCode : String;
	/**
		A Boolean value that indicates whether the App Store has downloadable content for this product. `true` if at least one file has been associated with the product.
	**/
	var isDownloadable : Bool;
}
