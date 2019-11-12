private _unlocks = (unlockedHeadgear + unlockedVests + unlockedNVGs + unlockedOptics + unlockedItems + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
private _crate = _this select 0;
private _available = objNull;
private _amount = objNull;
//Empty the crate
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
//protecting global max parameters
private _crateWepTypeMax = crateWepTypeMax;
private _crateItemTypeMax = crateItemTypeMax;
private _crateAmmoTypeMax = crateAmmoTypeMax;
private _crateExplosiveTypeMax = crateExplosiveTypeMax;
private _crateAttachmentTypeMax = crateAttachmentTypeMax;
private _crateBackpackTypeMax = crateBackpackTypeMax;
private _crateHelmetTypeMax = crateHelmetTypeMax;
private _crateVestTypeMax = crateVestTypeMax;
private _crateDeviceTypeMax = crateDeviceTypeMax;
//Double max types if the crate is an ammo truck
if (typeOf _crate == vehNATOAmmoTruck) then {
	if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Ammo Truck Detected: Doubling Types",servertime,_backpackTypes]};
	_crateWepTypeMax = _crateWepTypeMax * 2;
	_crateItemTypeMax = _crateItemTypeMax * 2;
	_crateAmmoTypeMax = _crateAmmoTypeMax * 2;
	_crateExplosiveTypeMax = _crateExplosiveTypeMax * 2;
	_crateAttachmentTypeMax = _crateAttachmentTypeMax * 2;
	_crateBackpackTypeMax = _crateBackpackTypeMax * 2;
	_crateHelmetTypeMax = _crateHelmetTypeMax * 2;
	_crateVestTypeMax = _crateVestTypeMax * 2;
	_crateDeviceTypeMax = _crateDeviceTypeMax * 2;
};

private _lootWeaponCategoryWeighting = [
	[allRifles, 4],
	[allHandguns, 4],
	[allMachineGuns, 4],
	[allShotguns, 4],
	[allSMGs, 4],
	[allSniperRifles, 1],
	[allMissileLaunchers, 1],
	[allRocketLaunchers, 1]
];

//Array of weapon type arrays where selectRandom gives you a type with the correct probability, according to its weight.
private _weightedWeaponCategories = [];
{
	private _weight = _x select 1;
	
	for "_i" from 1 to _weight do {
		//Add the collection to the types array.
		_weightedWeaponCategories pushBack (_x select 0);
	};
} forEach _lootWeaponCategoryWeighting;

private _fnc_pickRandomFromANotInB = {
	params ["_arrayA", "_arrayB"];
	private _choice = selectRandom _arrayA;
	private _foundValid = true;
	if (_choice in _arrayB) then {
		_foundValid = false;
		for "_i" from 0 to 9 do {
			_choice = selectRandom _arrayA;
			//We did it!
			if !(_choice in _arrayB) exitWith {
				_foundValid = true;
			};
		}
	};
	
	if (_foundValid) then {
		_choice;
	};
};


//Weapons Loot
for "_i" from 0 to floor random _crateWepTypeMax do {
	private _category =	selectRandom _weightedWeaponCategories;
	private _loot = [_category, unlockedWeapons] call _fnc_pickRandomFromANotInB;
	
	//If at first we don't succeed, try, try again.
	if (isNil "_loot") then {
		private _shuffledWeaponCategories = _weightedWeaponCategories call BIS_fnc_arrayShuffle;
		{
			_category =	_x;
			_loot = [_category, unlockedWeapons] call _fnc_pickRandomFromANotInB;
			if !(isNil "_loot") exitWith {};
		} forEach _shuffledWeaponCategories;
	};

	diag_log format ["%1 weapons chosen", _i];
	diag_log format ["Chosen category with %1 weapons", count _category];
	diag_log format ["Final weapon: %1", _loot];
	
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Weapons Left in Loot List Or Pick Random Failed",servertime]};
	}
	else {
		_amount = floor random crateWepNumMax;
		_crate addWeaponWithAttachmentsCargoGlobal [[ _loot, "", "", "", [], [], ""], _amount];
		_magazines = getArray (configFile / "CfgWeapons" / _loot / "magazines");
		_crate addMagazineCargoGlobal [_magazines select 0, 1];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount, _loot]};
	};
};

//Items Loot
for "_i" from 0 to floor random _crateItemTypeMax do {
	_available = (lootItem - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Items Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateItemNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Ammo Loot
for "_i" from 0 to floor random _crateAmmoTypeMax do {
	_available = (lootMagazine - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Ammo Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateAmmoNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Explosives Loot
for "_i" from 0 to floor random _crateExplosiveTypeMax do {
	_available = (lootExplosive - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Explosives Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateExplosiveNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Attachments Loot
for "_i" from 0 to floor random _crateAttachmentTypeMax do {
	_available = (lootAttachment - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Attachment Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateAttachmentNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Backpacks Loot
for "_i" from 0 to floor random _crateBackpackTypeMax do {
	_available = (lootBackpack - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Backpacks Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateBackpackNumMax;
		_crate addBackpackCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Helmets Loot
for "_i" from 0 to floor random _crateHelmetTypeMax do {
	_available = (lootHelmet - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Helmets Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateHelmetNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Vests Loot
for "_i" from 0 to floor random _crateVestTypeMax do {
	_available = (lootVest - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Vests Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateVestNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Device Loot
for "_i" from 0 to floor random _crateDeviceTypeMax do {
	_available = (lootDevice - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Device Bags Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateDeviceNumMax;
		_crate addBackpackCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
