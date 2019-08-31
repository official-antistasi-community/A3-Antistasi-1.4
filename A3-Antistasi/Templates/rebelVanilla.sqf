if (worldName == "Altis") exitWith {call compile preProcessFileLineNumbers "Templates\rebelVanillaAltis.sqf"};

rebelMortar = "I_G_Mortar_01_F";
rebelMortarRoundHE = "8Rnd_82mm_Mo_shells";
rebelMortarRoundSmoke = "8Rnd_82mm_Mo_Smoke_white";
rebelStaticMG = "I_HMG_01_high_F";
rebelStaticAT = "I_Static_AT_F";
rebelStaticAA = "I_Static_AA_F";

rebelStaticCrew = "I_G_Soldier_unarmed_F";
rebelUnarmed = "I_G_Survivor_F";
rebelSniper = ["I_C_Soldier_Bandit_5_F","I_C_Soldier_Para_7_F"];
rebelAT = ["I_C_Soldier_Bandit_2_F","I_C_Soldier_Para_5_F"];
rebelMedic = ["I_C_Soldier_Bandit_1_F","I_C_Soldier_Para_3_F"];
rebelHeavyGunner = ["I_C_Soldier_Bandit_3_F","I_C_Soldier_Para_4_F"];
rebelExpSpec = ["I_C_Soldier_Bandit_8_F","I_C_Soldier_Para_8_F"];
rebelGrenadier = ["I_C_Soldier_Bandit_6_F","I_C_Soldier_Para_6_F"];
rebelLiteAT = ["I_C_Soldier_Bandit_7_F","I_C_Soldier_Para_1_F"];
rebelSquadLeader = ["I_C_Soldier_Bandit_4_F","I_C_Soldier_Para_2_F"];
rebelEngineer = ["I_G_engineer_F","I_G_engineer_F"];

rebelVehQuadbike = "I_G_Quadbike_01_F";
rebelVehLiteArmed = "I_G_Offroad_01_armed_F";
rebelVehLiteAT = "I_G_Offroad_02_AT_F";
rebelVehLiteUnarmed = "I_G_Offroad_01_F";
rebelVehTransport = "I_C_Van_01_Transport_F";
//rebelVehHeli = "I_C_Heli_Light_01_civil_F";
rebelVehPlane = "I_C_Plane_civil_01_F";
rebelVehBoat = "I_C_Boat_Transport_01_F";
rebelVehRepair = "B_G_Offroad_01_repair_F";
rebelFlag = "Flag_Syndikat_F";
rebelFlagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
typePetros = "I_C_Soldier_Camo_F";

rebelStaticSupportMG = "I_HMG_01_support_F";
rebelStaticSupportAT = "I_AT_01_weapon_F";
rebelStaticTallMG = "I_HMG_01_high_weapon_F";
rebelStaticSupportTallMG = "I_HMG_01_support_high_F";
rebelStaticSupportAA = "I_AA_01_weapon_F";
rebelStaticMortarBag = "I_Mortar_01_weapon_F";
rebelStaticSupportMortar = "I_Mortar_01_support_F";

civCar = "C_Offroad_01_F";
civTruck = "C_Van_01_transport_F";
civHeli = "C_Heli_Light_01_civil_F";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "srifle_DMR_06_camo_F";
rebelStartingFlashlight = ["acc_flashlight"];

rebelMineAT = "ATMine_Range_Mag";
rebelMineAP = "APERSMine_Range_Mag";

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		militiaRifleman = "B_G_Soldier_F";
		militiaMarksman = "B_G_Sharpshooter_F";
		militiaVehArmed = "B_G_Offroad_01_armed_F";
		militiaVehTransport = "B_G_van_01_transport_F";
		militiaVehUnarmed = "B_G_Offroad_01_F";
		militiaGroupLow = [["B_G_Soldier_GL_F","B_G_Soldier_F"],["B_G_Soldier_M_F","B_G_Soldier_F"],["B_G_Sharpshooter_F","B_G_Soldier_M_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["B_G_Soldier_SL_F","B_G_Sharpshooter_F","B_G_Soldier_AR_F","B_G_Soldier_A_F"],["B_G_Soldier_TL_F","B_G_Soldier_AR_F","B_G_Soldier_GL_F","B_G_Soldier_LAT_F"],["B_G_Soldier_TL_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F","B_G_Soldier_LAT_F"]];
		militiaGroupLarge = ["B_G_soldier_SL_F","B_G_soldier_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_TL_F","B_G_soldier_AR_F","B_G_Soldier_A_F","B_G_medic_F"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge,["B_G_soldier_SL_F","B_G_soldier_LAT_F","B_G_Soldier_M_F","B_G_soldier_TL_F","B_G_Soldier_A_F","B_G_medic_F","B_support_MG_F","B_support_AMG_F"]];
		militiaFactionName = "BLU_G_F";
		}
	else
		{
		militiaRifleman = "O_G_Soldier_F";
		militiaMarksman = "O_G_Sharpshooter_F";
		militiaVehArmed = "O_G_Offroad_01_armed_F";
		militiaVehTransport = "O_G_van_01_transport_F";
		militiaVehUnarmed = "O_G_Offroad_01_F";
		militiaGroupLow = [["O_G_Soldier_GL_F","O_G_Soldier_F"],["O_G_Soldier_M_F","O_G_Soldier_F"],["O_G_Sharpshooter_F","O_G_Soldier_M_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["O_G_Soldier_SL_F","O_G_Sharpshooter_F","O_G_Soldier_AR_F","O_G_Soldier_A_F"],["O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"],["O_G_Soldier_TL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT_F"]];
		militiaGroupLarge = ["O_G_soldier_SL_F","O_G_soldier_F","O_G_soldier_LAT_F","O_G_Soldier_M_F","O_G_soldier_TL_F","O_G_soldier_AR_F","O_G_Soldier_A_F","O_G_medic_F"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge,["O_G_soldier_SL_F","O_G_soldier_LAT_F","O_G_Soldier_M_F","O_G_soldier_TL_F","O_G_Soldier_A_F","O_G_medic_F","O_support_MG_F","O_support_AMG_F"]];
		militiaFactionName = "OPF_G_F";
		};
	};

vehPoliceCar = "B_GEN_OFFROAD_01_gen_F";
policeOfficer = "B_GEN_Commander_F";
policeGrunt = "B_GEN_Soldier_F";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "SDK";

factionGEN = "BLU_GEN_F";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

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
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155"]};
