private _filename = "fn_patrolCA";
if (!isServer) exitWith {
	_this remoteExec ["A3A_fnc_patrolCA", 2];			// fudge until the other calls are fixed up
//	[1, "Server-only function miscalled", _filename] call A3A_fnc_log;
};

waitUntil {sleep 1; isNil "requestQRFactive"};
requestQRFactive = true;

// call methods:
// first param (target) can be either position or marker name
// second param (origin) can be either an (airport?) marker or a side
// second param as airport is only used for rebelAttack and the refugee mission (probably broken)
// forces the attack to progress regardless of other patrolCAs?

params ["_target", "_source", "_typeOfAttack"];
private _super = if (!isMultiplayer) then {false} else {_this select 3};
private _forced = false;
private _sideX = Occupants;
private _posOrigin = [];
private _posDest = [];

[2, format ["QRF requested. Target:%1, Source:%2, Type:%3, IsSuper:%4",_target,_source,_typeOfAttack,_super], _filename] call A3A_fnc_log;

if ([_target, false] call A3A_fnc_fogCheck < 0.3) exitWith {
	[2, format ["PatrolCA on %1 cancelled due to heavy fog",_target], _filename] call A3A_fnc_log;
	requestQRFactive = nil;
};

if (_source isEqualType "") then
{
	_forced = true;
	if (sidesX getVariable [_source,sideUnknown] == Invaders) then {_sideX = Invaders};
	_posOrigin = getMarkerPos _source;
}
else
{
	_sideX = _source;
};

// Check whether there's already a patrolCA active in the vicinity
private _isMarker = false;
private _exit = false;
if (_target isEqualType "") then
{
	// If the target is a marker, only consider other marker attacks
	_isMarker = true;
	_posDest = getMarkerPos _target;
	if (!_forced) then {if (_target in smallCAmrk) then {_exit = true}};
}
else
{
	// If the target is a position, consider both position and marker attacks
	_posDest = _target;
	private _nearX = [smallCApos,_target] call BIS_fnc_nearestPosition;
	if (_nearX distance _target < 500) exitWith {_exit = true};

	if (count smallCAmrk > 0) then
	{
		_nearX = [smallCAmrk,_target] call BIS_fnc_nearestPosition;
		if (getMarkerPos _nearX distance _target < 500) then {_exit = true};
	};
};

if (_exit) exitWith {
	[2, format ["PatrolCA on %1 cancelled due to other CA in vicinity",_target], _filename] call A3A_fnc_log;
	requestQRFactive = nil;
};


private _enemiesX = allUnits select {_x distance _posDest < distanceSPWN2 and (side (group _x) != _sideX) and (side (group _x) != civilian) and (alive _x)};

// Use an airstrike if suitable 
if ((!_isMarker) and (_typeOfAttack != "Air") and (!_super) and ({sidesX getVariable [_x,sideUnknown] == _sideX} count airportsX > 0)) then
{
	private _plane = if (_sideX == Occupants) then {vehNATOPlane} else {vehCSATPlane};
	if !([_plane] call A3A_fnc_vehAvailable) exitWith {};

	// Government have much broader definition of "friendlies" than invaders do
	private _friendlies = if (_sideX == Occupants) then {allUnits select {(_x distance _posDest < 200) and (alive _x) and ((side (group _x) == _sideX) or (side (group _x) == civilian))}} else {allUnits select {(_x distance _posDest < 100) and ([_x] call A3A_fnc_canFight) and (side (group _x) == _sideX)}};
	if (count _friendlies == 0) then
	{
		// select ordnance to use
		private _bombType = if (napalmEnabled) then {"NAPALM"} else {"HE"};		// anti-infantry default. why?
		{
			private _veh = vehicle _x;
			if (_veh isKindOf "Tank") exitWith {_bombType = "HE"};
			if (_veh != _x && !(_veh isKindOf "StaticWeapon")) then {_bombType = "CLUSTER"};
		} forEach _enemiesX;

		_exit = true;
		[_posDest, "add"] call A3A_fnc_updateCAMark;
		[_posDest, _sideX, _bombType] spawn A3A_fnc_airstrike;			// should be scheduled
		[2, format ["PatrolCA airstrike of type %1 sent to %2", _bombType, _posDest], _filename] call A3A_fnc_log;
		requestQRFactive = nil;

		sleep 120;
		[_posDest, "remove"] call A3A_fnc_updateCAMark;
	};
};
if (_exit) exitWith {};


// maxUnits needs to be multiplied by the HC count here, as we're counting all units not just local
private _maxUnits = (1 max (count hcArray)) * maxUnits;
private _remUnitCount = _maxUnits - ({!(isPlayer _x) && (alive _x)} count allUnits);
if (gameMode <3) then
{
	private _sideCount = {!(isPlayer _x) and (alive _x) and (side group _x == _sideX)} count allUnits;
	_remUnitCount = _remUnitCount min (_maxUnits * 0.7 - _sideCount);
};

if (_remUnitCount < 5) exitWith {
	[2, format ["PatrolCA on %1 cancelled because maximum unit count reached", _target], _filename] call A3A_fnc_log;
	requestQRFactive = nil;
};


