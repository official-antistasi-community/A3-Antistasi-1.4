if (!isServer and hasInterface) exitWith {};

private ["_thingX","_num","_magazines"];

clearMagazineCargoGlobal boxX;
clearWeaponCargoGlobal boxX;
clearItemCargoGlobal boxX;
clearBackpackCargoGlobal boxX;


for "_i" from 0 to (1 + floor random 4) do
	{_thingX = if (random 2 < 1) then {selectRandom (weaponsNato + antitankAAF)} else {selectRandom (weaponsCSAT + antitankAAF)};
	_num = 1 + (floor random 9);
	boxX addWeaponWithAttachmentsCargoGlobal [[_thingX, "", "", "", [], [], ""], _num];
	};

for "_i" from 0 to (1 + floor random 4) do
	{_thingX = selectRandom itemsAAF;
	_num = floor random 5;
	boxX addItemCargoGlobal [_thingX, _num];
	};

for "_i" from 1 to (floor random 4) do
	{_thingX = selectRandom minesAAF;
	_num = 1 + (floor random 5);
	boxX addMagazineCargoGlobal [_thingX, _num];
	};
	
for "_i" from 1 to (floor random 4) do
	{
	_thingX = selectRandom opticsAAF;
	boxX addItemCargoGlobal [_thingX, 1 + (floor random 4)];
	};
	
for "_i" from 0 to (floor random 4) do
	{
	_ammo = smokeX + chemX + ammunitionNATO;
	_loot = selectRandom _ammo;
	_crate addMagazineCargoGlobal [_loot, 5]
	};
		
if (hasTFAR) then {boxX addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1]};
