if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\REBELtemplateBlu3CBUN.sqf"};
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\REBELtemplate3CBCCMT.sqf"};

REBELmortar = "rhsgref_ins_g_2b14";
REBELmortarHEmag = "rhs_mag_3vo18_10";
REBELmortarSMOKEmag = "rhs_mag_d832du_10";
REBELstaticMG = "UK3CB_TKP_I_NSV";
REBELstaticAT = "UK3CB_UN_I_SPG9";
REBELstaticAA = "UK3CB_UN_I_ZU23";

REBELstaticCREW = "UK3CB_CCM_I_COM";
REBELprisoner = "UK3CB_CHC_I_SPY";
REBELsniper = ["UK3CB_CCM_I_MK","UK3CB_CCM_I_SNI"];
REBELsoldierAT = ["UK3CB_CCM_I_AT","UK3CB_CCM_I_AT"];
REBELmedic = ["UK3CB_CCM_I_MD","UK3CB_CCM_I_MD"];
REBELsoldierMG = ["UK3CB_CCM_I_AR","UK3CB_CCM_I_AR"];
REBELsoldierEXP = ["UK3CB_CCM_I_DEM","UK3CB_CCM_I_DEM"];
REBELsoldierGL = ["UK3CB_CCM_I_RIF_LITE","UK3CB_CCM_I_RIF_LITE"];
REBELliteAT = ["UK3CB_CCM_I_RIF_BOLT","UK3CB_CCM_I_RIF_1"];
REBELsquadLeader = ["UK3CB_CCM_I_TL","UK3CB_CCM_I_OFF"];
REBELengineer = ["UK3CB_CCM_I_ENG","UK3CB_CCM_I_ENG"];

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

REBELvehQUAD = "UK3CB_CCM_I_Golf";
REBELvehARMEDlite = "UK3CB_CCM_I_Datsun_Pkm";
REBELvehAT = "UK3CB_CCM_I_Hilux_Spg";
REBELvehUNARMEDlite = "UK3CB_CCM_I_Datsun_Open";
REBELvehTRANSPORT = "UK3CB_CCM_I_V3S_Closed";
//REBELvehHELI = "rhsgref_ins_g_Mi8amt";
REBELvehPLANE = "UK3CB_CHC_I_Antonov_AN2";
REBELvehBOAT = "I_C_Boat_Transport_01_F";
REBELvehREPAIR = "UK3CB_CCM_I_V3S_Repair";

REBELvehALL = [REBELvehQUAD,REBELvehARMEDlite,REBELstaticMG,REBELvehUNARMEDlite,REBELvehTRANSPORT,REBELvehBOAT,REBELmortar,REBELstaticAT,REBELstaticAA,REBELvehREPAIR];

REBELflag = "Flag_CCM_B";
REBELflagTEX = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_TKP_I_OFF";

REBELstaticSUPPORTbag = "RHS_SPG9_Tripod_Bag";
REBELstaticSUPPORTbagAT = "RHS_SPG9_Gun_Bag";
REBELstaticSUPPORTbagTALL = "RHS_DShkM_Gun_Bag";
REBELstaticSUPPORTbagTALL2 = "RHS_DShkM_TripodHigh_Bag";
REBELstaticSUPPORTbagAA = "I_AA_01_weapon_F";
REBELstaticSUPPORTbagMORTAR = "RHS_Podnos_Gun_Bag";
REBELstaticSUPPORTbagMORTAR2 = "RHS_Podnos_Bipod_Bag";

CIVcar = "UK3CB_CHC_C_Ikarus";
CIVtruck = "UK3CB_CHC_C_V3S_Recovery";
CIVheli = "UK3CB_CHC_C_Mi8AMT";
CIVboat = "C_Rubberboat";

arrayCivVeh = ["UK3CB_CHC_C_Datsun_Civ_Closed","UK3CB_CHC_C_Datsun_Civ_Open","UK3CB_CHC_C_Gaz24","UK3CB_CHC_C_Golf","UK3CB_CHC_C_Hatchback","UK3CB_CHC_C_Hilux_Civ_Open","UK3CB_CHC_C_Hilux_Civ_Closed","UK3CB_CHC_C_Ikarus","UK3CB_CHC_C_Kamaz_Covered","UK3CB_CHC_C_Kamaz_Fuel","UK3CB_CHC_C_Kamaz_Open","UK3CB_CHC_C_Kamaz_Repair","UK3CB_CHC_C_Lada","UK3CB_CHC_C_LR_Open","UK3CB_CHC_C_LR_Closed","UK3CB_CHC_C_S1203","UK3CB_CHC_C_S1203_Amb","UK3CB_CHC_C_Sedan","UK3CB_CHC_C_Skoda","UK3CB_CHC_C_Tractor","UK3CB_CHC_C_Tractor_Old","UK3CB_CHC_C_UAZ_Closed","UK3CB_CHC_C_UAZ_Open","UK3CB_CHC_C_Ural","UK3CB_CHC_C_Ural_Open","UK3CB_CHC_C_Ural_Fuel","UK3CB_CHC_C_Ural_Empty","UK3CB_CHC_C_Ural_Repair","UK3CB_CHC_C_V3S_Open","UK3CB_CHC_C_V3S_Closed","UK3CB_CHC_C_V3S_Recovery","UK3CB_CHC_C_V3S_Refuel","UK3CB_CHC_C_V3S_Repair"];

