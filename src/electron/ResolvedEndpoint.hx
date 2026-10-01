package electron;
/**
	@see https://electronjs.org/docs/api/structures/resolved-endpoint
**/
typedef ResolvedEndpoint = {
	var address : String;
	/**
		One of the following:
	**/
	var family : ResolvedEndpointFamily;
}
enum abstract ResolvedEndpointFamily(String) from String to String {
	/**
		Corresponds to `AF_INET`
	**/
	var ipv4 = "ipv4";
	/**
		Corresponds to `AF_INET6`
	**/
	var ipv6 = "ipv6";
	/**
		Corresponds to `AF_UNSPEC`
	**/
	var unspec = "unspec";
}
