package electron;
/**
	@see http://electronjs.org/docs/api/structures/remove-password
**/
typedef RemovePassword = {
	/**
		password.
	**/
	var type : String;
	/**
		When provided, the authentication info related to the origin will only be removed otherwise the entire cache will be cleared.
	**/
	var origin : String;
	/**
		Scheme of the authentication. Can be basic, digest, ntlm, negotiate. Must be provided if removing by origin.
	**/
	var scheme : String;
	/**
		Realm of the authentication. Must be provided if removing by origin.
	**/
	var realm : String;
	/**
		Credentials of the authentication. Must be provided if removing by origin.
	**/
	var username : String;
	/**
		Credentials of the authentication. Must be provided if removing by origin.
	**/
	var password : String;
}
