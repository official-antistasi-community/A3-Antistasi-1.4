
private ["_crate","_loot","_num","_magazines","_unlocks"];


_unlocks = (unlockedItems + unlockedOptics + unlockedWeapons + unlockedBackpacks + unlockedMagazines);
_crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_var1 = 1 + floor random 4;
_var2 = 1 + floor random 4;
_var3 = 1 + floor random 4;
_var4 = 1 + floor random 4;
_var5 = 1 + floor random 4;
_var6 = 1 + floor random 4;
if (typeOf _crate == vehCSATAmmoTruck) then
	{
	_var1=_var1*2;
	_var2=_var2*2;
	_var3=_var3*2;
	_var4=_var4*2;
	_var5=_var5*2;
	_var6=_var6*2;
	};

for "_i" from 0 to _var1 do
	{
	_guns = (weaponsCSAT + antitankAAF);
	_avail = (_guns - _unlocks);
	_loot = selectRandom _avail;
	if (!(_loot in weaponCargo _crate)) then
		{
		_num = 1 + (floor random 9);
		_crate addWeaponWithAttachmentsCargoGlobal [[_loot, "", "", "", [], [], ""], _num];
		};
	};
for "_i" from 0 to _var2 do
	{
	_items = itemsAAF;
	_avail = (itemsAAF - _unlocks);
	_loot = selectRandom _avail;
	if (!(_loot in itemCargo _crate)) then
		{
		_num = 1 + (floor random 4);
		_crate addItemCargoGlobal [_loot, _num];
		};
	};
for "_i" from 0 to _var3 do
	{
	_ammo = smokeX + chemX + ammunitionCSAT;
	_avail = (_ammo - _unlocks);
	_loot = selectRandom _avail;
	if (!(_loot in magazineCargo _crate)) then {_crate addMagazineCargoGlobal [_loot, 10]};
	};
for "_i" from 0 to _var4 do
	{
	_loot = selectRandom minesAAF;
	_num = 1 + (floor random 4);
	_crate addMagazineCargoGlobal [_loot, _num];
	};

if !(hasIFA) then
	{
	for "_i" from 0 to _var5 do
		{
		_optics = opticsAAF;
		_avail = (opticsAAF - _unlocks);
		_loot = selectRandom _avail;
		_num = 1 + (floor random 4);
		if (!(_loot in itemCargo _crate)) then
			{
			_crate addItemCargoGlobal [_loot, _num];
			};
		};

	for "_i" from 0 to _var6 do
		{
		_items = backpacksNATO;
		_avail = (_items - _unlocks);
		_loot = selectRandom _avail;
		if (!(_loot in itemCargo _crate)) then
				{
				_num = 1 + (floor random 4);
				_crate addItemCargoGlobal [_loot, _num];
				};
		};

	if (round random 100 < 25) then
		{
		_crate addBackpackCargoGlobal ["O_Static_Designator_02_weapon_F",1];
		}
	else
		{
		if (round random 100 < 25) then
			{
			if (side group petros == independent) then
				{
				_crate addBackpackCargoGlobal ["I_UAV_01_backpack_F",1];
				_crate addItemCargoGlobal ["I_UavTerminal",1];
				}
			else
				{
				_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F",1];
				_crate addItemCargoGlobal ["B_UavTerminal",1];
				};
			};
		};
	};