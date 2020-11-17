package electron;
/**
	@see https://electronjs.org/docs/api/structures/cookie
**/
typedef Cookie = {
	/**
		The name of the cookie.
	**/
	var name : String;
	/**
		The value of the cookie.
	**/
	var value : String;
	/**
		The domain of the cookie; this will be normalized with a preceding dot so that it's also valid for subdomains.
	**/
	var domain : String;
	/**
		Whether the cookie is a host-only cookie; this will only be `true` if no domain was passed.
	**/
	var hostOnly : Bool;
	/**
		The path of the cookie.
	**/
	var path : String;
	/**
		Whether the cookie is marked as secure.
	**/
	var secure : Bool;
	/**
		Whether the cookie is marked as HTTP only.
	**/
	var httpOnly : Bool;
	/**
		Whether the cookie is a session cookie or a persistent cookie with an expiration date.
	**/
	var session : Bool;
	/**
		The expiration date of the cookie as the number of seconds since the UNIX epoch. Not provided for session cookies.
	**/
	var expirationDate : Float;
	/**
		The Same Site policy applied to this cookie.  Can be `unspecified`, `no_restriction`, `lax` or `strict`.
	**/
	var sameSite : String;
}
