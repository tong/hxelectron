package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/transaction>
**/
@:require(js, electron) @:electron typedef Transaction = {
	/**
		A string that uniquely identifies a successful payment transaction.
	**/
	var transactionIdentifier : String;
	/**
		The date the transaction was added to the App Store’s payment queue.
	**/
	var transactionDate : String;
	/**
		The identifier of the restored transaction by the App Store.
	**/
	var originalTransactionIdentifier : String;
	/**
		The transaction state, can be purchasing, purchased, failed, restored or deferred.
	**/
	var transactionState : String;
	/**
		The error code if an error occurred while processing the transaction.
	**/
	var errorCode : Int;
	/**
		The error message if an error occurred while processing the transaction.
	**/
	var errorMessage : String;
	var payment : { /**
		The identifier of the purchased product.
	**/
	@:optional
	var productIdentifier : String; /**
		The quantity purchased.
	**/
	@:optional
	var quantity : Int; };
}