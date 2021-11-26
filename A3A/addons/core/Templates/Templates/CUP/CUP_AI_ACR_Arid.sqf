//////////////////////////
//   Side Information   //
//////////////////////////

["name", "ACR"] call _fnc_saveToTemplate; 						//this line determines the faction name -- Example: ["name", "NATO"] - ENTER ONLY ONE OPTION
["spawnMarkerName", "ACR support corridor"] call _fnc_saveToTemplate; 			//this line determines the name tag for the "carrier" on the map -- Example: ["spawnMarkerName", "NATO support corridor"] - ENTER ONLY ONE OPTION

["flag", "Flag_NATO_F"] call _fnc_saveToTemplate; 						//this line determines the flag -- Example: ["flag", "Flag_NATO_F"] - ENTER ONLY ONE OPTION
["flagTexture", "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa"] call _fnc_saveToTemplate; 				//this line determines the flag texture -- Example: ["flagTexture", "\A3\Data_F\Flags\Flag_NATO_CO.paa"] - ENTER ONLY ONE OPTION
["flagMarkerType", "flag_CzechRepublic"] call _fnc_saveToTemplate; 			//this line determines the flag marker type -- Example: ["flagMarkerType", "flag_NATO"] - ENTER ONLY ONE OPTION

//////////////////////////
//       Vehicles       //
//////////////////////////

["vehiclesBasic",["B_Quadbike_01_F"]] call _fnc_saveToTemplate;
["vehiclesLightUnarmed",["CUP_B_UAZ_Open_ACR","CUP_B_UAZ_Unarmed_ACR","CUP_B_LR_Transport_CZ_D"]] call _fnc_saveToTemplate;
["vehiclesLightArmed",["CUP_B_Dingo_GL_CZ_Des","CUP_B_Dingo_CZ_Des","CUP_B_HMMWV_AGS_GPK_ACR","CUP_B_HMMWV_DSHKM_GPK_ACR","CUP_B_HMMWV_M2_GPK_ACR","CUP_B_LR_Special_Des_CZ_D","CUP_B_UAZ_SPG9_ACR","CUP_B_UAZ_METIS_ACR","CUP_B_UAZ_MG_ACR","CUP_B_UAZ_AGS30_ACR"]] call _fnc_saveToTemplate;

