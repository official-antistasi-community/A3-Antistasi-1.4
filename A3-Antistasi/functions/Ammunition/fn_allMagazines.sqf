/*
Author: Håkon
Description:
    Retrives all magazines compatible with the passed config

Arguments:
0. <Config> Config of whatever you want to get the magazines for
1. <Bool>   Perform only a shallow search (optional) (Default: false)

Return Value: <Array> compatible magazines

Scope: Any
Environment: Any
Public: Yes
Dependencies:

Example:
    [configFile/"cfgVehicles"/"B_MBT_01_base_F"] call A3A_fnc_allMagazines;
    [configFile/"cfgWeapons"/"arifle_MX_GL_F"] call A3A_fnc_allMagazines;

Note: None shallow search can take several millisecond, use it sparingly.

License: MIT License
*/
#include "..\..\Includes\common.inc"
params ["_config", ["_shallow", false, [true]]];
if (!isClass _config) exitWith { Error_1("Not a config: ", _config); [] };

//data store
private _magazines = [];
private _magazineWells = [];
private _classes = [_config];

//process
while {_config isNotEqualTo []} do {
    private _curClass = _classes#0;
    if (isNil "_curClass") exitWith {};
    if (!isClass _curClass) exitWith {};

    if (isArray (_curClass/"magazines")) then {_magazines append getArray (_curClass/"magazines")};
    if (isArray (_curClass/"magazineWell")) then {_magazineWells append getArray (_curClass/"magazineWell")};

    if (_shallow) exitWith {};
    _classes append (configProperties [_curClass, "isClass _x"]);
    _classes deleteAt (_classes find _curClass);
};

{
    {
        if (isArray _x) then { _magazines append getArray _x };
    } forEach configProperties [configFile/"cfgMagazineWells"/_x];
} forEach _magazineWells;

_magazines arrayIntersect _magazines;
