if (!isServer and hasInterface) exitWith {};

private ["_thingX","_num","_loot","_guns","_ammo","_items","_avail","_num","_optics","_packs","_mines","_unlocks"];

clearMagazineCargoGlobal boxX;
clearWeaponCargoGlobal boxX;
clearItemCargoGlobal boxX;
clearBackpackCargoGlobal boxX;

private _weaponTypes = crateWepTypeMin + floor random (crateWepTypeMax - crateWepTypeMin);
private _itemTypes = crateItemTypeMin + floor random (crateItemTypeMax - crateItemTypeMin);
private _ammoTypes = crateAmmoTypeMin + floor random (crateAmmoTypeMax - crateAmmoTypeMin);
private _mineTypes = crateMineTypeMin + floor random (crateMineTypeMax - crateMineTypeMin);
private _opticTypes = crateOpticTypeMin + floor random (crateOpticTypeMax - crateOpticTypeMin);
private _backpackTypes = crateBackpackTypeMin + floor random (crateBackpackTypeMax - crateBackpackTypeMin);

for "_i" from 0 to _weaponTypes do
	{_thingX = if (random 2 < 1) then {selectRandom (weaponsNato + antitankAAF)} else {selectRandom (weaponsCSAT + antitankAAF)};
	_num = crateWepNumMin + floor random (crateWepNumMax - crateWepNumMin);
	boxX addWeaponWithAttachmentsCargoGlobal [[_thingX, "", "", "", [], [], ""],_num];
	_magazines = getArray (configFile / "CfgWeapons" / _thingX / "magazines");
	boxX addMagazineCargoGlobal [_magazines select 0, _num * 3];
	};

for "_i" from 0 to _itemTypes do
	{_thingX = selectRandom itemsAAF;
	_num = crateItemNumMin + floor random (crateItemNumMax - crateItemNumMin);
	boxX addItemCargoGlobal [_thingX, _num];
	};

for "_i" from 0 to _mineTypes do
	{_thingX = selectRandom minesAAF;
	_num = crateMineNumMin + floor random (crateMineNumMax - crateMineNumMin);
	boxX addMagazineCargoGlobal [_thingX, _num];
	};
	
if !(opticsAAF isEqualTo []) then
	{
	for "_i" from 0 to _opticTypes do
		{
		_thingX = selectRandom opticsAAF;
		_num = crateOpticNumMin + floor random (crateOpticNumMax - crateOpticNumMin);
		boxX addItemCargoGlobal [_thingX,_num];
		};
	};

if (hasTFAR) then {boxX addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1]};