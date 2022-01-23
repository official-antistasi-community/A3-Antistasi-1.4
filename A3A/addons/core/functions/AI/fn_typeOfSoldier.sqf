/*
Author: Barbolani, changed by Triada

Description:
    returns "type" of unit in dependence from the
    unit trait, inventory, weapons and vehicle sitting in,
    update or set unit "typeOfSoldier" variable

Arguments: <OBJECT>
    soldier unit

Return Value: <STRING>
    "Normal", "Medic", "Engineer", "ATMan", "AAMan", "MGMan", "Sniper"
    "StaticMortar", "StaticGunner", "StaticBase"

Scope: Any
Environment: Any
Public: No
Dependencies: A3A_fnc_isMedic

Example: unit call A3A_fnc_typeOfSoldier;
*/

/* -------------------------------------------------------------------------- */
/*                                   defines                                  */
/* -------------------------------------------------------------------------- */

#define MAGS(CFG_NAME) (configFile >> "CfgWeapons" >> CFG_NAME >> "magazines")
#define MAG_AMMO(CFG_NAME) (configFile >> "CfgMagazines" >> CFG_NAME >> "ammo")
#define AIRLOCK(CFG_NAME) (configfile >> "CfgAmmo" >> CFG_NAME >> "airLock")
#define ASSEMBLE_INFO(CFG_NAME) \
    (configFile >> "cfgVehicles" >> CFG_NAME >> "assembleInfo")
#define ASSEMBLE_WEAPON(CFG_NAME) \
    (configFile >> "cfgVehicles" >> CFG_NAME >> "assembleInfo" >> "assembleTo")

/* -------------------------------------------------------------------------- */
/*                                  functions                                 */
/* -------------------------------------------------------------------------- */

private _fnc_isRight = {
    if (_soldierType isEqualTo "") exitWith { false };
    if (_soldierType isEqualTo "ATMan") exitWith { false };
    if (_soldierType isEqualTo "AAMan") exitWith { false };
    if (_soldierType isEqualTo "Engineer") exitWith { false };

    true
};

private _fnc_haveMines = {
    (magazines _unit) findIf { (_x call BIS_fnc_itemType) # 0 == "Mine" } != -1
};

private _fnc_isAT = {
    if (secondaryWeapon _unit == "") exitWith { false };

    private _sWBase = [secondaryWeapon _unit] call BIS_fnc_baseWeapon;
    private _magTypeAT = (getArray MAGS(_sWBase)) # 0;

    if ((magazinesAmmoFull _unit) findIf { _x # 0 == _magTypeAT } == -1)
    exitWith { false };

    private _ammo = getText MAG_AMMO(_magTypeAT);
    _isAA = getNumber AIRLOCK(_ammo) != 0;

    !_isAA
};

private _fnc_isMortar = {
    private _return = false;
    private _backpack = backpack _unit;

    if (_backpack == "")
    then
    {
        private _vehicle = vehicle _unit;

        if !(_vehicle isKindOf "StaticWeapon") exitWith {};

        _return = _vehicle isKindOf "StaticMortar";
        _isStaticGunner = !_return;
    }
    else
    {
        if !(isClass ASSEMBLE_INFO(_backpack)) exitWith {};

        private _backpackWeapon = getText ASSEMBLE_WEAPON(_backpack);

        if (_backpackWeapon == "") exitWith { _isStaticBase = true; };

        _return = _backpackWeapon isKindOf "StaticMortar";
        _isStaticGunner = !_return;
    };

    _return
};

/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

private _unit = _this;

private _soldierType = _unit getVariable ["typeOfSoldier", ""];
private _toSet = true;

_soldierType = switch (true)
do
{
    case (call _fnc_isRight): { _toSet = false; _soldierType };
    case ([_unit] call A3A_fnc_isMedic): { "Medic" };
    case (call _fnc_haveMines): { "Engineer" };

    private _isAA = false;

    case (call _fnc_isAT): { "ATMan" };
    case (_isAA): { "AAMan" };

    private _pWBase = [primaryWeapon _unit] call BIS_fnc_baseWeapon;

    case (_pWBase in allMachineGuns): { "MGMan" };
    case (_pWBase in allSniperRifles): { "Sniper" };

    private _isStaticGunner = false;
    private _isStaticBase = false;

    case (call _fnc_isMortar): { "StaticMortar" };
    case (_isStaticGunner): { "StaticGunner" };
    case (_isStaticBase): { "StaticBase" };

    default { "Normal" };
};

if (_toSet) then { _unit setVariable ["typeOfSoldier", _soldierType]; };

/* -------------------------------------------------------------------------- */

_soldierType
