if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\REBELtemplateVANILLAaltisBLUFOR.sqf"};
REBELmortar = "I_G_Mortar_01_F";
REBELmortarHEmag = "8Rnd_82mm_Mo_shells";
REBELmortarSMOKEmag = "8Rnd_82mm_Mo_Smoke_white";
REBELstaticMG = "I_HMG_01_high_F";
REBELstaticAT = "I_Static_AT_F";
REBELstaticAA = "I_Static_AA_F";

REBELstaticCREW = "I_G_Soldier_unarmed_F";
REBELprisoner = "I_G_Survivor_F";
REBELsniper = ["I_G_Sharpshooter_F","I_ghillie_ard_F"];
REBELsoldierAT = ["I_G_Soldier_LAT2_F","I_Soldier_LAT2_F"];
REBELmedic = ["I_G_medic_F","I_medic_F"];
REBELsoldierMG = ["I_G_Soldier_AR_F","I_Soldier_AR_F"];
REBELsoldierEXP = ["I_G_Soldier_exp_F","I_Soldier_exp_F"];
REBELsoldierGL = ["I_G_Soldier_GL_F","I_Soldier_GL_F"];
REBELliteAT = ["I_G_Soldier_lite_F","I_Soldier_lite_F"];
REBELsquadLeader = ["I_G_Soldier_SL_F","I_Soldier_SL_F"];
REBELengineer = ["I_G_engineer_F","I_engineer_F"];

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
REBELvehARMEDlite = "I_G_Offroad_01_armed_F";
REBELvehAT = "I_G_Offroad_01_AT_F";
REBELvehUNARMEDlite = "I_G_Offroad_01_F";
REBELvehTRANSPORT = "I_G_Van_01_transport_F";
//REBELvehHELI = "I_C_Heli_Light_01_civil_F";
REBELvehPLANE = "I_C_Plane_civil_01_F";
REBELvehBOAT = "I_G_Boat_Transport_01_F";
REBELvehREPAIR = "I_G_Offroad_01_repair_F";

REBELvehALL = [REBELvehQUAD,REBELvehARMEDlite,REBELstaticMG,REBELvehUNARMEDlite,REBELvehTRANSPORT,REBELvehBOAT,REBELmortar,REBELstaticAT,REBELstaticAA,REBELvehREPAIR];

REBELflag = "Flag_Altis_F";
REBELflagTEX = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
typePetros = "I_G_officer_F";

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
		FIARifleman = "B_Soldier_lite_F";
		FIAMarksman = "B_soldier_M_F";
		vehFIAArmedCar = "B_LSV_01_armed_F";
		vehFIATruck = "B_Truck_01_transport_F";
		vehFIACar = "B_LSV_01_unarmed_F";
		groupsFIASmall = [["B_Soldier_GL_F",FIARifleman],[FIAMarksman,FIARifleman],["B_Sharpshooter_F","B_soldier_M_F"]];
		groupsFIAMid = [["B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_soldier_M_F"],["B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_soldier_LAT2_F"],["B_Soldier_TL_F","B_soldier_AR_F","B_soldier_AAA_F","B_soldier_AA_F"]];
		FIASquad = ["B_Soldier_TL_F","B_soldier_AR_F","B_Soldier_GL_F","B_Soldier_lite_F","B_Soldier_lite_F","B_soldier_M_F","B_soldier_LAT2_F","B_medic_F"];
		groupsFIASquad = [FIASquad,["B_Soldier_TL_F","B_support_AMG_F","B_Soldier_GL_F","B_Soldier_lite_F","B_support_MG_F","B_soldier_M_F","B_soldier_LAT2_F","B_medic_F"]];
		factionFIA = "";
		}
	else
		{
		FIARifleman = "O_soldierU_F";
		FIAMarksman = "O_soldierU_M_F";
		vehFIAArmedCar = "O_MRAP_02_hmg_F";
		vehFIATruck = "O_Truck_02_transport_F";
		vehFIACar = "O_MRAP_02_F";
		groupsFIASmall = [["O_SoldierU_GL_F",FIARifleman],[FIAMarksman,FIARifleman],["O_soldierU_M_F","O_SoldierU_GL_F"]];
		groupsFIAMid = [["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F",FIAMarksman],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_soldierU_LAT_F"],["O_SoldierU_SL_F","O_SoldierU_GL_F","O_soldierU_AR_F","O_engineer_U_F"]];
		FIASquad = ["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",FIARifleman,FIARifleman,FIAMarksman,"O_soldierU_LAT_F","O_soldierU_medic_F"];
		groupsFIASquad = [FIASquad,["O_SoldierU_SL_F","O_soldierU_AR_F","O_SoldierU_GL_F",FIARifleman,"O_soldierU_A_F","O_soldierU_exp_F","O_soldierU_LAT_F","O_soldierU_medic_F"]];
		factionFIA = "";
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
REBELvests0 = ["V_Rangemaster_belt","V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_BandollierB_ghex_F","V_HarnessO_brn","V_HarnessO_gry","V_HarnessO_ghex_F","V_HarnessOGL_ghex_F","V_HarnessOGL_gry","V_HarnessOGL_brn","V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F"];
unlockedWeapons = ["hgun_PDW2000_F","hgun_Pistol_01_F","hgun_ACPC2_F","Binocular","SMG_05_F","SMG_02_F"];//"LMG_03_F"
unlockedMagazines = ["9Rnd_45ACP_Mag","30Rnd_9x21_Mag","30Rnd_762x39_Mag_F","MiniGrenade","1Rnd_HE_Grenade_shell","30Rnd_545x39_Mag_F","30Rnd_9x21_Mag_SMG_02","10Rnd_9x21_Mag","200Rnd_556x45_Box_F","IEDLandBig_Remote_Mag","IEDUrbanBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag"];
unlockedRifles = ["hgun_PDW2000_F","arifle_AKM_F","arifle_AKS_F","SMG_05_F","SMG_02_F"];
unlockedBackpacks = ["B_FieldPack_oli","B_FieldPack_blk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_ghex_F","B_Messenger_Coyote_F","B_Messenger_Olive_F","B_Messenger_Black_F","B_Messenger_Gray_F"];

if !(isMultiplayer) then
	{
	unlockedWeapons append ["arifle_AKM_F","arifle_AKS_F","launch_MRAWS_olive_rail_F"];
	unlockedRifles append ["arifle_AKM_F","arifle_AKS_F"];
	unlockedAT = ["launch_MRAWS_olive_rail_F"];
	unlockedMagazines pushBack "MRAWS_HEAT_F";
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

//TFAR Unlocks
if (hasTFAR) then {unlockedItems  append ["tf_microdagr","tf_anprc148jem","ItemRadio"]};
if (startLR) then {unlockedBackpacks  pushBack "tf_anprc155"};

// Declare all the public variables we have created
publicVariable "unlockedWeapons";
publicVariable "unlockedRifles";
publicVariable "unlockedItems";
publicVariable "unlockedBackpacks";
publicVariable "unlockedMagazines";
publicVariable "unlockedAT";