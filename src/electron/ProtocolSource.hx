package electron;
/**
	@see https://electronjs.org/docs/api/structures/protocol-source
**/
typedef ProtocolSource = {
	/**
		How URLs on the scheme map to directories on disk; see `protocol.registerSource`.
	**/
	var routes : Array<electron.ProtocolRoute>;
}
