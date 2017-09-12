package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/printer-info>
**/
@:require(js, electron) typedef PrinterInfo = {
	var name : String;
	var description : String;
	var status : Float;
	var isDefault : Bool;
}