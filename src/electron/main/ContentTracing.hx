package electron.main;

@:jsRequire("content-tracing")
extern class ContentTracing {
  function getCategories(callback : Array<String> -> Void) : Void;
  function startRecording(categoryFilter : String, options : Int, callback : Void -> Void) : Void;
  function stopRecording(resultFilePath : String, callback : String -> Void) : Void;
  function startMonitoring(categoryFilter : String, options : Int, callback : Void -> Void) : Void;
  function stopMonitoring(callback : Void -> Void) : Void;
  function captureMonitoringSnapshot(resultFilePath : String, callback : Void -> Void) : Void;
  function getTraceBufferUsage(callback : Void -> Void) : Void;
  function setWatchEvent(categoryName : String, eventName : String, callback : Void -> Void) : Void;
  function cancelWatchEvent() : Void;
}
