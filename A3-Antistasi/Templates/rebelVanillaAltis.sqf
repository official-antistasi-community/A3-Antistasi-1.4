if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\rebelVanillaAltisB.sqf"};
rebelMortar = "I_G_Mortar_01_F";
rebelMortarRoundHE = "8Rnd_82mm_Mo_shells";
rebelMortarRoundSmoke = "8Rnd_82mm_Mo_Smoke_white";
rebelStaticMG = "I_HMG_01_high_F";
rebelStaticAT = "I_Static_AT_F";
rebelStaticAA = "I_Static_AA_F";

rebelStaticCrew = "I_G_Soldier_unarmed_F";
rebelUnarmed = "I_G_Survivor_F";
rebelSniper = ["I_G_Sharpshooter_F","I_ghillie_ard_F"];
rebelAT = ["I_G_Soldier_LAT2_F","I_Soldier_LAT2_F"];
rebelMedic = ["I_G_medic_F","I_medic_F"];
rebelHeavyGunner = ["I_G_Soldier_AR_F","I_Soldier_AR_F"];
rebelExpSpec = ["I_G_Soldier_exp_F","I_Soldier_exp_F"];
rebelGrenadier = ["I_G_Soldier_GL_F","I_Soldier_GL_F"];
rebelLiteAT = ["I_G_Soldier_lite_F","I_Soldier_lite_F"];
rebelSquadLeader = ["I_G_Soldier_SL_F","I_Soldier_SL_F"];
rebelEngineer = ["I_G_engineer_F","I_engineer_F"];

rebelVehQuadbike = "I_G_Quadbike_01_F";
rebelVehLiteArmed = "I_G_Offroad_01_armed_F";
rebelVehLiteAT = "I_G_Offroad_01_AT_F";
rebelVehLiteUnarmed = "I_G_Offroad_01_F";
rebelVehTransport = "I_G_Van_01_transport_F";
//rebelVehHeli = "I_C_Heli_Light_01_civil_F";
rebelVehPlane = "I_C_Plane_civil_01_F";
rebelVehBoat = "I_G_Boat_Transport_01_F";
rebelVehRepair = "I_G_Offroad_01_repair_F";
rebelFlag = "Flag_Altis_F";
rebelFlagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "I_G_officer_F";

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
		militiaRifleman = "B_Soldier_lite_F";
		militiaMarksman = "B_soldier_M_F";
		militiaVehArmed = "B_LSV_01_armed_F";
		militiaVehTransport = "B_Truck_01_transport_F";
		militiaVehUnarmed = "B_LSV_01_unarmed_F";
		militiaGroupLow = [["B_Soldier_GL_F",militiaRifleman],[militiaMarksman,militiaRifleman],["B_Sharpshooter_F","B_soldier_M_F"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_soldier_M_F"],["B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_soldier_LAT2_F"],["B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AAA_F","B_soldier_AA_F"]];
		militiaGroupLarge = ["B_Soldier_TL_F","B_soldier_AR_F","B_Soldier_GL_F","B_Soldier_lite_F","B_Soldier_lite_F","B_soldier_M_F","B_soldier_LAT2_F","B_medic_F"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge,["B_Soldier_TL_F","B_support_AMG_F","B_Soldier_GL_F","B_Soldier_lite_F","B_support_MG_F","B_soldier_M_F","B_soldier_LAT2_F","B_medic_F"]];
		militiaFactionName = "";
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
	};

vehPoliceCar = "B_GEN_OFFROAD_01_gen_F";
policeOfficer = "B_GEN_Commander_F";
policeGrunt = "B_GEN_Soldier_F";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "FIA";

factionGEN = "BLU_GEN_F";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

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
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155"]};
