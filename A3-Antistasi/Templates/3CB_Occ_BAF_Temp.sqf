////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "BAF";

//Police Faction
factionGEN = "UK3CB_CPD_B";
//SF Faction
factionMaleOccupants = "UK3CB_BAF_Faction_Army_Temperate";
//Miltia Faction
if (gameMode != 4) then {factionFIA = "UK3CB_BAF_Faction_Army_Woodland_CW"};
//Flag Images
NATOFlag = "Flag_UK_F";
NATOFlagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
flagNATOmrk = "flag_UK";
if (isServer) then {"NATO_carrier" setMarkerText "HMS Prince of Wales"};

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
vehNATOPVP = ["UK3CB_BAF_LandRover_Hard_FFR_Green_A_MTP","UK3CB_BAF_LandRover_Snatch_FFR_Green_A_MTP","UK3CB_BAF_LandRover_Soft_FFR_Green_A_MTP","UK3CB_BAF_Husky_Passenger_GPMG_Green_DPMT"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "UK3CB_BAF_Rifleman_762_DPMT";
NATOOfficer = "UK3CB_BAF_Officer_DPMT";
NATOOfficer2 = "UK3CB_BAF_FAC_DPMT";
NATOBodyG = "UK3CB_BAF_HeliCrew_DPMT";
NATOCrew = "UK3CB_BAF_Crewman_DPMT";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "UK3CB_BAF_Sharpshooter_DPMT";
staticCrewOccupants = "UK3CB_BAF_GunnerStatic_DPMT";;
NATOPilot = "UK3CB_BAF_HeliPilot_RAF_DPMT";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "UK3CB_BAF_Rifleman_Smock_DPMW";
	FIAMarksman = "UK3CB_BAF_Pointman_Smock_DPMW";
	};

