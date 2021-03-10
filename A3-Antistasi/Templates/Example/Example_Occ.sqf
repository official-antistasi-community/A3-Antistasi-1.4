////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "";

//Police Faction
factionGEN = "";//Faction classname for police units.
//Soldier Faction
factionMaleOccupants = "";//Faction classname for normal units.
//Miltia Faction
if (gameMode != 4) then {factionFIA = ""};//Faction classname for low war level units.

//Flag Images
NATOFlag = "";//classname for the flagpole
NATOFlagTexture = "";//Texture path for the flag
flagNATOmrk = "";//classname for the map marker of the side's flag
if (isServer) then {"" setMarkerText ""};//Name for the ""

//Loot Crate
NATOAmmobox = "";//classname of the box used for loot. DO NOT CHANGE unless you have added the box to JNL!

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts - These should match the file path to the loadouts folder minus the file extension. First line is an example
NATOPlayerLoadouts = [
	//Team Leader
	["Templates\Example\Loadouts\Example loadout"] call A3A_fnc_getLoadout,
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
vehNATOPVP = ["",""];//classnames of the vehicles that PvP players of this side can spawn. Generally nothing with more than a mounted .50 cal

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "";//classname of rifleman
NATOOfficer = "";//classname of Officer
NATOOfficer2 = "";//classname of Other officer
NATOBodyG = "";//classname of Guard for the officers
NATOCrew = "";//classname of vehicle crew
NATOUnarmed = "";//classname of unarmed soldier.
NATOMarksman = "";//classname of Marksman
staticCrewOccupants = "";//classname for static weapon crew
NATOPilot = "";//classname of aircraft pilot

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "";//classname of low war level rifleman
	FIAMarksman = "";//classname of low war level marksman
	};

//Police Units
policeOfficer = "";//classname of police officer
policeGrunt = "";//classname of police officer 2

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups - These are all made using classnames of units.
//Teams
groupsNATOSentry = ["",""];//2 man sentry team
groupsNATOSniper = ["",""];//2 man sniper team
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];//array of 2 man teams, can also include further 2 man teams in [].
//Fireteams
groupsNATOAA = ["","","",""];//4 man Anti Air team.
groupsNATOAT = ["","","",""];//4 man Anti Tank team.
groupsNATOmid = [["","","",""],groupsNATOAA,groupsNATOAT];//Array of 4 man teams, can also include further 4 man teams in [].
//Squads
NATOSquad = ["","","","","","","",""];//basic 8 man squad, can be difined with vars from above or with classnames.
NATOSpecOp = ["","","","","","","",""];//Spec op 8 man squad, used for attacks and some missions.
groupsNATOSquad =//Array of 8 man squads, can also include additional squads in the same way as the team arrays. (technically they don't have to be 8 men, but 8 is a standard squad size.)
	[
	NATOSquad,
	["","","","","","","",""]
	];

//Militia Groups - Same as above, but for the low war level units. They generally have less variety but don't strictly have to be.
if (gameMode != 4) then
	{
	//Teams - 2 man teams.
	groupsFIASmall =
		[
		["",""],
		["",""]
		];
	//Fireteams - 4 man teams
	groupsFIAMid =
		[
		["","","",""],
		["","","",""]
		];
	//Squads - 8 man squads (again, not strictly 8)
	FIASquad = ["","","","","","","",""];
	groupsFIASquad = [FIASquad];//array of squads, you could define additional ones here in the same way as above.
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];//Police patrol team, usually 2 man.

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "";//Quad bike or equivalent
vehNATOLightArmed = [""];//lightly armed vehicles, technicals to MRAPs
vehNATOLightUnarmed = [""];//Unarmed vehicles, smaller than trucks.
vehNATOTrucks = ["",""];//Transport trucks. These must have cargo seats
vehNATOCargoTrucks = [];//Any trucks that cannot carry passengers.
vehNATOAmmoTruck = "";//ammotruck, self explanatory
vehNATORepairTruck = "";//Repair truck, self explanatory
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;//Don't change this line.
//Armored
vehNATOAPC = [""];//APCs, should be troop carrying.
vehNATOTank = "";//The 1 tank they can use.
vehNATOAA = "";//Anti air vehicle.
vehNATOAttack = vehNATOAPC + [vehNATOTank];//Don't change this line.
//Boats
vehNATOBoat = "";//Armed boat
vehNATORBoat = "";//Transport boat
vehNATOBoats = [vehNATOBoat,vehNATORBoat];//Don't change this line.
//Planes
vehNATOPlane = "";//CAS plane, used for air strikes
vehNATOPlaneAA = "";//CAP plane, used for air superiority
vehNATOTransportPlanes = [];//Transport plane, used for paradrops. Must have cargo seats.
//Heli
vehNATOPatrolHeli = "";//Heli to be used for patrols, Should be small and unarmed, with a few cargo seats. The AI allways have access to this one.
vehNATOTransportHelis = ["",""];//Transport helicopters, used for attacks and QRFs may have defensive armament, offensive armament will likely not be used.
vehNATOAttackHelis = [""];//Attack helicopters, used for CAS for QRFs and Attacks.
//UAV
vehNATOUAV = "";//Large UAV used for CAS in Attacks.
vehNATOUAVSmall = "";//Small survaillence drone.
//Artillery
vehNATOMRLS = "";//Artillery asset, used for attacks.
vehNATOMRLSMags = "";//magazine classname for the artillery asset.
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, vehNATORepairTruck,""];//you can add adittional vehicles that should spawn unmanned around airbases here. Such as fuel and medical trucks.
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;//Don't touch this line.

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "";//Light armed vehicle for low war level troops
	vehFIATruck = "";//Tranport truck for low war level troops
	vehFIACar = "";//unarmed vehicle for low war level troops
	};

//Police Vehicles
vehPoliceCar = "";//unarmed vehicle to be used by police.

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//These are as-per the rebel template.
//Assembled
NATOMG = "";
staticATOccupants = "";
staticAAOccupants = "";
NATOMortar = "";

//Static Weapon Bags
MGStaticNATOB = "";
ATStaticNATOB = "";
AAStaticNATOB = "";
MortStaticNATOB = "";
//Short Support
supportStaticNATOB = "";
//Tall Support
supportStaticNATOB2 = "";
//Mortar Support
supportStaticNATOB3 = "";
