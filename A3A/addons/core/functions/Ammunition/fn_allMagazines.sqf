/*
Author: Håkon
Description:
    Retrives all magazines compatible with the passed config

Arguments:
0. <Config> Config of whatever you want to get the magazines for

Return Value: <Array> compatible magazines

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:
    [configFile/"cfgVehicles"/"B_MBT_01_base_F"] call A3A_fnc_allMagazines;
    [configFile/"cfgWeapons"/"arifle_MX_GL_F"] call A3A_fnc_allMagazines;

License: MIT License
*/
#include "..\..\script_component.hpp"
params ["_config"];
if (!isClass _config) exitWith { Error_1("Not a config: ", _config); [] };

//data store
private _magazines = [];
private _magazineWells = [];

private _processVehicle = {
    if (isArray (_config/"magazines")) then {_magazines append getArray (_config/"magazines")};
    if (isArray (_config/"magazineWell")) then {_magazineWells append getArray (_config/"magazineWell")};

    {
        if (isArray (_x/"magazines")) then {_magazines append getArray (_x/"magazines")};
        if (isArray (_x/"magazineWell")) then {_magazineWells append getArray (_x/"magazineWell")};
    } forEach (configProperties [_config/"Turrets"]);
};

private _processWeapon = {
    if (isArray (_config/"magazines")) then {_magazines append getArray (_config/"magazines")};
    if (isArray (_config/"magazineWell")) then {_magazineWells append getArray (_config/"magazineWell")};

    {
        if (_x isEqualTo "this") then {continue};
        if (isArray (_config/_x/"magazines")) then {_magazines append getArray (_config/_x/"magazines")};
        if (isArray (_config/_x/"magazineWell")) then {_magazineWells append getArray (_config/_x/"magazineWell")};
    } forEach (getArray (_config/"muzzles"));
};

if ((configFile/"cfgWeapons") in (configHierarchy _config)) then _processWeapon else _processVehicle;

{
    {
        if (isArray _x) then { _magazines append getArray _x };
    } forEach configProperties [configFile/"cfgMagazineWells"/_x];
} forEach _magazineWells;

_magazines arrayIntersect _magazines;
