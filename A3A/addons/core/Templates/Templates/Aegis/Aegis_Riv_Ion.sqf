private _hasWs = "ws" in A3A_enabledDLC;
private _hasLawsOfWar = "orange" in A3A_enabledDLC;
private _hasApex = "expansion" in A3A_enabledDLC;
private _hasContact = "enoch" in A3A_enabledDLC;
private _hasMarksman = "mark" in A3A_enabledDLC;

////////////////////////////
//   Rivals Information   //
///////////////////////////

["name", "Ion PMC"] call _fnc_saveToTemplate;
["nameLeader", "Thomas Larkin"] call _fnc_saveToTemplate;

//////////////////////////////////////
//       	Identities    			//
//////////////////////////////////////

["voices", ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]] call _fnc_saveToTemplate;
["faces", ["AfricanHead_01","AfricanHead_02","AfricanHead_03","Barklem",
"GreekHead_A3_05","GreekHead_A3_07","Sturrock","WhiteHead_01","WhiteHead_02",
"WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07",
"WhiteHead_08","WhiteHead_09","WhiteHead_11","WhiteHead_12","WhiteHead_14",
"WhiteHead_15","WhiteHead_16","WhiteHead_18","WhiteHead_19","WhiteHead_20",
"WhiteHead_21","WhiteHead_23", "WhiteHead_24", "WhiteHead_25",
"WhiteHead_26", "WhiteHead_27", "WhiteHead_28", "WhiteHead_29", "WhiteHead_30", "WhiteHead_31", "WhiteHead_32"
]] call _fnc_saveToTemplate;

//////////////////////////
//       Vehicles       //
//////////////////////////
["ammobox", "Box_FIA_Support_F"] call _fnc_saveToTemplate; 	
["surrenderCrate", "Box_W_NATO_Wps_F"] call _fnc_saveToTemplate;

