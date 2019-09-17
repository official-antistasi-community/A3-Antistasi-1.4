private ["_loot","_guns","_ammo","_items","_avail","_num","_optics","_packs","_mines"];

private _unlocks = (unlockedItems + unlockedOptics + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
private _crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

private _weaponTypes = crateWepTypeMin + floor random (crateWepTypeMax - crateWepTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Weapon Types Roll: %2",servertime,(_weaponTypes + 1)]};
private _itemTypes = crateItemTypeMin + floor random (crateItemTypeMax - crateItemTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Item Types Roll: %2",servertime,(_itemTypes + 1)]};
private _ammoTypes = crateAmmoTypeMin + floor random (crateAmmoTypeMax - crateAmmoTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Ammo Types Roll: %2",servertime,(_ammoTypes + 1)]};
private _mineTypes = crateMineTypeMin + floor random (crateMineTypeMax - crateMineTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Mine Types Roll: %2",servertime,(_mineTypes + 1)]};
private _opticTypes = crateOpticTypeMin + floor random (crateOpticTypeMax - crateOpticTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Optic Types Roll: %2",servertime,(_opticTypes + 1)]};
private _backpackTypes = crateBackpackTypeMin + floor random (crateBackpackTypeMax - crateBackpackTypeMin);
if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Backpack Types Roll: %2",servertime,(_backpackTypes + 1)]};

if (typeOf _crate == vehNATOAmmoTruck) then
	{
	if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Ammo Truck Detected: Doubling Types",servertime,_backpackTypes]};
	_weaponTypes=_weaponTypes*2;
	_itemTypes=_itemTypes*2;
	_ammoTypes=_ammoTypes*2;
	_mineTypes=_mineTypes*2;
	_opticTypes=_opticTypes*2;
	_backpackTypes=_backpackTypes*2;
	};

for "_i" from 0 to _weaponTypes do
	{
	_guns = (weaponsNato + antitankAAF);
	_avail = (_guns - _unlocks - itemCargo _crate);
	_loot = selectRandom _avail;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Weapons Left in Loot List",servertime]};
		}
		else
		{
		_num = crateWepNumMin + floor random (crateWepNumMax - crateWepNumMin);
		_crate addWeaponWithAttachmentsCargoGlobal [[ _loot, "", "", "", [], [], ""], _num];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num, _loot]};
		};
	};

for "_i" from 0 to _itemTypes do
	{
	_items = itemsAAF;
	_avail = (_items - _unlocks - itemCargo _crate);
	_loot = selectRandom _avail;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Items Left in Loot List",servertime]};
		}
		else
		{
		_num = crateItemNumMin + floor random (crateItemNumMax - crateItemNumMin);
		_crate addItemCargoGlobal [_loot,_num];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num,_loot]};
		};
	};

for "_i" from 0 to _ammoTypes do
	{
	_ammo = (smokeX + chemX + ammunitionNATO);
	_avail = (_ammo - _unlocks - itemCargo _crate);
	_loot = selectRandom _avail;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Ammo Left in Loot List",servertime]};
		}
		else
		{
		_num = crateAmmoNumMin + floor random (crateAmmoNumMax - crateAmmoNumMin);
		_crate addMagazineCargoGlobal [_loot,_num];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num,_loot]};
		};
	};

for "_i" from 0 to _mineTypes do
	{
	_mines = minesAAF;
	_avail = (_mines - _unlocks - itemCargo _crate);
	_loot = selectRandom _avail;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Mines Left in Loot List",servertime]};
		}
		else
		{
		_num = crateMineNumMin + floor random (crateMineNumMax - crateMineNumMin);
		_crate addMagazineCargoGlobal [_loot,_num];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num,_loot]};
		};
	};

if !(hasIFA) then
	{
	for "_i" from 0 to _opticTypes do
		{
		_optics = opticsAAF;
		_avail = (_optics - _unlocks - itemCargo _crate);
		_loot = selectRandom _avail;
		if (isNil "_loot") then
			{
			if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Optics Left in Loot List",servertime]};
			}
			else
			{
			_num = crateOpticNumMin + floor random (crateOpticNumMax - crateOpticNumMin);
			_crate addItemCargoGlobal [_loot,_num];
			if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num,_loot]};
			};
		};

	for "_i" from 0 to _backpackTypes do
		{
		_packs = backpacksNATO;
		_avail = (_packs - _unlocks - itemCargo _crate);
		_loot = selectRandom _avail;
		if (isNil "_loot") then
			{
			if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | No Optics Left in Loot List",servertime]};
			}
			else
			{
			_num = crateBackpackNumMin + floor random (crateBackpackNumMax - crateBackpackNumMin);
			_crate addBackpackCargoGlobal [_loot,_num];
			if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning %2 of %3",servertime,_num,_loot]};
			};
		};

	if (round random 100 < 25) then
		{
		if !("B_Static_Designator_01_weapon_F" in _unlocks) then
		{
		_crate addBackpackCargoGlobal ["B_Static_Designator_01_weapon_F",1];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning 1 Laser Designator",servertime]};
		};
		}
	else
		{
		if (round random 100 < 25) then
			{
			if (side group petros == independent) then
				{
				if !("I_UAV_01_backpack_F" in _unlocks) then
				{_crate addBackpackCargoGlobal ["I_UAV_01_backpack_F",1]};
				if !("I_UavTerminal" in _unlocks) then
				{_crate addItemCargoGlobal ["I_UavTerminal",1]};
				if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning 1 UAV Terminal And Bag",servertime]};
				}
			else
				{
				if !("B_UAV_01_backpack_F" in _unlocks) then
				{_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F",1]};
				if !("B_UavTerminal" in _unlocks) then
				{_crate addItemCargoGlobal ["B_UavTerminal",1]};
				if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning 1 UAV Terminal And Bag",servertime]};
				};
			};
		};
	if (hasACE) then
		{
			if !("ACE_HuntIR_M203" in _unlocks) then
		{_crate addMagazineCargoGlobal ["ACE_HuntIR_M203", 3]};
			if !("ACE_HuntIR_monitor" in _unlocks) then
		{_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1]};
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | NATOCrate | Spawning 1 HuntIR Monitor And 3 Rounds",servertime]};
		};
	};