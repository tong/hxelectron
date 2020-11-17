package electron;
/**
	An example TraceConfig that roughly matches what Chrome DevTools records:
	@see https://electronjs.org/docs/api/structures/trace-config
**/
typedef TraceConfig = {
	/**
		Can be `record-until-full`, `record-continuously`, `record-as-much-as-possible` or `trace-to-console`. Defaults to `record-until-full`.
	**/
	var recording_mode : String;
	/**
		maximum size of the trace recording buffer in kilobytes. Defaults to 100MB.
	**/
	var trace_buffer_size_in_kb : Float;
	/**
		maximum size of the trace recording buffer in events.
	**/
	var trace_buffer_size_in_events : Float;
	/**
		if true, filter event data according to a specific list of events that have been manually vetted to not include any PII. See the implementation in Chromium for specifics.
	**/
	var enable_argument_filter : Bool;
	/**
		a list of tracing categories to include. Can include glob-like patterns using `*` at the end of the category name. See tracing categories for the list of categories.
	**/
	var included_categories : Array<String>;
	/**
		a list of tracing categories to exclude. Can include glob-like patterns using `*` at the end of the category name. See tracing categories for the list of categories.
	**/
	var excluded_categories : Array<String>;
	/**
		a list of process IDs to include in the trace. If not specified, trace all processes.
	**/
	var included_process_ids : Array<Float>;
	/**
		a list of histogram names to report with the trace.
	**/
	var histogram_names : Array<String>;
	/**
		if the `disabled-by-default-memory-infra` category is enabled, this contains optional additional configuration for data collection. See the Chromium memory-infra docs for more information.
	**/
	var memory_dump_config : Record;
}
