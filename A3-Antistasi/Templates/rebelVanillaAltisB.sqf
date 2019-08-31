rebelMortar = "B_G_Mortar_01_F";
rebelMortarRoundHE = "8Rnd_82mm_Mo_shells";
rebelMortarRoundSmoke = "8Rnd_82mm_Mo_Smoke_white";
rebelStaticMG = "B_HMG_01_high_F";
rebelStaticAT = "B_Static_AT_F";
rebelStaticAA = "B_Static_AA_F";

rebelStaticCrew = "B_G_Soldier_unarmed_F";
rebelUnarmed = "B_G_Survivor_F";
rebelSniper = ["B_G_Soldier_M_F","B_G_Sharpshooter_F"];
rebelAT = ["B_G_Soldier_LAT2_F","B_G_Soldier_LAT_F"];
rebelMedic = ["B_G_medic_F","B_G_medic_F"];
rebelHeavyGunner = ["B_G_Soldier_AR_F","B_G_Soldier_AR_F"];
rebelExpSpec = ["B_G_Soldier_exp_F","B_G_Soldier_exp_F"];
rebelGrenadier = ["B_G_Soldier_GL_F","B_G_Soldier_GL_F"];
rebelLiteAT = ["B_G_Soldier_lite_F","B_G_Soldier_lite_F"];
rebelSquadLeader = ["B_G_Soldier_SL_F","B_G_Soldier_SL_F"];
rebelEngineer = ["B_G_engineer_F","B_G_engineer_F"];

rebelVehQuadbike = "B_G_Quadbike_01_F";
rebelVehLiteArmed = "B_G_Offroad_01_armed_F";
rebelVehLiteAT = "B_G_Offroad_01_AT_F";
rebelVehLiteUnarmed = "B_G_Offroad_01_F";
rebelVehTransport = "B_G_Van_01_transport_F";
//rebelVehHeli = "I_C_Heli_Light_01_civil_F";
rebelVehPlane = "C_Plane_Civil_01_F";
rebelVehBoat = "B_G_Boat_Transport_01_F";
rebelVehRepair = "B_G_Offroad_01_repair_F";
rebelFlag = "Flag_FIA_F";
rebelFlagTexture = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "B_G_officer_F";

rebelStaticSupportMG = "B_HMG_01_support_F";
rebelStaticSupportAT = "B_AT_01_weapon_F";
rebelStaticTallMG = "B_HMG_01_high_weapon_F";
rebelStaticSupportTallMG = "B_HMG_01_support_high_F";
rebelStaticSupportAA = "B_AA_01_weapon_F";
rebelStaticMortarBag = "B_Mortar_01_weapon_F";
rebelStaticSupportMortar = "B_Mortar_01_support_F";

civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "srifle_DMR_06_camo_F";
rebelStartingFlashlight = ["acc_flashlight"];

rebelMineAT = "ATMine_Range_Mag";
rebelMineAP = "APERSMine_Range_Mag";
if (gameMode != 4) then
	{
	militiaRifleman = "I_C_Soldier_Para_7_F";
	militiaMarksman = "I_C_Soldier_Para_2_F";
	militiaVehArmed = "I_C_Offroad_02_LMG_F";
	militiaVehTransport = "I_C_Van_01_transport_F";
	militiaVehUnarmed = "I_C_Offroad_01_F";
	militiaGroupLow = [["I_C_Soldier_Para_6_F",militiaRifleman],[militiaMarksman,militiaRifleman],[militiaMarksman,militiaMarksman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F"],["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F"]];
	militiaGroupLarge = ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge];
	militiaFactionName = "IND_C_F";
	}
else
	{
	militiaRifleman = "O_soldierU_F";
	militiaMarksman = "O_soldierU_M_F";
	militiaVehArmed = "O_MRAP_02_hmg_F";
	militiaVehTransport = "O_Truck_02_transport_F";
	militiaVehUnarmed = "O_MRAP_02_F";
	militiaGroupLow = [["O_SoldierU_GL_F",militiaRifleman],[militiaMarksman,militiaRifleman],["O_soldierU_M_F","O_SoldierU_GL_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F",militiaMarksman],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_soldierU_LAT_F"],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_engineer_U_F"]];
	militiaGroupLarge = ["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",militiaRifleman,militiaRifleman,militiaMarksman,"O_soldierU_LAT_F","O_soldierU_medic_F"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge,["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",militiaRifleman,"O_soldierU_A_F","O_soldierU_exp_F","O_soldierU_LAT_F","O_soldierU_medic_F"]];
	militiaFactionName = "";
	};

vehPoliceCar = militiaVehUnarmed;
policeOfficer = militiaRifleman;
policeGrunt = militiaRifleman;
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "FIA";

factionGEN = "IND_C_F";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla2_1", []],[],[],"","",[],["ItemMap","","","","",""]];

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
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_rf7800str"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_rt1523g"]};
