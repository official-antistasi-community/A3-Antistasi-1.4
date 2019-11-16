if (!isServer) exitWith{};

//debugperf = false;

private ["_timeX","_markersX","_markerX","_positionMRK","_countX"];

waitUntil {!isNil "theBoss"};

_timeX = 1/(count markersX);
_countX = 0;
_greenfor = [];
_blufor = [];
_opfor = [];

while {true} do {
//sleep 0.01;
/*
if (time - _timeX >= 0.5) then
	{
	sleep 0.1;
	_countX = _countX + 0.1
	}
else
	{
	sleep 0.5 - (time - _timeX);
	_countX = _countX + (0.5 - (time-_timeX));
	};
//if (debugperf) then {hint format ["timeX transcurrido: %1 para %2 markersX", time - _timeX, count markersX]};
_timeX = time;
*/
//sleep 1;
_countX = _countX + 1;
if (_countX > 5) then
	{
	_countX = 0;
	_spawners = allUnits select {_x getVariable ["spawner",false]};
	_greenfor = [];
	_blufor = [];
	_opfor = [];
	{
	_sideX = side (group _x);
	if (_sideX == Occupants) then
		{
		_blufor pushBack _x;
		}
	else
		{
		if (_sideX == Invaders) then
			{
			_opfor pushBack _x;
			}
		else
			{
			_greenfor pushBack _x;
			};
		};
	} forEach _spawners;
	};

{
sleep _timeX;
_markerX = _x;

_positionMRK = getMarkerPos (_markerX);

if (sidesX getVariable [_markerX,sideUnknown] == Occupants) then
	{
	if (spawner getVariable _markerX != 0) then
		{
		if (spawner getVariable _markerX == 2) then
			{
			if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor > 0) or ({if ((_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _opfor > 0) or (_markerX in forcedSpawn)) then
				{
				spawner setVariable [_markerX,0,true];
				if (_markerX in citiesX) then
					{
					if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor > 0) or ({if ((isPlayer _x) and (_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _blufor > 0) or (_markerX in forcedSpawn)) then {[[_markerX],"A3A_fnc_createAICities"] call A3A_fnc_scheduler};
					if (not(_markerX in destroyedSites)) then
						{
						if (({if ((isPlayer _x) and (_x distance2D _positionMRK < distanceSPWN)) exitWith {1};false} count allUnits > 0) or (_markerX in forcedSpawn)) then {[[_markerX],"A3A_fnc_createCIV"] call A3A_fnc_scheduler};
						};
					}
				else
					{
					if (_markerX in controlsX) then {[[_markerX],"A3A_fnc_createAIcontrols"] call A3A_fnc_scheduler} else {
					if (_markerX in airportsX) then {[[_markerX],"A3A_fnc_createAIAirplane"] call A3A_fnc_scheduler} else {
					if (((_markerX in resourcesX) or (_markerX in factories))) then {[[_markerX],"A3A_fnc_createAIResources"] call A3A_fnc_scheduler} else {
					if ((_markerX in outposts) or (_markerX in seaports)) then {[[_markerX],"A3A_fnc_createAIOutposts"] call A3A_fnc_scheduler};};};};
					};
				};
			}
		else
			{
			if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor > 0) or ({if ((_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _opfor > 0) or (_markerX in forcedSpawn)) then
				{
				spawner setVariable [_markerX,0,true];
				if (isMUltiplayer) then
					{
					{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal true}}} forEach allUnits;
					}
				else
					{
					{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation true}}} forEach allUnits;
					};
				}
			else
				{
				if (({if (_x distance2D _positionMRK < distanceSPWN1) exitWith {1}} count _greenfor == 0) and ({if ((_x distance2D _positionMRK < distanceSPWN)) exitWith {1}} count _opfor == 0) and (not(_markerX in forcedSpawn))) then
					{
					spawner setVariable [_markerX,2,true];
					};
				};
			};
		}
	else
		{
		if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor == 0) and ({if ((_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _opfor == 0) and ({if ((isPlayer _x) and (_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _blufor == 0) and (not(_markerX in forcedSpawn))) then
			{
			spawner setVariable [_markerX,1,true];
			if (isMUltiplayer) then
					{
					{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal false}}} forEach allUnits;
					}
				else
					{
					{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation false}}} forEach allUnits;
					};
			};
		};
	}
else
	{
	if (sidesX getVariable [_markerX,sideUnknown] == teamPlayer) then
		{
		if (spawner getVariable _markerX != 0) then
			{
			if (spawner getVariable _markerX == 2) then
				{
				if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _blufor > 0) or ({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _opfor > 0) or ({if (((_x getVariable ["owner",objNull]) == _x) and (_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _greenfor > 0) or (_markerX in forcedSpawn)) then
					{
					spawner setVariable [_markerX,0,true];
					if (_markerX in citiesX) then
						{
						//[_markerX] remoteExec ["A3A_fnc_createAICities",HCGarrisons];
						if (not(_markerX in destroyedSites)) then
							{
							if (({if ((isPlayer _x) and (_x distance2D _positionMRK < distanceSPWN)) exitWith {1};false} count allUnits > 0) or (_markerX in forcedSpawn)) then {[[_markerX],"A3A_fnc_createCIV"] call A3A_fnc_scheduler};
							};
						};
					if (_markerX in outpostsFIA) then {[[_markerX],"A3A_fnc_createFIAOutposts2"] call A3A_fnc_scheduler} else {if (not(_markerX in controlsX)) then {[[_markerX],"A3A_fnc_createSDKGarrisons"] call A3A_fnc_scheduler}};
					};
				}
			else
				{
				if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _blufor > 0) or ({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _opfor > 0) or ({if (((_x getVariable ["owner",objNull]) == _x) and (_x distance2D _positionMRK < distanceSPWN2) or (_markerX in forcedSpawn)) exitWith {1}} count _greenfor > 0)) then
					{
					spawner setVariable [_markerX,0,true];
					if (isMUltiplayer) then
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal true}}} forEach allUnits;
						}
					else
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation true}}} forEach allUnits;
						};
					}
				else
					{
					if (({if (_x distance2D _positionMRK < distanceSPWN1) exitWith {1}} count _blufor == 0) and ({if (_x distance2D _positionMRK < distanceSPWN1) exitWith {1}} count _opfor == 0) and ({if (((_x getVariable ["owner",objNull]) == _x) and (_x distance2D _positionMRK < distanceSPWN)) exitWith {1}} count _greenfor == 0) and (not(_markerX in forcedSpawn))) then
						{
						spawner setVariable [_markerX,2,true];
						};
					};
				};
			}
		else
			{
			if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _blufor == 0) and ({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _opfor == 0) and ({if (((_x getVariable ["owner",objNull]) == _x) and (_x distance2D _positionMRK < distanceSPWN2)) exitWith {1}} count _greenfor == 0) and (not(_markerX in forcedSpawn))) then
				{
				spawner setVariable [_markerX,1,true];
				if (isMUltiplayer) then
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal false}}} forEach allUnits;
						}
					else
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation false}}} forEach allUnits;
						};
				};
			};
		}
	else
		{
		if (spawner getVariable _markerX != 0) then
			{
			if (spawner getVariable _markerX == 2) then
				{
				if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor > 0) or ({if (_x distance2D _positionMRK < distanceSPWN2) exitWith {1}} count _blufor > 0) or (_markerX in forcedSpawn)) then
					{
					spawner setVariable [_markerX,0,true];
					if (_markerX in controlsX) then {[[_markerX],"A3A_fnc_createAIcontrols"] call A3A_fnc_scheduler} else {
					if (_markerX in airportsX) then {[[_markerX],"A3A_fnc_createAIAirplane"] call A3A_fnc_scheduler} else {
					if (((_markerX in resourcesX) or (_markerX in factories))) then {[[_markerX],"A3A_fnc_createAIResources"] call A3A_fnc_scheduler} else {
					if ((_markerX in outposts) or (_markerX in seaports)) then {[[_markerX],"A3A_fnc_createAIOutposts"] call A3A_fnc_scheduler};};};};
					};
				}
			else
				{
				if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor > 0) or ({if (_x distance2D _positionMRK < distanceSPWN2) exitWith {1}} count _blufor > 0) or (_markerX in forcedSpawn)) then
					{
					spawner setVariable [_markerX,0,true];
					if (isMUltiplayer) then
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal true}}} forEach allUnits;
						}
					else
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation true}}} forEach allUnits;
						};
					}
				else
					{
					if (({if (_x distance2D _positionMRK < distanceSPWN1) exitWith {1}} count _greenfor == 0) and ({if ((_x distance2D _positionMRK < distanceSPWN)) exitWith {1}} count _blufor == 0) and (not(_markerX in forcedSpawn))) then
						{
						spawner setVariable [_markerX,2,true];
						};
					};
				};
			}
		else
			{
			if (({if (_x distance2D _positionMRK < distanceSPWN) exitWith {1}} count _greenfor == 0) and ({if ((_x distance2D _positionMRK < distanceSPWN2) and (isPlayer _x)) exitWith {1}} count _opfor == 0) and ({if (_x distance2D _positionMRK < distanceSPWN2) exitWith {1}} count _blufor == 0) and (not(_markerX in forcedSpawn))) then
				{
				spawner setVariable [_markerX,1,true];
				if (isMUltiplayer) then
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulationGlobal false}}} forEach allUnits;
						}
					else
						{
						{if (_x getVariable ["markerX",""] == _markerX) then {if (vehicle _x == _x) then {_x enableSimulation false}}} forEach allUnits;
						};
				};
			};
		};
	};
} forEach markersX;

};
