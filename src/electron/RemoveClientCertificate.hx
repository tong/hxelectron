package electron;
/**
	@see http://electronjs.org/docs/api/structures/remove-client-certificate
**/
typedef RemoveClientCertificate = {
	/**
		clientCertificate.
	**/
	var type : String;
	/**
		Origin of the server whose associated client certificate must be removed from the cache.
	**/
	var origin : String;
}