petrosRifle = "UK3CB_BAF_L22";
REBELflashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

REBELmineAT = "rhs_mine_tm62m_mag";
REBELmineAP = "rhs_mine_pmn2_mag";

//setting up low war level garrison units for the occupants.
if (hasFFAA) then//checks if you have FFAA installed then uses their units
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then//if you have occupants on your map it uses these
		{
		FIARifleman = "UK3CB_BAF_Rifleman_Smock_DPMW";
		FIAMarksman = "UK3CB_BAF_Pointman_Smock_DPMW";
		vehFIAArmedCar = "UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW";
		vehFIATruck = "UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM";
		vehFIACar = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMW";

		groupsFIASmall = [["UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],["UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],["UK3CB_BAF_Sniper_Smock_DPMW_Ghillie","UK3CB_BAF_Spotter_Smock_DPMW_Ghillie"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Pointman_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW"],["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_GunnerM6_Smock_DPMW","UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW"],["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW","UK3CB_BAF_MATC_Smock_DPMW","UK3CB_BAF_Engineer_Smock_DPMW"]];
		FIASquad = ["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW","UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Medic_Smock_DPMW","UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW","UK3CB_BAF_Marksman_Smock_DPMW"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad];
		factionFIA = "UK3CB_TKP_B";
		}
	else//if you have invaders only it uses these
		{
		FIARifleman = "UK3CB_TKP_O_RIF_1";
		FIAMarksman = "UK3CB_TKP_O_MK";
		vehFIAArmedCar = "UK3CB_TKP_O_Datsun_Pickup_PKM";
		vehFIATruck = "UK3CB_TKP_O_Hilux_Open";
		vehFIACar = "UK3CB_TKP_O_Lada_Police";

		groupsFIASmall = [["UK3CB_TKP_O_STATIC_GUN_NSV","UK3CB_TKP_O_STATIC_TRI_NSV"],["UK3CB_TKP_O_AT","UK3CB_TKP_O_RIF_2"],["UK3CB_TKP_O_OFF","UK3CB_TKP_O_MK"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["UK3CB_TKP_O_QRF_SL","UK3CB_TKP_O_QRF_MK","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_ENG"],["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_RIF_1","UK3CB_TKP_O_QRF_AT"],["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_ENG","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_AT"]];
		FIASquad = ["UK3CB_TKP_O_CIB_SL","UUK3CB_TKP_O_CIB_RIF_2","UK3CB_TKP_O_CIB_AT","UK3CB_TKP_O_CIB_MD","UK3CB_TKP_O_CIB_TL","UK3CB_TKP_O_CIB_AR","UK3CB_TKP_O_CIB_RIF_1","UK3CB_TKP_O_CIB_ENG"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad];
		factionFIA = "UK3CB_TKP_O";
		};
	};

//Police vic and unit setting
vehPoliceCar = "UK3CB_TKP_B_Lada_Police";
policeOfficer = "UK3CB_ANP_B_TL";
policeGrunt = "UK3CB_ANP_B_RIF_1";
groupsNATOGen = [policeOfficer,policeGrunt];
REBELfactionNAME = "CCM";//player faction

POLICE = "BLU_GEN_F";//police faction

//Player spawn loadout
REBELloadoutDEFAULT = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["UK3CB_Enfield","rhsusf_weap_m1911a1","Binocular","rhs_weap_panzerfaust60","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_pp2000_folded","UK3CB_M79","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["UK3CB_Enfield_Mag","rhsusf_mag_7x45acp_MHP","rhsgref_1Rnd_Slug","rhs_mag_rgd5","rhs_mag_9x19mm_7n31_44","rhs_mag_m576","rhs_mag_m713_red","rhs_mag_m4009","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle"];
unlockedRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit","rhs_acc_m852v"];
unlockedAT = ["rhs_weap_panzerfaust60"];
unlockedBackpacks = ["UK3CB_ANA_B_B_ASS","UK3CB_TKC_C_B_Sidor_MED","UK3CB_B_Hiker","UK3CB_B_Hiker_Camo"];

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
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_rf7800str","ItemRadio"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155_coyote"]};
