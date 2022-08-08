/*  Find minimum and maximum ranges for artillery type

Environment: Any

Arguments:
    <STRING> Classname of artillery vehicle
    <STRING> Classname of artillery magazine

Return array:
    <SCALAR> Minimum range in metres
    <SCALAR> Maximum range in metres

Examples:
    ["UK3CB_ADA_I_BM21", "rhs_mag_m21of_1"] call A3A_fnc_getArtilleryRanges;
    ["O_MBT_02_arty_F", "32Rnd_155mm_Mo_shells_O"] call A3A_fnc_getArtileryRanges;
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_vehType", "_shellType"];

private _turretCfg = call {
    private _allTurrets = configProperties [configFile >> "CfgVehicles" >> _vehType >> "Turrets"];
    private _idx = _allTurrets findIf { getNumber (_x >> "elevationMode") == 3 };       // no idea if this is a valid check
    if (_idx == -1) exitWith {
        Error_1("Artillery turret not found on %1", _vehType);
        configFile >> "CfgVehicles" >> _vehType >> "Turrets" >> "MainTurret";
    };
    _allTurrets # _idx;
};

// Try mags for pylon weapons, otherwise assume the turret weapon is valid
private _weapon = getText (configfile >> "CfgMagazines" >> _shellType >> "pylonWeapon");
if (_weapon == "") then { _weapon = getArray (_turretCfg >> "Weapons") # 0 };
private _weaponCfg = configFile >> "CfgWeapons" >> _weapon;

// Assume that there's no speed override on weapon, probably true for arty
private _initSpeed = getNumber (configFile >> "CfgMagazines" >> _shellType >> "initSpeed");
private _maxElev = getNumber (_turretCfg >> "maxElev");
// Simple formula works because Arma doesn't calculate air resistance for artillery
private _maxRange = (_initSpeed)^2 * sin (2*45) / 9.807;

// Assumes first fire mode is closest range, probably true because artillery computer
private _minCharge = getNumber (_weaponCfg >> getArray (_weaponCfg >> "modes")#0 >> "artilleryCharge");
if (_minCharge == 0) then { Error_1("Artillery charge lookup failed for %1", _vehType); _minCharge = 1 };
private _minRange = (_minCharge * _initSpeed)^2 * sin (2*_maxElev) / 9.807;

[_minRange+100, _maxRange-100];     // make sure we can spread shots
