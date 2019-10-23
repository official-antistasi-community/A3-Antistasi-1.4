private _unlocks = (unlockedHeadgear + unlockedVests + unlockedNVGs + unlockedOptics + unlockedItems + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
private _crate = _this select 0;
private _available = objNull;
private _loot = objNull;
private _amount = objNull;
//Empty the crate
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;
//Double max types if the crate is an ammo truck
if (typeOf _crate == vehCSATAmmoTruck) then {
	if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Ammo Truck Detected: Doubling Types",servertime,_backpackTypes]};
	crateWepTypeMax=crateWepTypeMax*2;
	crateItemTypeMax=crateItemTypeMax*2;
	crateAmmoTypeMax=crateAmmoTypeMax*2;
	crateExplosiveTypeMax=crateExplosiveTypeMax*2;
	crateAttachmentTypeMax=crateAttachmentTypeMax*2;
	crateBackpackTypeMax=crateBackpackTypeMax*2;
	crateHelmetTypeMax=crateHelmetTypeMax*2;
	crateVestTypeMax=crateVestTypeMax*2;
	crateDeviceTypeMax=crateDeviceTypeMax*2;
};
//Weapons Loot
for "_i" from 0 to floor random crateWepTypeMax do {
	_available = (lootWeapon - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Weapons Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateWepNumMax;
		_crate addWeaponWithAttachmentsCargoGlobal [[ _loot, "", "", "", [], [], ""], _amount];
		_magazines = getArray (configFile / "CfgWeapons" / _loot / "magazines");
		_crate addMagazineCargoGlobal [_magazines select 0, 1];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount, _loot]};
	};
};
//Items Loot
for "_i" from 0 to floor random crateItemTypeMax do {
	_available = (lootItem - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Items Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateItemNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Ammo Loot
for "_i" from 0 to floor random crateAmmoTypeMax do {
	_available = (lootMagazine - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Ammo Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateAmmoNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Explosives Loot
for "_i" from 0 to floor random crateExplosiveTypeMax do
	{
	_available = (lootExplosive - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Explosives Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateExplosiveNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Attachments Loot
for "_i" from 0 to floor random crateAttachmentTypeMax do {
	_available = (lootAttachment - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Attachment Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateAttachmentNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Backpacks Loot
for "_i" from 0 to floor random crateBackpackTypeMax do {
	_available = (lootBackpack - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Backpacks Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateBackpackNumMax;
		_crate addBackpackCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Helmets Loot
for "_i" from 0 to floor random crateHelmetTypeMax do {
	_available = (lootHelmet - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Helmets Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateHelmetNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Vests Loot
for "_i" from 0 to floor random crateVestTypeMax do {
	_available = (lootVest - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then {
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Vests Left in Loot List",servertime]};
	}
	else {
		_amount = floor random crateVestNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
	};
};
//Device Loot
for "_i" from 0 to floor random crateDeviceTypeMax do {
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