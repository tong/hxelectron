package electron;
/**
	@see http://electronjs.org/docs/api/structures/trace-config
**/
typedef TraceConfig = {
	var included_categories : Array<String>;
	var excluded_categories : Array<String>;
	var memory_dump_config : Any;
}
