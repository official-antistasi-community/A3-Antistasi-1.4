////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "Soviets";

//SF Faction
factionMaleInvaders = "UK3CB_CW_SOV_O_LATE";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "UK3CB_CW_SOV_O_EARLY"};

//Flag Images
CSATFlag = "Flag_CW_SOV_ARMY";
CSATFlagTexture = "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa";
flagCSATmrk = "UK3CB_Marker_CW_SOV_ARMY";
if (isServer) then {"CSAT_carrier" setMarkerText "USSRS Moskva"};

//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	["3CB_SOV_Teamleader"] call A3A_fnc_getLoadout,
	//Medic
	["3CB_SOV_Medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["3CB_SOV_MachineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["3CB_SOV_Marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["3CB_SOV_AT"] call A3A_fnc_getLoadout,
	//AT2
	["3CB_SOV_AT2"] call A3A_fnc_getLoadout
];


//PVP Player Vehicles
vehCSATPVP = ["UK3CB_CW_SOV_O_LATE_BRDM2_HQ","UK3CB_CW_SOV_O_LATE_BRDM2_UM","UK3CB_CW_SOV_O_LATE_BTR40","UK3CB_CW_SOV_O_LATE_BTR40_MG","UK3CB_CW_SOV_O_LATE_UAZ_Closed","UK3CB_CW_SOV_O_LATE_UAZ_MG","UK3CB_CW_SOV_O_LATE_UAZ_Open"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "UK3CB_CW_SOV_O_LATE_VDV_RIF_1";
CSATOfficer = "UK3CB_CW_SOV_O_LATE_VDV_FIELD_OFF";
CSATBodyG = "UK3CB_CW_SOV_O_LATE_VDV_RADIO";
CSATCrew = "UK3CB_CW_SOV_O_LATE_VDV_CREW";
CSATMarksman = "UK3CB_CW_SOV_O_LATE_VDV_MK";
staticCrewInvaders = "UK3CB_CW_SOV_O_LATE_FIELD_OFF";
CSATPilot = "UK3CB_CW_SOV_O_LATE_JET_PILOT";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "UK3CB_CW_SOV_O_EARLY_RIF_1";
	FIAMarksman = "UK3CB_CW_SOV_O_EARLY_MK";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["UK3CB_CW_SOV_O_LATE_VDV_RIF_1","UK3CB_CW_SOV_O_LATE_VDV_RIF_2"];
groupsCSATSniper = ["UK3CB_CW_SOV_O_LATE_VDV_MK","UK3CB_CW_SOV_O_LATE_VDV_RIF_2"];
groupsCSATsmall = [groupsCSATSentry,groupsCSATSniper];
//Fireteams
groupsCSATAA = ["UK3CB_CW_SOV_O_LATE_VDV_AA","UK3CB_CW_SOV_O_LATE_VDV_AA_ASST","UK3CB_CW_SOV_O_LATE_VDV_AA","UK3CB_CW_SOV_O_LATE_VDV_AA_ASST"];
groupsCSATAT = ["UK3CB_CW_SOV_O_LATE_VDV_AT","UK3CB_CW_SOV_O_LATE_VDV_AT_ASST","UK3CB_CW_SOV_O_LATE_VDV_AT","UK3CB_CW_SOV_O_LATE_VDV_AT_ASST"];
groupsCSATmid = [["UK3CB_CW_SOV_O_LATE_VDV_TL","UK3CB_CW_SOV_O_LATE_VDV_AR","UK3CB_CW_SOV_O_LATE_VDV_LAT","UK3CB_CW_SOV_O_LATE_VDV_MD"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["UK3CB_CW_SOV_O_LATE_VDV_SL","UK3CB_CW_SOV_O_LATE_VDV_LAT","UK3CB_CW_SOV_O_LATE_VDV_GL","UK3CB_CW_SOV_O_LATE_VDV_ENG","UK3CB_CW_SOV_O_LATE_VDV_TL","UK3CB_CW_SOV_O_LATE_VDV_MG","UK3CB_CW_SOV_O_LATE_VDV_MG_ASST","UK3CB_CW_SOV_O_LATE_VDV_MD"];
CSATSpecOp = ["UK3CB_CW_SOV_O_LATE_SF_SL","UK3CB_CW_SOV_O_LATE_SF_MK","UK3CB_CW_SOV_O_LATE_SF_GL","UK3CB_CW_SOV_O_LATE_SF_AR","UK3CB_CW_SOV_O_LATE_SF_TL","UK3CB_CW_SOV_O_LATE_SF_AT","UK3CB_CW_SOV_O_LATE_SF_AT_ASST","UK3CB_CW_SOV_O_LATE_SF_MD"];
groupsCSATSquad =
	[
	CSATSquad,
	["UK3CB_CW_SOV_O_LATE_VDV_SL","UK3CB_CW_SOV_O_LATE_VDV_AR","UK3CB_CW_SOV_O_LATE_VDV_DEM","UK3CB_CW_SOV_O_LATE_VDV_TL","UK3CB_CW_SOV_O_LATE_VDV_MK","UK3CB_CW_SOV_O_LATE_VDV_RADIO","UK3CB_CW_SOV_O_LATE_VDV_LAT","UK3CB_CW_SOV_O_LATE_VDV_MD"],
	["UK3CB_CW_SOV_O_LATE_VDV_SL","UK3CB_CW_SOV_O_LATE_VDV_AR","UK3CB_CW_SOV_O_LATE_VDV_ENG","UK3CB_CW_SOV_O_LATE_VDV_TL","UK3CB_CW_SOV_O_LATE_VDV_MK","UK3CB_CW_SOV_O_LATE_VDV_RADIO","UK3CB_CW_SOV_O_LATE_VDV_LAT","UK3CB_CW_SOV_O_LATE_VDV_MD"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["UK3CB_CW_SOV_O_EARLY_GL","UK3CB_CW_SOV_O_EARLY_RIF_1"],
		["UK3CB_CW_SOV_O_EARLY_LAT","UK3CB_CW_SOV_O_EARLY_RIF_2"],
		["UK3CB_CW_SOV_O_EARLY_JNR_OFF","UK3CB_CW_SOV_O_EARLY_MK"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_GL","UK3CB_CW_SOV_O_EARLY_AR","UK3CB_CW_SOV_O_EARLY_ENG"],
		["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MK","UK3CB_CW_SOV_O_EARLY_LAT","UK3CB_CW_SOV_O_EARLY_DEM"],
		["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_AT","UK3CB_CW_SOV_O_EARLY_AT_ASST","UK3CB_CW_SOV_O_EARLY_RIF_1"]
		];
	//Squads
	FIASquad = ["UK3CB_CW_SOV_O_EARLY_SL","UK3CB_CW_SOV_O_EARLY_LAT","UK3CB_CW_SOV_O_EARLY_MK","UK3CB_CW_SOV_O_EARLY_ENG","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MG","UK3CB_CW_SOV_O_EARLY_MG_ASST","UK3CB_CW_SOV_O_EARLY_MD"];
	groupsFIASquad = [FIASquad];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_Quadbike_01_F";
vehCSATLightArmed = ["UK3CB_CW_SOV_O_LATE_BRDM2","UK3CB_CW_SOV_O_LATE_BRDM2_ATGM","UK3CB_CW_SOV_O_LATE_BRDM2_HQ","UK3CB_CW_SOV_O_LATE_BTR40_MG","UK3CB_CW_SOV_O_LATE_UAZ_MG"];
vehCSATLightUnarmed = ["UK3CB_CW_SOV_O_LATE_UAZ_Open","UK3CB_CW_SOV_O_LATE_UAZ_Closed","UK3CB_CW_SOV_O_LATE_BRDM2_UM","UK3CB_CW_SOV_O_LATE_BTR40"];
vehCSATTrucks = ["UK3CB_CW_SOV_O_LATE_Ural","UK3CB_CW_SOV_O_LATE_Ural_Open"];
vehCSATAmmoTruck = "UK3CB_CW_SOV_O_LATE_Ural_Ammo";
vehCSATRepairTruck = "UK3CB_CW_SOV_O_LATE_Ural_Repair";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["UK3CB_CW_SOV_O_LATE_MTLB_PKT","UK3CB_CW_SOV_O_LATE_BTR60","UK3CB_CW_SOV_O_LATE_BTR70","UK3CB_CW_SOV_O_LATE_BTR80","UK3CB_CW_SOV_O_LATE_BTR80a","UK3CB_CW_SOV_O_LATE_BMD1","UK3CB_CW_SOV_O_LATE_BMD1K","UK3CB_CW_SOV_O_LATE_BMD1P","UK3CB_CW_SOV_O_LATE_BMD1PK","UK3CB_CW_SOV_O_LATE_BMD1R","UK3CB_CW_SOV_O_LATE_BMP1","UK3CB_CW_SOV_O_LATE_BMP2","UK3CB_CW_SOV_O_LATE_BMP2K"];
vehCSATTank = "UK3CB_CW_SOV_O_LATE_T55";
vehCSATAA = "UK3CB_CW_SOV_O_LATE_ZsuTank";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "UK3CB_TKA_O_RHIB_Gunboat";
vehCSATRBoat = "UK3CB_CW_SOV_O_LATE_MTLB_PKT";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"UK3CB_CW_SOV_O_LATE_BTR80"];
//Planes
vehCSATPlane = "UK3CB_CW_SOV_O_LATE_Su25SM";
vehCSATPlaneAA = "UK3CB_CW_SOV_O_LATE_MIG29S";
vehCSATTransportPlanes = [];
//Heli
vehCSATPatrolHeli = "UK3CB_CW_SOV_O_LATE_Mi8AMT";
vehCSATTransportHelis = ["UK3CB_CW_SOV_O_LATE_Mi8","UK3CB_CW_SOV_O_LATE_Mi8AMTSh",vehCSATPatrolHeli];
vehCSATAttackHelis = ["UK3CB_CW_SOV_O_LATE_Mi8AMTSh","UK3CB_CW_SOV_O_LATE_Mi_24P","UK3CB_CW_SOV_O_LATE_Mi_24V"];
//UAV
vehCSATUAV = "rhs_pchela1t_vvsc";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "UK3CB_CW_SOV_O_LATE_BM21";
vehCSATMRLSMags = "rhs_mag_m21of_1";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck,"UK3CB_CW_SOV_O_LATE_Ural_Fuel"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "UK3CB_CW_SOV_O_EARLY_BRDM2";
	vehFIATruck = "UK3CB_CW_SOV_O_EARLY_Ural_Recovery";
	vehFIACar = "UK3CB_CW_SOV_O_EARLY_UAZ_Closed";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "UK3CB_CW_SOV_O_Late_DSHKM";
staticATInvaders = "UK3CB_CW_SOV_O_Late_Metis";
staticAAInvaders = "UK3CB_CW_SOV_O_Late_Igla_AA_pod";
CSATMortar = "UK3CB_CW_SOV_O_Late_2b14_82mm";

//Static Weapon Bags
MGStaticCSATB = "RHS_DShkM_Gun_Bag";
ATStaticCSATB = "RHS_Metis_Gun_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
//Short Support
supportStaticCSATB = "RHS_DShkM_TripodHigh_Bag";
//Tall Support
supportStaticCSATB2 = "RHS_Metis_Tripod_Bag";
//Mortar Support
supportStaticCSATB3 = "RHS_Podnos_Bipod_Bag";
