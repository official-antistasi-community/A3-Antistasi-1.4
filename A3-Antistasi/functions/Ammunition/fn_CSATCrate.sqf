private _unlocks = (unlockedHelmet + unlockedVest + unlockedNVG + unlockedOptics + unlockedItems + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
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
if (typeOf _crate == vehCSATAmmoTruck) then
	{
	if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Ammo Truck Detected: Doubling Types",servertime,_backpackTypes]};
	crateWepTypeMax=crateWepTypeMax*2;
	crateItemTypeMax=crateItemTypeMax*2;
	crateAmmoTypeMax=crateAmmoTypeMax*2;
	crateMineTypeMax=crateMineTypeMax*2;
	crateOpticTypeMax=crateOpticTypeMax*2;
	crateBackpackTypeMax=crateBackpackTypeMax*2;
	};
//Weapons Loot
for "_i" from 0 to floor random crateWepTypeMax do
	{
	_available = (lootWeapon - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Weapons Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateWepNumMax;
		_crate addWeaponWithAttachmentsCargoGlobal [[ _loot, "", "", "", [], [], ""], _amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount, _loot]};
		};
	};
//Items Loot
for "_i" from 0 to floor random crateItemTypeMax do
	{
	_available = (lootItem - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Items Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateItemNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Ammo Loot
for "_i" from 0 to floor random crateAmmoTypeMax do
	{
	_available = (lootMagazine - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Ammo Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateAmmoNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Explosives Loot
for "_i" from 0 to floor random crateMineTypeMax do
	{
	_available = (lootExplosive - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Mines Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateMineNumMax;
		_crate addMagazineCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Attachments Loot
for "_i" from 0 to floor random crateOpticTypeMax do
	{
	_available = (lootAttachment - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Optics Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateOpticNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Backpacks Loot
for "_i" from 0 to floor random crateBackpackTypeMax do
	{
	_available = (lootBackpack - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Optics Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateBackpackNumMax;
		_crate addBackpackCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Helmets Loot
for "_i" from 0 to floor random crateItemTypeMax do
	{
	_available = (lootHelmet - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Helmets Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateItemNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};
//Vests Loot
for "_i" from 0 to floor random crateItemTypeMax do
	{
	_available = (lootVest - _unlocks - itemCargo _crate);
	_loot = selectRandom _available;
	if (isNil "_loot") then
		{
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | No Vests Left in Loot List",servertime]};
		exitWith {};
		}
		else
		{
		_amount = floor random crateItemNumMax;
		_crate addItemCargoGlobal [_loot,_amount];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning %2 of %3",servertime,_amount,_loot]};
		};
	};

if !(hasIFA) then
	{
	if (round random 100 < 25) then
		{
		if !("O_Static_Designator_01_weapon_F" in _unlocks) then
		{
		_crate addBackpackCargoGlobal ["O_Static_Designator_01_weapon_F",1];
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning 1 Laser Designator",servertime]};
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
				if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning 1 UAV Terminal And Bag",servertime]};
				}
			else
				{
				if !("B_UAV_01_backpack_F" in _unlocks) then
				{_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F",1]};
				if !("B_UavTerminal" in _unlocks) then
				{_crate addItemCargoGlobal ["B_UavTerminal",1]};
				if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning 1 UAV Terminal And Bag",servertime]};
				};
			};
		};
	if (hasACE) then
		{
			if !("ACE_HuntIR_M203" in _unlocks) then
		{_crate addMagazineCargoGlobal ["ACE_HuntIR_M203", 3]};
			if !("ACE_HuntIR_monitor" in _unlocks) then
		{_crate addItemCargoGlobal ["ACE_HuntIR_monitor", 1]};
		if (debug) then {diag_log format ["%1: [Antistasi] | INFO | CSATCrate | Spawning 1 HuntIR Monitor And 3 Rounds",servertime]};
		};
	};