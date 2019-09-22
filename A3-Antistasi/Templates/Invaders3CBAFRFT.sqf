////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "AFRF";

//SF Faction
factionMaleInvaders = "rhs_faction_msv";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "rhs_faction_vv"};

//Flag Images
CSATFlag = "rhs_Flag_Russia_F";
CSATFlagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
flagCSATmrk = "rhs_flag_Russia";
if (isServer) then {"CSAT_carrier" setMarkerText "RFS Minsk"};
	
//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
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
	//AT2
	"rhs_vdv_recon_rifleman_lat"
];

//PVP Player Vehicles
vehCSATPVP = ["rhs_tigr_msv","rhs_uaz_msv","rhsgref_BRDM2UM_msv","rhs_tigr_m_msv","rhs_tigr_sts_msv"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "rhs_msv_rifleman";
CSATOfficer = "rhs_msv_officer";
CSATBodyG = "rhs_msv_efreitor";
CSATCrew = "rhs_msv_armoredcrew";
CSATMarksman = "rhs_msv_marksman";
staticCrewInvaders = "rhs_msv_armoredcrew";
CSATPilot = "rhs_pilot";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "rhs_vdv_izlom_rifleman_asval";
	FIAMarksman = "rhs_vdv_izlom_marksman_vss";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["rhs_msv_sergeant","rhs_msv_rifleman"];
groupsCSATSniper = ["rhs_msv_marksman","rhs_msv_rifleman"];
groupsCSATsmall = [groupsCSATSentry,["rhs_msv_medic","rhs_msv_RShG2"],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["rhs_msv_junior_sergeant","rhs_msv_aa","rhs_msv_aa","rhs_msv_aa"];
groupsCSATAT = ["rhs_msv_junior_sergeant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_LAT"];
groupsCSATmid = [["rhs_msv_efreitor","rhs_msv_rifleman","rhs_msv_rifleman","rhs_msv_medic"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_grenadier_rpg","rhs_msv_strelok_rpg_assist","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_rifleman","rhs_msv_medic"];
CSATSpecOp = ["rhs_vdv_recon_sergeant","rhs_vdv_recon_rifleman_scout","rhs_vdv_recon_efreitor","rhs_vdv_recon_arifleman","rhs_vdv_recon_machinegunner_assistant","rhs_vdv_flora_engineer","rhs_vdv_recon_rifleman_lat","rhs_vdv_recon_medic"];
groupsCSATSquad =
	[
	CSATSquad,
	["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_arifleman","rhs_msv_rifleman","rhs_msv_marksman","rhs_msv_machinegunner_assistant","rhs_msv_LAT","rhs_msv_medic"],
	["rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_arifleman","rhs_msv_rifleman","rhs_msv_marksman","rhs_msv_machinegunner_assistant","rhs_msv_aa","rhs_msv_medic"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_rifleman_LAT"],
		["rhs_vdv_izlom_marksman","rhs_vdv_izlom_rifleman_LAT"],
		["rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_marksman_vss"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_marksman_vss","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_grenadier_rpg"],
		["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_marksman"],
		["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_grenadier_rpg","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_marksman"]
		];
	//Squads
	FIASquad = ["rhs_vdv_izlom_sergeant","rhs_vdv_izlom_rifleman_LAT","rhs_vdv_izlom_marksman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_efreitor","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_grenadier_rpg"];
	groupsFIASquad = [FIASquad];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_T_Quadbike_01_ghex_F";
vehCSATLightArmed = ["rhsgref_BRDM2_msv","rhsgref_BRDM2_HQ_msv","rhsgref_BRDM2_ATGM_msv","rhs_tigr_sts_msv"];
vehCSATLightUnarmed = ["rhs_tigr_msv","rhs_uaz_msv","rhsgref_BRDM2UM_msv","rhs_tigr_m_msv"];
vehCSATTrucks = ["rhs_kamaz5350_msv","rhs_kamaz5350_open_msv","RHS_Ural_Open_MSV_01","rhs_gaz66_msv"];
vehCSATAmmoTruck = "rhs_gaz66_ammo_msv";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv","rhs_bmp1_msv","rhs_bmp1d_msv","rhs_bmp1k_msv","rhs_bmp1p_msv","rhs_bmp2e_msv","rhs_bmp2_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_bmp3_msv","rhs_bmp3_late_msv","rhs_bmp3m_msv","rhs_bmp3mera_msv","rhs_brm1k_msv","rhs_Ob_681_2","rhs_prp3_msv"];
vehCSATTank = "rhs_t90a_tv";
vehCSATAA = "rhs_zsu234_aa";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"rhs_btr80a_msv"];
//Planes
vehCSATPlane = "RHS_Su25SM_CAS_vvs";
vehCSATPlaneAA = "RHS_T50_vvs_blueonblue";
vehCSATTransportPlanes = [];
//Heli
vehCSATPatrolHeli = "RHS_ka60_gray";
vehCSATTransportHelis = ["RHS_Mi24V_vdv","RHS_Mi24P_vdv","RHS_Mi8MTV3_vdv",vehCSATPatrolHeli];
vehCSATAttackHelis = ["RHS_Ka52_vvs","RHS_mi28n_vvs"];
//UAV
vehCSATUAV = "rhs_pchela1t_vvs";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "rhs_2s3_tv";
vehCSATMRLSMags = "rhs_mag_HE_2a33";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "rhs_gaz66_repair_msv","RHS_Ural_Fuel_MSV_01"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "UK3CB_O_G_T34";
	vehFIATruck = "rhs_gaz66o_vv";
	vehFIACar = "rhsgref_BRDM2_HQ_vmf";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "rhs_KORD_high_VMF";
staticATInvaders = "rhs_Kornet_9M133_2_vmf";
staticAAInvaders = "RHS_ZU23_MSV";
CSATMortar = "rhs_2b14_82mm_vmf";

//Static Weapon Bags
MGStaticCSATB = "RHS_Kord_Gun_Bag";
ATStaticCSATB = "RHS_Kornet_Gun_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticCSATB = "RHS_Kord_Tripod_Bag";
//Tall Support
supportStaticCSATB2 = "RHS_Kornet_Tripod_Bag";
//Mortar Support
supportStaticCSATB3 = "RHS_Podnos_Bipod_Bag";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
weaponsCSAT append ["rhs_weap_ak103","rhs_weap_ak104_npz","rhs_weap_ak105_npz","arifle_AK12_F","arifle_AK12_GL_F","rhs_weap_ak74_2","rhs_weap_ak74_gp25","rhs_weap_ak74m_2mag","rhs_weap_ak74m_gp25_1p29","rhs_weap_ak74n_gp25","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_asval","rhs_weap_svdp","rhs_weap_svds","rhs_weap_t5000","rhs_weap_vss","rhs_weap_aks74u","rhs_weap_rpg26","rhs_weap_rpg7","hgun_Pistol_heavy_01_F","rhs_weap_igla","rhs_weap_pya","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_makarov_pm","rhs_weap_rpg7_pgo","rhs_weap_rshg2"];
ammunitionCSAT append ["rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green"];
smokeX = smokeX + ["rhs_mag_nspd","rhs_mag_rdg2_white","rhs_mag_rdg2_black"];
NVGoggles = NVGoggles + ["rhs_1PN138"];
itemsAAF = itemsAAF + ["rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","rhs_acc_uuk","rhs_acc_dtk1l","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","rhs_item_flightrecorder","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhs_acc_perst3_2dp_h","rhs_acc_perst3_2dp_light_h","rhs_acc_pgs64","rhs_acc_pgs64_74u","rhs_acc_pgs64_74un","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_tgpa","rhs_acc_tgpv"];