package electron;
/**
	@see http://electronjs.org/docs/api/structures/transaction
**/
typedef Transaction = {
	var transactionIdentifier : String;
	var transactionDate : String;
	var originalTransactionIdentifier : String;
	/**
		The transaction sate ("purchasing", "purchased", "failed", "restored", or "deferred")
	**/
	var transactionState : String;
	var errorCode : Int;
	var errorMessage : String;
	var payment : { var productIdentifier : String; var quantity : Int; };
}
