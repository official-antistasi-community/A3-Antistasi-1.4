#include "defineGarage.inc"

private ["_pool","_veh","_typeVehX"];
_pool = false;
if (_this select 0 || !isMultiplayer) then {_pool = true};

if (side player != teamPlayer) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_no_rebels"] call A3A_fnc_customHint;};
if (!([player] call A3A_fnc_isMember)) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_member_on"] call A3A_fnc_customHint;};

_veh = cursorTarget;

if (isNull _veh) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_sell_veh_no_look"] call A3A_fnc_customHint;};

if !((_veh getVariable "SA_Tow_Ropes") isEqualTo objNull) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_rope"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_destr"] call A3A_fnc_customHint;};
_closeX = markersX select {sidesX getVariable [_x,sideUnknown] == teamPlayer};
_closeX = _closeX select {(player inArea _x) and (_veh inArea _x)};

if (_closeX isEqualTo []) exitWith {[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_no_garrison",nameTeamPlayer]] call A3A_fnc_customHint;};

//if (player distance2d getMarkerPos respawnTeamPlayer > 50) exitWith {hint "You must be closer than 50 meters to HQ"};

if ({alive _x} count (crew vehicle _veh) > 0) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_no_empty"] call A3A_fnc_customHint;};

_typeVehX = typeOf _veh;

if (_veh isKindOf "Man") exitWith {[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_cant",name _veh]] call A3A_fnc_customHint;};

if ((typeOf _veh) in [NATOSurrenderCrate, CSATSurrenderCrate]) exitWith {
	_veh addMagazineCargoGlobal [unlockedMagazines#0,1];// so fnc_empty will delete the crate
	_transferLoot = [_veh] spawn A3A_fnc_empty;
	[10] call A3A_fnc_resourcesPlayer;
	[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_loot"] call A3A_fnc_customHint;
};
if !(_veh isKindOf "AllVehicles") exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_cannot_stored"] call A3A_fnc_customHint;};

_units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {[localize "STR_a3_garage", "You can't garage vehicles while enemies are engaging you"] call A3A_fnc_customHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_enemy",25]] call A3A_fnc_customHint};

if (player distance _veh > 25) exitWith {[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_enemy",25]] call A3A_fnc_customHint};

if (_pool and (count vehInGarage >= (tierWar *5))) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_warlevel"] call A3A_fnc_customHint;};
private _personalGarage = player getVariable ["personalGarage", []];
if (!((count _personalGarage < personalGarageMax) or (personalGarageMax isEqualTo 0)) and !_pool) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_personal_full"] call A3A_fnc_customHint};


_exit = false;
if (!_pool) then
	{
	_owner = _veh getVariable "ownerX";
	if (!isNil "_owner") then
		{
		if (_owner isEqualType "") then
			{
			if (getPlayerUID player != _owner) then {_exit = true};
			};
		};
	};

if (_exit) exitWith {[localize "STR_a3_garage", localize "STR_antistasi_customHint_sell_veh_owner"] call A3A_fnc_customHint;};

if (_typeVehX isKindOf "Plane") then
	{
	_airportsX = airportsX select {(sidesX getVariable [_x,sideUnknown] == teamPlayer) and (player inArea _x)};
	if (count _airportsX == 0) then {_exit = true};
	};

if (_exit) exitWith {[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_air",nameTeamPlayer]] call A3A_fnc_customHint;};

if (_veh in staticsToSave) then {staticsToSave = staticsToSave - [_veh]; publicVariable "staticsToSave"};

[_veh,true] call A3A_fnc_empty;
if (_veh in reportedVehs) then {reportedVehs = reportedVehs - [_veh]; publicVariable "reportedVehs"};
if (_veh isKindOf "StaticWeapon") then {deleteVehicle _veh};
if (_pool) then
	{
	vehInGarage = vehInGarage + [_typeVehX];
	publicVariable "vehInGarage";
	[localize "STR_a3_garage", format [localize "STR_antistasi_customHint_garage_add",nameTeamPlayer]] call A3A_fnc_customHint;
	}
else
	{
		[_typeVehX] call A3A_fnc_addToPersonalGarageLocal;
		[localize "STR_a3_garage", localize "STR_antistasi_customHint_garage_personal_add"] call A3A_fnc_customHint;
	};
