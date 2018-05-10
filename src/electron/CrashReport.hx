package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/crash-report>
**/
@:require(js, electron) typedef CrashReport = {
	var date : Date;
	var id : String;
}