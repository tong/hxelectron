package electron;
/**
	@see https://electronjs.org/docs/api/structures/product-subscription-period
**/
typedef ProductSubscriptionPeriod = {
	/**
		The number of units per subscription period.
	**/
	var numberOfUnits : Float;
	/**
		The increment of time that a subscription period is specified in. Can be `day`, `week`, `month`, `year`.
	**/
	var unit : String;
}
