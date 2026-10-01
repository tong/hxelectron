package electron;
/**
	@see https://electronjs.org/docs/api/structures/render-process-gone-details
**/
typedef RenderProcessGoneDetails = {
	/**
		The reason the render process is gone.  Possible values:
	**/
	var reason : RenderProcessGoneDetailsReason;
	/**
		The exit code of the process, unless `reason` is `launch-failed`, in which case `exitCode` will be a platform-specific launch failure error code.
	**/
	var exitCode : Int;
}
enum abstract RenderProcessGoneDetailsReason(String) from String to String {
	/**
		Process exited with an exit code of zero
	**/
	var clean_exit = "clean-exit";
	/**
		Process exited with a non-zero exit code
	**/
	var abnormal_exit = "abnormal-exit";
	/**
		Process was sent a SIGTERM or otherwise killed externally
	**/
	var killed = "killed";
	/**
		Process crashed
	**/
	var crashed = "crashed";
	/**
		Process ran out of memory
	**/
	var oom = "oom";
	/**
		Process never successfully launched
	**/
	var launch_failed = "launch-failed";
	/**
		Windows code integrity checks failed
	**/
	var integrity_failure = "integrity-failure";
	/**
		Process proactively terminated to prevent a future out-of-memory (OOM) situation
	**/
	var memory_eviction = "memory-eviction";
}