["vehiclesTrucks",["CUP_B_T810_Unarmed_CZ_DES","CUP_B_T810_Armed_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesCargoTrucks",["CUP_B_T810_Unarmed_CZ_DES","B_Truck_01_flatbed_F"]] call _fnc_saveToTemplate;

["vehiclesAmmoTrucks",["CUP_B_T810_Reammo_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesRepairTrucks",["CUP_B_T810_Repair_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesFuelTrucks",["CUP_B_T810_Refuel_CZ_DES"]] call _fnc_saveToTemplate;
["vehiclesMedical",["CUP_B_LR_Ambulance_CZ_D","CUP_B_BMP2_AMB_CZ_Des"]] call _fnc_saveToTemplate;

["vehiclesAPCs",["CUP_B_BRDM2_CZ_Des","CUP_B_BRDM2_HQ_CZ_Des","CUP_B_BMP2_CZ_Des"]] call _fnc_saveToTemplate;
["vehiclesTanks",["CUP_B_T72_CZ"]] call _fnc_saveToTemplate;
["vehiclesAA",["CUP_B_nM1097_AVENGER_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesLightAPCs",[]] call _fnc_saveToTemplate;
["vehiclesIFVs",[]] call _fnc_saveToTemplate;

["vehiclesTransportBoats",["B_Boat_Transport_01_F"]] call _fnc_saveToTemplate;
["vehiclesGunBoats",["CUP_B_RHIB2Turret_USMC"]] call _fnc_saveToTemplate;
["vehiclesAmphibious",[]] call _fnc_saveToTemplate;

["vehiclesPlanesCAS",["CUP_B_L39_CZ"]] call _fnc_saveToTemplate;
["vehiclesPlanesAA",["CUP_B_L39_CZ"]] call _fnc_saveToTemplate;
["vehiclesPlanesTransport",[]] call _fnc_saveToTemplate;

["vehiclesHelisLight",["CUP_B_Mi171Sh_Unarmed_ACR"]] call _fnc_saveToTemplate;
["vehiclesHelisTransport",["CUP_B_Mi171Sh_Unarmed_ACR"]] call _fnc_saveToTemplate;
["vehiclesHelisAttack",["CUP_B_Mi35_Dynamic_CZ","CUP_B_Mi35_Dynamic_CZ_Dark","CUP_B_Mi35_Dynamic_CZ_Ram","CUP_B_Mi35_Dynamic_CZ_Tiger"]] call _fnc_saveToTemplate;

["vehiclesArtillery",["CUP_B_RM70_CZ"]] call _fnc_saveToTemplate;
["magazines", createHashMapFromArray [["CUP_B_RM70_CZ",["CUP_40Rnd_GRAD_HE"]]]] call _fnc_saveToTemplate;

["uavsAttack",[]] call _fnc_saveToTemplate;
["uavsPortable",[]] call _fnc_saveToTemplate;

["vehiclesMilitiaLightArmed",["CUP_B_nM1025_M2_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesMilitiaTrucks",["CUP_B_MTVR_USA"]] call _fnc_saveToTemplate;
["vehiclesMilitiaCars",["CUP_B_nM1025_Unarmed_USA_DES"]] call _fnc_saveToTemplate;
["vehiclesPolice",["B_GEN_Offroad_01_gen_F"]] call _fnc_saveToTemplate;

["staticMGs",["CUP_B_DSHKM_ACR"]] call _fnc_saveToTemplate;
["staticAT",["CUP_B_TOW2_TriPod_US"]] call _fnc_saveToTemplate;
["staticAA",["CUP_B_RBS70_ACR"]] call _fnc_saveToTemplate;

["staticMortars",["CUP_B_2b14_82mm_ACR"]] call _fnc_saveToTemplate;
["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate; 			//this line determines available HE-shells for the static mortars - !needs to be compatible with the mortar! -- Example: ["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] - ENTER ONLY ONE OPTION
["mortarMagazineSmoke", "8Rnd_82mm_Mo_Smoke_white"] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;
_loadoutData set ["rifles", []];
_loadoutData set ["carbines", []];
_loadoutData set ["grenadeLaunchers", []];
_loadoutData set ["SMGs", []];
_loadoutData set ["machineGuns", []];
_loadoutData set ["marksmanRifles", []];
_loadoutData set ["sniperRifles", []];

_loadoutData set ["lightATLaunchers", [
	["CUP_launch_RPG7V", "", "", "cup_optic_pgo7v3", ["CUP_OG7_M", "CUP_PG7V_M"], [], ""],
	["CUP_launch_RPG7V", "", "", "cup_optic_pgo7v3", ["CUP_OG7_M", "CUP_PG7VL_M"], [], ""],
	["CUP_launch_RPG7V", "", "", "cup_optic_pgo7v3", ["CUP_OG7_M", "CUP_PG7VM_M"], [], ""],
	["CUP_launch_RPG7V", "", "", "cup_optic_pgo7v3", ["CUP_OG7_M", "RPG7_F"], [], ""],
	["CUP_launch_RPG7V", "", "", "cup_optic_pgo7v3", ["CUP_OG7_M", "CUP_PG7VR_M"], [], ""],
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
	["CUP_launch_MAAWS", "", "", "CUP_optic_MAAWS_Scope", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""]
]];
_loadoutData set ["ATLaunchers", []];
_loadoutData set ["missileATLaunchers", [
["CUP_launch_Javelin", "", "", "", ["CUP_Javelin_M", "CUP_Javelin_M"], [], ""]
]];
_loadoutData set ["AALaunchers", [
	["CUP_launch_9K32Strela","","","",["CUP_Strela_2_M"],[],""],
	["CUP_launch_FIM92Stinger_Loaded","","","",["CUP_Stinger_M"],[],""]
]];
_loadoutData set ["sidearms", []];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["DemoCharge_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["SatchelCharge_Remote_Mag"]];

_loadoutData set ["antiTankGrenades", []];
_loadoutData set ["antiInfantryGrenades", ["CUP_HandGrenade_RGO"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];


//Basic equipment. Shouldn't need touching most of the time.
//Mods might override this, or certain mods might want items removed (No GPSs in WW2, for example)
_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_INDEP"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["rangefinders", ["Rangefinder"]];

_loadoutData set ["uniforms", []];
_loadoutData set ["vests", []];
_loadoutData set ["backpacks", []];
_loadoutData set ["longRangeRadios", []];
_loadoutData set ["helmets", []];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies];
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

//Unit type specific item sets. Add or remove these, depending on the unit types in use.
_loadoutData set ["items_squadleader_extras", ["ACE_microDAGR", "ACE_DAGR", "Laserbatteries", "Laserbatteries", "Laserbatteries"]];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", ["ToolKit", "MineDetector", "ACE_Clacker", "ACE_DefusalKit"]];
_loadoutData set ["items_engineer_extras", ["ToolKit", "MineDetector"]];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData set ["items_sniper_extras", ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"]];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//TODO - ACE overrides for misc essentials, medical and engineer gear

///////////////////////////////////////
//    Special Forces Loadout Data    //
///////////////////////////////////////

private _sfLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_sfLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_NoKneepads","CUP_U_B_CZ_DST_Kneepads","CUP_U_B_CZ_DST_Kneepads_Gloves","CUP_U_B_CZ_DST_Kneepads_Sleeve","CUP_U_B_CZ_DST_TShirt","CUP_U_CRYE_ATACSAU_Full","CUP_U_CRYE_ATACSAU_Roll"]];
_sfLoadoutData set ["vests", ["CUP_V_CZ_NPP2006_co_des", "CUP_V_CZ_NPP2006_nk_des", "CUP_V_CZ_vest19","CUP_V_CZ_vest16"]];
_sfLoadoutData set ["backpacks", ["CUP_B_ACRPara_m95", "B_AssaultPack_cbr", "B_Kitbag_cbr"]];
_sfLoadoutData set ["helmets", ["CUP_H_CZ_Helmet07","CUP_H_CZ_Helmet08", "CUP_H_OpsCore_Black","CUP_H_OpsCore_Spray","CUP_H_OpsCore_Tan"]];
_sfLoadoutData set ["binoculars", ["CUP_LRTV"]];
//["Weapon", "Muzzle", "Rail", "Sight", [], [], "Bipod"];

_sfLoadoutData set ["rifles", [
	["CUP_arifle_CZ805_A1","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","CUP_muzzle_snds_M16","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","CUP_muzzle_snds_M16","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","CUP_muzzle_snds_M16","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","CUP_muzzle_snds_M16","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_M4A3_black","CUP_muzzle_snds_M16","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","CUP_muzzle_snds_M16","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","CUP_muzzle_snds_M16","","CUP_optic_ACOGcup_optic_aimpoint_50002",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""]
]];
_sfLoadoutData set ["carbines", [
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_762_8","CUP_muzzle_snds_SCAR_H","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_8","CUP_muzzle_snds_M16","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Emag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_762_8","CUP_muzzle_snds_SCAR_H","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_arifle_Sa58_Carbine_RIS_VFG","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58_Carbine_RIS_VFG","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""]
	["CUP_arifle_Sa58s_rearris","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58s_rearris","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""]
]];
_sfLoadoutData set ["grenadeLaunchers", [
	["CUP_arifle_CZ805_GL","CUP_muzzle_snds_M16","","CUP_optic_CompM4",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","CUP_muzzle_snds_SCAR_H","","CUP_optic_CompM4",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","CUP_muzzle_snds_M16","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","CUP_muzzle_snds_M16","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","CUP_muzzle_snds_SCAR_H","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","CUP_muzzle_snds_M16","","CUP_optic_Eotech553_Black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","CUP_muzzle_snds_SCAR_H","","CUP_optic_Eotech553_Black",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","CUP_muzzle_snds_M16","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","CUP_muzzle_snds_M16","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","CUP_muzzle_snds_M16","","cup_optic_acog2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","CUP_muzzle_snds_SCAR_H","","cup_optic_acog2",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","CUP_muzzle_snds_M16","","cup_optic_acog2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","CUP_muzzle_snds_M16","","cup_optic_acog2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_CompM4",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_Eotech553_Black",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","CUP_muzzle_snds_KZRZP_AK762","","cup_optic_acog2",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""]
	["CUP_arifle_M4A1_BUIS_GL","CUP_muzzle_snds_M16","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","CUP_muzzle_snds_M16","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","CUP_muzzle_snds_M16","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","CUP_muzzle_snds_M16","","cup_optic_acog2",["CUP_30Rnd_556x45_Emag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""]
]];
_sfLoadoutData set ["SMGs", [
	["CUP_smg_EVO","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_9x19_EVO"],[],""],
	["CUP_smg_EVO","","","CUP_optic_AIMM_COMPM4_BLK",["CUP_30Rnd_9x19_EVO"],[],""],
	["CUP_smg_EVO","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_9x19_EVO"],[],""]
]];
_sfLoadoutData set ["machineGuns", [
	["CUP_lmg_m249_pip4","","","CUP_optic_Aimpoint_5000",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_m249_pip4","","","CUP_optic_ElcanM145",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_m249_pip4","","","CUP_optic_ACOG2",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_Aimpoint_5000",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_ElcanM145",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_ACOG2",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""]
]];
_sfLoadoutData set ["marksmanRifles", [
	["CUP_arifle_HK417_20","","","CUP_optic_LeupoldMk4",["CUP_20Rnd_762x51_HK417_Camo_Desert"],[],""],
	["CUP_arifle_HK417_20","","","CUP_optic_LeupoldM3LR",["CUP_20Rnd_762x51_HK417_Camo_Desert"],[],""],
	["CUP_srifle_SVD","cup_muzzle_snds_kzrzp_svd","","cup_optic_pso_3",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_sfLoadoutData set ["sniperRifles", [
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4_20x40_LRT",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"],
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4_25x50_LRT",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"],
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"]
]];
_sfLoadoutData set ["sidearms", [
	["CUP_hgun_CZ75","","","",["CUP_16Rnd_9x19_cz75"],[],""],
	["CUP_hgun_Compact","","","",["CUP_10Rnd_9x19_Compact"],[],""],
	["CUP_hgun_Duty","","","",["16Rnd_9x21_Mag"],[],""],
	["CUP_hgun_Phantom","","","",["CUP_18Rnd_9x19_Phantom"],[],""],
	["CUP_hgun_Glock17","","","",["CUP_17Rnd_9x19_glock17"],[],""]
]];
/////////////////////////////////
//    Military Loadout Data    //
/////////////////////////////////

private _militaryLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militaryLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_NoKneepads", "CUP_U_B_CZ_DST_Kneepads","CUP_U_B_CZ_DST_Kneepads_Sleeve"]];
_militaryLoadoutData set ["vests", ["CUP_V_CZ_vest01", "CUP_V_CZ_vest18", "CUP_V_CZ_vest06", "CUP_V_CZ_vest12", "CUP_V_CZ_vest10", "CUP_V_CZ_vest04", "CUP_V_CZ_vest08","CUP_V_CZ_NPP2006_nk_des","CUP_V_CZ_NPP2006_co_des"]];
_militaryLoadoutData set ["backpacks", ["B_Carryall_cbr", "B_FieldPack_cbr", "B_TacticalPack_blk"]];
_militaryLoadoutData set ["helmets", ["CUP_H_CZ_Helmet01","CUP_H_CZ_Helmet02","CUP_H_CZ_Helmet07","CUP_H_CZ_Helmet08"]];
_militaryLoadoutData set ["binoculars", ["CUP_LRTV"]];

_militaryLoadoutData set ["rifles", [
	["CUP_arifle_CZ805_A1","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","","","CUP_optic_ACOG2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","","","cup_optic_eotech553_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","","","cup_optic_aimpoint_5000",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_arifle_CZ805_A1","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_CZ805_A2","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_CZ_BREN2_762_14","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_11","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_14","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_556_8","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_arifle_Sa58P_rearris","","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","","","cup_optic_eotech553_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","","","cup_optic_aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_rearris","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58P_RIS1","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58V_rearris","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58RIS1","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_M4A3_black","","","CUP_optic_ACOG2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","","","cup_optic_eotech553_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","","","CUP_optic_ACOGcup_optic_aimpoint_50002",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""],
	["CUP_arifle_M4A3_black","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],[],""]
]];
_militaryLoadoutData set ["carbines", [
	["CUP_CZ_BREN2_556_8","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_762_8","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_CZ_BREN2_556_8","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],[],""],
	["CUP_CZ_BREN2_762_8","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_TE1_Red_Tracer_762x39_CZ807"],[],""],
	["CUP_arifle_Sa58_Carbine_RIS_VFG","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58_Carbine_RIS_VFG","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""]
	["CUP_arifle_Sa58s_rearris","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
	["CUP_arifle_Sa58s_rearris","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_Sa58_M_TracerR"],[],""]
]];
_militaryLoadoutData set ["grenadeLaunchers", [
	["CUP_arifle_CZ805_GL","","","CUP_optic_CompM4",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","","","CUP_optic_CompM4",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_CZ805_GL","","","cup_optic_acog2",["CUP_30Rnd_TE1_Red_Tracer_556x45_CZ805"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_762_14_GL","","","cup_optic_acog2",["CUP_30Rnd_762x39_CZ807"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_11_GL","","","cup_optic_acog2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_CZ_BREN2_556_14_GL","","","cup_optic_acog2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","","","CUP_optic_CompM4",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_Sa58RIS2_gl","","","cup_optic_acog2",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""]
	["CUP_arifle_M4A1_BUIS_GL","","","CUP_optic_CompM4",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","","","cup_optic_elcan_specterdr_black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""],
	["CUP_arifle_M4A1_BUIS_GL","","","cup_optic_acog2",["CUP_30Rnd_556x45_Stanag_Tracer_Red"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""]

]];
_militaryLoadoutData set ["SMGs", [
	["CUP_smg_EVO","","","CUP_optic_Aimpoint_5000",["CUP_30Rnd_9x19_EVO"],[],""],
	["CUP_smg_EVO","","","CUP_optic_AIMM_COMPM4_BLK",["CUP_30Rnd_9x19_EVO"],[],""],
	["CUP_smg_EVO","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_9x19_EVO"],[],""]
]];
_militaryLoadoutData set ["machineGuns", [
	["CUP_lmg_m249_pip4","","","CUP_optic_Aimpoint_5000",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_m249_pip4","","","CUP_optic_ElcanM145",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_m249_pip4","","","CUP_optic_ACOG2",["CUP_200Rnd_TE4_Red_Tracer_556x45_M249"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_Aimpoint_5000",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_ElcanM145",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""],
	["CUP_lmg_M60E4","","","CUP_optic_ACOG2",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""]
]];
_militaryLoadoutData set ["marksmanRifles", [
	["CUP_arifle_HK417_20","","","CUP_optic_LeupoldMk4",["CUP_20Rnd_762x51_HK417_Camo_Desert"],[],""],
	["CUP_arifle_HK417_20","","","CUP_optic_LeupoldM3LR",["CUP_20Rnd_762x51_HK417_Camo_Desert"],[],""],
	["CUP_srifle_SVD","cup_muzzle_snds_kzrzp_svd","","cup_optic_pso_3",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_militaryLoadoutData set ["sniperRifles", [
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4_20x40_LRT",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"],
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4_25x50_LRT",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"],
	["CUP_srifle_CZ750","","","CUP_optic_LeupoldMk4",["CUP_10Rnd_762x51_CZ750_Tracer"],[],"bipod_01_F_blk"]
]];
_militaryLoadoutData set ["sidearms", [
	["CUP_hgun_CZ75","","","",["CUP_16Rnd_9x19_cz75"],[],""],
	["CUP_hgun_Compact","","","",["CUP_10Rnd_9x19_Compact"],[],""],
	["CUP_hgun_Duty","","","",["16Rnd_9x21_Mag"],[],""],
	["CUP_hgun_Phantom","","","",["CUP_18Rnd_9x19_Phantom"],[],""],
	["CUP_hgun_Glock17","","","",["CUP_17Rnd_9x19_glock17"],[],""]
]];

///////////////////////////////
//    Police Loadout Data    //
///////////////////////////////

private _policeLoadoutData = _loadoutData call _fnc_copyLoadoutData;

_policeLoadoutData set ["uniforms", ["U_B_GEN_Soldier_F", "U_B_GEN_Commander_F"]];
_policeLoadoutData set ["vests", ["V_TacVest_blk_POLICE"]];
_policeLoadoutData set ["helmets", ["H_Cap_police"]];

_policeLoadoutData set ["SMGs", [
["CUP_smg_M3A1_blk","","","",["CUP_30Rnd_45ACP_M3A1_BLK_M"],[],""],
	["CUP_smg_MP5A5","","","CUP_optic_CompM2_low",["CUP_30Rnd_Red_Tracer_9x19_MP5"],[],""],
	["CUP_smg_MP5A5","","","CUP_optic_Eotech553_Coyote",["CUP_30Rnd_Red_Tracer_9x19_MP5"],[],""]
]];
_policeLoadoutData set ["sidearms", [
	["CUP_hgun_Colt1911","","","",["CUP_7Rnd_45ACP_1911"],[],""]
]];

////////////////////////////////
//    Militia Loadout Data    //
////////////////////////////////

private _militiaLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_militiaLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_TShirt"]];
_militiaLoadoutData set ["vests", ["CUP_V_CZ_vest02"]];
_militiaLoadoutData set ["backpacks", ["B_Carryall_cbr", "B_FieldPack_cbr", "B_TacticalPack_blk"]];
_militiaLoadoutData set ["helmets", ["CUP_H_CZ_Helmet01","CUP_H_CZ_Helmet02","CUP_H_CZ_Helmet07","CUP_H_CZ_Helmet08"]];

_militiaLoadoutData set ["rifles", [
	["CUP_arifle_Sa58P_rearris","CUP_muzzle_snds_KZRZP_AK762","","CUP_optic_ACOG2",["CUP_30Rnd_Sa58_M_TracerR"],[],""]
]];
_militiaLoadoutData set ["carbines", [
	["CUP_arifle_Sa58s_rearris","","","cup_optic_aimm_compm4_blk",["CUP_30Rnd_Sa58_M_TracerR"],[],""],
]];
_militiaLoadoutData set ["grenadeLaunchers", [
	["CUP_arifle_Sa58RIS2_gl","","","cup_optic_acog2",["CUP_30Rnd_Sa58_M_TracerR"],["1Rnd_HE_Grenade_shell", "CUP_1Rnd_HEDP_M203", "1Rnd_Smoke_Grenade_shell"],""]
]];
_militiaLoadoutData set ["SMGs", [
	["CUP_smg_EVO","","","CUP_optic_Eotech553_Black",["CUP_30Rnd_9x19_EVO"],[],""]
]];
_militiaLoadoutData set ["machineGuns", [
	["CUP_lmg_M60E4","","","",["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"],[],""]
]];
_militiaLoadoutData set ["marksmanRifles", [
	["CUP_srifle_SVD","cup_muzzle_snds_kzrzp_svd","","cup_optic_pso_3",["CUP_10Rnd_762x54_SVD_M"],[],""]
]];
_militiaLoadoutData set ["sidearms", [
	["CUP_hgun_CZ75","","","",["CUP_16Rnd_9x19_cz75"],[],""]
]];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["uniforms", ["CUP_U_B_CZ_DST_TShirt"]];
_crewLoadoutData set ["vests", ["CUP_V_CZ_vest19"]];
_crewLoadoutData set ["helmets", ["CUP_H_CZ_Helmet05"]];

private _pilotLoadoutData = _militaryLoadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["uniforms", ["CUP_U_B_CZ_Pilot_WDL"]];
_pilotLoadoutData set ["vests", ["CUP_V_CZ_vest20"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_B"]];


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _squadLeaderTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["grenadeLaunchers", "rifles"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	["primary", 4] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _riflemanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_rifleman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _medicTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;
  [selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_medic"] call _fnc_addItemSet;
	["items_medic_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _grenadierTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_grenadier_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 4] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _explosivesExpertTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;


	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_explosivesExpert_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["lightExplosives", 2] call _fnc_addItem;
	if (random 1 > 0.5) then {["heavyExplosives", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["atMines", 1] call _fnc_addItem;};
	if (random 1 > 0.5) then {["apMines", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _engineerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_engineer_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	if (random 1 > 0.5) then {["lightExplosives", 1] call _fnc_addItem;};

	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _latTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	[["lightATLaunchers", "ATLaunchers"] call _fnc_fallback] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 1] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_lat_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _atTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	[selectRandom ["ATLaunchers", "missileATLaunchers"]] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 2] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_at_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _aaTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 2] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_aa_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _machineGunnerTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_machineGunner_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["NVGs"] call _fnc_addNVGs;
};

private _marksmanTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 5] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_marksman_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["rangefinders"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _sniperTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["sniperRifles"] call _fnc_setPrimary;
	["primary", 7] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_sniper_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 1] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["rangefinders"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _policeTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["SMGs"] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_police_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _crewTemplate = {
	["helmets"] call _fnc_setHelmet;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["carbines", "SMGs"]] call _fnc_setPrimary;
	["primary", 3] call _fnc_addMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_crew_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["smokeGrenades", 2] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["NVGs"] call _fnc_addNVGs;
};

private _unarmedTemplate = {
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _traitorTemplate = {
	call _unarmedTemplate;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;
};

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////
//  Special Forces Units   //
/////////////////////////////
private _prefix = "SF";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _sfLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

/*{
	params ["_name", "_loadoutTemplate"];
	private _loadouts = [_sfLoadoutData, _loadoutTemplate] call _fnc_buildLoadouts;
	private _finalName = _prefix + _name;
	[_finalName, _loadouts] call _fnc_saveToTemplate;
} forEach _unitTypes;
*/

///////////////////////
//  Military Units   //
///////////////////////
private _prefix = "military";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Police Units    //
////////////////////////
private _prefix = "police";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Standard", _policeTemplate]
];

[_prefix, _unitTypes, _policeLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

////////////////////////
//    Militia Units    //
////////////////////////
private _prefix = "militia";
private _unitTypes = [
	["SquadLeader", _squadLeaderTemplate],
	["Rifleman", _riflemanTemplate],
	["Medic", _medicTemplate, [["medic", true]]],
	["Engineer", _engineerTemplate, [["engineer", true]]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]]],
	["Grenadier", _grenadierTemplate],
	["LAT", _latTemplate],
	["AT", _atTemplate],
	["AA", _aaTemplate],
	["MachineGunner", _machineGunnerTemplate],
	["Marksman", _marksmanTemplate],
	["Sniper", _sniperTemplate]
];

[_prefix, _unitTypes, _militiaLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////

//The following lines are determining the loadout of vehicle crew
["other", [["Crew", _crewTemplate]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout of the pilots
["other", [["Pilot", _crewTemplate]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the unit used in the "kill the official" mission
["other", [["Official", _policeTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "kill the traitor" mission
["other", [["Traitor", _traitorTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
//The following lines are determining the loadout for the AI used in the "Invader Punishment" mission
["other", [["Unarmed", _UnarmedTemplate]], _militaryLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
