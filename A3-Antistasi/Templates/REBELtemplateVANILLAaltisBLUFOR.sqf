REBELmortar = "B_G_Mortar_01_F";
REBELmortarHEmag = "8Rnd_82mm_Mo_shells";
REBELmortarSMOKEmag = "8Rnd_82mm_Mo_Smoke_white";
REBELstaticMG = "B_HMG_01_high_F";
REBELstaticAT = "B_Static_AT_F";
REBELstaticAA = "B_Static_AA_F";

REBELstaticCREW = "B_G_Soldier_unarmed_F";
REBELprisoner = "B_G_Survivor_F";
REBELsniper = ["B_G_Soldier_M_F","B_G_Sharpshooter_F"];
REBELsoldierAT = ["B_G_Soldier_LAT2_F","B_G_Soldier_LAT_F"];
REBELmedic = ["B_G_medic_F","B_G_medic_F"];
REBELsoldierMG = ["B_G_Soldier_AR_F","B_G_Soldier_AR_F"];
REBELsoldierEXP = ["B_G_Soldier_exp_F","B_G_Soldier_exp_F"];
REBELsoldierGL = ["B_G_Soldier_GL_F","B_G_Soldier_GL_F"];
REBELliteAT = ["B_G_Soldier_lite_F","B_G_Soldier_lite_F"];
REBELsquadLeader = ["B_G_Soldier_SL_F","B_G_Soldier_SL_F"];
REBELengineer = ["B_G_engineer_F","B_G_engineer_F"];

REBELunitsTIER1 = REBELliteAT + [REBELstaticCREW] + REBELsoldierMG + REBELsoldierGL + REBELsoldierAT;
REBELunitsTIER2 = REBELmedic + REBELsoldierEXP + REBELengineer;
REBELunitsTIER3 = REBELsquadLeader + REBELsniper;
REBELunitsALL = REBELunitsTIER1 + REBELunitsTIER2 + REBELunitsTIER3;

REBELgroupFIRETEAM = [REBELsquadLeader,REBELsoldierGL,REBELsoldierMG,REBELliteAT];
REBELgroupAT = [REBELsquadLeader,REBELsoldierMG,REBELsoldierAT,REBELsoldierAT,REBELsoldierAT];
REBELgroupSQUAD = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELliteAT,REBELsoldierAT,REBELliteAT,REBELmedic];
REBELgroupSQUADengineer = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierEXP,REBELsoldierAT,REBELengineer,REBELmedic];
REBELgroupSQUADsupport = [REBELsquadLeader,REBELsoldierGL,REBELliteAT,REBELsoldierMG,REBELsoldierAT,REBELmedic,[REBELstaticCREW,REBELstaticCREW],[REBELstaticCREW,REBELstaticCREW]];
REBELgroupSNIPER = [REBELsniper,REBELsniper];
REBELgroupSENTRY = [REBELsoldierGL,REBELliteAT];

REBELvehQUAD = "B_G_Quadbike_01_F";
REBELvehARMEDlite = "B_G_Offroad_01_armed_F";
REBELvehAT = "B_G_Offroad_01_AT_F";
REBELvehUNARMEDlite = "B_G_Offroad_01_F";
REBELvehTRANSPORT = "B_G_Van_01_transport_F";
//REBELvehHELI = "I_C_Heli_Light_01_civil_F";
REBELvehPLANE = "C_Plane_Civil_01_F";
REBELvehBOAT = "B_G_Boat_Transport_01_F";
REBELvehREPAIR = "B_G_Offroad_01_repair_F";

REBELvehALL = [REBELvehQUAD,REBELvehARMEDlite,REBELstaticMG,REBELvehUNARMEDlite,REBELvehTRANSPORT,REBELvehBOAT,REBELmortar,REBELstaticAT,REBELstaticAA,REBELvehREPAIR];

REBELflag = "Flag_FIA_F";
REBELflagTEX = "\A3\Data_F\Flags\Flag_FIA_CO.paa";
typePetros = "B_G_officer_F";

REBELstaticSUPPORTbag = "B_HMG_01_support_F";
REBELstaticSUPPORTbagAT = "B_AT_01_weapon_F";
REBELstaticSUPPORTbagTALL = "B_HMG_01_high_weapon_F";
REBELstaticSUPPORTbagTALL2 = "B_HMG_01_support_high_F";
REBELstaticSUPPORTbagAA = "B_AA_01_weapon_F";
REBELstaticSUPPORTbagMORTAR = "B_Mortar_01_weapon_F";
REBELstaticSUPPORTbagMORTAR2 = "B_Mortar_01_support_F";

CIVcar = "C_Offroad_01_F";
CIVtruck = "C_Van_01_transport_F";
CIVheli = "C_Heli_Light_01_civil_F";
CIVboat = "C_Boat_Transport_02_F";

petrosRifle = "srifle_DMR_06_camo_F";
REBELflashlight = ["acc_flashlight"];

REBELmineAT = "ATMine_Range_Mag";
REBELmineAP = "APERSMine_Range_Mag";

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
REBELfactionNAME = "FIA";

POLICE = "IND_C_F";

//Player spawn loadout
REBELloadoutDEFAULT = [[],[],[],["U_BG_Guerilla2_1", []],[],[],"","",[],["ItemMap","","","","",""]];

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
	unlockedWeapons pushBack "launch_MRAWS_olive_rail_F";
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
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc152","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_rt1523g"]};
