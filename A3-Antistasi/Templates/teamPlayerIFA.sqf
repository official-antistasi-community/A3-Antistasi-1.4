SDKMortar = "LIB_M2_60";
SDKMortarHEMag = "LIB_8Rnd_60mmHE_M2";
SDKMortarSmokeMag = "not_supported";
SDKMGStatic = "LIB_M1919_M2";
staticATteamPlayer = "LIB_Pak40";
staticAAteamPlayer = "LIB_FlaK_30";

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

vehSDKBike = "LIB_DAK_Kfz1";
vehSDKLightArmed = "LIB_DAK_Kfz1_MG42";
vehSDKAT = "not_supported";
vehSDKLightUnarmed = "LIB_US_Willys_MB";
vehSDKTruck = "LIB_US_GMC_Open";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "LIB_US_NAC_P39";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "LIB_US_GMC_Parm";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "ak.jpg"; if (isServer) then {flagX setFlagTexture SDKFlagTexture};
typePetros = "LIB_WP_Sierzant";

supportStaticSDKB = "not_supported";
ATStaticSDKB = "not_supported";
MGStaticSDKB = "not_supported";
supportStaticsSDKB2 = "not_supported";
AAStaticSDKB = "not_supported";
MortStaticSDKB = "not_supported";
supportStaticsSDKB3 = "not_supported";

civCar = "LIB_GazM1_dirty";
civTruck = "LIB_DAK_OpelBlitz_Open";
civHeli = "not_supported";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "LIB_K98ZF39";
lampsSDK = ["not_supported"];

ATMineMag = "LIB_TM44_MINE_mag";
APERSMineMag = "LIB_PMD6_MINE_mag";

if (gameMode != 4) then
	{
	FIARifleman = "LIB_DAK_Soldier";
	FIAMarksman = "LIB_DAK_Sniper";
	vehFIAArmedCar = "LIB_Kfz1_MG42_camo";
	vehFIATruck = "LIB_OpelBlitz_Open_Y_Camo_w";
	vehFIACar = "LIB_Kfz1_hood_w";
	groupsFIASmall = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_AT_soldier","LIB_DAK_AT_grenadier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier","LIB_DAK_Sniper"]];
	FIASquad = ["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_AT_soldier","LIB_DAK_radioman","LIB_DAK_medic"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad,["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_Sniper","LIB_DAK_radioman","LIB_DAK_medic"]];
	factionFIA = "LIB_DAK";
	}
else
	{
	FIARifleman = "LIB_NKVD_rifleman";
	FIAMarksman = "LIB_NKVD_LC_rifleman";
	vehFIAArmedCar = "LIB_Scout_m3_w";
	vehFIATruck = "LIB_Zis5v_w";
	vehFIACar = "LIB_Willys_MB_w";
	groupsFIASmall = [[FIARifleman,FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["LIB_NKVD_p_officer","LIB_NKVD_smgunner","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman"]];
	FIASquad = ["LIB_NKVD_lieutenant","LIB_NKVD_smgunner","LIB_NKVD_smgunner","LIB_NKVD_p_officer","LIB_NKVD_p_officer","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman","LIB_SOV_medic"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad];
	factionFIA = "LIB_NKVD";
	};

vehPoliceCar = "LIB_Kfz1_sernyt";
policeOfficer = "SG_sturmpanzer_unterofficer";
policeGrunt = "SG_sturmpanzer_crew";
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = "AK";

factionGEN = "SG_STURMPANZER";

//Player spawn loadout
teamPlayerDefaultLoadout = [[],[],[],["U_LIB_WP_Soldier_camo_3", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["LIB_PTRD","LIB_M2_Flamethrower","LIB_Binocular_GER","LIB_K98","LIB_M1895","LIB_FLARE_PISTOL"];//"LMG_03_F"
unlockedRifles = ["LIB_K98"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["LIB_1Rnd_145x114","LIB_M2_Flamethrower_Mag","LIB_5Rnd_792x57","LIB_Pwm","LIB_Rg42","LIB_US_TNT_4pound_mag","LIB_7Rnd_762x38","LIB_1Rnd_flare_red","LIB_1Rnd_flare_green","LIB_1Rnd_flare_white","LIB_1Rnd_flare_yellow"];
initialRifles = ["LIB_K98"];
unlockedAT = [];
unlockedBackpacks = ["B_LIB_US_M2Flamethrower","B_LIB_SOV_RA_MGAmmoBag_Empty"];
//TFAR Unlocks
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["B_LIB_US_Radio"]};
