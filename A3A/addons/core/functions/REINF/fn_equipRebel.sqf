// Fully equips a rebel infantry unit based on their class and unlocked gear
// _recruitType param allows some variation based on recruiting method: 0 recruit, 1 HC squad, 2 garrison

params ["_unit", "_recruitType"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

// Mostly exists because BIS_fnc_addWeapon won't use backpack space properly with AT launchers
private _addWeaponAndMags = {
	params["_unit", "_weapon", "_magCount"];

	if !(isClass (configFile / "CfgWeapons" / _weapon)) exitwith {
		[1, format ["Bad weapon class: %1", _weapon], _filename, true] call A3A_log;
	};

	_unit addWeapon _weapon;
	private _magazine = getArray (configFile / "CfgWeapons" / _weapon / "magazines") select 0;
	_unit addSecondaryWeaponItem _magazine;
	_unit addMagazines [_magazine, _magCount-1];
};

if (haveRadio) then {_unit linkItem selectrandom (unlockedRadios)};

// Chance of picking armored rather than random vests and headgear, rising with unlocked gear counts
if !(unlockedHeadgear isEqualTo []) then {
	if (count unlockedArmoredHeadgear * 20 < random(100)) then { _unit addHeadgear (selectRandom (A3A_faction_reb get "headgear")) }
	else { _unit addHeadgear (selectRandom unlockedArmoredHeadgear) };
};
if !(unlockedVests isEqualTo []) then {
	if (count unlockedArmoredVests * 20 < random(100)) then { _unit addVest (selectRandom unlockedVests) }
	else { _unit addVest (selectRandom unlockedArmoredVests); };
};
if !(unlockedBackpacksCargo isEqualTo []) then { _unit addBackpack (selectRandom unlockedBackpacksCargo) };

// this should be improved by categorising grenades properly
private _unlockedSmokes = allSmokeGrenades arrayIntersect unlockedMagazines;
if !(_unlockedSmokes isEqualTo []) then { _unit addMagazines [selectRandom _unlockedSmokes, 2] };


private _unitType = _unit getVariable "unitType";
switch (true) do {
	case (_unitType isEqualTo FactionGet(reb,"unitSniper")): {
		if (count unlockedSniperRifles > 0) then {
			[_unit, selectRandom unlockedSniperRifles, 8] call _addWeaponAndMags;
			if (count unlockedOptics > 0) then {
				private _compatibleX = [primaryWeapon _unit] call BIS_fnc_compatibleItems;
				private _potentials = unlockedOptics select {_x in _compatibleX};
				if (count _potentials > 0) then {_unit addPrimaryWeaponItem (_potentials select 0)};
			};
		} else {
			[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		};
	};
	case (_unitType isEqualTo FactionGet(reb,"unitRifle")): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		// Adding AA launchers to garrison riflemen because explosives guys can't currently be purchased there
		if (_recruitType == 2 && {count unlockedAA > 0}) then {
			[_unit, selectRandom unlockedAA, 1] call _addWeaponAndMags;
		};
	};
	case (_unitType isEqualTo FactionGet(reb,"unitMG")): {
		[_unit,unlockedMachineGuns] call A3A_fnc_randomRifle;
	};
	case (_unitType isEqualTo FactionGet(reb,"unitGL")): {
		[_unit,unlockedGrenadeLaunchers] call A3A_fnc_randomRifle;
	};
	case (_unitType isEqualTo FactionGet(reb,"unitExp")): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		_unit enableAIFeature ["MINEDETECTION", true]; //This should prevent them from Stepping on the Mines as an "Expert" (It helps, they still step on them)
		if (count unlockedAA > 0) then {
			[_unit, selectRandom unlockedAA, 1] call _addWeaponAndMags;
		};
			_unit addItemToBackpack (selectRandom unlockedToolKits);
			_unit addItemToBackpack (selectRandom unlockedMineDetectors);
		// TODO: explosives. Not that they know what to do with them.
	};
	case (_unitType isEqualTo FactionGet(reb,"unitEng")): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		_unit addItemToBackpack (selectRandom unlockedToolKits);
	};
	case (_unitType isEqualTo FactionGet(reb,"unitMedic")): {
		[_unit,unlockedSMGs] call A3A_fnc_randomRifle;
		// temporary hack
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
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if !(unlockedAT isEqualTo []) then {
			[_unit, selectRandom unlockedAT, 4] call _addWeaponAndMags;
		} else {
			if (A3A_hasIFA) then {
				[_unit, "LIB_PTRD", 10] call _addWeaponAndMags;
			};
		};
	};
	// squad leaders and
	case (_unitType isEqualTo FactionGet(reb,"unitSL")): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if (_recruitType == 1) then {_unit linkItem selectrandom (unlockedRadios)};
	};
 	case (_unitType isEqualTo FactionGet(reb,"unitCrew")): {
		[_unit,unlockedRifles] call A3A_fnc_randomRifle;
		if (_recruitType == 1) then {_unit linkItem selectrandom (unlockedRadios)};
	};
	default {
		[_unit,unlockedSMGs] call A3A_fnc_randomRifle;
        Error_1("Unknown unit class: %1", _unitType);
	};
};

if (!A3A_hasIFA && sunOrMoon < 1) then {
	if !(haveNV) then {
		// horrible, although at least it stops once you unlock NV
		private _flashlights = allLightAttachments arrayIntersect unlockedItems;
		if !(_flashlights isEqualTo []) then {
			_flashlights = _flashlights arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
			if !(_flashlights isEqualTo []) then {
				private _flashlight = selectRandom _flashlights;
				_unit addPrimaryWeaponItem _flashlight;
				_unit assignItem _flashlight;
				_unit enableGunLights _flashlight;
			};
		};
	} else {
		// inclined to hand these out even in daytime, but whatever
		_unit linkItem (selectRandom unlockedNVGs);

/* Removed because it's pretty daft to use IR pointers when all your enemies have NV
		private _pointers = allLaserAttachments arrayIntersect unlockedItems;
		if !(_pointers isEqualTo []) then {
			_pointers = _pointers arrayIntersect ((primaryWeapon _unit) call BIS_fnc_compatibleItems);
			if !(_pointers isEqualTo []) then {
				_pointer = selectRandom _pointers;
				_unit addPrimaryWeaponItem _pointer;
				_unit assignItem _pointer;
				_unit enableIRLasers true;
			};
		};
*/
	};
};

// remove backpack if empty, otherwise squad troops will throw it on the ground
if (backpackItems _unit isEqualTo []) then { removeBackpack _unit };

Verbose_3("Class %1, type %2, loadout %3", _unitType, _recruitType, str (getUnitLoadout _unit));
