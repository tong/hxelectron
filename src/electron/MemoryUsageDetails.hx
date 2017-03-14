package electron;

/**
	See: <http://electron.atom.io/docs/api/structures/memory-usage-details>
**/
@:require(js, electron) typedef MemoryUsageDetails = {
	var count : Float;
	var size : Float;
	var liveSize : Float;
}