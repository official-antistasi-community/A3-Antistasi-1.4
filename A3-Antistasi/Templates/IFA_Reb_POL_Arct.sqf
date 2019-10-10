////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
nameTeamPlayer = "AK";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "ak.jpg"; if (isServer) then {flagX setFlagTexture SDKFlagTexture};
typePetros = "LIB_WP_Sierzant";

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//First Entry is Guerilla, Second Entry is Para/Military
staticCrewTeamPlayer = "LIB_US_Bomber_Crew";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["LIB_WP_Sniper","LIB_WP_Sniper"];
SDKATman = ["LIB_WP_AT_grenadier","LIB_WP_AT_grenadier"];
SDKMedic = ["LIB_WP_Medic","LIB_WP_Medic"];
SDKMG = ["LIB_WP_Mgunner","LIB_WP_Mgunner"];
SDKExp = ["LIB_WP_Saper","LIB_WP_Saper"];
SDKGL = ["LIB_WP_Radioman","LIB_WP_Radioman"];
SDKMil = ["LIB_WP_Strzelec","LIB_WP_Strzelec"];
SDKSL = ["LIB_WP_Porucznic","LIB_WP_Porucznic"];
SDKEng = ["LIB_WP_Starszy_saper","LIB_WP_Starszy_saper"];

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
vehSDKBike = "LIB_DAK_Kfz1";
vehSDKLightArmed = "LIB_DAK_Kfz1_MG42";
vehSDKAT = "not_supported";
vehSDKLightUnarmed = "LIB_US_Willys_MB";
vehSDKTruck = "LIB_US_GMC_Open";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "LIB_US_NAC_P39";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "LIB_US_GMC_Parm";

//Civilian Vehicles
civCar = "LIB_GazM1_dirty";
civTruck = "LIB_DAK_OpelBlitz_Open";
civHeli = "not_supported";
civBoat = "C_Boat_Transport_02_F";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Static Weapons
SDKMGStatic = "LIB_M1919_M2";
staticATteamPlayer = "LIB_Pak40";
staticAAteamPlayer = "LIB_FlaK_38";
SDKMortar = "LIB_M2_60";
SDKMortarHEMag = "LIB_8Rnd_60mmHE_M2";
SDKMortarSmokeMag = "not_supported";

//Static Weapon Bags
MGStaticSDKB = "not_supported";
ATStaticSDKB = "not_supported";
AAStaticSDKB = "not_supported";
MortStaticSDKB = "not_supported";
//Short Support
supportStaticSDKB = "not_supported";
//Tall Support
supportStaticsSDKB2 = "not_supported";
//Mortar Support
supportStaticsSDKB3 = "not_supported";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_LIB_WP_Soldier_camo_3", []],[],[],"","",[],["ItemMap","","","","",""]];
//Mines
ATMineMag = "LIB_TMI_42_MINE_mag";
APERSMineMag = "LIB_shumine_42_MINE_mag";
//Starting Unlocks
unlockedWeapons append ["LIB_PTRD","LIB_M38","LIB_Webley_Mk6","LIB_Webley_Flare"];
unlockedRifles append ["LIB_M38"];
initialWeapons append ["LIB_M38"];
unlockedMagazines append ["LIB_1Rnd_145x114","LIB_5Rnd_762x54","LIB_6Rnd_455","LIB_1Rnd_flare_red","LIB_1Rnd_flare_green","LIB_1Rnd_flare_white","LIB_1Rnd_flare_yellow","LIB_US_TNT_4pound_mag","LIB_Shg24","LIB_Shg24x7","LIB_No77"];
unlockedBackpacks append ["B_LIB_SOV_RA_Gasbag"];
unlockedVest append ["V_LIB_WP_OfficerVest","V_LIB_WP_SniperBela","V_LIB_WP_Kar98Vest","V_LIB_SOV_RA_Belt"];
unlockedItems append ["LIB_Binocular_PL"];
//TFAR Unlocks
if (startLR) then {unlockedBackpacks pushBack "B_LIB_US_Radio"};
