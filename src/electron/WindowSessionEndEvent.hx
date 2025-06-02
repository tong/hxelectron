package electron;
/**
	Unfortunately, Windows does not offer a way to differentiate between a shutdown and a reboot, meaning the 'shutdown' reason is triggered in both scenarios. For more details on the `WM_ENDSESSION` message and its associated reasons, refer to the MSDN documentation.
	@see https://electronjs.org/docs/api/structures/window-session-end-event
**/
typedef WindowSessionEndEvent = {
	/**
		List of reasons for shutdown. Can be 'shutdown', 'close-app', 'critical', or 'logoff'.
	**/
	var reasons : Array<String>;
}
