package electron;
/**
	@see https://electronjs.org/docs/api/structures/io-counters
**/
typedef IOCounters = {
	/**
		The number of I/O read operations.
	**/
	var readOperationCount : Float;
	/**
		The number of I/O write operations.
	**/
	var writeOperationCount : Float;
	/**
		Then number of I/O other operations.
	**/
	var otherOperationCount : Float;
	/**
		The number of I/O read transfers.
	**/
	var readTransferCount : Float;
	/**
		The number of I/O write transfers.
	**/
	var writeTransferCount : Float;
	/**
		Then number of I/O other transfers.
	**/
	var otherTransferCount : Float;
}
