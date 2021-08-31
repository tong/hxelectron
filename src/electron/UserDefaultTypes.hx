package electron;
/**
	This type is a helper alias, no object will never exist of this type.
	@see https://electronjs.org/docs/api/structures/user-default-types
**/
typedef UserDefaultTypes = {
	var string : String;
	var boolean : Bool;
	var integer : Float;
	var float : Float;
	var double : Float;
	var url : String;
	var array : Array<Dynamic>;
	var dictionary : Record;
}
