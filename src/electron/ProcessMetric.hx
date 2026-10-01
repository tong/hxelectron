package electron;
/**
	@see https://electronjs.org/docs/api/structures/process-metric
**/
typedef ProcessMetric = {
	/**
		Process id of the process.
	**/
	var pid : Int;
	/**
		Process type. One of the following values:
	**/
	var type : ProcessMetricType;
	/**
		The non-localized name of the process.
	**/
	@:optional
	var serviceName : String;
	/**
		The name of the process. Examples for utility: `Audio Service`, `Content Decryption Module Service`, `Network Service`, `Video Capture`, etc.
	**/
	@:optional
	var name : String;
	/**
		CPU usage of the process. Its `percentCPUUsage` and `idleWakeupsPerSecond` are averages over the time since the previous call to the API returning this object.
	**/
	var cpu : electron.CPUUsage;
	/**
		Creation time for this process. The time is represented as number of milliseconds since epoch. Since the `pid` can be reused after a process dies, it is useful to use both the `pid` and the `creationTime` to uniquely identify a process.
	**/
	var creationTime : Float;
	/**
		Memory information for the process.
	**/
	var memory : electron.MemoryInfo;
	/**
		Whether the process is sandboxed on OS level.
	**/
	@:electron_platforms(["macOS", "Windows"])
	@:optional
	var sandboxed : Bool;
	/**
		One of the following values:
	**/
	@:electron_platforms(["Windows"])
	@:optional
	var integrityLevel : ProcessMetricIntegrityLevel;
}
enum abstract ProcessMetricType(String) from String to String {
	var Browser = "Browser";
	var Tab = "Tab";
	var Utility = "Utility";
	var Zygote = "Zygote";
	var Sandbox_helper = "Sandbox helper";
	var GPU = "GPU";
	var Pepper_Plugin = "Pepper Plugin";
	var Pepper_Plugin_Broker = "Pepper Plugin Broker";
	var Unknown = "Unknown";
}
enum abstract ProcessMetricIntegrityLevel(String) from String to String {
	var untrusted = "untrusted";
	var low = "low";
	var medium = "medium";
	var high = "high";
	var unknown = "unknown";
}
