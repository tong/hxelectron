package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/file-filter>
**/
@:require(js, electron) typedef FileFilter = {
	var name : String;
	var extensions : String;
}