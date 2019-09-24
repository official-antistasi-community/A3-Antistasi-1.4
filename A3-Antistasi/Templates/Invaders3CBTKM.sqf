//Call to Tanoa Invader Template
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\Invaders3CBAFRFT.sqf"};
////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "TKM";

//SF Faction
factionMaleInvaders = "UK3CB_TKM_B";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "UK3CB_TKP_O"};

//Flag Images
CSATFlag = "Flag_TKM_O_Army";
CSATFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_TKM\Flag\tkm_o_flag_co.paa";
flagCSATmrk = "UK3CB_Marker_O_TKM";
if (isServer) then {"CSAT_carrier" setMarkerText "Takistani Carrier"};
	
//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
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
	//AT2
	"UK3CB_TKM_O_LAT"
];

//PVP Player Vehicles
vehCSATPVP = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_UAZ_Closed","UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Dshkm"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "UK3CB_TKM_O_RIF_1";
CSATOfficer = "UK3CB_TKM_O_WAR";
CSATBodyG = "UK3CB_TKM_O_IED";
CSATCrew = "UK3CB_TKM_O_RIF_2";
CSATMarksman = "UK3CB_TKM_O_MK";;
staticCrewInvaders = "UK3CB_TKM_O_RIF_2";
CSATPilot = "UK3CB_TKA_O_HELI_PILOT";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "UK3CB_TKP_O_RIF_1";
	FIAMarksman = "UK3CB_TKP_O_MK";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["UK3CB_TKM_O_TL","UK3CB_TKM_O_RIF_1"];
