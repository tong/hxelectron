package electron;

/**
**/
@:require(js, electron) typedef RemoveClientCertificate = {
	/**
		.
	**/
	var type : String;
	/**
		Origin of the server whose associated client certificate must be removed from the cache.
	**/
	var origin : String;
}