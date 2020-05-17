if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\3CB_Occ_TKA_Arid.sqf"};
//Tropcical
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
//Cheap Woodland(Tropical) Call since we dont have one yet
if (worldName == "chernarus_summer") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
if (worldName == "cup_chernarus_A3") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
if (worldName == "Enoch") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
if (worldName == "Tembelan") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
if (worldName == "vt7") exitWith {call compile preProcessFileLineNumbers "Templates\BAF_Occ_BAF_Trop.sqf"};
////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "BAF";

//Police Faction
factionGEN = "BLU_GEN_F";
//SF Faction
factionMaleOccupants = "UK3CB_BAF_Faction_Army_Desert";
//Miltia Faction
if ((gameMode != 4) and (!hasFFAA)) then {factionFIA = "UK3CB_TKP_B"};

//Flag Images
NATOFlag = "Flag_UK_F";
NATOFlagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
flagNATOmrk = "flag_UK";
if (isServer) then {"NATO_carrier" setMarkerText "HMS Ark Royal"};

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
NATOOfficer = "UK3CB_BAF_SL_DDPM";
NATOOfficer2 = "UK3CB_BAF_Officer_DDPM";
NATOBodyG = "UK3CB_BAF_Crewman_RTR_DDPM";
NATOCrew = "UK3CB_BAF_Crewman_DDPM";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "UK3CB_BAF_Marksman_DDPM";
staticCrewOccupants = "UK3CB_BAF_GunnerStatic_DDPM";;
NATOPilot = "UK3CB_BAF_HeliPilot_RAF_DDPM";

//Militia Units
if ((gameMode != 4) and (!hasFFAA)) then
	{
	FIARifleman = "UK3CB_BAF_Rifleman_Smock_DPMW";
	FIAMarksman = "UK3CB_BAF_Pointman_Smock_DPMW";
	};

//Police Units
policeOfficer = "UK3CB_ANP_B_TL";
policeGrunt = "UK3CB_ANP_B_RIF_1";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["UK3CB_BAF_Grenadier_DDPM",NATOGrunt];
groupsNATOSniper = ["UK3CB_BAF_Sniper_DDPM_Ghillie_L115_RM","UK3CB_BAF_Spotter_DDPM_Ghillie_L85_RM"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["rhsusf_army_ocp_fso","rhsusf_army_ocp_aa","rhsusf_army_ocp_aa","rhsusf_army_ocp_aa"];
groupsNATOAT = ["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MATC_DDPM"];
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
if ((gameMode != 4) and (!hasFFAA)) then
	{
	//Teams
	groupsFIASmall =
		[
		["UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],
		["UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],
		["UK3CB_BAF_Sniper_Smock_DPMW_Ghillie","UK3CB_BAF_Spotter_Smock_DPMW_Ghillie"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Pointman_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW"],
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_GunnerM6_Smock_DPMW","UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW"],
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW","UK3CB_BAF_MATC_Smock_DPMW","UK3CB_BAF_Engineer_Smock_DPMW"]
		];
	//Squads
	FIASquad = ["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW","UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW","UK3CB_BAF_Marksman_Smock_DPMW","UK3CB_BAF_Medic_Smock_DPMW"];
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
vehNATOLightArmed = ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A_DDPM","UK3CB_BAF_Jackal2_L2A1_D_DDPM","UK3CB_BAF_Coyote_Logistics_L111A1_D_DDPM","UK3CB_BAF_Coyote_Passenger_L111A1_D_DDPM","UK3CB_BAF_Husky_Passenger_GMG_Sand_DDPM_RM","UK3CB_BAF_Husky_Passenger_GPMG_Sand_DDPM_RM","UK3CB_BAF_Husky_Passenger_HMG_Sand_DDPM_RM"];
vehNATOLightUnarmed = ["UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Snatch_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM"];
vehNATOTrucks = ["UK3CB_BAF_MAN_HX58_Transport_Sand_DDPM","UK3CB_BAF_MAN_HX60_Transport_Sand_DDPM"];
vehNATOCargoTrucks = ["UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM","UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM"];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_usarmy_d";
vehNATORepairTruck = "UK3CB_BAF_MAN_HX58_Repair_Sand_DDPM";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["UK3CB_BAF_FV432_Mk3_GPMG_Sand_DDPM","UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM","UK3CB_BAF_Warrior_A3_D_MTP_RM","UK3CB_BAF_Warrior_A3_D_Cage_MTP_RM","UK3CB_BAF_Warrior_A3_D_Cage_Camo_MTP_RM","UK3CB_BAF_Warrior_A3_D_Camo_MTP_RM"];
vehNATOTank = "rhsusf_m1a2sep1d_usarmy";
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
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "rhsusf_m109d_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "UK3CB_BAF_MAN_HX58_Fuel_Sand_DDPM", "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM", vehNATORepairTruck,"UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if ((gameMode != 4) and (!hasFFAA)) then
	{
	vehFIAArmedCar = "UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW";
	vehFIATruck = "UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM";
	vehFIACar = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMW";
	};

//Police Vehicles
vehPoliceCar = "UK3CB_TKP_B_Lada_Police";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "UK3CB_BAF_Static_L111A1_Deployed_High_DDPM_RM";
staticATOccupants = "RHS_TOW_TriPod_USMC_D";
staticAAOccupants = "RHS_Stinger_AA_pod_D";
NATOMortar = "UK3CB_BAF_Static_L16_Deployed_DDPM_RM";

//Static Weapon Bags
MGStaticNATOB = "UK3CB_BAF_L111A1";
ATStaticNATOB = "rhs_Tow_Gun_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
//Short Support
supportStaticNATOB = "rhs_TOW_Tripod_Bag";
//Tall Support
supportStaticNATOB2 = "UK3CB_BAF_Tripod";
//Mortar Support
supportStaticNATOB3 = "UK3CB_BAF_L16_Tripod";