groupsCSATSniper = ["UK3CB_TKM_O_SPOT","UK3CB_TKM_O_SPOT"];
groupsCSATsmall = [groupsCSATSentry,["UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_RIF_2"],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_AA","UK3CB_TKM_O_AA","UK3CB_TKM_O_AA_ASST"];
groupsCSATAT = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT_ASST"];
groupsCSATmid = [["UK3CB_TKM_O_SL","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_RIF_1","UK3CB_TKM_O_MD"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_GL","UK3CB_TKM_O_MG","UK3CB_TKM_O_AT","UK3CB_TKM_O_AT_ASST","UK3CB_TKM_O_AR","UK3CB_TKM_O_MD"];
CSATSpecOp = ["UK3CB_TKA_O_SL","UK3CB_TKA_O_MK","UK3CB_TKA_O_TL","UK3CB_TKA_O_AR","UK3CB_TKA_O_AA","UK3CB_TKA_O_ENG","UK3CB_TKA_O_AT","UK3CB_TKA_O_MD"];
groupsCSATSquad =
	[
	CSATSquad,
	["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_MG","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_MK","UK3CB_TKM_O_MG_ASST","UK3CB_TKA_O_LAT","UK3CB_TKM_O_MD"],
	["UK3CB_TKM_O_SL","UK3CB_TKM_O_TL","UK3CB_TKM_O_AR","UK3CB_TKM_O_RIF_2","UK3CB_TKM_O_MK","UK3CB_TKM_O_IED","UK3CB_TKM_O_AA","UK3CB_TKM_O_MD"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["UK3CB_TKP_O_STATIC_GUN_NSV","UK3CB_TKP_O_STATIC_TRI_NSV"],
		["UK3CB_TKP_O_AT","UK3CB_TKP_O_RIF_2"],
		["UK3CB_TKP_O_OFF","UK3CB_TKP_O_MK"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["UK3CB_TKP_O_QRF_SL","UK3CB_TKP_O_QRF_MK","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_ENG"],
		["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_RIF_1","UK3CB_TKP_O_QRF_AT"],
		["UK3CB_TKP_O_QRF_TL","UK3CB_TKP_O_QRF_ENG","UK3CB_TKP_O_QRF_AR","UK3CB_TKP_O_QRF_AT"]
		];
	//Squads
	FIASquad = ["UK3CB_TKP_O_CIB_SL","UUK3CB_TKP_O_CIB_RIF_2","UK3CB_TKP_O_CIB_AT","UK3CB_TKP_O_CIB_MD","UK3CB_TKP_O_CIB_TL","UK3CB_TKP_O_CIB_AR","UK3CB_TKP_O_CIB_RIF_1","UK3CB_TKP_O_CIB_ENG"];
	groupsFIASquad = [FIASquad];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_T_Quadbike_01_ghex_F";
vehCSATLightArmed = ["UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Hilux_Rocket","UK3CB_TKM_O_Hilux_Spg9","UK3CB_TKM_O_Hilux_Zu23"];
vehCSATLightUnarmed = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_UAZ_Closed"];
vehCSATTrucks = ["UK3CB_TKM_O_Ural_Covered","UK3CB_TKM_O_V3S_Closed","UK3CB_TKM_O_V3S_Open","UK3CB_TKM_O_Ural_Open"];
vehCSATAmmoTruck = "UK3CB_TKM_O_V3S_Reammo";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["UK3CB_TKM_O_BMP1","UK3CB_TKM_O_BRDM2_ATGM","UK3CB_TKM_O_BTR60","UK3CB_TKM_O_BRDM2","UK3CB_TKM_O_BRDM2_HQ","UK3CB_TKM_O_MTLB_PKT"];
vehCSATTank = "UK3CB_TKM_O_T34";
vehCSATAA = "UK3CB_TKM_O_V3S_Zu23";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "UK3CB_TKA_O_RHIB_Gunboat";
vehCSATRBoat = "UK3CB_TKM_O_MTLB_PKT";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"UK3CB_TKM_O_BTR60"];
//Planes
vehCSATPlane = "UK3CB_TKA_O_Su25SM_CAS";
vehCSATPlaneAA = "UK3CB_TKA_O_L39_AA";
vehCSATTransportPlanes = [];
//Heli
vehCSATPatrolHeli = "UK3CB_TKA_O_UH1H_M240";
vehCSATTransportHelis = ["UK3CB_TKA_O_Mi8AMTSh","UK3CB_TKA_O_Mi8","UK3CB_TKC_O_Mi8AMT",vehCSATPatrolHeli];
vehCSATAttackHelis = ["UK3CB_TKA_O_Mi_24P","UK3CB_TKA_O_Mi_24V"];
//UAV
vehCSATUAV = "rhs_pchela1t_vvs";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "UK3CB_TKM_O_Hilux_Rocket_Arty";
vehCSATMRLSMags = "122mm_10rnds";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "UK3CB_TKM_O_Ural_Repair","UK3CB_TKM_O_V3S_Refuel"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "UK3CB_TKP_O_Datsun_Pickup_PKM";
	vehFIATruck = "UK3CB_TKP_O_Hilux_Open";
	vehFIACar = "UK3CB_TKP_O_Lada_Police";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "UK3CB_TKM_O_KORD_high";
staticATInvaders = "UK3CB_TKM_O_SPG9";
staticAAInvaders = "UK3CB_TKM_O_ZU23";
CSATMortar = "UK3CB_TKM_O_2b14_82mm";

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
weaponsCSAT append ["UK3CB_RPK","rhs_weap_ak103","rhs_weap_ak104_npz","rhs_weap_ak105_npz","arifle_AK12_F","arifle_AK12_GL_F","rhs_weap_ak74_2","rhs_weap_ak74_gp25","rhs_weap_ak74m_2mag","rhs_weap_ak74m_gp25_1p29","rhs_weap_ak74n_gp25","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_asval","rhs_weap_svdp","rhs_weap_svds","rhs_weap_t5000","rhs_weap_vss","rhs_weap_aks74u","rhs_weap_rpg26","rhs_weap_rpg7","hgun_Pistol_heavy_01_F","rhs_weap_igla","rhs_weap_pya","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_makarov_pm","rhs_weap_rpg7_pgo","rhs_weap_rshg2"];
ammunitionCSAT append ["rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green"];
smokeX append ["rhs_mag_nspd","rhs_mag_rdg2_white","rhs_mag_rdg2_black"];
NVGoggles pushBack "rhs_1PN138";
itemsAAF append ["rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","rhs_acc_uuk","rhs_acc_dtk1l","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","rhs_item_flightrecorder","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhs_acc_perst3_2dp_h","rhs_acc_perst3_2dp_light_h","rhs_acc_pgs64","rhs_acc_pgs64_74u","rhs_acc_pgs64_74un","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_tgpa","rhs_acc_tgpv"];