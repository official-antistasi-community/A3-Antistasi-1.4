if (!isServer and hasInterface) exitWith {};

private ["_thingX","_num","_magazines"];

clearMagazineCargoGlobal boxX;
clearWeaponCargoGlobal boxX;
clearItemCargoGlobal boxX;
clearBackpackCargoGlobal boxX;


for "_i" from 0 to (1+ round random 4) do
	{_thingX = if (random 2 < 1) then {selectRandom (weaponsNato + antitankAAF)} else {selectRandom (weaponsCSAT + antitankAAF)};
	_num = 1+ (floor random 4);
	boxX addWeaponCargoGlobal [_thingX, _num];
	_magazines = getArray (configFile / "CfgWeapons" / _thingX / "magazines");
	boxX addMagazineCargoGlobal [_magazines select 0, _num * 3];
	};

for "_i" from 0 to (1 + round random 5) do
	{_thingX = selectRandom itemsAAF;
	_num = floor random 5;
	boxX addItemCargoGlobal [_thingX, _num];
	};

for "_i" from 1 to (floor random 3) do
	{_thingX = selectRandom minesAAF;
	_num = 1 + (floor random 5);
	boxX addMagazineCargoGlobal [_thingX, _num];
	};
if !(opticsAAF isEqualTo []) then
	{
	for "_i" from 1 to (floor random 2) do
		{
		_thingX = selectRandom opticsAAF;
		boxX addItemCargoGlobal [_thingX, 1 + (floor random 2)];
		};
	};
if (hasTFAR) then {boxX addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1]};
