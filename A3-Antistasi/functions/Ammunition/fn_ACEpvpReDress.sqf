//Function is not Obsolete yet due to Modsets without Loadouts
{
_item = _x select 0;
for "_i" from 1 to (_x select 1) do
	{
	player addItemToVest _item
	};
} forEach [["ACE_HandFlare_White",3],["ACE_Flashlight_XL50",1],["ACE_CableTie",1],["ACE_MapTools",1]];
player addItemToUniform "ACE_EarPlugs";
if (hasACEMedical) then
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
		} forEach [["ACE_morphine",2],["ACE_epinephrine",2],["ACE_elasticBandage",10],["ACE_PackingBandage",15],["ACE_tourniquet",3],["ACE_splint",2]];
		}
	else
		{
		{
		_item = _x select 0;
		for "_i" from 1 to (_x select 1) do
			{
			player addItemToBackpack _item
			};
		} forEach [["ACE_morphine",5],["ACE_epinephrine",5],["ACE_adenosine",5],["ACE_bloodIV",4],["ACE_elasticBandage",20],["ACE_packingBandage",10],["ACE_tourniquet",5],["ACE_salineIV_250",2],["ACE_surgicalKit",1],["ACE_splint", 5]];
		};
	};
