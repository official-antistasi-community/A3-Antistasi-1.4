private ["_playersX","_playerX","_mrk","_veh","_sideX"];
_sideX = side group player;
while {true} do
	{
	waitUntil {sleep 0.5; (visibleMap or visibleGPS) and ([player] call A3A_fnc_hasRadio)};
	_playersX = [];
	_markersX = [];
	while {visibleMap or visibleGPS} do
		{
		{
		_playerX = _x getVariable ["owner",_x];
		if ((not(_playerX in _playersX)) and ((side group _playerX == _sideX))) then
			{
			_playersX pushBack _playerX;
			_mrk = createMarkerLocal [format ["%1",_playerX],position _playerX];
			_mrk setMarkerTypeLocal "mil_triangle";
			_mrk setMarkerColorLocal "ColorWhite";
			_mrk setMarkerTextLocal format ["%1",name _playerX];
			_markersX pushBack _mrk;
			};
		} forEach (call A3A_fnc_playableUnits);
		if (count _playersX > 0) then
			{
			{
			_playerX = _x;
			_mrk = format ["%1",_playerX];
			if (vehicle _playerX == _playerX) then
				{
				_mrk setMarkerAlphaLocal 1;
				_mrk setMarkerPosLocal position _playerX;
				_mrk setMarkerDirLocal getDir _playerX;
				if (_playerX getVariable ["incapacitated",false] || _playerX getVariable ["ACE_isUnconscious",false]) then
					{
					_mrk setMarkerTextLocal format ["%1 Injured",name _playerX];
					_mrk setMarkerColorLocal "ColorRed";
					}
				else
					{
					_mrk setMarkerTextLocal format ["%1",name _playerX];
					_mrk setMarkerColorLocal "ColorWhite";
					};
				}
			else
				{
				_veh = vehicle _playerX;
				if ((!isPlayer driver _veh) or (driver _veh == _playerX)) then
					{
					_mrk setMarkerAlphaLocal 1;
					_mrk setMarkerPosLocal position _veh;
					_mrk setMarkerDirLocal getDir _veh;
					_textX = format ["%1 (%2)/",name _playerX,getText(configFile>>"CfgVehicles">>typeOf _veh>>"DisplayName")];
					{
					if ((_x!=_playerX) and (vehicle _x == _veh)) then
						{
						_textX = format ["%1%2/",_textX,name _x];
						};
					} forEach (call A3A_fnc_playableUnits);
					_mrk setMarkerTextLocal _textX;
					}
				else
					{
					_mrk setMarkerAlphaLocal 0;
					};
				};
			} forEach _playersX;
			};
		sleep 1;
		};
	{deleteMarkerLocal _x} forEach _markersX;
	};
