////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "AAF";

//Police Faction
factionGEN = "IND_C_F";
//SF Faction
factionMaleOccupants = "";
//Miltia Faction
if (gameMode != 4) then {factionFIA = "IND_C_F"};

//Flag Images
NATOFlag = "Flag_AltisColonial_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_AltisColonial_CO.paa";
flagNATOmrk = "flag_AltisColonial";
if (isServer) then {"NATO_carrier" setMarkerText "AAF Carrier"};
	
//Loot Crate
NATOAmmobox = "I_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	"I_soldier_SL_F",
	//Medic
	"I_medic_F",
	//Autorifleman
	"I_Soldier_AR_F",
	//Marksman
	"I_Soldier_M_F",
	//Anti-tank Scout
	"I_soldier_LAT_F",
	//AT2
	"I_soldier_LAT_F"
];

//PVP Player Vehicles
vehNATOPVP = ["I_MRAP_03_F","I_MRAP_03_hmg_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "I_Soldier_F";
NATOOfficer = "I_Officer_F";
NATOOfficer2 = "I_G_officer_F";
NATOBodyG = "I_Soldier_SL_F";
NATOCrew = "I_Crew_F";
NATOUnarmed = "I_G_Survivor_F";
NATOMarksman = "I_Soldier_M_F";
staticCrewOccupants = "I_support_MG_F";
NATOPilot = "I_Helipilot_F";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "I_C_Soldier_Para_7_F";
	FIAMarksman = "I_C_Soldier_Para_2_F";
	};

//Police Units
policeOfficer = FIARifleman;
policeGrunt = FIARifleman;

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["I_Soldier_GL_F","I_soldier_F"];
groupsNATOSniper = ["I_sniper_F","I_spotter_F"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"];
groupsNATOAT = ["I_soldier_TL_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AAT_F"];
groupsNATOmid = [["I_Soldier_TL_F","I_Soldier_GL_F","I_Soldier_AR_F","I_Soldier_LAT_F"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["I_soldier_SL_F",NATOGrunt,"I_soldier_LAT_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AR_F","I_soldier_A_F","I_medic_F"];
NATOSpecOp = ["I_soldier_SL_F",NATOGrunt,"I_soldier_LAT_F","I_Soldier_GL_F","I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_medic_F"];
groupsNATOSquad =
	[
	NATOSquad,
	["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_support_Mort_F","I_support_AMort_F","I_medic_F"],
	["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_support_MG_F","I_support_AMG_F","I_medic_F"],
	["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_soldier_AA_F","I_soldier_AAA_F","I_medic_F"],
	["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_soldier_AT_F","I_soldier_AAT_F","I_medic_F"],
	["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_engineer_F","I_engineer_F","I_medic_F"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["I_C_Soldier_Para_6_F",FIARifleman],
		[FIAMarksman,FIARifleman],
		[FIAMarksman,FIAMarksman]
		];
	//Fireteams
	groupsFIAMid =
		[
		["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F"],
		["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F"]
		];
	//Squads
	FIASquad = ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"];
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
vehNATOBike = "I_Quadbike_01_F";
vehNATOLightArmed = ["I_MRAP_03_hmg_F"];
vehNATOLightUnarmed = ["I_MRAP_03_F"];
vehNATOTrucks = ["I_Truck_02_covered_F","I_Truck_02_transport_F"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "I_Truck_02_ammo_F";
vehNATORepairTruck = "I_Truck_02_box_F";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["I_APC_Wheeled_03_cannon_F"];
vehNATOTank = "I_MBT_03_cannon_F";
vehNATOAA = "I_LT_01_AA_F";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "I_Boat_Armed_01_minigun_F";
vehNATORBoat = "I_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
//Planes
vehNATOPlane = "I_Plane_Fighter_03_dynamicLoadout_F";
vehNATOPlaneAA = "I_Plane_Fighter_04_F";
vehNATOTransportPlanes = [];
//Heli
vehNATOPatrolHeli = "I_Heli_light_03_unarmed_F";
vehNATOTransportHelis = ["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"];
vehNATOAttackHelis = ["I_Heli_light_03_dynamicLoadout_F"];
//UAV
vehNATOUAV = "I_UAV_02_dynamicLoadout_F";
vehNATOUAVSmall = "I_UAV_01_F";
//Artillery
vehNATOMRLS = "I_Truck_02_MRL_F";
vehNATOMRLSMags = "12Rnd_230mm_rockets";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "I_Truck_02_fuel_F", "I_Truck_02_medical_F", vehNATORepairTruck,"I_APC_tracked_03_cannon_F"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "I_C_Offroad_02_LMG_F";
	vehFIATruck = "I_C_Van_01_transport_F";
	vehFIACar = "I_C_Offroad_01_F";
	};

//Police Vehicles
vehPoliceCar = vehFIACar;

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled
NATOMG = "I_HMG_01_high_F";
staticATOccupants = "I_static_AT_F";
staticAAOccupants = "I_static_AA_F";
NATOMortar = "I_Mortar_01_F";

//Static Weapon Bags
MGStaticNATOB = "I_HMG_01_high_weapon_F";
ATStaticNATOB = "I_AT_01_weapon_F";
AAStaticNATOB = "I_AA_01_weapon_F";
MortStaticNATOB = "I_Mortar_01_weapon_F";
//Short Support
supportStaticNATOB = "I_HMG_01_support_F";
//Tall Support
supportStaticNATOB2 = "I_HMG_01_support_high_F";
//Mortar Support
supportStaticNATOB3 = "I_Mortar_01_support_F";
