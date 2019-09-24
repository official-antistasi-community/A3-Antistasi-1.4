//3CB Blufor ALtis Template Call
if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayerBlu3CBUN.sqf"};
//Tanoa Template Call
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayer3CBCCMT.sqf"};
////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "CCM";
SDKFlag = "Flag_CCM_B";
SDKFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_TKP_I_OFF";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
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

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
groupsSDKmid = [SDKSL,SDKGL,SDKMG,SDKMil];
groupsSDKAT = [SDKSL,SDKMG,SDKATman,SDKATman,SDKATman];
groupsSDKSquad = [SDKSL,SDKGL,SDKMil,SDKMG,SDKMil,SDKATman,SDKMil,SDKMedic];
groupsSDKSquadEng = [SDKSL,SDKGL,SDKMil,SDKMG,SDKExp,SDKATman,SDKEng,SDKMedic];
groupsSDKSquadSupp = [SDKSL,SDKGL,SDKMil,SDKMG,SDKATman,SDKMedic,[staticCrewTeamPlayer,staticCrewTeamPlayer],[staticCrewTeamPlayer,staticCrewTeamPlayer]];
groupsSDKSniper = [SDKSniper,SDKSniper];
groupsSDKSentry = [SDKGL,SDKMil];

//Rebel Unit Tiers (for costs)
sdkTier1 = SDKMil + [staticCrewTeamPlayer] + SDKMG + SDKGL + SDKATman;
sdkTier2 = SDKMedic + SDKExp + SDKEng;
sdkTier3 = SDKSL + SDKSniper;
soldiersSDK = sdkTier1 + sdkTier2 + sdkTier3;

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
vehSDKBike = "UK3CB_CCM_I_Golf";
vehSDKLightArmed = "UK3CB_CCM_I_Datsun_Pkm";
vehSDKAT = "UK3CB_CCM_I_Hilux_Spg";
vehSDKLightUnarmed = "UK3CB_CCM_I_Datsun_Open";
vehSDKTruck = "UK3CB_CCM_I_V3S_Closed";
//vehSDKHeli = "rhsgref_ins_g_Mi8amt";
vehSDKPlane = "UK3CB_CHC_I_Antonov_AN2";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "UK3CB_CCM_I_V3S_Repair";

//Civilian Vehicles
civCar = "UK3CB_CHC_C_Ikarus";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_CHC_C_Mi8AMT";
civBoat = "C_Rubberboat";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "UK3CB_TKP_I_NSV";
staticATteamPlayer = "UK3CB_UN_I_SPG9";
staticAAteamPlayer = "UK3CB_UN_I_ZU23";
SDKMortar = "rhsgref_ins_g_2b14";
SDKMortarHEMag = "rhs_mag_3vo18_10";
SDKMortarSmokeMag = "rhs_mag_d832du_10";

//Static Weapon Bags
MGStaticSDKB = "RHS_DShkM_Gun_Bag";
ATStaticSDKB = "RHS_SPG9_Gun_Bag";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticSDKB = "RHS_SPG9_Tripod_Bag";
//Tall Support
supportStaticsSDKB2 = "RHS_DShkM_TripodHigh_Bag";
//Mortar Support
supportStaticsSDKB3 = "RHS_Podnos_Bipod_Bag";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];
//Mines
ATMineMag = "rhs_mine_tm62m_mag";
APERSMineMag = "rhs_mine_pmn2_mag";
//Starting Unlocks
unlockedWeapons append ["UK3CB_Enfield","rhsusf_weap_m1911a1","Binocular","rhs_weap_panzerfaust60","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_pp2000_folded","UK3CB_M79","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles append ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedMagazines append ["UK3CB_Enfield_Mag","rhsusf_mag_7x45acp_MHP","rhsgref_1Rnd_Slug","rhs_mag_rgd5","rhs_mag_9x19mm_7n31_44","rhs_mag_m576","rhs_mag_m713_red","rhs_mag_m4009","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle"];
initialRifles append ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_savz61"];
unlockedItems append ["rhs_acc_2dpZenit","rhs_acc_m852v"];
unlockedAT append ["rhs_weap_panzerfaust60"];
unlockedBackpacks append ["UK3CB_ANA_B_B_ASS","UK3CB_TKC_C_B_Sidor_MED","UK3CB_B_Hiker","UK3CB_B_Hiker_Camo"];
//TFAR Unlocks
if (hasTFAR) then {unlockedItems append ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks pushBack "tf_anprc155_coyote"};