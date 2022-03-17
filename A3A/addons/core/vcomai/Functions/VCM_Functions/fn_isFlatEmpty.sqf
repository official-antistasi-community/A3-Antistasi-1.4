	params ["_pos","_dist", "_params"];
	_pos = _pos findEmptyPosition [0,_dist];
	if (_pos isEqualTo []) exitWith {_pos};
	_params =+ _params;
	_params set [0, -1];
	_pos = _pos isFlatEmpty _params;
	if (_pos isEqualTo []) exitWith {_pos};
	_pos