["vehiclesRivalsLightArmed", ["B_ION_Offroad_armed_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRivalsCars", ["B_ION_Offroad_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRivalsTrucks", ["B_ION_Truck_02_covered_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRivalsAPCs", ["B_ION_APC_Wheeled_01_command_lxWS", "B_ION_APC_Wheeled_02_hmg_lxWS"]] call _fnc_saveToTemplate;
["vehiclesRivalsTanks", []] call _fnc_saveToTemplate;
["vehiclesRivalsHelis", ["B_ION_Heli_Light_02_dynamicLoadout_lxWS"]] call _fnc_saveToTemplate;			
["vehiclesRivalsUavs", ["ION_UAV_01_lxWS"]] call _fnc_saveToTemplate;			

["staticLowWeapons", ["B_HMG_02_F", "B_HMG_01_F", "B_GMG_01_F"]] call _fnc_saveToTemplate;
["staticMortars", ["B_Mortar_01_F"]] call _fnc_saveToTemplate;

["mortarMagazineHE", "8Rnd_82mm_Mo_shells"] call _fnc_saveToTemplate;

["handGrenadeAmmo", ["HandGrenade", "MiniGrenade"]] call _fnc_saveToTemplate;
["mortarAmmo", ["Sh_82mm_AMOS"]] call _fnc_saveToTemplate;

["minefieldAT", ["ATMine"]] call _fnc_saveToTemplate;
["minefieldAPERS", ["APERSMine", "APERSBoundingMine"]] call _fnc_saveToTemplate;

//////////////////////////
//       Loadouts       //
//////////////////////////
private _loadoutData = call _fnc_createLoadoutData;

_loadoutData set ["rifles", [
["arifle_SCAR_L_grip_black_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_black_F", "", "acc_flashlight", "optic_r1_high_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_grip_black_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_flashlight", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_flashlight", "optic_r1_high_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_02_blk_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_r1_high_lxWS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_Black_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""]
]];
_loadoutData set ["carbines", [
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SPAR_01_blk_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_black_F", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_SCAR_L_short_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MSBS65_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_r1_high_lxWS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MXC_Black_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_loadoutData set ["enforcerRifles", [
["sgun_aa40_lxWS", "", "saber_light_lxWS", "", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_Aco", ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Slug_lxWS", "20Rnd_12Gauge_AA40_HE_lxWS"], [], ""],
["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_XMS_Shot_lxWS", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_MSBS65_UBS_black_F", "", "saber_light_lxWS", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_MSBS65_UBS_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_MSBS65_UBS_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""],
["arifle_MSBS65_UBS_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Pellets", "6Rnd_12Gauge_Slug", "6rnd_Smoke_Mag_lxWS"], ""]
]];
_loadoutData set ["tunedRifles", [
["arifle_SCAR_grip_black_F", "", "acc_pointer_IR", "optic_Arco_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "acc_pointer_IR", "optic_Hamr", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "acc_pointer_IR", "optic_LRCO_blk_F", [], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_Arco_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_SW_Black_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""],
["arifle_MX_SW_Black_F", "muzzle_mzls_H", "acc_pointer_IR", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], ""]
]];
_loadoutData set ["grenadeLaunchers", [
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ""],
["GL_XM25_F", "", "", "", ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ["5Rnd_25x40mm_HE", "5Rnd_25x40mm_HE", "5Rnd_25x40mm_airburst"], ""],
["sgun_aa40_lxWS", "", "saber_light_lxWS", "", ["20Rnd_12Gauge_AA40_HE_lxWS"], ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Smoke_lxWS"], ""],
["sgun_aa40_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["20Rnd_12Gauge_AA40_HE_lxWS"], ["20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Pellets_lxWS", "20Rnd_12Gauge_AA40_Smoke_lxWS"], ""],
["GL_M32_F", "", "saber_light_lxWS", "", ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_HEDP_Grenade_shell"], ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_HEDP_Grenade_shell", "6Rnd_Pellets_Grenade_shell", "6Rnd_Smoke_Grenade_shell", "6Rnd_UGL_FlareWhite_F"], ""],
["GL_M32_F", "", "saber_light_lxWS", "", ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_HEDP_Grenade_shell"], ["6Rnd_HE_Grenade_shell", "6Rnd_HE_Grenade_shell", "6Rnd_HEDP_Grenade_shell", "6Rnd_Pellets_Grenade_shell", "6Rnd_Smoke_Grenade_shell", "6Rnd_UGL_FlareWhite_F"], ""],
["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_XMS_GL_lxWS", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SPAR_01_GL_blk_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "", "saber_light_lxWS", "", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_SCAR_L_GL_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Tracer_Yellow"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "", "saber_light_lxWS", "", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "", "saber_light_lxWS", "optic_r1_low_lxWS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MSBS65_GL_black_F", "", "saber_light_lxWS", "optic_Aco", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Holosight_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_r1_high_lxWS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""],
["arifle_MX_GL_Black_F", "", "acc_flashlight", "optic_Aco", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], ["1Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell", "1Rnd_Pellet_Grenade_shell_lxWS", "1Rnd_HE_Grenade_shell"], ""]
]];
_loadoutData set ["machineGuns", [
["Atlas_LMG_Negev_black_F", "", "", "", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["Atlas_LMG_Negev_black_F", "", "saber_light_lxWS", "optic_Hamr", ["150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Yellow", "150Rnd_762x51_Box_Tracer_Yellow"], [], ""],
["LMG_03_F", "", "saber_light_lxWS", "", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_03_F", "", "saber_light_lxWS", "optic_Hamr", ["200Rnd_556x45_Box_F", "200Rnd_556x45_Box_F", "200Rnd_556x45_Box_Tracer_F"], [], ""],
["LMG_S77_Compact_lxWS", "", "", "", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "optic_Hamr", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
["LMG_S77_Compact_lxWS", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_lxWS", "100Rnd_762x51_S77_Red_Tracer_lxWS"], [], ""],
["LMG_Mk200_black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "saber_light_lxWS", "optic_Hamr", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"],
["LMG_Mk200_black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box_Tracer"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "", "", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "optic_Hamr", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_SPAR_02_blk_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Mag_Tracer_F"], [], "bipod_01_F_blk"],
["arifle_XMS_Base_lxWS", "", "", "", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_Hamr", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
["arifle_XMS_Base_lxWS", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_lxWS", "75Rnd_556x45_Stanag_green_lxWS"], [], ""],
["arifle_MX_SW_Black_F", "", "", "", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "saber_light_lxWS", "optic_Holosight_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "saber_light_lxWS", "optic_Hamr", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"],
["arifle_MX_SW_Black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag", "100Rnd_65x39_caseless_black_mag_tracer"], [], "bipod_01_F_blk"]
]];
_loadoutData set ["marksmanRifles", [
["arifle_MXM_Black_F", "", "saber_light_lxWS", "optic_MRCO", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "", "saber_light_lxWS", "optic_Hamr", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MXM_Black_F", "", "saber_light_lxWS", "optic_SOS", ["30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_black_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_black_F", "", "saber_light_lxWS", "optic_MRCO", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_black_F", "", "saber_light_lxWS", "optic_Hamr", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_MSBS65_Mark_black_F", "", "saber_light_lxWS", "optic_SOS", ["30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag", "30Rnd_65x39_caseless_msbs_mag_Tracer"], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "saber_light_lxWS", "optic_MRCO", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "saber_light_lxWS", "optic_Hamr", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SPAR_03_blk_F", "", "saber_light_lxWS", "optic_SOS", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "saber_light_lxWS", "optic_MRCO", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "saber_light_lxWS", "optic_Hamr", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", [], [], "bipod_01_F_blk"],
["arifle_SCAR_grip_black_F", "", "saber_light_lxWS", "optic_SOS", [], [], "bipod_01_F_blk"],
["srifle_EBR_blk_F", "", "saber_light_lxWS", "optic_MRCO", [], [], "bipod_01_F_blk"],
["srifle_EBR_blk_F", "", "saber_light_lxWS", "optic_Hamr", [], [], "bipod_01_F_blk"],
["srifle_EBR_blk_F", "", "saber_light_lxWS", "optic_LRCO_blk_F", [], [], "bipod_01_F_blk"],
["srifle_EBR_blk_F", "", "saber_light_lxWS", "optic_SOS", [], [], "bipod_01_F_blk"]
]];
_loadoutData set ["lightATLaunchers", [
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["Aegis_launch_RPG7M_F", "", "", "", ["RPG7_F"], [], ""],
["launch_MRAWS_black_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_black_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_black_rail_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_MRAWS_black_F", "", "acc_pointer_IR", "", ["MRAWS_HE_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_black_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HEAT55_F"], [], ""],
["launch_MRAWS_black_F", "", "acc_pointer_IR", "", ["MRAWS_HEAT_F", "MRAWS_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_F", "RPG32_F", "RPG32_HE_F"], [], ""]
]];
_loadoutData set ["lightHELaunchers", [
["launch_MRAWS_black_rail_F", "", "", "", ["MRAWS_HE_F"], [], ""],
["launch_MRAWS_black_F", "", "", "", ["MRAWS_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_HE_F"], [], ""],
["launch_RPG32_black_F", "", "", "", ["RPG32_HE_F"], [], ""]
]];
_loadoutData set ["AALaunchers", [
["launch_Titan_blk_F", "", "acc_pointer_IR", "", ["Titan_AA"], [], ""]
]];
_loadoutData set ["sidearms", [
["hgun_P07_blk_F", "", "acc_flashlight_pistol", "", [], [], ""],
["hgun_Mk26_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_Pistol_heavy_02_F", "", "acc_flashlight_pistol", "optic_Yorris", [], [], ""],
["hgun_ACPC2_black_F", "", "acc_flashlight_pistol", "", [], [], ""],
["hgun_G17_black_F", "", "", "", [], [], ""],
["hgun_Pistol_heavy_01_black_F", "", "acc_flashlight_pistol", "optic_MRD_black", [], [], ""]
]];
_loadoutData set ["smgs", ["SMG_03C_TR_black", "SMG_02_F", "SMG_05_F", "SMG_03C_black", "SMG_04_blk_F"]];

_loadoutData set ["ATMines", ["ATMine_Range_Mag"]];
_loadoutData set ["APMines", ["APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag"]];
_loadoutData set ["lightExplosives", ["IEDLandSmall_Remote_Mag"]];
_loadoutData set ["heavyExplosives", ["IEDLandBig_Remote_Mag"]];

_loadoutData set ["antiInfantryGrenades", ["HandGrenade", "MiniGrenade"]];
_loadoutData set ["smokeGrenades", ["SmokeShell"]];
_loadoutData set ["signalsmokeGrenades", ["SmokeShellYellow", "SmokeShellRed", "SmokeShellPurple", "SmokeShellOrange", "SmokeShellGreen", "SmokeShellBlue"]];

_loadoutData set ["facewear", [
	"G_Aviator",
	"G_Shades_Black",
	"G_Shades_Blue",
	"G_Shades_Green",
	"G_Shades_Red",
	"G_Shades_Yellowred",
	"G_Sport_Red",
	"G_Sport_Blackyellow",
	"G_Sport_BlackWhite",
	"G_Sport_Checkered",
	"G_Sport_Blackred",
	"G_Sport_Greenblack",
	"G_Combat_Goggles_blk_F",
	"G_Bandanna_aviator",
	"G_Bandanna_beast",
	"G_Bandanna_blk",
	"G_Bandanna_shades",
	"G_Bandanna_Syndikat2",
	"G_Bandanna_Skull1",
	"G_Bandanna_Skull2",	
	"G_Tactical_Yellow",
	"G_Tactical_Clear",
	"G_Tactical_Black",
	"G_Tactical_Camo",
	"G_Shemag_white"
]];

_loadoutData set ["headgear", [
    "H_Cap_blk_ION",
    "H_Cap_headphones_ion_lxws",
    "H_Cap_blk_ION_hs", 
	"lxWS_H_CapB_rvs_blk_ION",
	"H_Cap_headphones_blk_ION",
    "H_Bandanna_gry",
	"H_Headset_Tactical",
	"H_Booniehat_blk",
	"lxWS_H_Bandanna_blk_hs",
	"H_Cap_blk",
	"H_MilCap_blk",
	"H_Watchcap_blk_hs"
]];

_loadoutData set ["maps", ["ItemMap"]];
_loadoutData set ["watches", ["ItemWatch"]];
_loadoutData set ["compasses", ["ItemCompass"]];
_loadoutData set ["radios", ["ItemRadio"]];
_loadoutData set ["gpses", ["ItemGPS"]];
_loadoutData set ["NVGs", ["NVGoggles_OPFOR"]];
_loadoutData set ["binoculars", ["Binocular"]];
_loadoutData set ["Rangefinder", ["Rangefinder"]];

_loadoutData set ["uniforms", [
	"U_lxWS_ION_Casual3",
	"U_lxWS_ION_Casual5",
	"U_lxWS_ION_Casual2",
	"U_lxWS_ION_Casual4",
	"Opf_U_I_I_Uniform_01_tshirt_black_F",
	"Atlas_U_C_Uniform_01_tshirt_white_F",
	"U_B_ION_Uniform_01_poloshirt_blue_F",
	"U_B_ION_Uniform_01_poloshirt_wdl_F",
	"U_B_ION_Uniform_01_tshirt_black_F",
	"U_Jayholder",
	"U_I_L_Uniform_01_tshirt_black_F",
	"U_I_G_Story_Protagonist_F"
]];

private _helmets = [
	"Aegis_H_Helmet_FASTMT_Headset_blk_F", 
	"Aegis_H_Helmet_FASTMT_Cover_blk_F", 
	"Aegis_H_Helmet_FASTMT_blk_F", 
	"H_HelmetSpecB_light_black",
	"H_HelmetB_light_black"
];

if (_hasLawsOfWar) then {
	_helmets pushBack "H_PASGT_basic_black_F";
};

_loadoutData set ["vests", ["V_PlateCarrier1_blk", "Aegis_V_PlateCarrier2_alt_blk", "V_PlateCarrier2_blk"]];
_loadoutData set ["backpacks", ["B_AssaultPack_blk", "B_AssaultPackSpec_blk", "B_FieldPack_blk", "B_Kitbag_blk"]];
_loadoutData set ["atBackpacks", ["B_Kitbag_blk", "B_Carryall_blk"]];
_loadoutData set ["helmets", _helmets];
_loadoutData set ["crewHelmets", ["lxWS_H_HelmetCrew_I"]];

//Item *set* definitions. These are added in their entirety to unit loadouts. No randomisation is applied.
_loadoutData set ["items_medical_basic", ["BASIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the basic medical loadout for vanilla
_loadoutData set ["items_medical_standard", ["STANDARD"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the standard medical loadout for vanilla
_loadoutData set ["items_medical_medic", ["MEDIC"] call A3A_fnc_itemset_medicalSupplies]; //this line defines the medic medical loadout for vanilla
_loadoutData set ["items_miscEssentials", [] call A3A_fnc_itemset_miscEssentials];

private _slItems = ["Laserbatteries", "Laserbatteries", "Laserbatteries"];
private _eeItems = ["ToolKit", "MineDetector"];
private _mmItems = [];

if (A3A_hasACE) then {
    _slItems append ["ACE_microDAGR", "ACE_DAGR"];
    _eeItems append ["ACE_Clacker", "ACE_DefusalKit"];
    _mmItems append ["ACE_RangeCard", "ACE_ATragMX", "ACE_Kestrel4500"];
};

_loadoutData set ["items_squadleader_extras", _slItems];
_loadoutData set ["items_rifleman_extras", []];
_loadoutData set ["items_medic_extras", []];
_loadoutData set ["items_grenadier_extras", []];
_loadoutData set ["items_explosivesExpert_extras", _eeItems];
_loadoutData set ["items_engineer_extras", _eeItems];
_loadoutData set ["items_lat_extras", []];
_loadoutData set ["items_at_extras", []];
_loadoutData set ["items_aa_extras", []];
_loadoutData set ["items_machineGunner_extras", []];
_loadoutData set ["items_marksman_extras", _mmItems];
_loadoutData set ["items_sniper_extras", _mmItems];
_loadoutData set ["items_police_extras", []];
_loadoutData set ["items_crew_extras", []];
_loadoutData set ["items_unarmed_extras", []];

//////////////////////////
//    Misc Loadouts     //
//////////////////////////

private _crewLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_crewLoadoutData set ["vests", ["V_TacVest_blk"]];
_crewLoadoutData set ["helmets", ["H_Tank_black_F"]];

private _pilotLoadoutData = _loadoutData call _fnc_copyLoadoutData;
_pilotLoadoutData set ["vests", ["V_TacVest_blk"]];
_pilotLoadoutData set ["helmets", ["H_PilotHelmetHeli_I_E", "H_PilotHelmetHeli_I_E_visor_up"]];


// ##################### DO NOT TOUCH ANYTHING BELOW THIS LINE #####################


/////////////////////////////////
//    Unit Type Definitions    //
/////////////////////////////////
//These define the loadouts for different unit types.
//For example, rifleman, grenadier, squad leader, etc.
//In 95% of situations, you *should not need to edit these*.
//Almost all factions can be set up just by modifying the loadout data above.
//However, these exist in case you really do want to do a lot of custom alterations.

private _cellLeaderTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _mercenaryTemplate = {
	["helmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[selectRandom ["grenadeLaunchers", "rifles", "tunedRifles"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _enforcerTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	[["enforcerRifles", "rifles"] call _fnc_fallback] call _fnc_setPrimary;
	["primary", 4] call _fnc_addMagazines;
	["primary", 5] call _fnc_addAdditionalMuzzleMagazines;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	["items_medical_standard"] call _fnc_addItemSet;
	["items_squadLeader_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;
	["antiInfantryGrenades", 2] call _fnc_addItem;
	["smokeGrenades", 2] call _fnc_addItem;
	["signalsmokeGrenades", 1] call _fnc_addItem;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
	["gpses"] call _fnc_addGPS;
	["binoculars"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _partisanTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	if (random 1 < 0.15) then {
		["backpacks"] call _fnc_setBackpack;
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 3] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _minutemanTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

  	["carbines"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _saboteurTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["grenadeLaunchers"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;
	["primary", 10] call _fnc_addAdditionalMuzzleMagazines;

	if (random 1 < 0.15) then {
		["lightHELaunchers"] call _fnc_setLauncher;
		["launcher", 2] call _fnc_addMagazines;
	} else {
		["sidearms"] call _fnc_setHandgun;
		["handgun", 2] call _fnc_addMagazines;
	};

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
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _atTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["lightATLaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

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
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	[selectRandom ["rifles", "carbines"]] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

	["AALaunchers"] call _fnc_setLauncher;
	//TODO - Add a check if it's disposable.
	["launcher", 3] call _fnc_addMagazines;

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

private _oppressorTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;
	["backpacks"] call _fnc_setBackpack;

	["machineGuns"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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

private _sharpshooterTemplate = {
	[selectRandomWeighted["headgear", 1.5, "helmets", 0.5]] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;


	["marksmanRifles"] call _fnc_setPrimary;
	["primary", 6] call _fnc_addMagazines;

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
	["Rangefinder"] call _fnc_addBinoculars;
	["NVGs"] call _fnc_addNVGs;
};

private _crewTemplate = {
	["crewHelmets"] call _fnc_setHelmet;
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["vests"] call _fnc_setVest;
	["uniforms"] call _fnc_setUniform;

	["smgs"] call _fnc_setPrimary;
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
	[selectRandomWeighted [[], 2, "facewear", 1]] call _fnc_setFacewear;
	["uniforms"] call _fnc_setUniform;

	["items_medical_basic"] call _fnc_addItemSet;
	["items_unarmed_extras"] call _fnc_addItemSet;
	["items_miscEssentials"] call _fnc_addItemSet;

	["maps"] call _fnc_addMap;
	["watches"] call _fnc_addWatch;
	["compasses"] call _fnc_addCompass;
	["radios"] call _fnc_addRadio;
};

private _commanderTemplate = {
	[selectRandomWeighted ["helmets", 0.3, "headgear", 0.7]] call _fnc_setHelmet;
	["sidearms"] call _fnc_setHandgun;
	["handgun", 2] call _fnc_addMagazines;

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

////////////////////////////////////////////////////////////////////////////////////////
//  You shouldn't touch below this line unless you really really know what you're doing.
//  Things below here can and will break the gamemode if improperly changed.
////////////////////////////////////////////////////////////////////////////////////////

///////////////////////
//  Rivals Units     //
///////////////////////
private _prefix = "militia";
private _unitTypes = [
	["CellLeader", _cellLeaderTemplate, [], [_prefix, true]],
	["Mercenary", _mercenaryTemplate, [], [_prefix, true]],
	["Minuteman", _minutemanTemplate, [], [_prefix, true]],
	["Enforcer", _enforcerTemplate, [], [_prefix, true]],
	["Partisan", _partisanTemplate, [], [_prefix, true]],
	["Saboteur", _saboteurTemplate, [], [_prefix, true]],
	["Medic", _medicTemplate, [["medic", true]], [_prefix, true]],
	["ExplosivesExpert", _explosivesExpertTemplate, [["explosiveSpecialist", true]], [_prefix, true]],
	["SpecialistAT", _atTemplate, [], [_prefix, true]],
	["SpecialistAA", _aaTemplate, [], [_prefix, true]],
	["Oppressor", _oppressorTemplate, [], [_prefix, true]],
	["Sharpshooter", _sharpshooterTemplate, [], [_prefix, true]]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;

//////////////////////
//    Misc Units    //
//////////////////////
[_prefix, [["Crew", _crewTemplate, [], [_prefix, true]]], _crewLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Pilot", _crewTemplate, [], [_prefix, true]]], _pilotLoadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Commander", _commanderTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
[_prefix, [["Unarmed", _unarmedTemplate, [], [_prefix, true]]], _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;