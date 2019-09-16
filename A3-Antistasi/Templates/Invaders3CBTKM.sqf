if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\Invaders3CBAFRFT.sqf"};

CSATGrunt = "UK3CB_TKM_O_RIF_1";
CSATOfficer = "UK3CB_TKM_O_WAR";
CSATBodyG = "UK3CB_TKM_O_IED";
CSATCrew = "UK3CB_TKM_O_RIF_2";
CSATMarksman = "UK3CB_TKM_O_MK";;
staticCrewInvaders = "UK3CB_TKM_O_RIF_2";
CSATPilot = "UK3CB_TKA_O_HELI_PILOT";

CSATMortar = "UK3CB_TKM_O_2b14_82mm";
CSATMG = "UK3CB_TKM_O_KORD_high";
staticATInvaders = "UK3CB_TKM_O_SPG9";
staticAAInvaders = "UK3CB_TKM_O_ZU23";

//CSAT PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	"UK3CB_TKM_O_SL",
	//Medic
	"UK3CB_TKM_O_MD",
	//Autorifleman
	"UK3CB_TKM_O_AR",
	//Marksman
	"UK3CB_TKM_O_MK",
	//Anti-tank Scout
	"UK3CB_TKM_O_LAT",
	//Anti-tank Scout
	"UK3CB_TKM_O_LAT"
];

vehCSATPVP = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_UAZ_Closed","UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Dshkm"];//This array contains the vehicles CSAT-PvP players can spawn near their flag.

vehCSATLightArmed = ["UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Hilux_Rocket","UK3CB_TKM_O_Hilux_Spg9","UK3CB_TKM_O_Hilux_Zu23"];//zu may be too much
vehCSATLightUnarmed = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_UAZ_Closed"];
vehCSATTrucks = ["UK3CB_TKM_O_Ural_Covered","UK3CB_TKM_O_V3S_Closed","UK3CB_TKM_O_V3S_Open","UK3CB_TKM_O_Ural_Open"];
vehCSATAmmoTruck = "UK3CB_TKM_O_V3S_Reammo";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["UK3CB_TKM_O_BMP1","UK3CB_TKM_O_BRDM2_ATGM","UK3CB_TKM_O_BTR60","UK3CB_TKM_O_BRDM2","UK3CB_TKM_O_BRDM2_HQ","UK3CB_TKM_O_MTLB_PKT"];
vehCSATTank = "UK3CB_TKM_O_T34";
vehCSATAA = "UK3CB_TKM_O_V3S_Zu23";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "UK3CB_TKA_O_RHIB_Gunboat";
vehCSATRBoat = "UK3CB_TKM_O_MTLB_PKT";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"UK3CB_TKM_O_BTR60"];
vehCSATPlane = "UK3CB_TKA_O_Su25SM_CAS";
vehCSATPlaneAA = "UK3CB_TKA_O_L39_AA";
vehCSATTransportPlanes = [];
vehCSATPatrolHeli = "UK3CB_TKA_O_UH1H_M240";
vehCSATTransportHelis = ["UK3CB_TKA_O_Mi8AMTSh","UK3CB_TKA_O_Mi8","UK3CB_TKC_O_Mi8AMT",vehCSATPatrolHeli];
vehCSATAttackHelis = ["UK3CB_TKA_O_Mi_24P","UK3CB_TKA_O_Mi_24V"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;
vehCSATUAV = "rhs_pchela1t_vvs";
vehCSATUAVSmall = "O_UAV_01_F";
vehCSATMRLS = "UK3CB_TKM_O_Hilux_Rocket_Arty";
vehCSATMRLSMags = "122mm_10rnds";
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "UK3CB_TKM_O_Ural_Repair","UK3CB_TKM_O_V3S_Refuel"];
vehCSATBike = "O_T_Quadbike_01_ghex_F";

