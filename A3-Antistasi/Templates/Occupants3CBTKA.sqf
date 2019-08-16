//if (worldName == "Chernarus_summer") exitWith {call compile preProcessFileLineNumbers "Templates\Occupants3CBBAFT.sqf"};

NATOGrunt = "UK3CB_TKA_I_RIF_1";
NATOOfficer = "UK3CB_TKA_I_OFF";
NATOOfficer2 = "UK3CB_TKA_I_CREW_COMM";
NATOBodyG = "UK3CB_BAF_Crewman_RTR_DDPM";
NATOCrew = "UK3CB_TKA_I_CREW";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "UK3CB_TKA_I_MK";
staticCrewOccupants = "UK3CB_TKA_I_NAVY_CREW";
NATOPilot = "UK3CB_TKA_I_JET_PILOT";

NATOMG = "UK3CB_TKA_I_KORD_high";
NATOMortar = "UK3CB_TKA_I_D30";
staticATOccupants = "UK3CB_TKA_I_Kornet";
staticAAOccupants = "UK3CB_TKA_I_Igla_AA_pod";

//NATO PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	"UK3CB_TKA_B_SF_SL",
	//Medic
	"UK3CB_TKA_B_SF_MD",
	//Autorifleman
	"UK3CB_TKA_B_SF_AR",
	//Marksman
	"UK3CB_TKA_B_SF_MK",
	//Anti-tank Scout
	"UK3CB_TKA_B_SF_LAT",
	//Anti-tank Scout
	"UK3CB_TKA_B_SF_LAT"
];

