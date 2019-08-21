if (!isServer and hasInterface) exitWith {};

private ["_thingX","_num","_magazines"];

clearMagazineCargoGlobal boxX;
clearWeaponCargoGlobal boxX;
clearItemCargoGlobal boxX;
clearBackpackCargoGlobal boxX;


for "_i" from 0 to (1 + floor random 4) do
	{
	_thingX = selectRandom (weaponsNato + antitankAAF);
	_num = 1 + (floor random 9);
	boxX addWeaponWithAttachmentsCargoGlobal [[_thingX, "", "", "", [], [], ""], _num];
	};

for "_i" from 0 to (1 + floor random 4) do
	{
	_thingX = selectRandom itemsAAF;
	_num = 1 + (1 + floor random 4);
	boxX addItemCargoGlobal [_thingX, _num];
	};

for "_i" from 0 to (1 + floor random 4) do
	{
	_thingX = selectRandom minesAAF;
	_num = 1 + (floor random 4);
	boxX addMagazineCargoGlobal [_thingX, _num];
	};
	
for "_i" from 0 to (1 + floor random 4) do
	{
	_thingX = selectRandom opticsAAF;
	boxX addItemCargoGlobal [_thingX, 1 + (floor random 4)];
	};
	
for "_i" from 0 to (1 + floor random 4) do
	{
	_ammo = smokeX + chemX + ammunitionNATO;
	_loot = selectRandom _ammo;
	boxX addMagazineCargoGlobal [_loot, 5]
	};
		
if (hasTFAR) then {boxX addBackpackCargoGlobal ["tf_rt1523g_big_bwmod",1]};
