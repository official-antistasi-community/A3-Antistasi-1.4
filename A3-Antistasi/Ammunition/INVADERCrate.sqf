
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
	_guns = (weaponsINVADER + antitankAAF);
	_avail = (_guns - _unlocks);
	_loot = selectRandom _avail;
	if (isNil "_loot") then {};
	_num = 1 + (floor random 9);
	if (!(_loot in weaponCargo _crate)) then
		{
		_crate addWeaponWithAttachmentsCargoGlobal [[_loot, "", "", "", [], [], ""], _num];
		};
	};

for "_i" from 0 to _var2 do
	{
	_items = itemsAAF;
	_avail = (_items - _unlocks);
	_loot = selectRandom _avail;
	if (isNil "_loot") then {} else {
	_num = 1 + (floor random 4);
	if (!(_loot in itemCargo _crate)) then
		{
		_crate addItemCargoGlobal [_loot, _num];
		};
		};
	};

for "_i" from 0 to _var3 do
	{
	_ammo = smokeX + chemX + ammoINVADER;
	_avail = (_ammo - _unlocks);
	_loot = selectRandom _avail;
	if (isNil "_loot") then {} else {
	if (!(_loot in magazineCargo _crate)) then
		{
		_crate addMagazineCargoGlobal [_loot, 10];
		};
		};
	};

for "_i" from 0 to _var4 do
	{
	_mines = minesAAF;
	_avail = (_mines - _unlocks);
	_loot = selectRandom _avail;
	if (isNil "_loot") then {} else {
	_num = 1 + (floor random 4);
	if (!(_loot in itemCargo _crate)) then
		{
			_crate addMagazineCargoGlobal [_loot, _num];
		};
		};
	};

if !(hasIFA) then
	{
	for "_i" from 0 to _var5 do
		{
		_optics = opticsAAF;
		_avail = (_optics - _unlocks);
		_loot = selectRandom _avail;
		if (isNil "_loot") then {} else {
		_num = 1 + (floor random 4);
		if (!(_loot in itemCargo _crate)) then
			{
			_crate addItemCargoGlobal [_loot, _num];
			};
			};
		};

	for "_i" from 0 to _var6 do
		{
		_items = backpacksCSAT;
		_avail = (_items - _unlocks);
		_loot = selectRandom _avail;
		if (isNil "_loot") then {} else {
		if (!(_loot in itemCargo _crate)) then
			{
			_crate addItemCargoGlobal [_loot, _num];
			};
			};
		};

	if (round random 100 < 25) then
		{
		if !("O_Static_Designator_02_weapon_F" in _unlocks) then
		_crate addBackpackCargoGlobal ["O_Static_Designator_02_weapon_F",1];
		}
	else
		{
		if (round random 100 < 25) then
			{
			if (side group petros == independent) then
				{
				if !("O_Static_Designator_02_weapon_F" in _unlocks) then
				{_crate addBackpackCargoGlobal ["I_UAV_01_backpack_F",1]};
				if !("O_Static_Designator_02_weapon_F" in _unlocks) then
				{_crate addItemCargoGlobal ["I_UavTerminal",1]};
				}
			else
				{
				if !("O_Static_Designator_02_weapon_F" in _unlocks) then
				{_crate addBackpackCargoGlobal ["B_UAV_01_backpack_F",1]};
				if !("O_Static_Designator_02_weapon_F" in _unlocks) then
				{_crate addItemCargoGlobal ["B_UavTerminal",1]};
				};
			};
		};
	};