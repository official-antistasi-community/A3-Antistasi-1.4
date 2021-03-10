////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////

//This is the same as the Occ template with a couple of assets not listed as they are not used by Inv.

//Name Used for notifications
nameInvaders = "";

//SF Faction
factionMaleInvaders = "";
//Miltia Faction
if (gameMode == 4) then {factionFIA = ""};

//Flag Images
CSATFlag = "";
CSATFlagTexture = "";
flagCSATmrk = "";
if (isServer) then {"CSAT_carrier" setMarkerText ""};

//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	[""] call A3A_fnc_getLoadout,
	//Medic
	[""] call A3A_fnc_getLoadout,
	//Autorifleman
	[""] call A3A_fnc_getLoadout,
	//Marksman
	[""] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	[""] call A3A_fnc_getLoadout,
	//AT2
	[""] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehCSATPVP = ["","","",""];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "";
CSATOfficer = "";
CSATBodyG = "";
CSATCrew = "";
CSATMarksman = "";
staticCrewInvaders = "";
CSATPilot = "";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "";
	FIAMarksman = "";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["",""];
groupsCSATSniper = ["",""];
groupsCSATsmall = [groupsCSATSentry,["",""],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["","","",""];
groupsCSATAT = ["","","",""];
groupsCSATmid = [["","","",""],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["","","","","","","",""];
CSATSpecOp = ["","","","","",""];
groupsCSATSquad =
	[
	CSATSquad,
	["","","","","","","",""]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["",FIARifleman],
		[FIAMarksman,FIARifleman],
		["",""]
		];
	//Fireteams
	groupsFIAMid =
		[
		["","","",FIAMarksman],
		["","","",""],
		["","","",""]
		];
	//Squads
	FIASquad = ["","","",FIARifleman,FIARifleman,FIAMarksman,"",""];
	groupsFIASquad =
		[
		FIASquad,
		["","","",FIARifleman,"","","",""]
		];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "";
vehCSATLightArmed = ["","",""];
vehCSATLightUnarmed = ["",""];
vehCSATTrucks = ["",""];
vehCSATAmmoTruck = "";
vehCSATRepairTruck = "";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["",""];
vehCSATTank = "";
vehCSATAA = "";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "";
vehCSATRBoat = "";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,""];
//Planes
vehCSATPlane = "";
vehCSATPlaneAA = "";
vehCSATTransportPlanes = [""];
//Heli
vehCSATPatrolHeli = "";
vehCSATTransportHelis = ["",vehCSATPatrolHeli];
vehCSATAttackHelis = ["",""];
//UAV
vehCSATUAV = "";
vehCSATUAVSmall = "";
//Artillery
vehCSATMRLS = "";
vehCSATMRLSMags = "";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck, "", ""];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "";
	vehFIATruck = "";
	vehFIACar = "";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "";
staticATInvaders = "";
staticAAInvaders = "";
CSATMortar = "";

//Static Weapon Bags
MGStaticCSATB = "";
ATStaticCSATB = "";
AAStaticCSATB = "";
MortStaticCSATB = "";
//Short Support
supportStaticCSATB = "";
//Tall Support
supportStaticCSATB2 = "";
//Mortar Support
supportStaticCSATB3 = "";
