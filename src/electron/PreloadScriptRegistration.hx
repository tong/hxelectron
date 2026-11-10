package electron;
/**
	@see https://electronjs.org/docs/api/structures/preload-script-registration
**/
typedef PreloadScriptRegistration = {
	/**
		Context type where the preload script will be executed. Possible values include `frame` or `service-worker`.
	**/
	var type : PreloadScriptRegistrationType;
	/**
		Unique ID of preload script. Defaults to a random UUID.
	**/
	@:optional
	var id : String;
	/**
		Path of the script file. Must be an absolute path.
	**/
	var filePath : String;
	/**
		Match patterns for URLs the script runs in. A custom protocol can be used if its scheme is registered as `standard` with `protocol.registerSchemesAsPrivileged`. To filter documents served from a non-standard scheme, use `includeGlobs` or `excludeGlobs`, which match against the whole URL. If omitted, the script runs for all URLs not excluded by other filters. Must not be empty.
	**/
	@:optional
	var matches : Array<String>;
	/**
		Match patterns for URLs the script will not run in.
	**/
	@:optional
	var excludeMatches : Array<String>;
	/**
		Glob patterns applied after `matches`. A URL must also match one of these globs. `*` matches any sequence of characters and `?` matches zero or one character. Must not be empty.
	**/
	@:optional
	var includeGlobs : Array<String>;
	/**
		Glob patterns for URLs the script will not run in.
	**/
	@:optional
	var excludeGlobs : Array<String>;
	/**
		Whether a document whose URL has no origin of its own (`about:`, `blob:`, `data:` or `filesystem:`) is matched by the origin of the frame that created it instead of by its URL. This includes documents with an opaque origin, such as a `data:` frame or a sandboxed `<iframe srcdoc>`. For example, an `about:blank` popup opened by `https://example.com/page` is matched as `https://example.com/`. When set, every pattern in `matches` must have a path of `/*`. Only applies to `frame` contexts. Default is `false`.
	**/
	@:optional
	var matchOriginAsFallback : Bool;
}
enum abstract PreloadScriptRegistrationType(String) from String to String {
	var frame = "frame";
	var service_worker = "service-worker";
}
