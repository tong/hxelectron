package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/transaction>
**/
@:require(js, electron) @:electron typedef Transaction = {
	var transactionIdentifier : String;
	var transactionDate : String;
	var originalTransactionIdentifier : String;
	/**
		The transaction sate ("purchasing", "purchased", "failed", "restored", or "deferred")
	**/
	var transactionState : String;
	var errorCode : Int;
	var errorMessage : String;
	var payment : { @:optional
	var productIdentifier : String; @:optional
	var quantity : Int; };
}