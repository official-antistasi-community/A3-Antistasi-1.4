/*
Author: Barbolani, changed by Triada

Description: returns "type" of unit in dependence from the
    unit trait, inventory, weapons and vehicle sitting in

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

#define SW_BASE_MAGS (configFile >> "CfgWeapons" >> _sWBase >> "magazines")
#define MAG_TYPE_AT_AMMO (configFile >> "CfgMagazines" >> _magTypeAT >> "ammo")
#define AMMO_AIRLOCK (configfile >> "CfgAmmo" >> _ammo >> "airLock")
#define BACKPACK_ASSEMBLE_INF \
    (configFile >> "cfgVehicles" >> _backpack >> "assembleInfo")
#define BACKPACK_ASSEMBLE_TO \
    (configFile >> "cfgVehicles" >> _backpack >> "assembleInfo" >> "assembleTo")

/* -------------------------------------------------------------------------- */
/*                                    start                                   */
/* -------------------------------------------------------------------------- */

private _unit = _this;

private _soldierType = _unit getVariable ["typeOfSoldier", ""];
private _toSet = true;

_soldierType = switch (true)
do
{
    private _isRight = !(_soldierType isEqualTo ""
        || { _soldierType isEqualTo "ATMan"
        || { _soldierType isEqualTo "AAMan"
        || { _soldierType isEqualTo "Engineer" }}});

    case (_isRight): { _toSet = false; _soldierType };

    private _isMedic = [_unit] call A3A_fnc_isMedic;

    case (_isMedic): { "Medic" };

    private _haveMines = (magazines _unit) findIf
        { (_x call BIS_fnc_itemType) select 0 == "Mine" } != -1;

    case (_haveMines): { "Engineer" };

    private _isAA = false;
    private _isAT = secondaryWeapon _unit != ""
        && { private _sWBase = [secondaryWeapon _unit] call BIS_fnc_baseWeapon;
            private _magTypeAT = (getArray SW_BASE_MAGS) # 0;
            (magazinesAmmoFull _unit) findIf { _x # 0 == _magTypeAT } != -1
        && { _isAA = true;
            private _ammo = getText MAG_TYPE_AT_AMMO;
            getNumber AMMO_AIRLOCK == 0 }};

    case (_isAT): { "ATMan" };
    case (_isAA): { "AAMan" };

    private _pWBase = [primaryWeapon _unit] call BIS_fnc_baseWeapon;
    private _isMG = _pWBase in allMachineGuns;

    case (_isMG): { "MGMan" };

    private _isSniper = _pWBase in allSniperRifles;

    case (_isSniper): { "Sniper" };

    private _isGunner = false;
    private _isStaticBase = false;
    private _backpack = backpack _unit;
    private "_isMortar";

    if (_backpack == "")
    then
    {
        private _vehicle = vehicle _unit;

        _isMortar = _vehicle isKindOf "StaticWeapon"
            && { _isGunner = true; _vehicle isKindOf "StaticMortar" };
    }
    else
    {
        _isMortar = isClass BACKPACK_ASSEMBLE_INF
            && { _isStaticBase = true;
                private _backpackWeapon = getText BACKPACK_ASSEMBLE_TO;
                _backpackWeapon != ""
            && { _isGunner = true;
                _backpackWeapon isKindOf "StaticMortar" }};
    };

    case (_isMortar): { "StaticMortar" };
    case (_isGunner): { "StaticGunner" };
    case (_isStaticBase): { "StaticBase" };

    default { "Normal" };
};

if (_toSet) then { _unit setVariable ["typeOfSoldier", _soldierType]; };

_soldierType