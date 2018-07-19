package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "inAppPurchase") @:electron("main") extern class InAppPurchase {
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