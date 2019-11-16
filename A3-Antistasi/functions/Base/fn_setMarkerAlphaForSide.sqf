/*
	Sets the alpha of a marker for a particular side only. Persists in the JIP queue for new players.
	
	Params:
		1. Name of the marker
		2. Side to set the marker alpha for.
		
	Returns:
		None
*/

params ["_marker", "_alpha", "_side"];


private _jipId = _marker + (str _side);

[_marker, _alpha] remoteExec ["setMarkerAlphaLocal", _side, _jipId];