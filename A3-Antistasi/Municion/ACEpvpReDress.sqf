{
_item = _x select 0;
for "_i" from 1 to (_x select 1) do
	{
	player addItemToVest _item
	};
} forEach [["ACE_HandFlare_White",2],["ACE_Chemlight_HiWhite",2],["ACE_Flashlight_MX991",1],["ACE_CableTie",1],["ACE_MapTools",1]];
player addItemToUniform "ACE_EarPlugs";
if (hayACEMedical) then
	{
	player removeItems "FirstAidKit";
	player removeItem "Medikit";
	if !([player] call A3A_fnc_isMedic) then
		{
		{
		_item = _x select 0;
		for "_i" from 1 to (_x select 1) do
			{
			player addItemToUniform _item
			};
		} forEach [["ACE_fieldDressing",7],["ACE_morphine",2],["ACE_epinephrine",2]];
		if (ace_medical_level == 2) then
			{
			{
			_item = _x select 0;
			for "_i" from 1 to (_x select 1) do
				{
				player addItemToUniform _item
				};
			} forEach [["ACE_elasticBandage",7],["ACE_tourniquet",5]];
			};
		}
	else
		{
		{
		_item = _x select 0;
		for "_i" from 1 to (_x select 1) do
			{
			player addItemToBackpack _item
			};
		} forEach [["ACE_morphine",15],["ACE_epinephrine",9],["ACE_bloodIV",8],["ACE_fieldDressing",30]];
		if (ace_medical_level == 2) then
			{
			{
			_item = _x select 0;
			for "_i" from 1 to (_x select 1) do
				{
				player addItemToBackpack _item
				};
			} forEach [["ACE_elasticBandage",20],["ACE_packingBandage",10],["ACE_epinephrine",5],["ACE_morphine",5],["ACE_adenosine",5],["ACE_tourniquet",10],["ACE_salineIV_250",2],["ACE_surgicalKit",1],["ACE_personalAidKit",2]];
			};
		};
	};
if ((player getUnitTrait "explosiveSpecialist") or (player getUnitTrait "engineer")) then
	{
	{
	_item = _x select 0;
	for "_i" from 1 to (_x select 1) do
		{
		player addItemToVest _item
		};
	} forEach [["ACE_Clacker",1],["ACE_M26_Clacker",1],["ACE_DefusalKit",1]];
	};