package electron;
/**
	@see https://electronjs.org/docs/api/structures/shared-dictionary-info
**/
typedef SharedDictionaryInfo = {
	/**
		The matching path pattern for the dictionary which was declared in 'use-as-dictionary' response header's `match` option.
	**/
	var match : String;
	/**
		An array of matching destinations for the dictionary which was declared in 'use-as-dictionary' response header's `match-dest` option.
	**/
	var matchDestinations : Array<String>;
	/**
		The Id for the dictionary which was declared in 'use-as-dictionary' response header's `id` option.
	**/
	var id : String;
	/**
		URL of the dictionary.
	**/
	var dictionaryUrl : String;
	/**
		The time of when the dictionary was received from the network layer.
	**/
	var lastFetchTime : Date;
	/**
		The time of when the dictionary was received from the server. For cached responses, this time could be "far" in the past.
	**/
	var responseTime : Date;
	/**
		The expiration time for the dictionary which was declared in 'use-as-dictionary' response header's `expires` option in seconds.
	**/
	var expirationDuration : Float;
	/**
		The time when the dictionary was last used.
	**/
	var lastUsedTime : Date;
	/**
		The amount of bytes stored for this shared dictionary information object in Chromium's internal storage (usually Sqlite).
	**/
	var size : Float;
	/**
		The sha256 hash of the dictionary binary.
	**/
	var hash : String;
}
