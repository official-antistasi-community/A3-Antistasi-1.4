_veh = cursortarget;
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define OccAndInv(VEH) (FactionGet(occ, VEH) + FactionGet(inv, VEH))
private _titleStr = localize "STR_A3A_fn_reinf_bombrun_title";

if (isNull _veh) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_looking"] call A3A_fnc_customHint;};

if (!alive _veh) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_destr"] call A3A_fnc_customHint;};

_units = (player nearEntities ["Man",300]) select {([_x] call A3A_fnc_CanFight) && (side _x isEqualTo Occupants || side _x isEqualTo Invaders)};
if (_units findIf {_unit = _x; _players = allPlayers select {(side _x isEqualTo teamPlayer) && (player distance _x < 300)}; _players findIf {_x in (_unit targets [true, 300])} != -1} != -1) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_nearby"] call A3A_fnc_customHint};
if (_units findIf{player distance _x < 100} != -1) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_nearby"] call A3A_fnc_customHint};

_near = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
_near = _near select {(player inArea _x) && (_veh inArea _x)};

if (_near isEqualTo []) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_no_area",FactionGet(reb,"name")]] call A3A_fnc_customHint;};

if ({isPlayer _x} count crew _veh > 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_empty"] call A3A_fnc_customHint;};

_owner = _veh getVariable "ownerX";
_exit = false;
if (!isNil "_owner") then
	{
	if (_owner isEqualType "") then
		{
		if (getPlayerUID player != _owner) then {_exit = true};
		};
	};

if (_exit) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_owner"] call A3A_fnc_customHint;};

if (not(_veh isKindOf "Air")) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_airveh"] call A3A_fnc_customHint;};

_typeX = typeOf _veh;

if (isClass (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo")) then {
	if (count getArray (configfile >> "CfgVehicles" >> _typeX >> "assembleInfo" >> "dissasembleTo") > 0) then {
		_exit = true;
	};
};
if (_exit) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_drone"] call A3A_fnc_customHint;};



_pointsX = 2;

if (_typeX in (FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack"))) then {_pointsX = 5};
if (_typeX in (OccAndInv("vehiclesPlanesCAS") + OccAndInv("vehiclesPlanesAA"))) then {_pointsX = 10};
deleteVehicle _veh;
[_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_increased",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];
