package electron.main;
/**
	In-app purchases on Mac App Store.
	@see http://electronjs.org/docs/api/in-app-purchase
**/
@:jsRequire("electron", "inAppPurchase") extern class InAppPurchase extends js.node.events.EventEmitter<electron.main.InAppPurchase> {
	/**
		You should listen for the transactions-updated event as soon as possible and certainly before you call purchaseProduct.
	**/
	static function purchaseProduct(productID:String, ?quantity:Int, ?callback:haxe.Constraints.Function):Void;
	/**
		Retrieves the product descriptions.
	**/
	static function getProducts(productIDs:Array<String>, callback:haxe.Constraints.Function):Void;
	static function canMakePayments():Bool;
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
	/**
		Emitted when one or more transactions have been updated.
	**/
	var transactions_updated : electron.main.InAppPurchaseEvent<(js.html.Event, Array<electron.Transaction>) -> Void> = "transactions-updated";
}
