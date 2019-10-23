SDKMortar = "LIB_M2_60";
SDKMortarHEMag = "LIB_8Rnd_60mmHE_M2";
SDKMortarSmokeMag = "not_supported";
SDKMGStatic = "LIB_M1919_M2";
staticATBuenos = "LIB_Pak40";
staticAABuenos = "LIB_FlaK_30";

staticCrewBuenos = "LIB_US_Bomber_Crew";
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
SDKFlagTexture = "ak.jpg"; if (isServer) then {bandera setFlagTexture SDKFlagTexture};
tipoPetros = "LIB_WP_Sierzant";

soporteStaticSDKB = "not_supported";
ATStaticSDKB = "not_supported";
MGStaticSDKB = "not_supported";
soporteStaticSDKB2 = "not_supported";
AAStaticSDKB = "not_supported";
MortStaticSDKB = "not_supported";
soporteStaticSDKB3 = "not_supported";

civCar = "LIB_GazM1_dirty";
civTruck = "LIB_DAK_OpelBlitz_Open";
civHeli = "not_supported";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "LIB_K98ZF39";
lamparasSDK = ["not_supported"];

ATMineMag = "LIB_TM44_MINE_mag";
APERSMineMag = "LIB_PMD6_MINE_mag";

if (gameMode != 4) then
	{
	FIARifleman = "LIB_DAK_Soldier";
	FIAMarksman = "LIB_DAK_Sniper";
	vehFIAArmedCar = "LIB_Kfz1_MG42_camo";
	vehFIATruck = "LIB_OpelBlitz_Open_Y_Camo_w";
	vehFIACar = "LIB_Kfz1_hood_w";
	gruposFIASmall = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	gruposFIAMid = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_AT_soldier","LIB_DAK_AT_grenadier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier","LIB_DAK_Sniper"]];
	FIASquad = ["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_AT_soldier","LIB_DAK_radioman","LIB_DAK_medic"];//"IRG_InfSquad";///
	gruposFIASquad = [FIASquad,["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_Sniper","LIB_DAK_radioman","LIB_DAK_medic"]];
	factionFIA = "LIB_DAK";
	}
else
	{
	FIARifleman = "LIB_NKVD_rifleman";
	FIAMarksman = "LIB_NKVD_LC_rifleman";
	vehFIAArmedCar = "LIB_Scout_m3_w";
	vehFIATruck = "LIB_Zis5v_w";
	vehFIACar = "LIB_Willys_MB_w";
	gruposFIASmall = [[FIARifleman,FIARifleman],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	gruposFIAMid = [["LIB_NKVD_p_officer","LIB_NKVD_smgunner","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman"]];
	FIASquad = ["LIB_NKVD_lieutenant","LIB_NKVD_smgunner","LIB_NKVD_smgunner","LIB_NKVD_p_officer","LIB_NKVD_p_officer","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman","LIB_SOV_medic"];//"IRG_InfSquad";///
	gruposFIASquad = [FIASquad];
	factionFIA = "LIB_NKVD";
	};

vehPoliceCar = "LIB_Kfz1_sernyt";
policeOfficer = "SG_sturmpanzer_unterofficer";
policeGrunt = "SG_sturmpanzer_crew";
gruposNATOGen = [policeOfficer,policeGrunt];
nameBuenos = "AK";

factionGEN = "SG_STURMPANZER";