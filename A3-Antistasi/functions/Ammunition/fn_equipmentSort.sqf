////////////////////////////////////
//      Uniforms Sorting        ///
////////////////////////////////////
{
private _originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
private _uniformSide = getNumber (configfile >> "CfgVehicles" >> _originUnit >> "side");
switch (_uniformSide) do
	{
	case 3: {civilianUniform pushBack _x};
	};
} forEach allUniform;

{
private _originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
private _uniformFaction = getText (configfile >> "CfgVehicles" >> _originUnit >> "faction");
switch (_uniformFaction) do
	{
	case "IND_C_F";
	//BLUFOR used because O/I Gueriilla uniforms 'scope' = 1
	case "BLU_G_F": {rebelUniform pushBack _x};
	};
} forEach allUniform;

civilianUniform deleteAt (civilianUniform find "U_C_Protagonist_VR");
rebelUniform deleteAt (rebelUniform find "U_I_G_Story_Protagonist_F");
rebelUniform deleteAt (rebelUniform find "U_I_G_resistanceLeader_F");

////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
private _itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
switch (_itemFaction) do
	{
	case "Default": {allBackpackEmpty pushBack _x};
	default {allBackpackTool pushBack _x};
	};
} forEach allBackpack;

allBackpackEmpty deleteAt (allBackpackEmpty find "B_AssaultPack_Kerry");

{
	if ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) != "") then {
		if ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) != "") then {
			allBackpackStatic pushBack _x;
		};
	};
} forEach allBackpackTool;

private _allBackpackDevice = allBackpackTool - allBackpackStatic;

{
	private _side = getNumber (configfile >> "CfgVehicles" >> _x >> "side");
	switch (_side) do {
		case 0: {invaderBackpackDevice pushBack _x};
		case 1: {occupantBackpackDevice pushBack _x};
		case 2: {rebelBackpackDevice pushBack _x};
		case 3: {civilianBackpackDevice pushBack _x};
	}
} forEach _allBackpackDevice;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
armoredVest = allVest select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};
civilianVest = allVest - armoredVest;

civilianVest deleteAt (civilianVest find "V_RebreatherB");
civilianVest deleteAt (civilianVest find "V_RebreatherIR");
civilianVest deleteAt (civilianVest find "V_RebreatherIA");

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

civilianGlasses deleteAt (civilianGlasses find "None");
civilianGlasses deleteAt (civilianGlasses find "G_Goggles_VR");
civilianGlasses deleteAt (civilianGlasses find "G_I_Diving");
civilianGlasses deleteAt (civilianGlasses find "G_O_Diving");
civilianGlasses deleteAt (civilianGlasses find "G_B_Diving");
