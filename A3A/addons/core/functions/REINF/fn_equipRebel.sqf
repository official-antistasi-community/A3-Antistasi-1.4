/*
    Fully equips a rebel infantry unit based on their class and unlocked gear

Parameters:
    0. <OBJECT> Unit to equip
    1. <NUMBER> Recruit type: 0 recruit, 1 HC squad, 2 garrison. Doesn't currently have any effect

Returns:
    Nothing

Environment:
    Scheduled, any machine
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_unit", "_recruitType"];

call A3A_fnc_fetchRebelGear;        // Send current version of rebelGear from server if we're out of date

private _fnc_addSecondaryAndMags = {
    params ["_unit", "_weapon", "_totalMagWeight"];

    _unit addWeapon _weapon;
    if ("Disposable" in (_weapon call A3A_fnc_equipmentClassToCategories)) exitWith {};

    private _magazine = getArray (configFile / "CfgWeapons" / _weapon / "magazines") select 0;
    _unit addSecondaryWeaponItem _magazine;
    private _magWeight = 10 max getNumber (configFile / "CfgMagazines" / _magazine / "mass");
    _unit addMagazines [_magazine, round (random 0.5 + _totalMagWeight / _magWeight)];

    private _compatOptics = A3A_rebelOpticsCache get _weapon;
    if (isNil "_compatOptics") then {
        private _compatItems = [_weapon] call BIS_fnc_compatibleItems;		// cached, should be fast
        _compatOptics = _compatItems arrayIntersect (A3A_rebelGear get "OpticsAll");
        A3A_rebelOpticsCache set [_weapon, _compatOptics];
    };
    if (_compatOptics isNotEqualTo []) then { _unit addSecondaryWeaponItem (selectRandom _compatOptics) };
};

private _fnc_addCharges = {
    params ["_unit", "_totalWeight"];

    private _charges = A3A_rebelGear get "ExplosiveCharges";
    if (_charges isEqualTo []) exitWith {};

    private _weight = 0;
    while { _weight < _totalWeight } do {
        private _charge = selectRandomWeighted _charges;
        _weight = _weight + getNumber (configFile / "CfgMagazines" / _charge / "mass");
        _unit addItemToBackpack _charge;
    };
};

private _radio = selectRandomWeighted (A3A_rebelGear get "Radios");
if (!isNil "_radio") then {_unit linkItem _radio};

private _helmet = selectRandomWeighted (A3A_rebelGear get "ArmoredHeadgear");
if (_helmet == "") then { _helmet = selectRandom (A3A_faction_reb get "headgear") };
_unit addHeadgear _helmet;

private _vest = selectRandomWeighted (A3A_rebelGear get "ArmoredVests");
if (_vest == "") then { _vest = selectRandomWeighted (A3A_rebelGear get "UnarmoredVests") };
_unit addVest _vest;

private _backpack = selectRandomWeighted (A3A_rebelGear get "BackpacksCargo");
if !(isNil "_backpack") then { _unit addBackpack _backpack };

private _smokes = A3A_rebelGear get "SmokeGrenades";
if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 1] };
private _grenades = A3A_rebelGear get "Grenades";
if (_grenades isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _grenades, 1] };

// TODO: add types unitAA and unitAT(name?) when UI is ready
private _unitType = _unit getVariable "unitType";
switch (true) do
{
    case (_unitType isEqualTo FactionGet(reb,"unitSniper")): {
        [_unit, "SniperRifles", 50] call A3A_fnc_randomRifle;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitRifle")): {
        [_unit, "Rifles", 70] call A3A_fnc_randomRifle;
        if (_grenades isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _grenades, 2] };
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 1] };

        // could throw in some disposable launchers here...
    };
    case (_unitType isEqualTo FactionGet(reb,"unitMG")): {
        [_unit, "MachineGuns", 150] call A3A_fnc_randomRifle;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitGL")): {
        [_unit, "GrenadeLaunchers", 50] call A3A_fnc_randomRifle;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitExp")): {
        [_unit, "Rifles", 40] call A3A_fnc_randomRifle;

        _unit enableAIFeature ["MINEDETECTION", true]; //This should prevent them from Stepping on the Mines as an "Expert" (It helps, they still step on them)

        private _mineDetector = selectRandomWeighted (A3A_rebelGear get "MineDetectors");
        if !(isNil "_mineDetector") then { _unit addItem _mineDetector };

        private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
        if !(isNil "_toolkit") then { _unit addItem _toolkit };

        [_unit, 50] call _fnc_addCharges;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitEng")): {
        [_unit, "Rifles", 50] call A3A_fnc_randomRifle;

        private _toolkit = selectRandomWeighted (A3A_rebelGear get "Toolkits");
        if !(isNil "_toolkit") then { _unit addItem _toolkit };

        [_unit, 50] call _fnc_addCharges;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitMedic")): {
        [_unit, "SMGs", 40] call A3A_fnc_randomRifle;
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 2] };

        // not-so-temporary hack
        private _medItems = [];
        {
            for "_i" from 1 to (_x#1) do { _medItems pushBack (_x#0) };
        } forEach (["MEDIC",independent] call A3A_fnc_itemset_medicalSupplies);
        {
            _medItems deleteAt (_medItems find _x);
        } forEach items _unit;
        {
            _unit addItemToBackpack _x;
        } forEach _medItems;
    };
    case (_unitType isEqualTo FactionGet(reb,"unitLAT")): {
        [_unit, "Rifles", 40] call A3A_fnc_randomRifle;

        private _launcher = selectRandomWeighted (A3A_rebelGear get "RocketLaunchers");
        if !(isNil "_launcher") then { [_unit, _launcher, 100] call _fnc_addSecondaryAndMags };

//		if (A3A_hasIFA) then {
//			[_unit, "LIB_PTRD", 100] call _addSecondaryAndMags;
//		};
    };
    case (_unitType isEqualTo FactionGet(reb,"unitSL")): {
        [_unit, "Rifles", 50] call A3A_fnc_randomRifle;
        if (_smokes isNotEqualTo []) then { _unit addMagazines [selectRandomWeighted _smokes, 2] };
    };
     case (_unitType isEqualTo FactionGet(reb,"unitCrew")): {
        [_unit, "Rifles", 50] call A3A_fnc_randomRifle;
    };
    default {
        [_unit, "SMGs", 50] call A3A_fnc_randomRifle;
        Error_1("Unknown unit class: %1", _unitType);
    };
};

private _nvg = selectRandomWeighted (A3A_rebelGear get "NVGs");
if (_nvg != "") then { _unit linkItem _nvg }
else {
    private _weapon = primaryWeapon _unit;
    private _compatLights = A3A_rebelFlashlightsCache get _weapon;
    if (isNil "_compatLights") then {
        private _compatItems = [_weapon] call BIS_fnc_compatibleItems;		// cached, should be fast
        _compatLights = _compatItems arrayIntersect (A3A_rebelGear get "LightAttachments");
        A3A_rebelFlashlightsCache set [_weapon, _compatLights];
    };
    if (_compatLights isNotEqualTo []) then {
        private _flashlight = selectRandom _compatLights;
        _unit addPrimaryWeaponItem _flashlight;		// should be used automatically by AI as necessary
    };
};


// remove backpack if empty, otherwise squad troops will throw it on the ground
if (backpackItems _unit isEqualTo []) then { removeBackpack _unit };

Verbose_3("Class %1, type %2, loadout %3", _unitType, _recruitType, str (getUnitLoadout _unit));
