package electron;
/**
	@see https://electronjs.org/docs/api/structures/resolved-host
**/
typedef ResolvedHost = {
	/**
		resolved DNS entries for the hostname
	**/
	var endpoints : Array<electron.ResolvedEndpoint>;
}
