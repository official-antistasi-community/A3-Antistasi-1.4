private _jammed = false;
private _sideX = side player;
_rad = 1000;
_strength = 49;
_isJammed = false;
_interference = 1;
_sendInterference = 1;
private _bases = outposts + airportsX + seaports;
while {true} do
	{
	private _antennas = [];
	{
	_outpost = [_bases,_x] call BIS_fnc_nearestPosition;
	if (sidesX getVariable [_outpost,sideUnknown] != _sideX) then {_antennas pushBack _x};
	} forEach antennas;
	if !(_antennas isEqualTo []) then
		{
		_jammer = [_antennas,player] call BIS_fnc_nearestPosition;
		_dist = player distance _jammer;
	    _distPercent = _dist / _rad;

	    if (_dist < _rad) then
	    	{
			_interference = _strength - (_distPercent * _strength) + 1; // Calculate the recieving interference, which has to be above 1 to have any effect.
			_sendInterference = 1/_interference; //Calculate the sending interference, which needs to be below 1 to have any effect.
			if (!_isJammed) then {_isJammed = true};
			if(A3A_hasTFAR || A3A_hasTFARBeta) then {
				player setVariable ["tf_receivingDistanceMultiplicator", _interference];
				player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
			};
			if (A3A_hasACRE) then {
				[{
					private _defaultSignal = _this call acre_sys_signal_fnc_getSignalCore;
					_defaultSignal params ["_powerX","_maxSignal"];

					private _distancePercentageFromTower = [] call A3A_radioJamACRE;

					_powerX = 1 - _distancePercentageFromTower;
					[_powerX, _maxSignal];
				}] call acre_api_fnc_setCustomSignalFunc;
			};
	    	}
	    else
	    	{
	    	if (_isJammed) then
	    		{
	    		_isJammed = false;
	    		_interference = 1;
				_sendInterference = 1;
				if (A3A_hasTFAR || A3A_hasTFARBeta) then {
					player setVariable ["tf_receivingDistanceMultiplicator", _interference];
					player setVariable ["tf_sendingDistanceMultiplicator", _sendInterference];
				};
				if (A3A_hasACRE) then {
					[{}] call acre_api_fnc_setCustomSignalFunc;
				};
				};
	    	};
	    // Set the TF receiving and sending distance multipliers

		};
	sleep 10;
	};