
private ["_crate","_thingX","_num","_magazines"];

_crate = _this select 0;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_var1 = 1+ round random 4;
_var2 = 1 + round random 5;
_var3 = 1 + floor random 3;
_var4 = floor random 2;
if (typeOf _crate == vehCSATAmmoTruck) then
	{
	_var1=_var1*2;
	_var2=_var2*2;
	_var3=_var3*2;
	_var4=_var4*2;
	};

for "_i" from 0 to _var1 do
	{
	_thingX = selectRandom (weaponsCSAT + antitankAAF);
	if (!(_thingX in unlockedWeapons)) then
		{
		_num = 1+ (floor random 12);
		_crate addWeaponCargoGlobal [_thingX, _num];
		_magazines = getArray (configFile / "CfgWeapons" / _thingX / "magazines");
		_crate addMagazineCargoGlobal [_magazines select 0, _num * 3];
		};
	};
for "_i" from 0 to _var2 do
	{
	_thingX = selectRandom itemsAAF;
	if (!(_thingX in unlockedItems)) then
		{
		_num = floor random 5;
		_crate addItemCargoGlobal [_thingX, _num];
		};
	};
for "_i" from 0 to _var2 do
	{
	_thingX = selectRandom ammunitionCSAT;
	if (!(_thingX in unlockedMagazines)) then {_crate addMagazineCargoGlobal [_thingX, 10]};
	};
for "_i" from 1 to _var3 do
	{
	_thingX = selectRandom minesAAF;
	_num = 1 + (floor random 5);
	_crate addMagazineCargoGlobal [_thingX, _num];
	};

if !(hasIFA) then
	{
	for "_i" from 1 to _var4 do
		{
		_thingX = selectRandom opticsAAF;
		if (not(_thingX in unlockedItems)) then
			{
			_crate addItemCargoGlobal [_thingX, 1 + (floor random 2)];
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
				comment "Exported from Arsenal by Alberto";
				};
			}
		else
			{
			_crate addBackpackCargoGlobal ["B_Carryall_oli",round (random 2)];
			};
		};
	};