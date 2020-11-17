package electron;
/**
	@see https://electronjs.org/docs/api/structures/custom-scheme
**/
typedef CustomScheme = {
	/**
		Custom schemes to be registered with options.
	**/
	var scheme : String;
	var privileges : { /**
		Default false.
	**/
	@:optional
	var standard : Bool; /**
		Default false.
	**/
	@:optional
	var secure : Bool; /**
		Default false.
	**/
	@:optional
	var bypassCSP : Bool; /**
		Default false.
	**/
	@:optional
	var allowServiceWorkers : Bool; /**
		Default false.
	**/
	@:optional
	var supportFetchAPI : Bool; /**
		Default false.
	**/
	@:optional
	var corsEnabled : Bool; /**
		Default false.
	**/
	@:optional
	var stream : Bool; };
}
