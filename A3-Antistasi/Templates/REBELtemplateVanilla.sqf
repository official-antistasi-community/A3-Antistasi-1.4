if (worldName == "Altis") exitWith {call compile preProcessFileLineNumbers "Templates\REBELtemplateVanillaAltis.sqf"};

REBELmortar = "I_G_Mortar_01_F";
REBELmortarHEmag = "8Rnd_82mm_Mo_shells";
REBELmortarSMOKEmag = "8Rnd_82mm_Mo_Smoke_white";
REBELstaticMG = "I_HMG_01_high_F";
REBELstaticAT = "I_Static_AT_F";
REBELstaticAA = "I_Static_AA_F";

REBELstaticCREW = "I_G_Soldier_unarmed_F";
REBELprisoner = "I_G_Survivor_F";
REBELsniper = ["I_C_Soldier_Bandit_5_F","I_C_Soldier_Para_7_F"];
REBELsoldierAT = ["I_C_Soldier_Bandit_2_F","I_C_Soldier_Para_5_F"];
REBELmedic = ["I_C_Soldier_Bandit_1_F","I_C_Soldier_Para_3_F"];
REBELsoldierMG = ["I_C_Soldier_Bandit_3_F","I_C_Soldier_Para_4_F"];
REBELsoldierEXP = ["I_C_Soldier_Bandit_8_F","I_C_Soldier_Para_8_F"];
REBELsoldierGL = ["I_C_Soldier_Bandit_6_F","I_C_Soldier_Para_6_F"];
REBELliteAT = ["I_C_Soldier_Bandit_7_F","I_C_Soldier_Para_1_F"];
REBELsquadLeader = ["I_C_Soldier_Bandit_4_F","I_C_Soldier_Para_2_F"];
REBELengineer = ["I_G_engineer_F","I_G_engineer_F"];

REBELunitsTIER1 = REBELliteAT + [REBELstaticCREW] + REBELsoldierMG + REBELsoldierGL + REBELsoldierAT;
REBELunitsTIER2 = REBELmedic + REBELsoldierEXP + REBELengineer;
REBELunitsTIER3 = REBELsquadLeader + REBELsniper;
REBELunitsALL = REBELunitsTIER1 + REBELunitsTIER2 + REBELunitsTIER3;

REBELgroupFIRETEAM = [REBELsquadLeader,REBELsoldierGL,REBELsoldierMG,REBELliteAT];
REBELgroupAT = [REBELsquadLeader,REBELsoldierMG,REBELsoldierAT,REBELsoldierAT,REBELsoldierAT];
//["BanditShockTeam","ParaShockTeam"];
REBELgroupSQUAD = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELliteAT,REBELsoldierAT,REBELliteAT,REBELmedic];
REBELgroupSQUADengineer = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierEXP,REBELsoldierAT,REBELengineer,REBELmedic];
REBELgroupSQUADsupport = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierAT,REBELmedic,[REBELstaticCREW,REBELstaticCREW],[REBELstaticCREW,REBELstaticCREW]];
REBELgroupSNIPER = [REBELsniper,REBELsniper];
REBELgroupSENTRY = [REBELsoldierGL,REBELliteAT];

REBELvehQUAD = "I_G_Quadbike_01_F";
REBELvehARMEDlite = "I_C_Offroad_02_LMG_F";
REBELvehAT = "I_C_Offroad_02_AT_F";
REBELvehUNARMEDlite = "I_C_Offroad_01_F";
REBELvehTRANSPORT = "I_C_Van_01_Transport_F";
//REBELvehHELI = "I_C_Heli_Light_01_civil_F";
REBELvehPLANE = "I_C_Plane_civil_01_F";
REBELvehBOAT = "I_C_Boat_Transport_01_F";
REBELvehREPAIR = "B_G_Offroad_01_repair_F";

REBELvehALL = [REBELvehQUAD,REBELvehARMEDlite,REBELstaticMG,REBELvehUNARMEDlite,REBELvehTRANSPORT,REBELvehBOAT,REBELmortar,REBELstaticAT,REBELstaticAA,REBELvehREPAIR];

REBELflag = "Flag_Syndikat_F";
REBELflagTEX = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
typePetros = "I_C_Soldier_Camo_F";

REBELstaticSUPPORTbag = "I_HMG_01_support_F";
REBELstaticSUPPORTbagAT = "I_AT_01_weapon_F";
REBELstaticSUPPORTbagTALL = "I_HMG_01_high_weapon_F";
REBELstaticSUPPORTbagTALL2 = "I_HMG_01_support_high_F";
REBELstaticSUPPORTbagAA = "I_AA_01_weapon_F";
REBELstaticSUPPORTbagMORTAR = "I_Mortar_01_weapon_F";
REBELstaticSUPPORTbagMORTAR2 = "I_Mortar_01_support_F";

CIVcar = "C_Offroad_01_F";
CIVtruck = "C_Van_01_transport_F";
CIVheli = "C_Heli_Light_01_civil_F";
CIVboat = "C_Boat_Transport_02_F";

petrosRifle = "srifle_DMR_06_camo_F";
REBELflashlight = ["acc_flashlight"];

REBELmineAT = "ATMine_Range_Mag";
REBELmineAP = "APERSMine_Range_Mag";

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
REBELfactionNAME = if (worldName == "Tanoa") then {"SDK"} else {"FIA"};

POLICE = "BLU_GEN_F";

//Player spawn loadout
REBELloadoutDEFAULT = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedVEST = ["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_BandollierB_ghex_F","V_HarnessO_brn","V_HarnessO_gry","V_HarnessO_ghex_F","V_HarnessOGL_ghex_F","V_HarnessOGL_gry","V_HarnessOGL_brn","V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F"];
unlockedWeapons = ["hgun_PDW2000_F","hgun_Pistol_01_F","hgun_ACPC2_F","Binocular","SMG_05_F","SMG_02_F"];//"LMG_03_F"
unlockedRifles = ["hgun_PDW2000_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","SMG_02_F"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["9Rnd_45ACP_Mag","30Rnd_9x21_Mag","30Rnd_762x39_Mag_F","MiniGrenade","1Rnd_HE_Grenade_shell","30Rnd_545x39_Mag_F","30Rnd_9x21_Mag_SMG_02","10Rnd_9x21_Mag","200Rnd_556x45_Box_F","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag"];
unlockedRifles = ["hgun_PDW2000_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","SMG_02_F"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr"];

if !(isMultiplayer) then
	{
	unlockedWeapons append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedWeapons pushBack "launch_RPG7_F";
	unlockedAT = ["launch_RPG7_F"];
	unlockedMagazines pushBack "RPG7_F";
  };

// BEGIN ITEM CLASSIFICATION

REBELuniforms = [];
REBELuniformsPM = [];
{
_unit = _x select 0;
_uniform = (getUnitLoadout _unit select 3) select 0;
REBELuniforms pushBackUnique _uniform;
REBELuniformsPM pushBackUnique _uniform;
if (count _x > 1) then
	{
	_unit = _x select 1;
	_uniform = (getUnitLoadout _unit select 3) select 0;
	REBELuniformsPM pushBackUnique _uniform;
	};
} forEach [REBELsniper,REBELsoldierAT,REBELmedic,REBELsoldierMG,REBELsoldierEXP,REBELsoldierGL,REBELliteAT,REBELsquadLeader,REBELengineer,[REBELprisoner],[REBELstaticCREW]];

//TFAR unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_rf7800str","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155"]};
