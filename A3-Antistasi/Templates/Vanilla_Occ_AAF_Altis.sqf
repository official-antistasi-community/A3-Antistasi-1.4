////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "AAF";

//Police Faction
factionGEN = "";
//SF Faction
factionMaleOccupants = "";
//Miltia Faction
if (gameMode != 4) then {factionFIA = ""};

//Flag Images
NATOFlag = "Flag_AAF_F";
NATOFlagTexture = "a3\data_f\flags\flag_aaf_co.paa";
flagNATOmrk = "flag_AAF";
if (isServer) then {"NATO_carrier" setMarkerText "AAF Carrier"};

//Loot Crate
NATOAmmobox = "I_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["Vanilla_AAF_TeamLeader_Altis"] call A3A_fnc_getLoadout,
	//Medic
	["Vanilla_AAF_Medic_Altis"] call A3A_fnc_getLoadout,
	//Autorifleman
	["Vanilla_AAF_MachineGunner_Altis"] call A3A_fnc_getLoadout,
	//Marksman
	["Vanilla_AAF_Marksman_Altis"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["Vanilla_AAF_AT1_Altis"] call A3A_fnc_getLoadout,
	//AT2
	["Vanilla_AAF_AT2_Altis"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["I_MRAP_03_F","I_MRAP_03_hmg_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "I_soldier_F";
NATOOfficer = "I_officer_F";
NATOOfficer2 = "I_G_officer_F";
NATOBodyG = "I_Soldier_SL_F";
NATOCrew = "I_crew_F";
NATOUnarmed = "I_G_Survivor_F";
NATOMarksman = "I_Soldier_M_F";
staticCrewOccupants = "I_soldier_F";
NATOPilot = "I_helipilot_F";

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "I_soldier_F";
	FIAMarksman = "I_Soldier_M_F";
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
groupsNATOSniper = ["I_Sniper_F","I_Spotter_F"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"];
groupsNATOAT = ["I_Soldier_TL_F","I_Soldier_AT_F","I_Soldier_AT_F","I_Soldier_AAT_F"];
groupsNATOmid = [["I_Soldier_TL_F","I_Soldier_GL_F","I_Soldier_AR_F","I_Soldier_LAT_F"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["I_Soldier_SL_F",NATOGrunt,"I_Soldier_LAT_F","I_Soldier_GL_F","I_Soldier_M_F","I_Soldier_AR_F","I_Soldier_A_F","I_medic_F"];
NATOSpecOp = ["I_Soldier_SL_F",NATOGrunt,"I_Soldier_LAT_F","I_Soldier_GL_F","I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_medic_F"];
groupsNATOSquad =
	[
	NATOSquad,
	["I_Soldier_SL_F",NATOGrunt,"I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_Soldier_LAT2_F","I_Soldier_LAT2_F","I_medic_F"],
	["I_Soldier_SL_F",NATOGrunt,"I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_Soldier_LAT_F","I_Soldier_LAT_F","I_medic_F"],
	["I_Soldier_SL_F",NATOGrunt,"I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_Soldier_AA_F","I_Soldier_AAA_F","I_medic_F"],
	["I_Soldier_SL_F",NATOGrunt,"I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_Soldier_AT_F","I_Soldier_AAT_F","I_medic_F"],
	["I_Soldier_SL_F",NATOGrunt,"I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_A_F","I_engineer_F","I_engineer_F","I_medic_F"]
	];

//Militia Groups
if (gameMode != 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["I_Soldier_GL_F",FIARifleman],
		[FIAMarksman,FIARifleman],
		[FIAMarksman,FIAMarksman]
		];
	//Fireteams
	groupsFIAMid =
		[
		["I_Soldier_SL_F","I_Soldier_GL_F","I_soldier_F","I_Soldier_AR_F"],
		["I_Soldier_SL_F","I_Soldier_GL_F","I_soldier_F","I_Soldier_LAT2_F"]
		];
	//Squads
	FIASquad = ["I_Soldier_SL_F","I_Soldier_GL_F","I_soldier_F","I_Soldier_AR_F","I_Soldier_LAT2_F","I_soldier_F","I_Soldier_exp_F","I_medic_F"];
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
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "I_Truck_02_fuel_F", "I_Truck_02_medical_F", vehNATORepairTruck];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "I_MRAP_03_hmg_F";
	vehFIATruck = "I_Truck_02_transport_F";
	vehFIACar = "I_MRAP_03_F";
	};

//Police Vehicles
vehPoliceCar = vehFIACar;

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled
NATOMG = "I_G_HMG_02_high_F";
staticATOccupants = "I_static_AT_F";
staticAAOccupants = "I_static_AA_F";
NATOMortar = "I_Mortar_01_F";

//Static Weapon Bags
MGStaticNATOB = "I_G_HMG_02_high_weapon_F";
ATStaticNATOB = "I_AT_01_weapon_F";
AAStaticNATOB = "I_AA_01_weapon_F";
MortStaticNATOB = "I_Mortar_01_weapon_F";
//Short Support
supportStaticNATOB = "I_G_HMG_02_support_F";
//Tall Support
supportStaticNATOB2 = "I_G_HMG_02_support_high_F";
//Mortar Support
supportStaticNATOB3 = "I_Mortar_01_support_F";