//Police Units
policeOfficer = "UK3CB_CPD_B_PAT_2";
policeGrunt = "UK3CB_CPD_B_PAT_RIF_LITE";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["UK3CB_BAF_Officer_DPMT","UK3CB_BAF_RO_DPMT"];
groupsNATOSniper = ["UK3CB_BAF_Sniper_DPMT_Ghillie_L115","UK3CB_BAF_Spotter_DPMT_Ghillie_L85"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["rhsusf_usmc_marpat_wd_fso","rhsusf_usmc_marpat_wd_stinger","rhsusf_usmc_marpat_wd_jfo","rhsusf_usmc_marpat_wd_stinger"];
groupsNATOAT = ["UK3CB_BAF_FT_762_DPMT","UK3CB_BAF_MAT_DPMT","UK3CB_BAF_MAT_DPMT","UK3CB_BAF_MATC_DPMT"];
groupsNATOmid = [["UK3CB_BAF_SC_DPMT","UK3CB_BAF_MGLMG_DPMT","UK3CB_BAF_Grenadier_762_DPMT","UK3CB_BAF_LAT_DPMT"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["UK3CB_BAF_SC_DPMT",NATOGrunt,"UK3CB_BAF_GunnerM6_DPMT",NATOMarksman,"UK3CB_BAF_FT_762_DPMT","UK3CB_BAF_LSW_DPMT","UK3CB_BAF_Explosive_DPMT","UK3CB_BAF_Medic_DPMT"];
NATOSpecOp = ["UK3CB_BAF_SC_DPMT_BPT_RM","UK3CB_BAF_Pointman_DPMT_BPT_RM","UK3CB_BAF_Pointman_DPMT_BPT_RM","UK3CB_BAF_Marksman_DPMT_BPT_RM","UK3CB_BAF_FAC_DPMT_BPT_RM","UK3CB_BAF_Explosive_DPMT_BPT_RM","UK3CB_BAF_MGLMG_DPMT_BPT_RM","UK3CB_BAF_Medic_DPMT_BPT_RM"];
groupsNATOSquad =
	[
	NATOSquad,
	["UK3CB_BAF_SC_DPMT","UK3CB_BAF_LSW_DPMT","UK3CB_BAF_Grenadier_762_DPMT",NATOMarksman,"UK3CB_BAF_LAT_ILAW_762_DPMT","UK3CB_BAF_Pointman_DPMT","UK3CB_BAF_Engineer_DPMT","UK3CB_BAF_Medic_DPMT"],
	["UK3CB_BAF_SC_DPMT","UK3CB_BAF_GunnerM6_DPMT","UK3CB_BAF_Repair_DPMT","UK3CB_BAF_MGGPMG_DPMT","UK3CB_BAF_FT_762_DPMT","UK3CB_BAF_Sharpshooter_DPMT","UK3CB_BAF_Grenadier_762_DPMT","UK3CB_BAF_Medic_DPMT"],
	["UK3CB_BAF_SC_DPMT","UK3CB_BAF_Marksman_DPMT","UK3CB_BAF_Explosive_DPMT","UK3CB_BAF_Engineer_DPMT","UK3CB_BAF_Repair_DPMT","UK3CB_BAF_Pointman_DPMT","UK3CB_BAF_LAT_762_DPMT","UK3CB_BAF_Medic_DPMT"],
	["UK3CB_BAF_SC_DPMT","UK3CB_BAF_LSW_DPMT","UK3CB_BAF_MGGPMG_DPMT","UK3CB_BAF_MGLMG_DPMT","UK3CB_BAF_Grenadier_762_DPMT","UK3CB_BAF_LAT_ILAW_762_DPMT","UK3CB_BAF_LAT_762_DPMT","UK3CB_BAF_Medic_DPMT"]
	];

//Militia Groups
if (gameMode != 4) then
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
vehNATOBike = "B_Quadbike_01_F";
vehNATOLightArmed = ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Green_B_DPMT","UK3CB_BAF_LandRover_WMIK_GMG_FFR_Green_B_DPMT","UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMT","UK3CB_BAF_Husky_Passenger_GMG_Green_DPMT","UK3CB_BAF_Husky_Passenger_GPMG_Green_DPMT","UK3CB_BAF_Husky_Passenger_HMG_Green_DPMT"];
vehNATOLightUnarmed = ["UK3CB_BAF_MAN_HX60_Container_Servicing_Air_Green","UK3CB_BAF_LandRover_Hard_FFR_Green_B_DPMT","UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMT","UK3CB_BAF_LandRover_Soft_FFR_Green_B_DPMT"];
vehNATOTrucks = ["UK3CB_BAF_MAN_HX60_Transport_Green_DPMT","UK3CB_BAF_MAN_HX58_Transport_Green_DPMT"];
vehNATOCargoTrucks = ["UK3CB_BAF_MAN_HX60_Cargo_Green_A_DPMT","UK3CB_BAF_MAN_HX58_Cargo_Green_A_DPMT"];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_usarmy_wd";
vehNATORepairTruck = "UK3CB_BAF_MAN_HX58_Repair_Green_DPMT";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["UK3CB_BAF_FV432_Mk3_GPMG_Green_DPMT","UK3CB_BAF_FV432_Mk3_RWS_Green_DPMT","UK3CB_BAF_Warrior_A3_W_MTP","UK3CB_BAF_Warrior_A3_W_Cage_MTP","UK3CB_BAF_Warrior_A3_W_Cage_Camo_MTP","UK3CB_BAF_Warrior_A3_W_Camo_MTP"];
vehNATOTank = "rhsusf_m1a1aimwd_usarmy";
vehNATOAA = "RHS_M6_wd";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "UK3CB_BAF_RHIB_HMG_DPMT";
vehNATORBoat = "UK3CB_BAF_RHIB_GPMG_DPMT";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
//Planes
vehNATOPlane = "RHS_A10_AT";
vehNATOPlaneAA = "rhsusf_f22";
vehNATOTransportPlanes = ["UK3CB_BAF_Hercules_C4_DPMT"];
//Heli
vehNATOPatrolHeli = "UK3CB_BAF_Merlin_HC3_CSAR_DPMT";
vehNATOTransportHelis = ["UK3CB_BAF_Wildcat_AH1_TRN_8A_DPMT","UK3CB_BAF_Merlin_HC3_18_GPMG_DPMT",vehNATOPatrolHeli,"UK3CB_BAF_Chinook_HC2_DPMT"];
vehNATOAttackHelis = ["UK3CB_BAF_Apache_AH1_DPMT","UK3CB_BAF_Apache_AH1_CAS_DPMT","UK3CB_BAF_Wildcat_AH1_CAS_6A_DPMT","UK3CB_BAF_Wildcat_AH1_CAS_8A_DPMT"];
//UAV
vehNATOUAV = "UK3CB_BAF_MQ9_Reaper_DPMT";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "rhsusf_m109_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "UK3CB_BAF_MAN_HX60_Fuel_Green_DPMT", "UK3CB_BAF_LandRover_Amb_FFR_Green_A_DPMT", vehNATORepairTruck,"UK3CB_BAF_FV432_Mk3_RWS_Green_DPMT"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "UK3CB_BAF_LandRover_WMIK_GPMG_FFR_Green_B_DPMT";
	vehFIATruck = "UK3CB_BAF_MAN_HX60_Cargo_Green_A_DPMT";
	vehFIACar = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMT";
	};

//Police Vehicles
vehPoliceCar = "UK3CB_CPD_B_Lada";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "RHS_M2StaticMG_USMC_WD";
staticATOccupants = "RHS_TOW_TriPod_USMC_WD";
staticAAOccupants = "RHS_Stinger_AA_pod_WD";
NATOMortar = "RHS_M252_USMC_WD";

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
