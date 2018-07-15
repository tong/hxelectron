package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/web-source>
**/
@:require(js, electron) @:electron typedef WebSource = {
	var code : String;
	var url : String;
	/**
		Default is 1.
	**/
	var startLine : Int;
}