CSATFlag = "Flag_TKM_O_Army";
CSATFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKM\Flag\tkm_o_flag_co.paa";
CSATAmmoBox = "O_supplyCrate_F";
//cfgCSATInf = (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry");
groupsCSATSentry = ["UK3CB_TKM_O_TL","UK3CB_TKM_O_RIF_1"];///"O_T_InfSentry";///
groupsCSATSniper = ["UK3CB_TKM_O_SPOT","UK3CB_TKM_O_SPOT"];
groupsCSATsmall = [groupsCSATSentry,["UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_RIF_2"],groupsCSATSniper];///[groupsCSATSentry,"O_T_reconSentry","O_T_SniperTeam"];///
groupsCSATAA = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_AA","UK3CB_TKM_O_AA","UK3CB_TKM_O_AA_ASST"];
groupsCSATAT = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT_ASST"];
groupsCSATmid = [["UK3CB_TKM_O_SL","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_MD"],groupsCSATAA,groupsCSATAT];///["O_T_InfTeam","O_T_InfTeam_AA","O_T_InfTeam_AT"];///
CSATSquad = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_GL","UK3CB_TKM_O_MG","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT_ASST","UK3CB_TKM_O_AR","UK3CB_TKM_O_MD"];///"O_T_InfSquad";///
CSATSpecOp = ["UK3CB_TKA_O_SL","UK3CB_TKA_O_MK","UK3CB_TKA_O_TL","UK3CB_TKA_O_AR","UK3CB_TKA_O_AA","UK3CB_TKA_O_ENG","UK3CB_TKA_O_AT","UK3CB_TKA_O_MD"];///(configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam");///
factionMaleInvaders = "UK3CB_TKM_B";
groupsCSATSquad = [CSATSquad,["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_MG","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_MK","UK3CB_TKM_O_MG_ASST","UK3CB_TKA_O_LAT","UK3CB_TKM_O_MD"],["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_AR","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_MK","UK3CB_TKM_O_IED","UK3CB_TKM_O_AA","UK3CB_TKM_O_MD"]];//[CSATSquad,"O_T_InfSquad_Weapons"];///

supportStaticCSATB = "RHS_Kord_Tripod_Bag";
ATStaticCSATB = "RHS_Kornet_Gun_Bag";
MGStaticCSATB = "RHS_Kord_Gun_Bag";
supportStaticCSATB2 = "RHS_Kornet_Tripod_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
supportStaticCSATB3 = "RHS_Podnos_Bipod_Bag";

weaponsCSAT append ["UK3CB_RPK","rhs_weap_ak103","rhs_weap_ak104_npz","rhs_weap_ak105_npz","arifle_AK12_F","arifle_AK12_GL_F","rhs_weap_ak74_2","rhs_weap_ak74_gp25","rhs_weap_ak74m_2mag","rhs_weap_ak74m_gp25_1p29","rhs_weap_ak74n_gp25","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_asval","rhs_weap_svdp","rhs_weap_svds","rhs_weap_t5000","rhs_weap_vss","rhs_weap_aks74u","rhs_weap_rpg26","rhs_weap_rpg7","hgun_Pistol_heavy_01_F","rhs_weap_igla","rhs_weap_pya","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_makarov_pm","rhs_weap_rpg7_pgo","rhs_weap_rshg2"];
ammunitionCSAT append ["rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green"];
smokeX = smokeX + ["rhs_mag_nspd","rhs_mag_rdg2_white","rhs_mag_rdg2_black"];
NVGoggles = NVGoggles + ["rhs_1PN138"];
//opticsAAF = opticsAAF + ["rhs_acc_1p29","rhs_acc_1p63","rhs_acc_rakursPM","rhs_acc_1p78","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_dh520x56","rhs_acc_ekp1","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_pso1m21"];
itemsAAF = itemsAAF + ["rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","rhs_acc_uuk","rhs_acc_dtk1l","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","rhs_item_flightrecorder","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhs_acc_perst3_2dp_h","rhs_acc_perst3_2dp_light_h","rhs_acc_pgs64","rhs_acc_pgs64_74u","rhs_acc_pgs64_74un","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_tgpa","rhs_acc_tgpv"];

lampInvaders = "rhs_acc_2dpZenit";
flagCSATmrk = "UK3CB_Marker_O_TKM";
nameInvaders = "TKM";
if (isServer) then {"CSAT_carrier" setMarkerText "Takistani Carrier"};

if (gameMode == 4) then
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