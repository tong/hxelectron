package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "inAppPurchase") extern class InAppPurchase {
	static function purchaseProduct(productID:String, ?quantity:Int, ?callback:haxe.Constraints.Function):Void;
	static function canMakePayments():True;
	static function getReceiptURL():String;
}