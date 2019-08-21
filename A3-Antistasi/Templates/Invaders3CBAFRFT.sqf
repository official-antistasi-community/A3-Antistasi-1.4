//if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\teamPlayer3CBBAFT.sqf"} else {

CSATGrunt = "rhs_msv_rifleman";
CSATOfficer = "rhs_msv_officer";
CSATBodyG = "rhs_msv_efreitor";
CSATCrew = "rhs_msv_armoredcrew";
CSATMarksman = "rhs_msv_marksman";
staticCrewInvaders = "rhs_msv_armoredcrew";
CSATPilot = "rhs_pilot";

CSATMortar = "rhs_2b14_82mm_vmf";
CSATMG = "rhs_KORD_high_VMF";
staticATInvaders = "rhs_Kornet_9M133_2_vmf";
staticAAInvaders = "RHS_ZU23_MSV";

//CSAT PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	"rhs_vdv_recon_sergeant",
	//Medic
	"rhs_vdv_recon_medic",
	//Autorifleman
	"rhs_vdv_recon_arifleman",
	//Marksman
	"rhs_vdv_recon_marksman",
	//Anti-tank Scout
	"rhs_vdv_recon_rifleman_lat",
	//Anti-tank Scout
	"rhs_vdv_recon_rifleman_lat"
]

vehCSATPVP = ["rhs_tigr_msv","rhs_uaz_msv","rhsgref_BRDM2UM_msv","rhs_tigr_m_msv","rhs_tigr_sts_msv"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehCSATLightArmed = ["rhsgref_BRDM2_msv","rhsgref_BRDM2_HQ_msv","rhsgref_BRDM2_ATGM_msv","rhs_tigr_sts_msv"];
vehCSATLightUnarmed = ["rhs_tigr_msv","rhs_uaz_msv","rhsgref_BRDM2UM_msv","rhs_tigr_m_msv"];
vehCSATTrucks = ["rhs_kamaz5350_msv","rhs_kamaz5350_open_msv","RHS_Ural_Open_MSV_01","rhs_gaz66_msv"];
vehCSATAmmoTruck = "rhs_gaz66_ammo_msv";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_bmp3_msv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3mera_msv","rhs_brm1k_msv","rhs_Ob_681_2","rhs_prp3_msv"];
vehCSATTank = "rhs_t90a_tv";
vehCSATAA = "rhs_zsu234_aa";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"rhs_btr80a_msv"];
vehCSATPlane = "RHS_Su25SM_CAS_vvs";
vehCSATPlaneAA = "RHS_T50_vvs_blueonblue";
vehCSATPatrolHeli = "RHS_ka60_gray";
vehCSATTransportHelis = ["RHS_Mi24V_vdv","RHS_Mi24P_vdv","RHS_Mi8MTV3_vdv",vehCSATPatrolHeli];
vehCSATAttackHelis = ["RHS_Ka52_vvs","RHS_mi28n_vvs"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA];
vehCSATUAV = "rhs_pchela1t_vvs";
vehCSATUAVSmall = "O_UAV_01_F";
vehCSATMRLS = "rhs_2s3_tv";
vehCSATMRLSMags = "rhs_mag_HE_2a33";
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "rhs_gaz66_repair_msv","RHS_Ural_Fuel_MSV_01"];
vehCSATBike = "O_T_Quadbike_01_ghex_F";

