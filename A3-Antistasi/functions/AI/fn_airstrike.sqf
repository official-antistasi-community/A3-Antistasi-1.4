// usage: Activate via radio trigger, on act: ["control", Occupants] spawn A3A_fnc_airstrike;
if (!isServer and hasInterface) exitWith{};

private ["_markerX","_positionX","_ang","_angorig","_pos1","_origpos","_pos2","_finpos","_plane","_wp1","_wp2","_wp3","_sideX","_isMarker","_typePlane","_exit","_timeOut","_friendlies","_enemiesX","_mediaX","_mediaY","_pos","_countX","_distantNum","_distantX","_planefn","_planeCrew","_groupPlane","_typeX"];

_markerX = _this select 0;
_sideX = _this select 1;
_positionX = _markerX;
_isMarker = false;
if (_markerX isEqualType "") then
	{
	_isMarker = true;
	_positionX = getMarkerPos _markerX;
	};
_typeX = _this select 2;

_typePlane = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};

_ang = random 360;
_angorig = _ang + 180;
_pos1 = [];
_origPos = [];
_pos2 = [];
_finPos = [];
_exit = false;
if (_isMarker) then
	{
	_timeOut = time + 600;
	waitUntil {sleep 1; (spawner getVariable _markerX == 0) or (time > _timeOut)};
	if (_markerX in airportsX) then
		{
		private _runwayTakeoff = [_markerX] call A3A_fnc_getRunwayTakeoffForAirportMarker;
		if (count _runwayTakeoff > 0) then
			{
			_positionX = _runwayTakeoff select 0;
			_angOrig = (_runwayTakeoff select 1) + (random 20 - 10);
			_ang = _angOrig + 180;
			};
		};
	_pos1 = [_positionX, 400, _angorig] call BIS_Fnc_relPos;
	_origpos = [_positionX, 3*distanceSPWN, _angorig] call BIS_fnc_relPos;
	_pos2 = [_positionX, 200, _ang] call BIS_Fnc_relPos;
	_finpos = [_positionX, 3*distanceSPWN, _ang] call BIS_fnc_relPos;
	}
else
	{
	_friendlies = if (_sideX == Occupants) then {allUnits select {(_x distance _positionX < 300) and (alive _x) and ((side _x == Occupants) or (side _x == civilian))}} else {allUnits select {(_x distance _positionX < 300) and (alive _x) and (side _x == Invaders)}};
	if (count _friendlies == 0) then
		{
		_enemiesX = if (_sideX == Occupants) then {allUnits select {_x distance _positionX < 300 and (side _x != _sideX) and (side _x != civilian) and (alive _x)}} else {allUnits select {_x distance _positionX < 300 and (side _x != _sideX) and (alive _x)}};
		if (count _enemiesX > 0) then
			{
			_mediaX = 0;
			_mediaY = 0;
			{
			_pos = position _x;
			_mediaX = _mediaX + (_pos select 0);
			_mediaY = _mediaY + (_pos select 1);
			} forEach _enemiesX;
			_countX = count _enemiesX;
			_mediaX = _mediaX / _countX;
			_mediaY = _mediaY / _countX;
			_positionX = [_mediaX,_mediaY,0];
			_distantNum = 0;
			_distantX = objNull;
			{
			if (_x distance2D _positionX > _distantNum) then
				{
				_distantNum = _x distance2D _positionX;
				_distantX = _x;
				}
			} forEach _enemiesX;
			_ang = [_positionX, _distantX] call BIS_fnc_DirTo;
			_angOrig = _ang + 180;
			_pos1 = [_positionX, 200, _angorig] call BIS_Fnc_relPos;
			_origpos = [_positionX, 4500, _angorig] call BIS_fnc_relPos;
			_pos2 = [_positionX, 200, _ang] call BIS_Fnc_relPos;
			_finpos = [_positionX, 4500, _ang] call BIS_fnc_relPos;
			}
		else
			{
			_exit = true;
			};
		}
	else
		{
		_exit = true;
		};
	};

if (_exit) exitWith {};
_planefn = [_origpos, _ang, _typePlane, _sideX] call bis_fnc_spawnvehicle;
_plane = _planefn select 0;
_planeCrew = _planefn select 1;
_groupPlane = _planefn select 2;
[_plane, _sideX] call A3A_fnc_AIVEHinit;
{[_x] call A3A_fnc_NATOinit} forEach _planeCrew;

_plane setPosATL [getPosATL _plane select 0, getPosATL _plane select 1, 1000];
_plane setVelocityModelSpace (velocityModelSpace _plane vectorAdd [0, 150, 50]);
_plane disableAI "TARGET";
_plane disableAI "AUTOTARGET";
_plane flyInHeight 150;
private _minAltASL = ATLToASL [_positionX select 0, _positionX select 1, 0];
_plane flyInHeightASL [(_minAltASL select 2) +150, (_minAltASL select 2) +150, (_minAltASL select 2) +150];


_wp1 = _groupPlane addWaypoint [_pos1, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointSpeed "LIMITED";
_wp1 setWaypointBehaviour "CARELESS";
_plane setCollisionLight true;

if ((_typeX == "NAPALM") and (napalmCurrent)) then {_typeX = "CLUSTER"};
_wp1 setWaypointStatements ["true", format ["if !(local this) exitWith {}; [this, '%1'] spawn A3A_fnc_airbomb", _typeX]];

_wp2 = _groupPlane addWaypoint [_pos2, 1];
_wp2 setWaypointSpeed "LIMITED";
_wp2 setWaypointType "MOVE";

_wp3 = _groupPlane addWaypoint [_finpos, 2];
_wp3 setWaypointType "MOVE";
_wp3 setWaypointSpeed "FULL";

_timeOut = time + 300;
waitUntil { sleep 2; (currentWaypoint _groupPlane == 4) or (time > _timeOut) };

if (time >_timeOut) then {
    [_groupPlane] spawn A3A_fnc_groupDespawner;
    [_plane] spawn A3A_fnc_vehDespawner;
} else {
    { deleteVehicle _x } forEach _planeCrew;
    deleteGroup _groupPlane;
    deleteVehicle _plane;
};
