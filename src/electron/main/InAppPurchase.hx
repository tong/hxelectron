package electron.main;
/**
	@see http://electronjs.org/docs/api/in-app-purchase
**/
@:jsRequire("electron", "inAppPurchase") extern class InAppPurchase extends js.node.events.EventEmitter<electron.main.InAppPurchase> {
	/**
		Returns `true` if the product is valid and added to the payment queue.
		
		You should listen for the `transactions-updated` event as soon as possible and certainly before you call `purchaseProduct`.
	**/
	static function purchaseProduct(productID:String, ?quantity:Int):js.lib.Promise<Any>;
	/**
		Resolves with an array of `Product` objects.
		
		Retrieves the product descriptions.
	**/
	static function getProducts(productIDs:Array<String>):js.lib.Promise<Any>;
	/**
		whether a user can make a payment.
	**/
	static function canMakePayments():Bool;
	/**
		the path to the receipt.
	**/
	static function getReceiptURL():String;
	/**
		Completes all pending transactions.
	**/
	static function finishAllTransactions():Void;
	/**
		Completes the pending transactions corresponding to the date.
	**/
	static function finishTransactionByDate(date:String):Void;
}
@:enum abstract InAppPurchaseEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) to js.node.events.EventEmitter.Event<T> {
	var transactions_updated : electron.main.InAppPurchaseEvent<Void -> Void> = "transactions-updated";
}
