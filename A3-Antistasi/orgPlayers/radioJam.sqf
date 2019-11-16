private _jammed = false;
private _sideX = side player;
_rad = 1000;
_strength = 49;
_isJammed = false;
_interference = 1;
_sendInterference = 1;
while {true} do
	{
	private _antennas = [];
	{
	_outpost = [outposts,_x] call BIS_fnc_nearestPosition;
	if (sidesX getVariable [_outpost,sideUnknown] != _sideX) then {_antennas pushBack _x};
	} forEach antennas;
	if (_sideX != teamPlayer) then {_antennas pushBack [vehicleBox]};
	if !(_antennas isEqualTo []) then
		{
		_jammer = [_antennas,player] call BIS_fnc_nearestPosition;
		_dist = player distance _jammer;
	    _distPercent = _dist / _rad;

	    if (_dist < _rad) then
	    	{
			_interference = _strength - (_distPercent * _strength) + 1; // Calculat the recieving interference, which has to be above 1 to have any effect.
			_sendInterference = 1/_interference; //Calculate the sending interference, which needs to be below 1 to have any effect.
			if (!_isJammed) then {_isJammed = true};
			player setVariable ["tf_receivingDistanceMultiplicator", _interference];
			player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
	    	}
	    else
	    	{
	    	if (_isJammed) then
	    		{
	    		_isJammed = false;
	    		_interference = 1;
				_sendInterference = 1;
				player setVariable ["tf_receivingDistanceMultiplicator", _interference];
				player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
	    		};
	    	};
	    // Set the TF receiving and sending distance multipliers

		};
	sleep 10;
	};