// Determine origin base, if not specified
private _threatEvalLand = [_posDest,_sideX] call A3A_fnc_landThreatEval;
if (!_forced) then
{
	private _airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == _sideX) and ([_x,true] call A3A_fnc_airportCanAttack) and (getMarkerPos _x distance2D _posDest < distanceForAirAttack)};
	if (hasIFA and (_threatEvalLand <= 15)) then {_airportsX = _airportsX select {(getMarkerPos _x distance2D _posDest < distanceForLandAttack)}};
	private _outposts = if (_threatEvalLand <= 15) then {outposts select {(sidesX getVariable [_x,sideUnknown] == _sideX) and ([_posDest,getMarkerPos _x] call A3A_fnc_isTheSameIsland) and (getMarkerPos _x distance _posDest < distanceForLandAttack)  and ([_x,true] call A3A_fnc_airportCanAttack)}} else {[]};
	private _bases = _airportsX + _outposts;
	if (_isMarker) then
	{
		if (_target in blackListDest) then { _bases = _bases - outposts };
		_bases = _bases - [_target];
		_bases = _bases select {({_x == _target} count (killZones getVariable [_x,[]])) < 3};
	}
	else
	{
		if (!_super) then
		{
			private _siteX = [(resourcesX + factories + airportsX + outposts + seaports),_posDest] call BIS_fnc_nearestPosition;
			_bases = _bases select {({_x == _siteX} count (killZones getVariable [_x,[]])) < 3};
		};
	};
	if (_bases isEqualTo []) exitWith {_exit = true};

	// Use closest base outside spawn range of rebels. If none, allow bases further than half spawn range.
	private _spawners = allUnits select { side group _x == teamPlayer && {_x getVariable ["spawner",false]} };
	private _closeMrk = "";
	private _closeDist = 1000000;
	{
		private _basePos = getMarkerPos _x;
		private _dist = _basePos distance2D _posDest;
		if (_dist < _closeDist) then {
			private _closeSpwn = _spawners inAreaArray [getMarkerPos _x, distanceSPWN, distanceSPWN];
			private _closeSpwn2 = _closeSpwn inAreaArray [getMarkerPos _x, distanceSPWN2, distanceSPWN2];
			if (count _closeSpwn2 > 0) exitWith {};
			if (count _closeSpwn > 0) then { _dist = distanceForLandAttack + _dist};
			if (_dist > _closeDist) exitWith {};
			_closeDist = _dist;
			_closeMrk = _x;
		};
	} forEach _bases;

	if (_closeMrk == "") exitWith {_exit = true};
	_source = _closeMrk;
	_posOrigin = getMarkerPos _closeMrk;
};

if (_exit) exitWith {
	[2, format ["PatrolCA on %1 cancelled because no usable bases in vicinity", _target], _filename] call A3A_fnc_log;
	requestQRFactive = nil;
};


private _landAttack = if ((_posOrigin distance _posDest < distanceForLandAttack) and ([_posDest,_posOrigin] call A3A_fnc_isTheSameIsland) and (_threatEvalLand <= 15)) then {true} else {false};

// Automatically determine attack type from enemy vehicles, if it was left blank
if (_typeOfAttack == "") then
{
	_typeOfAttack = "Normal";
	{
		if (vehicle _x != _x) then
		{
			private _veh = vehicle _x;
			if (_veh isKindOf "Plane") exitWith {_typeOfAttack = "Air"};
			if (_veh isKindOf "Helicopter") then
			{
				_weapons = getArray (configfile >> "CfgVehicles" >> (typeOf _veh) >> "weapons");
				if (_weapons isEqualType []) then
				{
					if (count _weapons > 1) then {_typeOfAttack = "Air"};
				};
			}
			else
			{
				if (_veh isKindOf "Tank") then {_typeOfAttack = "Tank"};
			};
		};
		if (_typeOfAttack == "Air") exitWith {};
	} forEach _enemiesX;
};


// Determine vehicle count from aggression & attack type
private _aggro = if(_sideX == Occupants) then {aggressionOccupants} else {aggressionInvaders};
if (_isMarker && {sidesX getVariable [_target, sideUnknown] != teamPlayer}) then {_aggro = 100 - _aggro;};
private _vehicleCount = 0.5 + random (1.5) + _aggro/33;

if (_super) then { _vehicleCount = _vehicleCount + 2 };
_vehicleCount = _vehicleCount + ((skillMult - 2) / 2);			// skillMult range 1-3
if (_sideX == Invaders) then { _vehicleCount = _vehicleCount * 1.2 };
if !(_isMarker) then { _vehicleCount = _vehicleCount / 2 };

_vehicleCount = (round (_vehicleCount)) max 1;
[3, format ["With %1 aggression, sending %2 vehicles", _aggro, _vehicleCount], _fileName] call A3A_fnc_log;


// Going ahead with the attack. Add it to the appropriate fencing array
[_target, "add"] call A3A_fnc_updateCAMark;


if (_isMarker && !_forced) then {
	// send notification to PvPs for marker counterattacks
	private _nameDest = [_target] call A3A_fnc_localizar;
	["IntelAdded", ["", format ["QRF sent to %1",_nameDest]]] remoteExec ["BIS_fnc_showNotification",_sideX];
};

[[_target, _source, _sideX, _vehicleCount, _landAttack, _typeOfAttack], "A3A_fnc_createQRF"] call A3A_fnc_scheduler;
requestQRFactive = nil;				// could set this a bit earlier...

