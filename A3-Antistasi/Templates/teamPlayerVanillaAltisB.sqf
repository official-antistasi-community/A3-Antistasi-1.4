SDKMortar = "B_G_Mortar_01_F";
SDKMortarHEMag = "8Rnd_82mm_Mo_shells";
SDKMortarSmokeMag = "8Rnd_82mm_Mo_Smoke_white";
SDKMGStatic = "B_HMG_01_high_F";
staticATteamPlayer = "B_Static_AT_F";
staticAAteamPlayer = "B_Static_AA_F";

staticCrewTeamPlayer = "B_G_Soldier_unarmed_F";
SDKUnarmed = "B_G_Survivor_F";
SDKSniper = ["B_G_Soldier_M_F","B_G_Sharpshooter_F"];
SDKATman = ["B_G_Soldier_LAT2_F","B_G_Soldier_LAT_F"];
SDKMedic = ["B_G_medic_F","B_G_medic_F"];
SDKMG = ["B_G_Soldier_AR_F","B_G_Soldier_AR_F"];
SDKExp = ["B_G_Soldier_exp_F","B_G_Soldier_exp_F"];
SDKGL = ["B_G_Soldier_GL_F","B_G_Soldier_GL_F"];
SDKMil = ["B_G_Soldier_lite_F","B_G_Soldier_lite_F"];
SDKSL = ["B_G_Soldier_SL_F","B_G_Soldier_SL_F"];
SDKEng = ["B_G_engineer_F","B_G_engineer_F"];

vehSDKBike = "B_G_Quadbike_01_F";
vehSDKLightArmed = "B_G_Offroad_01_armed_F";
vehSDKAT = "B_G_Offroad_01_AT_F";
vehSDKLightUnarmed = "B_G_Offroad_01_F";
vehSDKTruck = "B_G_Van_01_transport_F";
//vehSDKHeli = "I_C_Heli_Light_01_civil_F";
vehSDKPlane = "C_Plane_Civil_01_F";
vehSDKBoat = "B_G_Boat_Transport_01_F";
vehSDKRepair = "B_G_Offroad_01_repair_F";
SDKFlag = "Flag_FIA_F";
SDKFlagTexture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "B_G_officer_F";

supportStaticSDKB = "B_HMG_01_support_F";
ATStaticSDKB = "B_AT_01_weapon_F";
MGStaticSDKB = "B_HMG_01_high_weapon_F";
supportStaticsSDKB2 = "B_HMG_01_support_high_F";
AAStaticSDKB = "B_AA_01_weapon_F";
MortStaticSDKB = "B_Mortar_01_weapon_F";
supportStaticsSDKB3 = "B_Mortar_01_support_F";

civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "srifle_DMR_06_camo_F";
lampsSDK = ["acc_flashlight"];

ATMineMag = "ATMine_Range_Mag";
APERSMineMag = "APERSMine_Range_Mag";
if (gameMode != 4) then
	{
	FIARifleman = "I_C_Soldier_Para_7_F";
	FIAMarksman = "I_C_Soldier_Para_2_F";
	vehFIAArmedCar = "I_C_Offroad_02_LMG_F";
	vehFIATruck = "I_C_Van_01_transport_F";
	vehFIACar = "I_C_Offroad_01_F";
	groupsFIASmall = [["I_C_Soldier_Para_6_F",FIARifleman],[FIAMarksman,FIARifleman],[FIAMarksman,FIAMarksman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F"],["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F"]];
	FIASquad = ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad];
	factionFIA = "IND_C_F";
	}
else
	{
	FIARifleman = "O_soldierU_F";
	FIAMarksman = "O_soldierU_M_F";
	vehFIAArmedCar = "O_MRAP_02_hmg_F";
	vehFIATruck = "O_Truck_02_transport_F";
	vehFIACar = "O_MRAP_02_F";
	groupsFIASmall = [["O_SoldierU_GL_F",FIARifleman],[FIAMarksman,FIARifleman],["O_soldierU_M_F","O_SoldierU_GL_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F",FIAMarksman],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_soldierU_LAT_F"],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_engineer_U_F"]];
	FIASquad = ["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",FIARifleman,FIARifleman,FIAMarksman,"O_soldierU_LAT_F","O_soldierU_medic_F"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad,["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",FIARifleman,"O_soldierU_A_F","O_soldierU_exp_F","O_soldierU_LAT_F","O_soldierU_medic_F"]];
	factionFIA = "";
	};

vehPoliceCar = vehFIACar;
policeOfficer = FIARifleman;
policeGrunt = FIARifleman;
groupsNATOGen = [policeOfficer,policeGrunt];
nameTeamPlayer = "FIA";

factionGEN = "IND_C_F";

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
	unlockedWeapons pushBack "launch_MRAWS_olive_rail_F";
	unlockedAT = ["launch_MRAWS_olive_rail_F"];
	unlockedMagazines pushBack "MRAWS_HEAT_F";
  };
//TFAR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc152","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_rt1523g"]};
