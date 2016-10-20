package electron;
@:require("electron") typedef MemoryUsageDetails = {
	var count : Float;
	var size : Float;
	var liveSize : Float;
	var decodedSize : Float;
	var purgedSize : Float;
	var purgeableSize : Float;
}