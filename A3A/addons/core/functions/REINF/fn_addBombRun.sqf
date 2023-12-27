_veh = cursortarget;
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
#define OccAndInv(VEH) (FactionGet(occ, VEH) + FactionGet(inv, VEH))
private _titleStr = localize "STR_A3A_fn_reinf_bombrun_title";

if (isNull _veh) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_looking"] call A3A_fnc_customHint;}; // cursorObject null i.e. not looking at vehicle
if (!alive _veh) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_destr"] call A3A_fnc_customHint;}; // destroyed
if (_veh getVariable ["A3A_locked",false]) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_locked"] call A3A_fnc_customHint;}; // locked
if (!isNil "_owner" && {_owner isEqualType ""} && {getPlayerUID player != _owner}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_owner"] call A3A_fnc_customHint;}; // not owner
if (player isNotEqualTo vehicle player) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_inVehicle"] call A3A_fnc_customHint;}; // already in a vehicle
if (player distance _veh > 25) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_distance"] call A3A_fnc_customHint;}; // not close enough
if ([getPosATL player] call A3A_fnc_enemyNearCheck) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_nearby"] call A3A_fnc_customHint}; // enemies nearby

private _validMarks = (["Synd_HQ"] + airportsX) select {sidesX getVariable [_x,sideUnknown] isEqualTo teamplayer};
private _inArea = _validMarks findIf { count ([player, _veh] inAreaArray _x) > 1 };
if !(_inArea > -1) exitWith {[_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_no_area",FactionGet(reb,"name")]] call A3A_fnc_customHint;}; // not near airbase or HQ

if (count crew _veh > 0) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_empty"] call A3A_fnc_customHint;}; // not empty
if !(_veh isKindOf "Air") exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_airveh"] call A3A_fnc_customHint;}; // not an air vehicle

//checks if the vehicle can be assembled/disassembled (i.e. backpack drone)
if (isClass (configfile >> "CfgVehicles" >> typeOf _veh >> "assembleInfo") && {count getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "assembleInfo" >> "dissasembleTo") > 0}) exitWith {[_titleStr, localize "STR_A3A_fn_reinf_bombrun_no_drone"] call A3A_fnc_customHint;};

_pointsX = 2;

if (_typeX in (FactionGet(all,"vehiclesHelisAttack") + FactionGet(all,"vehiclesHelisLightAttack"))) then {_pointsX = 5};
if (_typeX in (OccAndInv("vehiclesPlanesCAS") + OccAndInv("vehiclesPlanesAA"))) then {_pointsX = 10};
deleteVehicle _veh;
[_titleStr, format [localize "STR_A3A_fn_reinf_bombrun_increased",_pointsX]] call A3A_fnc_customHint;
bombRuns = bombRuns + _pointsX;
publicVariable "bombRuns";
[] remoteExec ["A3A_fnc_statistics",theBoss];
