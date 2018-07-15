package electron.main;

/**
**/
@:require(js, electron) @:jsRequire("electron", "inAppPurchase") @:electron("main") extern class InAppPurchase {
	static function purchaseProduct(productID:String, ?quantity:Int, ?callback:haxe.Constraints.Function):Void;
	static function canMakePayments():Bool;
	static function getReceiptURL():String;
}