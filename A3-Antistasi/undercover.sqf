if (player != player getVariable ["owner",player]) exitWith {
	hint "You cannot go Undercover while you are controlling AI"
};

private _player = player getVariable ["owner", player];

if (captive _player) exitWith { hint "You are Undercover already"; };

private ["_size","_base","_onDetectionMarker","_onBaseMarker","_airportSide"];

private _changeX = "";
private _roadblocks = (controlsX select {isOnRoad (getMarkerPos _x)});
private _airportsX = airportsX + outposts + _roadblocks;
private _airportsX1 = airportsX;
private _arrayCivVeh = arrayCivVeh + [civHeli] + civBoats;
private _compromised = _player getVariable "compromised";



if (vehicle _player != _player) then {

	if (!(typeOf(vehicle _player) in _arrayCivVeh)) then {
		hint "You are not in a civilian vehicle";
		_changeX = "Init"
	};

	if (vehicle _player in reportedVehs) then {
		hint "This vehicle has been reported to the enemy. Change or renew your vehicle in the Garage to go Undercover";
		_changeX = "Init";
	};

} else {

	if (
		(primaryWeapon _player != "") or
		(secondaryWeapon _player != "") or
		(handgunWeapon _player != "") or
		(vest _player != "") or
		(getNumber (configfile >> "CfgWeapons" >> headgear _player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) or
		(hmd _player != "") or
		(!(uniform _player in civUniforms))
	) then {
		hint "You cannot go Undercover while:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform";
		_changeX = "Init";
	};

	if (dateToNumber date < _compromised) then {
		hint "You have been reported in the last 30 minutes therefore you cannot go Undercover";
		_changeX = "Init";
	};
};

if (_changeX != "") exitWith {};

if (
	{
		(
			(side _x== Invaders) or
			(side _x== Occupants)
		) and
		(
			(
				(_x knowsAbout _player > 1.4) and
				(_x distance _player < 500)
			) or
			(_x distance _player < 350)
		)
	} count allUnits > 0
) exitWith {
	hint "You cannot go Undercover while enemies are spotting you";

	if (vehicle _player != _player) then {
		{
			if ((isPlayer _x) and (captive _x)) then {
				[_x, false] remoteExec ["setCaptive"];
				_x setCaptive false;
				reportedVehs pushBackUnique (vehicle _player);
				publicVariable "reportedVehs";
			};
		} forEach ((crew (vehicle _player)) + (assignedCargo (vehicle _player)) - [_player]);
	};
};

_base = [_airportsX, _player] call BIS_fnc_nearestPosition;
_size = [_base] call A3A_fnc_sizeMarker;

if (
	(_player distance getMarkerPos _base < _size * 2) &&
	(!(sidesX getVariable [_base,sideUnknown] == teamPlayer))
) exitWith {hint "You cannot go Undercover near Airports, Outposts or Roadblocks"};

["Undercover ON", 0, 0, 4, 0, 0, 4] spawn bis_fnc_dynamicText;

[_player,true] remoteExec ["setCaptive",0,_player];
_player setCaptive true;
[] spawn A3A_fnc_statistics;

if (_player == leader group _player) then {
	{
		if ((!isplayer _x) and (local _x) && (_x getVariable ["owner",_x] == _player)) then {
			[_x] spawn A3A_fnc_undercoverAI;
		};
	} forEach units group _player;
};

_isInControl = false;

while {_changeX == ""} do {
	sleep 1;

	if (!captive _player) exitWith {_changeX = "Reported"; false};


	_veh = vehicle _player;
	_typeX = typeOf _veh;

	if (_veh != _player) then {

		if (!(_typeX in _arrayCivVeh)) exitWith { _changeX = "VNoCivil"; };


		if (_veh in reportedVehs) exitWith { _changeX = "VCompromised"; };

		if ((_typeX == civHeli) or (_typeX in civBoats)) exitWith {};

		if (isOnRoad position _veh) exitWith {};

		if (count (_veh nearRoads 50) != 0) exitWith {};

		if (
			{
				(
					(side _x== Invaders) or
					(side _x== Occupants)
				) and
				(
					(_x knowsAbout _player > 1.4) or
					(_x distance _player < 350)
				)
			} count allUnits > 0
		) then { _changeX = "Carretera"; };

		if (!hasACE) exitWith {};

		if (((position _player nearObjects ["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) then {
			_changeX = "SpotBombTruck";
		};

		if (((position _player nearObjects ["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy Occupants) then {
			_changeX = "SpotBombTruck";
		};

	} else {

		if (
			(primaryWeapon _player != "") or
			(secondaryWeapon _player != "") or
			(handgunWeapon _player != "") or
			(vest _player != "") or
			(getNumber (configfile >> "CfgWeapons" >> headgear _player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) or
			(hmd _player != "") or
			(!(uniform _player in civUniforms))
		) then {

			if (
				{
					(
						(side _x== Invaders) or
						(side _x== Occupants)
					) and
					(
						(_x knowsAbout _player > 1.4) or
						(_x distance _player < 350)
					)
				} count allUnits > 0
			) then { _changeX = "clothes2"; } else { _changeX = "clothes"; };
		};

		if (dateToNumber date < _compromised) then {
			_changeX = "Compromised";
		};
	};

	if (!(_changeX isEqualTo "")) exitWith { false};

	if (
		(_typeX != civHeli) &&
		(!(_typeX in civBoats))
	) then {
		_base = [_airportsX,_player] call BIS_fnc_nearestPosition;
		//Following lines are for the detection of players in the detectionAreas
		_onDetectionMarker = (detectionAreas findIf {_player inArea _x } != -1);
		_onBaseMarker = (_player inArea _base);
		_airportSide = (sidesX getVariable [_base, sideUnknown]);
		_airport = [_airportsX1,_player] call BIS_fnc_nearestPosition;

		if (!(
			_onBaseMarker  &&
			{_airportSide != teamPlayer} ||
			{
				_onDetectionMarker &&
				{sidesX getVariable _airport != teamPlayer}
			}
		)) exitWith { _isInControl = false; };

		if (_isInControl) exitWith {};

		_aggro = [ prestigeCSAT + (tierWar * 10), prestigeNATO + (tierWar * 10)] select (sidesX getVariable [_base, sideUnknown] == Occupants);

		//Probability	of being spotted. Unless we're in an airfield - then we're always spotted.
		if (_base in _airportsX1 || _onDetectionMarker || random 100 < _aggro) then {
			_changeX = ["Control", "distanceX"] select (_base in _roadblocks);
		} else {
			_isInControl = true;
		};

	} else {

		if (_typeX != civHeli) exitWith {};

		_base = [_airportsX1,_player] call BIS_fnc_nearestPosition;
		_size = [_base] call A3A_fnc_sizeMarker;

		if (
			(_player distance2d getMarkerPos _base < _size*3) &&
			(
				(sidesX getVariable [_base, sideUnknown] == Occupants) ||
				(sidesX getVariable [_base, sideUnknown] == Invaders)
			)
		) then {
			_changeX = "NoFly";
		};
	};
};

diag_log format ["[Antistasi] Player detected in %1 (undercover.sqf)", _onDetectionMarker];

if (captive _player) then {
	[_player, false] remoteExec ["setCaptive"];
	_player setCaptive false;
};

if (vehicle _player != _player) then {
	{
		if (isPlayer _x) then {
			[_x,false] remoteExec ["setCaptive",0,_x];
			_x setCaptive false;
		}
	} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [_player]);
};

["Undercover OFF",0,0,4,0,0,4] spawn bis_fnc_dynamicText;
[] spawn A3A_fnc_statistics;
switch _changeX do {
	case "Reported": {
		hint "You have been reported or spotted by the enemy";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then {
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player);
			publicVariable "reportedVehs";
		} else {
			_player setVariable [
				"compromised",
				(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])
			];
		};
	};
	case "VNoCivil": { hint "You entered a non civilian vehicle"; };
	case "VCompromised": { hint "You entered in a reported vehicle"; };
	case "SpotBombTruck": {
		hint "Explosives have been spotted on your vehicle";
		reportedVehs pushBackUnique (vehicle _player);
		publicVariable "reportedVehs";
	};
	case "Carretera": {
		hint "You went too far away from any roads and have been spotted";
		reportedVehs pushBackUnique (vehicle _player);
		publicVariable "reportedVehs";
	};
	case "clothes": { hint "You cannot stay Undercover while:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform"};
	case "clothes2": {
		hint "You cannot stay Undercover while showing:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform\n\nThe enemy added you to their Wanted List";
		_player setVariable ["compromised", dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
		};
	case "Compromised": {hint "You left your vehicle and you are still on the Wanted List"};
	case "distanceX":
		{
		hint "You have gotten too close to an enemy Base, Outpost or Roadblock";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then
			{
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
			}
		else
			{
			_player setVariable ["compromised",(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
			};
		};
	case "NoFly":
		{
		hint "You have gotten too close to an enemy Airbase no-fly zone";
		//_compromised = _player getVariable "compromised";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "Control":
		{
		hint "The Roadblock Garrison has recognised you";
		//_compromised = _player getVariable "compromised";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	};
