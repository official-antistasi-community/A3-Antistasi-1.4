////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "BAF";

//Police Faction
factionGEN = "UK3CB_TKP_B";
//SF Faction
factionMaleOccupants = "UK3CB_BAF_Faction_Army_Desert";
//Miltia Faction
if (gameMode != 4) then {factionFIA = "UK3CB_TKA_B"};

//Flag Images
NATOFlag = "Flag_UK_F";
NATOFlagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
flagNATOmrk = "flag_UK";
if (isServer) then {"NATO_carrier" setMarkerText "HMS Queen Elizabeth"};

//Loot Crate
NATOAmmobox = "B_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["3CB_BAF_Teamleader_MTP"] call A3A_fnc_getLoadout,
	//Medic
	["3CB_BAF_Medic_MTP"] call A3A_fnc_getLoadout,
	//Autorifleman
	["3CB_BAF_MachineGunner_MTP"] call A3A_fnc_getLoadout,
	//Marksman
	["3CB_BAF_Marksman_MTP"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["3CB_BAF_AT_MTP"] call A3A_fnc_getLoadout,
	//AT2
	["3CB_BAF_AT2_MTP"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Snatch_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM","UK3CB_BAF_Husky_Passenger_GPMG_Sand_DDPM"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "UK3CB_BAF_Rifleman_DDPM";
NATOOfficer = "UK3CB_BAF_Officer_DDPM";
NATOOfficer2 = "UK3CB_BAF_FAC_DDPM";
NATOBodyG = "UK3CB_BAF_Crewman_RTR_DDPM";
NATOCrew = "UK3CB_BAF_Crewman_DDPM";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "UK3CB_BAF_Marksman_DDPM";
staticCrewOccupants = "UK3CB_BAF_GunnerStatic_DDPM";;
NATOPilot = "UK3CB_BAF_HeliPilot_RAF_DDPM";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "UK3CB_TKA_B_RIF_2";
	FIAMarksman = "UK3CB_TKA_B_MK";
	};

//Police Units
policeOfficer = "UK3CB_TKP_B_OFF";
policeGrunt = "UK3CB_TKP_B_RIF_1";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["UK3CB_BAF_Grenadier_DDPM",NATOGrunt];
groupsNATOSniper = ["UK3CB_BAF_Sniper_DDPM_Ghillie_L115_RM","UK3CB_BAF_Spotter_DDPM_Ghillie_L85_RM"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["UK3CB_TKA_B_AA","UK3CB_TKA_B_AA_ASST","UK3CB_TKA_B_AA","UK3CB_TKA_B_AA_ASST"];
groupsNATOAT = ["UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MATC_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MATC_DDPM"];
groupsNATOmid = [["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MGLMG_DDPM","UK3CB_BAF_Grenadier_DDPM","UK3CB_BAF_GunnerM6_DDPM"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["UK3CB_BAF_Officer_DDPM",NATOGrunt,"UK3CB_BAF_GunnerM6_DDPM",NATOMarksman,"UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"];
NATOSpecOp = ["UK3CB_BAF_Officer_DDPM_RM","UK3CB_BAF_Rifleman_DDPM_RM",NATOBodyG,"UK3CB_BAF_LAT_DDPM_RM","UK3CB_BAF_FAC_DDPM_RM","UK3CB_BAF_Explosive_DDPM_RM","UK3CB_BAF_LSW_DDPM_RM","UK3CB_BAF_Medic_DDPM_RM"];
groupsNATOSquad =
	[
	NATOSquad,
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_LAT_DDPM","UK3CB_BAF_MATC_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_GunnerM6_DDPM","UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MGLMG_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Grenadier_DDPM","UK3CB_BAF_Grenadier_762_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_Engineer_DDPM","UK3CB_BAF_Engineer_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["UK3CB_TKA_B_TL","UK3CB_TKA_B_RIF_1"],
		["UK3CB_TKA_B_AT","UK3CB_TKA_B_AT_ASST"],
		["UK3CB_TKA_B_SNI","UK3CB_TKA_B_SPOT"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["UK3CB_TKA_B_TL","UK3CB_TKA_B_AR","UK3CB_TKA_B_ENG","UK3CB_TKA_B_LAT"],
		["UK3CB_TKA_B_TL","UK3CB_TKA_B_MG","UK3CB_TKA_B_MG_ASST","UK3CB_TKA_B_LAT"],
		["UK3CB_TKA_B_TL","UK3CB_TKA_B_MK","UK3CB_TKA_B_DEM","UK3CB_TKA_B_LAT"]
		];
	//Squads
	FIASquad = ["UK3CB_TKA_B_SL","UK3CB_TKA_B_LAT","UK3CB_TKA_B_MK","UK3CB_TKA_B_RIF_1","UK3CB_TKA_B_TL","UK3CB_TKA_B_AR","UK3CB_TKA_B_LAT","UK3CB_TKA_B_MD"];
	groupsFIASquad = [FIASquad];
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "B_T_Quadbike_01_F";
vehNATOLightArmed = ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A_DDPM","UK3CB_BAF_Husky_Passenger_GMG_Sand_DDPM_RM","UK3CB_BAF_Husky_Passenger_GPMG_Sand_DDPM_RM","UK3CB_BAF_Husky_Passenger_HMG_Sand_DDPM_RM"];
vehNATOLightUnarmed = ["UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Snatch_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM"];
vehNATOTrucks = ["UK3CB_BAF_MAN_HX58_Transport_Sand_DDPM","UK3CB_BAF_MAN_HX60_Transport_Sand_DDPM"];
vehNATOCargoTrucks = ["UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM","UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM"];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_usarmy_d";
vehNATORepairTruck = "UK3CB_BAF_MAN_HX58_Repair_Sand_DDPM";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["UK3CB_BAF_FV432_Mk3_GPMG_Sand_DDPM","UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM","UK3CB_BAF_Warrior_A3_D_MTP_RM","UK3CB_BAF_Warrior_A3_D_Cage_MTP_RM","UK3CB_BAF_Warrior_A3_D_Cage_Camo_MTP_RM","UK3CB_BAF_Warrior_A3_D_Camo_MTP_RM"];
vehNATOTank = "rhsusf_m1a1aimd_usarmy";
vehNATOAA = "RHS_M6";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "UK3CB_BAF_RHIB_HMG_DDPM_RM";
vehNATORBoat = "UK3CB_BAF_RHIB_GPMG_DDPM_RM";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
//Planes
vehNATOPlane = "RHS_A10_AT";
vehNATOPlaneAA = "rhsusf_f22";
vehNATOTransportPlanes = ["UK3CB_BAF_Hercules_C3_DDPM"];
//Heli
vehNATOPatrolHeli = "UK3CB_BAF_Merlin_HC3_CSAR_DDPM_RM";
vehNATOTransportHelis = ["UK3CB_BAF_Wildcat_AH1_TRN_8A_DDPM_RM","UK3CB_BAF_Merlin_HC3_18_GPMG_DDPM_RM",vehNATOPatrolHeli,"UK3CB_BAF_Chinook_HC1_DDPM"];
vehNATOAttackHelis = ["UK3CB_BAF_Apache_AH1_CAS_DDPM_RM","UK3CB_BAF_Apache_AH1_DDPM_RM","UK3CB_BAF_Wildcat_AH1_CAS_6A_DDPM_RM","UK3CB_BAF_Wildcat_AH1_CAS_8A"];
//UAV
vehNATOUAV = "UK3CB_BAF_MQ9_Reaper_DDPM";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "rhsusf_m109d_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "UK3CB_BAF_MAN_HX58_Fuel_Sand_DDPM", "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM", vehNATORepairTruck,"UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "UK3CB_TKA_B_MaxxPro_M2";
	vehFIATruck = "UK3CB_TKA_B_Ural_Open";
	vehFIACar = "UK3CB_TKA_B_M1025";
	};

//Police Vehicles
vehPoliceCar = "UK3CB_TKP_B_Hilux_Closed";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "RHS_M2StaticMG_USMC_D";
staticATOccupants = "RHS_TOW_TriPod_USMC_D";
staticAAOccupants = "RHS_Stinger_AA_pod_D";
NATOMortar = "RHS_M252_USMC_D";

//Static Weapon Bags
MGStaticNATOB = "RHS_M2_Gun_Bag";
ATStaticNATOB = "rhs_Tow_Gun_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "rhs_M252_Gun_Bag";
//Short Support
supportStaticNATOB = "rhs_TOW_Tripod_Bag";
//Tall Support
supportStaticNATOB2 = "RHS_M2_Tripod_Bag";
//Mortar Support
supportStaticNATOB3 = "rhs_M252_Bipod_Bag";
