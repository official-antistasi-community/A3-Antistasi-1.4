private ["_markerX","_city","_pos","_power","_dataX","_powered","_numCiv","_numVeh","_roads","_prestigeOPFOR","_prestigeBLUFOR","_siteX"];

_markerX = _this select 0;

{
_city = _x;
_pos = getMarkerPos _x;
_power = [power,_pos] call BIS_fnc_nearestPosition;
_powered = true;
if (_power == _markerX) then
	{
	//_dataX = server getVariable _city;
	if (_markerX in destroyedSites) then
		{
		_powered = false;
		//[-10,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		//_powered = _dataX select 4;
		if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
			{
			if (sidesX getVariable [_city,sideUnknown] == teamPlayer) then
				{
				//hint format ["You achieved to bring power to %1, more people there supports our cause",_city];
				//[-10,10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [[5, 10],[0,0]] remoteExec ["A3A_fnc_prestige",2];
				}
			else
				{
				//hint format ["You cutted off power to %1, less people support AAF there",_city];
				//[-10,0,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [[-5, 10],[0,0]] remoteExec ["A3A_fnc_prestige",2];
				_powered = false;
				};
			}
		else
			{
			if (sidesX getVariable [_city,sideUnknown] == teamPlayer) then
				{
				//hint format ["AAF has cut off power to %1, less people there supports our cause",_city];
				//[0,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
				_nul = [[5, 10],[0,0]] remoteExec ["A3A_fnc_prestige",2];
				_powered = false;
				};
			};
		};
	[_city,_powered] spawn A3A_fnc_blackout;
	};
} forEach citiesX;

_markersX = factories + resourcesX;
{
_siteX = _x;
_pos = getMarkerPos _x;
_power = [power,_pos] call BIS_fnc_nearestPosition;
_powered = true;
if (_power == _markerX) then
	{
	if (_markerX in destroyedSites) then
		{
		_powered = false;
		//[-10,-10,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
		}
	else
		{
		if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
			{
			if (sidesX getVariable [_siteX,sideUnknown] == Occupants) then
				{
				//_city = [citiesX,_pos] call BIS_fnc_nearestPosition;
				//hint format ["You cutted off power to AAF resources near %1. They will be less productive from now",_city];
				_powered = false;
				};
			}
		else
			{
			if (sidesX getVariable [_siteX,sideUnknown] == teamPlayer) then
				{
				//_city = [citiesX,_pos] call BIS_fnc_nearestPosition;
				//hint format ["AAF cutted off power supply to our resources near %1. They will be less productive from now",_city];
				_powered = false;
				};
			};
		};
	[_siteX,_powered] spawn A3A_fnc_blackout;
	};
} forEach _markersX;
