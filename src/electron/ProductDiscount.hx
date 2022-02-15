package electron;
/**
	@see https://electronjs.org/docs/api/structures/product-discount
**/
typedef ProductDiscount = {
	/**
		A string used to uniquely identify a discount offer for a product.
	**/
	var identifier : String;
	/**
		The type of discount offer.
	**/
	var type : Float;
	/**
		The discount price of the product in the local currency.
	**/
	var price : Float;
	/**
		The locale used to format the discount price of the product.
	**/
	var priceLocale : String;
	/**
		The payment mode for this product discount. Can be `payAsYouGo`, `payUpFront`, or `freeTrial`.
	**/
	var paymentMode : String;
	/**
		An integer that indicates the number of periods the product discount is available.
	**/
	var numberOfPeriods : Float;
	/**
		An object that defines the period for the product discount.
	**/
	var subscriptionPeriod : electron.ProductSubscriptionPeriod;
}