vehNATOPVP = ["UK3CB_BAF_MAN_HX60_Container_Servicing_Air_Green","UK3CB_BAF_LandRover_Hard_FFR_Green_B_Tropical","UK3CB_BAF_LandRover_Snatch_FFR_Green_A_Tropical","UK3CB_BAF_LandRover_Soft_FFR_Green_B_Tropical","UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_Tropical_RM"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["UK3CB_TKA_I_LR_M2","UK3CB_TKA_I_LR_AGS30","UK3CB_TKA_I_LR_SPG9","UK3CB_TKA_I_GAZ_Vodnik_PKT","UK3CB_TKA_I_LR_SF_M2","UK3CB_TKA_I_LR_SF_AGS30","UK3CB_TKA_I_BTR40_MG","UK3CB_TKA_I_BRDM2","UK3CB_TKA_I_BRDM2_ATGM"];
vehNATOLightUnarmed = ["UK3CB_TKA_I_BTR40","UK3CB_TKA_I_GAZ_Vodnik","UK3CB_TKA_I_LR_Open","UK3CB_TKA_I_Hilux_Closed","UK3CB_TKA_I_BRDM2_HQ"];
vehNATOTrucks = ["UK3CB_TKA_I_V3S_Closed","UK3CB_TKA_I_V3S_Open","UK3CB_TKA_I_V3S_Recovery"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "UK3CB_TKA_I_M113_supply";
vehNATORepairTruck = "UK3CB_TKA_I_V3S_Repair";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["UK3CB_TKA_I_MTLB_PKT","UK3CB_TKA_I_BMP1","UK3CB_TKA_I_BMP2","UK3CB_TKA_I_BMP2K","UK3CB_TKA_I_BTR60","UK3CB_TKA_I_GAZ_Vodnik_KVPT","UK3CB_TKA_I_GAZ_Vodnik_Cannon"];//"B_T_APC_Tracked_01_CRV_F" has no cargo seats
vehNATOTank = "UK3CB_TKA_I_T55";
vehNATOAA = "UK3CB_TKA_I_ZsuTank";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "UK3CB_TKA_I_RHIB";
vehNATORBoat = "UK3CB_TKA_I_RHIB_Gunboat";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
vehNATOPlane = "UK3CB_TKA_I_Su25SM_CAS";
vehNATOPlaneAA = "UK3CB_TKA_I_L39_AA";
vehNATOPatrolHeli = "UK3CB_TKA_I_UH1H_M240";
vehNATOTransportHelis = ["UK3CB_TKA_I_Mi8","UK3CB_TKA_I_Mi8AMT",vehNATOPatrolHeli,"UK3CB_TKA_I_UH1H"];
vehNATOAttackHelis = ["UK3CB_TKA_I_UH1H_M240","UK3CB_TKA_I_Mi_24P","UK3CB_TKA_I_Mi_24V","UK3CB_TKA_I_Mi8AMTSh"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA];
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
vehNATOMRLS = "UK3CB_TKA_I_BM21";
vehNATOMRLSMags = "rhs_mag_40Rnd_122mm_rockets";//["Sh_155mm_AMOS","rhs_mag_155mm_m795_28",<NULL-object>,B Alpha 1-1:3 (Alberto)]
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "UK3CB_TKA_I_V3S_Refuel", "UK3CB_TKA_I_Hilux_Open", vehNATORepairTruck,"UK3CB_TKA_I_UAZ_Closed"];
vehNATOBike = "B_T_Quadbike_01_F";
NATOFlag = "Flag_TKA_O_Army";
NATOFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_o_army_co.paa";
NATOAmmobox = "B_supplyCrate_F";

//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["UK3CB_TKA_I_GL",NATOGrunt];//"B_T_InfSentry";//
groupsNATOSniper = ["UK3CB_TKA_I_SF_SNI","UK3CB_TKA_I_SF_SPOT"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["UK3CB_TKA_I_SL","UK3CB_TKA_I_AA","UK3CB_TKA_I_AA","UK3CB_TKA_I_AA_ASST"];
groupsNATOAT = ["UK3CB_TKA_I_SL","UK3CB_TKA_I_AT","UK3CB_TKA_I_AT","UK3CB_TKA_I_AT_ASST"];
groupsNATOmid = [["UK3CB_TKA_I_SL","UK3CB_TKA_I_MG","UK3CB_TKA_I_MG_ASST","UK3CB_TKA_I_RIF_2"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["UK3CB_TKA_I_SL",NATOGrunt,"UK3CB_TKA_I_DEM",NATOMarksman,"UK3CB_TKA_I_TL","UK3CB_TKA_I_AR","UK3CB_TKA_I_LAT","UK3CB_TKA_I_MD"];//"B_T_InfSquad";//
NATOSpecOp = ["UK3CB_TKA_I_SF_SL","UK3CB_TKA_I_SF_RIF_1","UK3CB_TKA_I_SF_MD","UK3CB_TKA_I_SF_RIF_2","UK3CB_TKA_I_SF_LAT","UK3CB_TKA_I_SF_TL","UK3CB_TKA_I_SF_DEM","UK3CB_TKA_I_SF_AR"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMaleOccupants = "UK3CB_BAF_Faction_Army_Desert";
groupsNATOSquad = [NATOSquad,["UK3CB_TKA_I_SL","UK3CB_TKA_I_AR","UK3CB_TKA_I_GL",NATOMarksman,"UK3CB_TKA_I_AT","UK3CB_TKA_I_AT_ASST","UK3CB_TKA_I_DEM","UK3CB_TKA_I_MD"],["UK3CB_TKA_I_SL","UK3CB_TKA_I_ENG","UK3CB_TKA_I_TL","UK3CB_TKA_I_MG","UK3CB_TKA_I_MG_ASST","UK3CB_TKA_I_MD","UK3CB_TKA_I_GL","UK3CB_TKA_I_RIF_2"],["UK3CB_TKA_I_SL","UK3CB_TKA_I_AR","UK3CB_TKA_I_GL",NATOMarksman,"UK3CB_TKA_I_TL","UK3CB_TKA_I_AT","UK3CB_TKA_I_AT_ASST","UK3CB_TKA_I_MD"],["UK3CB_TKA_I_SL","UK3CB_TKA_I_AR","UK3CB_TKA_I_GL","UK3CB_TKA_I_MK","UK3CB_TKA_I_ENG","UK3CB_TKA_I_LAT","UK3CB_TKA_I_DEM","UK3CB_TKA_I_MD"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///

supportStaticNATOB = "RHS_Kornet_Tripod_Bag";
ATStaticNATOB = "RHS_Kornet_Gun_Bag";
MGStaticNATOB = "RHS_Kord_Gun_Bag";
supportStaticNATOB2 = "RHS_Kord_Tripod_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "RHS_Podnos_Gun_Bag";
supportStaticNATOB3 = "RHS_Podnos_Tripod_Bag";

weaponsNato append ["UK3CB_FNFAL_FULL","UK3CB_FNFAL_PARA","UK3CB_Enfield_Rail","rhs_weap_igla","rhs_weap_svdp_wd_npz","rhs_weap_makarov_pm","rhs_weap_pb_6p9","UK3CB_RPK","UK3CB_M79","rhs_weap_pkp","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_m70ab2","rhs_weap_m70b1","rhs_weap_m76","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_savz58p_rail","rhs_weap_savz58v_rail","rhs_weap_pm63","rhs_weap_ak74m_camo","rhs_weap_ak74m_desert"];//possible weapons that spawn in NATO ammoboxes
smokeX = smokeX + ["UK3CB_BAF_SmokeShell","UK3CB_BAF_SmokeShellRed","UK3CB_BAF_SmokeShellGreen","UK3CB_BAF_SmokeShellYellow","UK3CB_BAF_SmokeShellPurple","UK3CB_BAF_SmokeShellBlue","UK3CB_BAF_SmokeShellOrange"];
NVGoggles = NVGoggles + ["rhs_1PN138"/*,"rhsusf_ANPVS_15"*/];
itemsAAF = itemsAAF + ["muzzle_snds_b","uk3cb_fnfal_suit","rhs_acc_dtk3","rhs_acc_dtk4long","rhs_acc_dtk4screws","rhs_acc_dtk4short","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_tgpa","rhs_acc_tgpv","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1","rhs_acc_dtk2","rhs_acc_dtkakm","rhs_acc_uuk","rhs_acc_1p29","rhs_acc_1p63","rhs_acc_1p78","rhs_acc_1p87","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_rakursPM","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pkas","rhs_acc_dh520x56","rhs_acc_pso1m2","rhs_acc_pso1m21","rhs_acc_ekp1","rhs_acc_ekp8_02","rhs_acc_ekp8_18","rhs_acc_nita"];
flagNATOmrk = "UK3CB_MARKER_TKA_O_Army";//ok

lampOccupants = "acc_flashlight";
nameOccupants = "TKA";
if (isServer) then {"NATO_carrier" setMarkerText "Takistani Carrier"};
