package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-route
**/
typedef ProtocolRoute = {
	/**
		Which URLs on the scheme this route serves. A route without `match` serves every URL.
	**/
	@:optional
	var match : { /**
		Host name to match, for standard schemes. It is compared with the URL's host as a whole, case-insensitively; there is no wildcard or subdomain matching. Omit to match any host.
	**/
	@:optional
	var host : String; /**
		Path prefix to match, starting with `/` and written as it appears in a URL (percent-encoded). Defaults to `/`.
	**/
	@:optional
	var path : String; };
	/**
		What the matched URLs are served from.
	**/
	var source : { /**
		Must be `directory`.
	**/
	var type : String; /**
		Absolute path of the directory. The part of the URL's path after `match.path` is resolved inside it; paths that would leave it are not served. May point into an `asar` archive.
	**/
	var root : String; /**
		File served for a URL whose path ends in `/`. Defaults to `index.html`; an empty string disables it.
	**/
	@:optional
	var index : String; /**
		Response headers added to every file served by this route. Headers computed by the file loader, including `Content-Type`, `Content-Length`, and `Content-Range`, will override these supplied values.
	**/
	@:optional
	var headers : haxe.DynamicAccess<String>; };
}
