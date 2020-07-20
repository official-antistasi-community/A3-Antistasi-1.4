////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "TKM";

//SF Faction
factionMaleInvaders = "UK3CB_TKM_O";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "UK3CB_TKP_O"};

//Flag Images
CSATFlag = "Flag_TKM_O";
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
	["3CB_TKM_Teamleader"] call A3A_fnc_getLoadout,
	//Medic
	["3CB_TKM_Medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["3CB_TKM_MachineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["3CB_TKM_Marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["3CB_TKM_AT"] call A3A_fnc_getLoadout,
	//AT2
	["3CB_TKM_AT2"] call A3A_fnc_getLoadout
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
	FIASquad = ["UK3CB_TKP_O_CIB_SL","UK3CB_TKP_O_CIB_RIF_2","UK3CB_TKP_O_CIB_AT","UK3CB_TKP_O_CIB_MD","UK3CB_TKP_O_CIB_TL","UK3CB_TKP_O_CIB_AR","UK3CB_TKP_O_CIB_RIF_1","UK3CB_TKP_O_CIB_ENG"];
	groupsFIASquad = [FIASquad];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_Quadbike_01_F";
vehCSATLightArmed = ["UK3CB_TKM_O_Datsun_Pkm","UK3CB_TKM_O_Hilux_Dshkm","UK3CB_TKM_O_Hilux_GMG","UK3CB_TKM_O_Hilux_Rocket","UK3CB_TKM_O_Hilux_Spg9","UK3CB_TKM_O_Hilux_Zu23"];
vehCSATLightUnarmed = ["UK3CB_TKM_O_BTR40","UK3CB_TKM_O_Hilux_Open","UK3CB_TKM_O_UAZ_Closed"];
vehCSATTrucks = ["UK3CB_TKM_O_Ural_Covered","UK3CB_TKM_O_V3S_Closed","UK3CB_TKM_O_V3S_Open","UK3CB_TKM_O_Ural_Open"];
vehCSATAmmoTruck = "UK3CB_TKM_O_V3S_Reammo";
vehCSATRepairTruck = "UK3CB_TKM_O_Ural_Repair";
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
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck,"UK3CB_TKM_O_V3S_Refuel"];
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
ATStaticCSATB = "RHS_SPG9_Gun_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticCSATB = "RHS_Kord_Tripod_Bag";
//Tall Support
supportStaticCSATB2 = "RHS_SPG9_Tripod_Bag";
//Mortar Support
supportStaticCSATB3 = "RHS_Podnos_Bipod_Bag";
