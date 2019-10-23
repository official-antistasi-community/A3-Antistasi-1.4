private _jammed = false;
private _lado = side player;
_rad = 1000;
_strength = 49;
_isJammed = false;
_interference = 1;
_sendInterference = 1;
while {true} do
	{
	private _antenas = [];
	{
	_puesto = [puestos,_x] call BIS_fnc_nearestPosition;
	if (lados getVariable [_puesto,sideUnknown] != _lado) then {_antenas pushBack _x};
	} forEach antenas;
	if (_lado != buenos) then {_antenas pushBack [cajaVeh]};
	if !(_antenas isEqualTo []) then
		{
		_jammer = [_antenas,player] call BIS_fnc_nearestPosition;
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