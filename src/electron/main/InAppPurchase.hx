package electron.main;
/**
	> In-app purchases on Mac App Store.
	
	Process: Main
	@see https://electronjs.org/docs/api/in-app-purchase
**/
@:jsRequire("electron", "inAppPurchase") extern class InAppPurchase extends js.node.events.EventEmitter<electron.main.InAppPurchase> {
	/**
		Returns `true` if the product is valid and added to the payment queue.
		
		You should listen for the `transactions-updated` event as soon as possible and certainly before you call `purchaseProduct`.
	**/
	static function purchaseProduct(productID:String, ?opts:haxe.extern.EitherType<Int, { /**
		The number of items the user wants to purchase.
	**/
	@:optional
	var quantity : Int; /**
		The string that associates the transaction with a user account on your service (applicationUsername).
	**/
	@:optional
	var username : String; }>):js.lib.Promise<Any>;
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
		Restores finished transactions. This method can be called either to install purchases on additional devices, or to restore purchases for an application that the user deleted and reinstalled.
		
		The payment queue delivers a new transaction for each previously completed transaction that can be restored. Each transaction includes a copy of the original transaction.
	**/
	static function restoreCompletedTransactions():Void;
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
	static function on<T:(haxe.Constraints.Function)>(eventType:Dynamic, callback:T):Void;
}
enum abstract InAppPurchaseEvent<T:(haxe.Constraints.Function)>(js.node.events.EventEmitter.Event<T>) from js.node.events.EventEmitter.Event<T> {
	/**
		Emitted when one or more transactions have been updated.
	**/
	var transactions_updated : electron.main.InAppPurchaseEvent<Void -> Void> = "transactions-updated";
}
