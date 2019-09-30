////////////////////////////////////
//      Uniforms Sorting        ///
////////////////////////////////////
{
_originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
_uniformSide = getNumber (configfile >> "CfgVehicles" >> _originUnit >> "side");
switch (_uniformSide) do
	{
	case 3: {civilianUniform pushBack _x};
	};
} forEach allUniform;

{
_originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
_uniformFaction = getText (configfile >> "CfgVehicles" >> _originUnit >> "faction");
switch (_uniformFaction) do
	{
	case "IND_C_F": {rebelUniform pushBack _x};
	//BLUFOR used because O/I Gueriilla uniforms 'scope' = 1
	case "BLU_G_F": {rebelUniform pushBack _x};
	};
} forEach allUniform;

////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
_itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
switch (_itemFaction) do
	{
	case "Default": {allBackpackEmpty pushBack _x};
	default {allBackpackTool pushBack _x};
	};
} forEach allBackpack;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
armoredVest = allVest select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};
civilianVest = allVest - armoredVest;

////////////////////////////////////
//   ARMORED HELMETS LIST        ///
////////////////////////////////////
//WHY is there no clean list?
armoredHeadgear = allHeadgear select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2};
civilianHeadgear = allHeadgear - armoredHeadgear;

//////////////////
//   Glasses   ///
//////////////////
civilianGlasses append allGlasses;
