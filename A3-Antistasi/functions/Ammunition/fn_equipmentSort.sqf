////////////////////////////////////
//      Uniforms Sorting        ///
////////////////////////////////////
{
	private _originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
	private _uniformSide = getNumber (configfile >> "CfgVehicles" >> _originUnit >> "side");
	switch (_uniformSide) do {
		case 3: {civilianUniform pushBack _x};
	};
} forEach allUniform;

{
	private _originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
	private _uniformFaction = getText (configfile >> "CfgVehicles" >> _originUnit >> "faction");
	switch (_uniformFaction) do {
		//RHS
		case "rhsgref_faction_nationalist": {if ((!has3CB) and nameTeamPlayer isEqualTo "NAPA") then {rebelUniform pushBack _x};};
		case "rhsgref_faction_cdf_ng_b": {if ((!has3CB) and teamPlayer isEqualTo west) then {rebelUniform pushBack _x};};
		//3CB
		//case "IND_F": {if ((has3CB) and nameTeamPlayer isEqualTo "TTF") then {rebelUniform pushBack _x};};
		//IFA
		case "LIB_GUER": {if (hasIFA) then {rebelUniform pushBack _x};};
		//Vanilla
		case "IND_C_F";
		//BLUFOR used because O/I Gueriilla uniforms 'scope' = 1
		case "BLU_G_F": {rebelUniform pushBack _x};
	};
} forEach allUniform;

civilianUniform deleteAt (civilianUniform find "U_C_Protagonist_VR");
civilianUniform deleteAt (civilianUniform find "U_LIB_CIV_Priest");
rebelUniform deleteAt (rebelUniform find "U_I_G_Story_Protagonist_F");
rebelUniform deleteAt (rebelUniform find "U_I_G_resistanceLeader_F");
rebelUniform deleteAt (rebelUniform find "UK3CB_CW_US_B_LATE_U_SF_CombatUniform_01_BLK");
rebelUniform deleteAt (rebelUniform find "UK3CB_CW_US_B_LATE_U_SF_CombatUniform_02_BLK");

////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
	private _itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	switch (_itemFaction) do {
		case "Default": {allBackpackEmpty pushBack _x};
		default {allBackpackTool pushBack _x};
	};
} forEach allBackpack;

allBackpackEmpty deleteAt (allBackpackEmpty find "B_AssaultPack_Kerry");

{
	switch (true) do {
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) != ""): {
			if !((getArray (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) isEqualTo []) then {
				allBackpackStatic pushBack _x;
			}
			else {
				allBackpackDevice pushback _x;
			};
		};
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) == ""): {
			if ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) == "") then {
				allBackpackStatic pushBack _x;
			};
		};
	};
} forEach allBackpackTool;

{
	private _faction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	private _side = getNumber (configfile >> "CfgFactionClasses" >> _faction >> "side");
	switch (_side) do {
		case 0: {invaderBackpackDevice pushBack _x};
		case 1: {occupantBackpackDevice pushBack _x};
		case 2: {rebelBackpackDevice pushBack _x};
		case 3: {civilianBackpackDevice pushBack _x};
	};
} forEach allBackpackDevice;

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
armoredHeadgear = allHeadgear select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 0};
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
civilianGlasses deleteAt (civilianGlasses find "LIB_Glasses");
