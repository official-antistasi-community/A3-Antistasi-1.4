if (!isServer and hasInterface) exitWith {};

private ["_cosa","_num","_magazines"];

clearMagazineCargoGlobal caja;
clearWeaponCargoGlobal caja;
clearItemCargoGlobal caja;
clearBackpackCargoGlobal caja;


for "_i" from 0 to (1+ round random 4) do
	{_cosa = if (random 2 < 1) then {selectRandom (armasNATO + antitanqueAAF)} else {selectRandom (armasCSAT + antitanqueAAF)};
	_num = 1+ (floor random 4);
	caja addWeaponCargoGlobal [_cosa, _num];
	_magazines = getArray (configFile / "CfgWeapons" / _cosa / "magazines");
	caja addMagazineCargoGlobal [_magazines select 0, _num * 3];
	};

for "_i" from 0 to (1 + round random 5) do
	{_cosa = selectRandom itemsAAF;
	_num = floor random 5;
	caja addItemCargoGlobal [_cosa, _num];
	};

for "_i" from 1 to (floor random 3) do
	{_cosa = selectRandom minasAAF;
	_num = 1 + (floor random 5);
	caja addMagazineCargoGlobal [_cosa, _num];
	};
if !(opticasAAF isEqualTo []) then
	{
	for "_i" from 1 to (floor random 2) do
		{
		_cosa = selectRandom opticasAAF;
		caja addItemCargoGlobal [_cosa, 1 + (floor random 2)];
		};
	};
if (hayTFAR) then {caja addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1]};