CSATFlag = "rhs_Flag_Russia_F";
CSATFlagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
CSATAmmoBox = "O_supplyCrate_F";
//cfgCSATInf = (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry");
groupsCSATSentry = ["rhs_msv_sergeant","rhs_msv_rifleman"];///"O_T_InfSentry";///
groupsCSATSniper = ["rhs_msv_marksman","rhs_msv_rifleman"];
groupsCSATsmall = [groupsCSATSentry,["rhs_msv_medic","rhs_msv_RShG2"],groupsCSATSniper];///[groupsCSATSentry,"O_T_reconSentry","O_T_SniperTeam"];///
groupsCSATAA = ["rhs_msv_junior_sergeant","rhs_msv_aa","rhs_msv_aa","rhs_msv_aa"];
groupsCSATAT = ["rhs_msv_junior_sergeant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_LAT"];
groupsCSATmid = [["rhs_msv_efreitor","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_medic"],groupsCSATAA,groupsCSATAT];///["O_T_InfTeam","O_T_InfTeam_AA","O_T_InfTeam_AT"];///
CSATSquad = ["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_grenadier_rpg","rhs_msv_strelok_rpg_assist","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_rifleman","rhs_msv_medic"];///"O_T_InfSquad";///
CSATSpecOp = ["rhs_vdv_recon_sergeant","rhs_vdv_recon_rifleman_scout","rhs_vdv_recon_efreitor","rhs_vdv_recon_arifleman","rhs_vdv_recon_machinegunner_assistant","rhs_vdv_flora_engineer","rhs_vdv_recon_rifleman_lat","rhs_vdv_recon_medic"];///(configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam");///
factionMaleInvaders = "rhs_faction_msv";
groupsCSATSquad = [CSATSquad,["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_arifleman","rhs_msv_rifleman","rhs_msv_marksman","rhs_msv_machinegunner_assistant","rhs_msv_LAT","rhs_msv_medic"],["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_arifleman","rhs_msv_rifleman","rhs_msv_marksman","rhs_msv_machinegunner_assistant","rhs_msv_aa","rhs_msv_medic"]];//[CSATSquad,"O_T_InfSquad_Weapons"];///

supportStaticCSATB = "RHS_Kord_Tripod_Bag";
ATStaticCSATB = "RHS_Kornet_Gun_Bag";
MGStaticCSATB = "RHS_Kord_Gun_Bag";
supportStaticCSATB2 = "RHS_Kornet_Tripod_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
supportStaticCSATB3 = "RHS_Podnos_Bipod_Bag";

weaponsCSAT append ["rhs_weap_ak103","rhs_weap_ak104_npz","rhs_weap_ak105_npz","arifle_AK12_F","arifle_AK12_GL_F","rhs_weap_ak74_2","rhs_weap_ak74_gp25","rhs_weap_ak74m_2mag","rhs_weap_ak74m_gp25_1p29","rhs_weap_ak74n_gp25","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_asval","rhs_weap_svdp","rhs_weap_svds","rhs_weap_t5000","rhs_weap_vss","rhs_weap_aks74u","rhs_weap_rpg26","rhs_weap_rpg7","hgun_Pistol_heavy_01_F","rhs_weap_igla","rhs_weap_pya","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_makarov_pm","rhs_weap_rpg7_pgo","rhs_weap_rshg2"];
ammunitionCSAT append ["rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green"];
smokeX = smokeX + ["rhs_mag_nspd","rhs_mag_rdg2_white","rhs_mag_rdg2_black"];
NVGoggles = NVGoggles + ["rhs_1PN138"];
//opticsAAF = opticsAAF + ["rhs_acc_1p29","rhs_acc_1p63","rhs_acc_rakursPM","rhs_acc_1p78","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_dh520x56","rhs_acc_ekp1","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_pso1m21"];
itemsAAF = itemsAAF + ["rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","rhs_acc_uuk","rhs_acc_dtk1l","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","rhs_item_flightrecorder","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhs_acc_perst3_2dp_h","rhs_acc_perst3_2dp_light_h","rhs_acc_pgs64","rhs_acc_pgs64_74u","rhs_acc_pgs64_74un","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_tgpa","rhs_acc_tgpv"];

lampInvaders = "rhs_acc_2dpZenit";
flagCSATmrk = "rhs_flag_Russia";
nameInvaders = "AFRF";
if (isServer) then {"CSAT_carrier" setMarkerText "RFS Minsk"};


//};
