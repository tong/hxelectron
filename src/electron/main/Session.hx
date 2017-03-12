package electron.main;

/**
	Get and set properties of a session.

	[Documentation](http://electron.atom.io/docs/api/session)
**/
@:require(js, electron) @:jsRequire("electron", "session") extern class Session {
	/**
		If partition starts with persist:, the page will use a persistent session available to all pages in the app with the same partition. if there is no persist: prefix, the page will use an in-memory session. If the partition is empty then default session of the app will be returned. To create a Session with options, you have to ensure the Session with the partition has never been used before. There is no way to change the options of an existing Session object.
	**/
	static function fromPartition(partition:String, options:{ /**
		Whether to enable cache.
	**/
	@:optional
	var cache : Bool; }):Session;
}