if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayerBlu3CBUN.sqf"};
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayer3CBCCMT.sqf"};

SDKMortar = "rhsgref_ins_g_2b14";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";
SDKMGStatic = "UK3CB_TKP_I_NSV";
staticATteamPlayer = "UK3CB_UN_I_SPG9";
staticAAteamPlayer = "UK3CB_UN_I_ZU23";

staticCrewTeamPlayer = "UK3CB_CCM_I_COM";
SDKUnarmed = "UK3CB_CHC_I_SPY";
SDKSniper = ["UK3CB_CCM_I_MK","UK3CB_CCM_I_SNI"];
SDKATman = ["UK3CB_CCM_I_AT","UK3CB_CCM_I_AT"];
SDKMedic = ["UK3CB_CCM_I_MD","UK3CB_CCM_I_MD"];
SDKMG = ["UK3CB_CCM_I_AR","UK3CB_CCM_I_AR"];
SDKExp = ["UK3CB_CCM_I_DEM","UK3CB_CCM_I_DEM"];
SDKGL = ["UK3CB_CCM_I_RIF_LITE","UK3CB_CCM_I_RIF_LITE"];
SDKMil = ["UK3CB_CCM_I_RIF_BOLT","UK3CB_CCM_I_RIF_1"];
SDKSL = ["UK3CB_CCM_I_TL","UK3CB_CCM_I_OFF"];
SDKEng = ["UK3CB_CCM_I_ENG","UK3CB_CCM_I_ENG"];

vehSDKBike = "UK3CB_CCM_I_Golf";
vehSDKLightArmed = "UK3CB_CCM_I_Datsun_Pkm";
vehSDKAT = "UK3CB_CCM_I_Hilux_Spg";
vehSDKLightUnarmed = "UK3CB_CCM_I_Datsun_Open";
vehSDKTruck = "UK3CB_CCM_I_V3S_Closed";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "UK3CB_CHC_I_Antonov_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "UK3CB_CCM_I_V3S_Repair";
SDKFlag = "Flag_CCM_B";
SDKFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_TKP_I_OFF";

supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
supportStaticsSDKB3 = "RHS_Podnos_Bipod_Bag";

civCar = "UK3CB_CHC_C_Ikarus";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_CHC_C_Mi8AMT";
civBoat = "C_Rubberboat";

arrayCivVeh = ["UK3CB_CHC_C_Datsun_Civ_Closed","UK3CB_CHC_C_Datsun_Civ_Open","UK3CB_CHC_C_Gaz24","UK3CB_CHC_C_Golf","UK3CB_CHC_C_Hatchback","UK3CB_CHC_C_Hilux_Civ_Open","UK3CB_CHC_C_Hilux_Civ_Closed","UK3CB_CHC_C_Ikarus","UK3CB_CHC_C_Kamaz_Covered","UK3CB_CHC_C_Kamaz_Fuel","UK3CB_CHC_C_Kamaz_Open","UK3CB_CHC_C_Kamaz_Repair","UK3CB_CHC_C_Lada","UK3CB_CHC_C_LR_Open","UK3CB_CHC_C_LR_Closed","UK3CB_CHC_C_S1203","UK3CB_CHC_C_S1203_Amb","UK3CB_CHC_C_Sedan","UK3CB_CHC_C_Skoda","UK3CB_CHC_C_Tractor","UK3CB_CHC_C_Tractor_Old","UK3CB_CHC_C_UAZ_Closed","UK3CB_CHC_C_UAZ_Open","UK3CB_CHC_C_Ural","UK3CB_CHC_C_Ural_Open","UK3CB_CHC_C_Ural_Fuel","UK3CB_CHC_C_Ural_Empty","UK3CB_CHC_C_Ural_Repair","UK3CB_CHC_C_V3S_Open","UK3CB_CHC_C_V3S_Closed","UK3CB_CHC_C_V3S_Recovery","UK3CB_CHC_C_V3S_Refuel","UK3CB_CHC_C_V3S_Repair"];

sniperRifle = "UK3CB_BAF_L22";
lampsSDK = ["rhs_acc_2dpZenit","acc_flashlight"];

ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";

nameTeamPlayer = "CCM";

//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["UK3CB_Enfield","rhsusf_weap_m1911a1","Binocular","rhs_weap_panzerfaust60","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_pp2000_folded","UK3CB_M79","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["UK3CB_Enfield_Mag","rhsusf_mag_7x45acp_MHP","rhsgref_1Rnd_Slug","rhs_mag_rgd5","rhs_mag_9x19mm_7n31_44","rhs_mag_m576","rhs_mag_m713_red","rhs_mag_m4009","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle"];
initialRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit","rhs_acc_m852v"];
unlockedAT = ["rhs_weap_panzerfaust60"];
unlockedBackpacks = ["UK3CB_ANA_B_B_ASS","UK3CB_TKC_C_B_Sidor_MED","UK3CB_B_Hiker","UK3CB_B_Hiker_Camo"];
//TFAR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155_coyote"]};
