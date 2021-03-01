////////////////////////////////////
//      Uniforms Sorting        ///
////////////////////////////////////
{
	private _originUnit = getText (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "uniformClass");
	private _uniformFaction = getText (configfile >> "CfgVehicles" >> _originUnit >> "faction");
	switch (_uniformFaction) do {
		//RHS and 3CB Rebell Uniforms are manually Added in Templates.
		//IFA
		case "LIB_GUER": {if (A3A_hasIFA) then {allRebelUniforms pushBack _x};};
		//Tanoa/ApexDLC
		case "IND_C_F": {if ((!A3A_hasIFA) and teamPlayer isEqualTo resistance) then {allRebelUniforms pushBack _x};};
		//Contact DLC Looters
		case "IND_L_F": {if ((!A3A_hasIFA) and teamPlayer isEqualTo resistance) then {allRebelUniforms pushBack _x};};
		//BLUFOR used because O/I Gueriilla uniforms 'scope' = 1 ----> Added Green Via Templates.
		case "BLU_G_F": {if ((!A3A_hasIFA) and teamPlayer isEqualTo west) then {allRebelUniforms pushBack _x};};
	};
} forEach allUniforms;
allRebelUniforms deleteAt (allRebelUniforms find "U_I_G_Story_Protagonist_F");
allRebelUniforms deleteAt (allRebelUniforms find "U_I_G_resistanceLeader_F");
allRebelUniforms deleteAt (allRebelUniforms find "UK3CB_CW_US_B_LATE_U_SF_CombatUniform_01_BLK");
allRebelUniforms deleteAt (allRebelUniforms find "UK3CB_CW_US_B_LATE_U_SF_CombatUniform_02_BLK");

////////////////////////////////////
//      Backpacks Sorting        ///
////////////////////////////////////
{
	private _itemFaction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	switch (_itemFaction) do {
		case "Default": {allBackpacksEmpty pushBack _x};
		default {allBackpacksTool pushBack _x};
	};
} forEach allBackpacks;

allBackpacksEmpty deleteAt (allBackpacksEmpty find "B_AssaultPack_Kerry");

{
	switch (true) do {
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) != ""): {
			if !((getArray (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) isEqualTo []) then {
				allBackpacksStatic pushBack _x;
			}
			else {
				allBackpacksDevice pushback _x;
			};
		};
		case ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "assembleTo")) == ""): {
			if ((getText (configfile >> "CfgVehicles" >> _x >> "assembleInfo" >> "base")) == "") then {
				allBackpacksStatic pushBack _x;
			};
		};
	};
} forEach allBackpacksTool;

{
	private _faction = getText (configfile >> "CfgVehicles" >> _x >> "faction");
	private _side = getNumber (configfile >> "CfgFactionClasses" >> _faction >> "side");
	switch (_side) do {
		case 0: {invaderBackpackDevice pushBack _x};
		case 1: {occupantBackpackDevice pushBack _x};
		case 2: {rebelBackpackDevice pushBack _x};
		case 3: {civilianBackpackDevice pushBack _x};
	};
} forEach allBackpacksDevice;

////////////////////////////////////
//   ARMORED VESTS LIST          ///
////////////////////////////////////
//WHY is there no clean list?
//allArmoredVests = allVests select {getNumber (configfile >> "CfgWeapons" >> _x >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Chest" >> "armor") > 5};
allCivilianVests = allVests - allArmoredVests;

allCivilianVests deleteAt (allCivilianVests find "V_RebreatherB");
allCivilianVests deleteAt (allCivilianVests find "V_RebreatherIR");
allCivilianVests deleteAt (allCivilianVests find "V_RebreatherIA");

//////////////////
//   Glasses   ///
//////////////////
allCivilianGlasses append allGlasses;

allCivilianGlasses deleteAt (allCivilianGlasses find "None");
allCivilianGlasses deleteAt (allCivilianGlasses find "G_Goggles_VR");
allCivilianGlasses deleteAt (allCivilianGlasses find "G_I_Diving");
allCivilianGlasses deleteAt (allCivilianGlasses find "G_O_Diving");
allCivilianGlasses deleteAt (allCivilianGlasses find "G_B_Diving");
allCivilianGlasses deleteAt (allCivilianGlasses find "LIB_Glasses");

////////////////
//   Radios   //
////////////////
If (hasTFAR) then {
private _encryptRebel = if (teamPlayer == west) then { ["tf_west_radio_code"] } else { ["tf_guer_radio_code", "tf_independent_radio_code"] };
allRadios = allRadios select {
    private _encrypt = getText (configFile >> "CfgWeapons" >> _x >> "tf_encryptionCode");
    (_encrypt in _encryptRebel);
};

private _encrypthostile = if (teamPlayer == west) then { ["tf_guer_radio_code", "tf_independent_radio_code", "tf_east_radio_code"] } else { ["tf_west_radio_code", "tf_east_radio_code"] };
private _allHostileRadio = [];
{
    private _encrypt = getText (configFile >> "CfgVehicles" >> _x >> "tf_encryptionCode");
  	if (_encrypt in _encryptRebel) then {allBackpacksRadio pushBack _x};
    if (_encrypt in _encrypthostile) then {_allHostileRadio pushBack _x};
} forEach allBackpacksEmpty;

//Removes Radios from allBackpacksEmpty
allBackpacksEmpty = allBackpacksEmpty - _allHostileRadio - allBackpacksRadio;
};
/////////////////
// UAVTerminal //
/////////////////
private _encryptRebel = if (teamPlayer == west) then { 1 } else { 2 };
allUAVTerminals = allUAVTerminals select {
    private _encrypt = getNumber  (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "side");
    (_encrypt isEqualTo "") or (_encrypt isEqualTo _encryptRebel);
};
