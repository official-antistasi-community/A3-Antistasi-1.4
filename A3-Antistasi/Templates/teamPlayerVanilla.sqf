if (worldName == "Altis") exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayerVanillaAltis.sqf"};

SDKMortar = "I_G_Mortar_01_F";
SDKMortarHEMag = "8Rnd_82mm_Mo_shells";
SDKMortarSmokeMag = "8Rnd_82mm_Mo_Smoke_white";
SDKMGStatic = "I_HMG_01_high_F";
staticATteamPlayer = "I_Static_AT_F";
staticAAteamPlayer = "I_Static_AA_F";

staticCrewTeamPlayer = "I_G_Soldier_unarmed_F";
SDKUnarmed = "I_G_Survivor_F";
SDKSniper = ["I_C_Soldier_Bandit_5_F","I_C_Soldier_Para_7_F"];
SDKATman = ["I_C_Soldier_Bandit_2_F","I_C_Soldier_Para_5_F"];
SDKMedic = ["I_C_Soldier_Bandit_1_F","I_C_Soldier_Para_3_F"];
SDKMG = ["I_C_Soldier_Bandit_3_F","I_C_Soldier_Para_4_F"];
SDKExp = ["I_C_Soldier_Bandit_8_F","I_C_Soldier_Para_8_F"];
SDKGL = ["I_C_Soldier_Bandit_6_F","I_C_Soldier_Para_6_F"];
SDKMil = ["I_C_Soldier_Bandit_7_F","I_C_Soldier_Para_1_F"];
SDKSL = ["I_C_Soldier_Bandit_4_F","I_C_Soldier_Para_2_F"];
SDKEng = ["I_G_engineer_F","I_G_engineer_F"];

vehSDKBike = "I_G_Quadbike_01_F";
vehSDKLightArmed = "I_C_Offroad_02_LMG_F";
vehSDKAT = "I_C_Offroad_02_AT_F";
vehSDKLightUnarmed = "I_C_Offroad_01_F";
vehSDKTruck = "I_C_Van_01_Transport_F";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "I_C_Plane_civil_01_F";
vehSDKBoat = "I_C_Boat_Transport_01_F";
vehSDKRepair = "B_G_Offroad_01_repair_F";
SDKFlag = "Flag_Syndikat_F";
SDKFlagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
typePetros = "I_C_Soldier_Camo_F";

supportStaticSDKB = "I_HMG_01_support_F";
ATStaticSDKB = "I_AT_01_weapon_F";
MGStaticSDKB = "I_HMG_01_high_weapon_F";
supportStaticsSDKB2 = "I_HMG_01_support_high_F";
AAStaticSDKB = "I_AA_01_weapon_F";
MortStaticSDKB = "I_Mortar_01_weapon_F";
supportStaticsSDKB3 = "I_Mortar_01_support_F";

civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "srifle_DMR_06_camo_F";
lampsSDK = ["acc_flashlight"];

ATMineMag = "ATMine_Range_Mag";
APERSMineMag = "APERSMine_Range_Mag";

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		FIARifleman = "B_G_Soldier_F";
		FIAMarksman = "B_G_Sharpshooter_F";
		vehFIAArmedCar = "B_G_Offroad_01_armed_F";
		vehFIATruck = "B_G_van_01_transport_F";
		vehFIACar = "B_G_Offroad_01_F";
		groupsFIASmall = [["B_G_Soldier_GL_F","B_G_Soldier_F"],["B_G_Soldier_M_F","B_G_Soldier_F"],["B_G_Sharpshooter_F","B_G_Soldier_M_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"]];
		FIASquad = ["B_G_soldier_SL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_TL_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad,["B_G_soldier_SL_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_TL_F","B_G_Soldier_A_F","B_G_medic_F","B_support_MG_F","B_support_AMG_F"]];
		factionFIA = "BLU_G_F";
		}
	else
		{
		FIARifleman = "O_G_Soldier_F";
		FIAMarksman = "O_G_Sharpshooter_F";
		vehFIAArmedCar = "O_G_Offroad_01_armed_F";
		vehFIATruck = "O_G_van_01_transport_F";
		vehFIACar = "O_G_Offroad_01_F";
		groupsFIASmall = [["O_G_Soldier_GL_F","O_G_Soldier_F"],["O_G_Soldier_M_F","O_G_Soldier_F"],["O_G_Sharpshooter_F","O_G_Soldier_M_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["O_G_Soldier_SL_F","O_G_Sharpshooter_F","O_G_Soldier_AR_F","O_G_Soldier_A_F"],["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"],["O_G_Soldier_TL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F"]];
		FIASquad = ["O_G_soldier_SL_F","O_G_soldier_F","O_G_soldier_LAT_F","O_G_Soldier_M_F","O_G_soldier_TL_F","O_G_soldier_AR_F","O_G_Soldier_A_F","O_G_medic_F"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad,["O_G_soldier_SL_F","O_G_soldier_LAT_F","O_G_Soldier_M_F","O_G_soldier_TL_F","O_G_Soldier_A_F","O_G_medic_F","O_support_MG_F","O_support_AMG_F"]];
		factionFIA = "OPF_G_F";
		};
	};

vehPoliceCar = "B_GEN_OFFROAD_01_gen_F";
policeOfficer = "B_GEN_Commander_F";
policeGrunt = "B_GEN_Soldier_F";
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = if (worldName == "Tanoa") then {"SDK"} else {"FIA"};

factionGEN = "BLU_GEN_F";

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["hgun_PDW2000_F","hgun_Pistol_01_F","hgun_ACPC2_F","Binocular","SMG_05_F","SMG_02_F"];//"LMG_03_F"
unlockedRifles = ["hgun_PDW2000_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","SMG_02_F"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["9Rnd_45ACP_Mag","30Rnd_9x21_Mag","30Rnd_762x39_Mag_F","MiniGrenade","1Rnd_HE_Grenade_shell","30Rnd_545x39_Mag_F","30Rnd_9x21_Mag_SMG_02","10Rnd_9x21_Mag","200Rnd_556x45_Box_F","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag"];
initialRifles = ["hgun_PDW2000_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","SMG_02_F"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];

if !(isMultiplayer) then
	{
	unlockedWeapons append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	initialRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedWeapons pushBack "launch_RPG7_F";
	unlockedAT = ["launch_RPG7_F"];
	unlockedMagazines pushBack "RPG7_F";
  };
//TFAR unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc148jem","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155"]};
