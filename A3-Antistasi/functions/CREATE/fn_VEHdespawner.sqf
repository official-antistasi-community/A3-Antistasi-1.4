private _veh = _this select 0;

_inside = _veh getVariable "inDespawner";
if (!isNil "_inside") exitWith {};

_veh setVariable ["inDespawner",true,true];

if ((typeOf _veh in arrayCivVeh) and ({(_x getVariable ["spawner",false]) and (side group _x == teamPlayer)} count crew _veh > 0) and (_veh distance getMarkerPos respawnTeamPlayer > 50)) then
	{
	_pos = position _veh;
	[0,-1,_pos] remoteExec ["A3A_fnc_citySupportChange",2];
	_city = [citiesX, _pos] call BIS_fnc_nearestPosition;
	_dataX = server getVariable _city;
	_prestigeOPFOR = _dataX select 2;
	sleep 5;
	if (random 100 < _prestigeOPFOR) then
		{
		{_friendX = _x;
		if ((captive _friendX) and (isPlayer _friendX)) then
			{
			[_friendX,false] remoteExec ["setCaptive",0,_friendX];
			_friendX setCaptive false;
			};
		{
		if ((side _x == Occupants) and (_x distance _pos < distanceSPWN)) then {_x reveal [_friendX,4]};
		} forEach allUnits;
		} forEach crew _veh;
		};
	};
while {alive _veh} do
	{
	if ((not([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)) and (not([distanceSPWN,1,_veh,Invaders] call A3A_fnc_distanceUnits)) and (not([distanceSPWN,1,_veh,Occupants] call A3A_fnc_distanceUnits)) and (not(_veh in staticsToSave)) and (_veh distance getMarkerPos respawnTeamPlayer > 100)) then
		{
		if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
		deleteVehicle _veh
		};
	sleep 60;
	};