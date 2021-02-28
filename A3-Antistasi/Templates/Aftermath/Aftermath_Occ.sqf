////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "New California Republic";

//Police Faction
factionGEN = "NCRF";//Faction classname for police units.
//Soldier Faction
factionMaleOccupants = "NCRF";//Faction classname for normal units.
//Miltia Faction
if (gameMode != 4) then {factionFIA = "NCRF"};//Faction classname for low war level units.

//Flag Images
NATOFlag = "Flag_NATO_F";
NATOFlagTexture = "\Templates\Aftermath\ncr_flag_antistasi.paa";
flagNATOmrk = "flag_NATO";
if (isServer) then {"NATO_carrier" setMarkerText "NCR Forward Operating Base"};

//Loot Crate
NATOAmmobox = "B_supplyCrate_F";


////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts - These should match the file path to the loadouts folder minus the file extension. First line is an example
NATOPlayerLoadouts = [
	//Team Leader
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout,
	//Autorifleman
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout,
	//AT2
	["Templates\Aftermath\Loadouts\NCRTrooper"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehNATOPVP = ["B_MRAP_01_F","B_MRAP_01_hmg_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "armor_ncr_trooper_11_body";//classname of rifleman
NATOOfficer = "armor_ncr_trooper_13_body";//classname of Officer
NATOOfficer2 = "armor_ncr_trooper_MP_body";//classname of Other officer
NATOBodyG = "armor_ncr_trooper_19_body";//classname of Guard for the officers
NATOCrew = "B_crew_NCR";//classname of vehicle crew
NATOUnarmed = "B_Survivor_NCR";//classname of unarmed soldier.
NATOMarksman = "B_soldier_M_NCR";//classname of Marksman
staticCrewOccupants = "B_crew_NCR";//classname for static weapon crew
NATOPilot = "B_Pilot_NCR";//classname of aircraft pilot

//Militia Units
if (gameMode != 4) then
	{
	FIARifleman = "armor_ncr_trooper_11_body";//classname of low war level rifleman
	FIAMarksman = "B_soldier_M_NCR";//classname of low war level marksman
	};

//Police Units
policeOfficer = "ncr_ranger_01_body";//classname of police officer
policeGrunt = "ncr_ranger_06_body";//classname of police officer 2

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups - These are all made using classnames of units.
//Teams
groupsNATOSentry = ["armor_ncr_trooper_11_body","armor_ncr_trooper_17_body"];//2 man sentry team
groupsNATOSniper = ["B_Sharpshooter_NCR","armor_ncr_trooper_18_body"];//2 man sniper team
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];//array of 2 man teams, can also include further 2 man teams in [].
//Fireteams
groupsNATOAA = ["B_soldier_LAT_NCR","B_soldier_LAT_NCR","B_soldier_LAT_NCR","B_soldier_LAT_NCR"];//4 man Anti Air team.
groupsNATOAT = ["B_soldier_LAT_NCR","B_soldier_LAT_NCR","B_soldier_LAT_NCR","B_soldier_LAT_NCR"];//4 man Anti Tank team.
groupsNATOmid = [["armor_ncr_trooper_11_body","armor_ncr_trooper_17_body","armor_ncr_trooper_18_body","armor_ncr_trooper_15_body"],groupsNATOAA,groupsNATOAT];//Array of 4 man teams, can also include further 4 man teams in [].
//Squads
NATOSquad = ["B_Soldier_SL_NCR","armor_ncr_trooper_11_body","armor_ncr_trooper_11_body","B_soldier_LAT_NCR","armor_ncr_trooper_17_body","armor_ncr_trooper_27_body","armor_ncr_trooper_15_body","B_Sharpshooter_NCR"];//basic 8 man squad, can be difined with vars from above or with classnames.
NATOSpecOp = ["armor_ncr_1stRec_10_body","armor_ncr_ranger_11_body","armor_ncr_ranger_11_body","armor_ncr_ranger_11_body","armor_ncr_1stRec_11_body","armor_ncr_1stRec_12_body","combat_ranger11_body","combat_ranger11_body"];//Spec op 8 man squad, used for attacks and some missions.
groupsNATOSquad =//Array of 8 man squads, can also include additional squads in the same way as the team arrays. (technically they don't have to be 8 men, but 8 is a standard squad size.)
	[
	NATOSquad,
	NATOSquad
	];

//Militia Groups - Same as above, but for the low war level units. They generally have less variety but don't strictly have to be.
if (gameMode != 4) then
	{
	//Teams - 2 man teams.
	groupsFIASmall =
		[
		["armor_ncr_trooper_11_body","armor_ncr_trooper_17_body"],
		["armor_ncr_trooper_11_body","armor_ncr_trooper_17_body"]
		];
	//Fireteams - 4 man teams
	groupsFIAMid =
		[
		["B_Soldier_SL_NCR","armor_ncr_trooper_11_body","B_soldier_LAT_NCR","armor_ncr_trooper_15_body"],
		["B_Soldier_SL_NCR","armor_ncr_trooper_11_body","B_soldier_LAT_NCR","armor_ncr_trooper_15_body"]
		];
	//Squads - 8 man squads (again, not strictly 8)
	FIASquad = ["B_Soldier_SL_NCR","B_soldier_LAT_NCR","armor_ncr_trooper_11_body","armor_ncr_trooper_11_body","armor_ncr_trooper_15_body","armor_ncr_trooper_18_body","armor_ncr_trooper_27_body","B_Sharpshooter_NCR"];
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
vehNATOBike = "C_Quadbike_01_F";//Quad bike or equivalent
vehNATOLightArmed = ["uns_willysmg50", "uns_willysmg", "uns_willysm40"];//lightly armed vehicles, technicals to MRAPs
vehNATOLightUnarmed = ["uns_willys", "uns_willys_2", "uns_willys_2_usmc"];//Unarmed vehicles, smaller than trucks.
vehNATOTrucks = ["uns_M35A2","uns_M35A2_Open"];//Transport trucks. These must have cargo seats
vehNATOCargoTrucks = [];//Any trucks that cannot carry passengers.
vehNATOAmmoTruck = "uns_M35A2_ammo";//ammotruck, self explanatory
vehNATORepairTruck = "uns_M35A2_repair";//Repair truck, self explanatory
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;//Don't change this line.
//Armored
vehNATOAPC = ["uns_M113", "uns_M113_M134", "uns_M113_M2", "uns_M113_M60", "uns_M113_transport", "uns_M113_XM182"];//APCs, should be troop carrying.
vehNATOTank = "uns_m48a3";//The 1 tank they can use.
vehNATOAA = "uns_m163";//Anti air vehicle.
vehNATOAttack = vehNATOAPC + [vehNATOTank];//Don't change this line.
//Boats
vehNATOBoat = "uns_pbr";//Armed boat
vehNATORBoat = "B_Boat_Transport_01_F";//Transport boat
vehNATOBoats = [vehNATOBoat,vehNATORBoat];//Don't change this line.
//Planes
vehNATOPlane = "uns_A1J_CAS";//CAS plane, used for air strikes
vehNATOPlaneAA = "uns_A7_CAP";//CAP plane, used for air superiority
vehNATOTransportPlanes = ["uns_C130_H"];//Transport plane, used for paradrops. Must have cargo seats.
//Heli
vehNATOPatrolHeli = "uns_h13_gunship_Army";//Heli to be used for patrols, Should be small and unarmed, with a few cargo seats. The AI allways have access to this one.
vehNATOTransportHelis = ["uns_oh6_transport","uns_ch47_m60_army"];//Transport helicopters, used for attacks and QRFs may have defensive armament, offensive armament will likely not be used.
vehNATOAttackHelis = ["uns_UH1D_M60", "uns_UH1C_M21_M158"];//Attack helicopters, used for CAS for QRFs and Attacks.
//UAV
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "B_MBT_01_arty_F";
vehNATOMRLSMags = "32Rnd_155mm_Mo_shells";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, vehNATORepairTruck];//you can add adittional vehicles that should spawn unmanned around airbases here. Such as fuel and medical trucks.
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;//Don't touch this line.

//Militia Vehicles
if (gameMode != 4) then
	{
	vehFIAArmedCar = "uns_willysmg";//Light armed vehicle for low war level troops
	vehFIATruck = "uns_M35A2";//Tranport truck for low war level troops
	vehFIACar = "uns_willys";//unarmed vehicle for low war level troops
	};

//Police Vehicles
vehPoliceCar = "uns_willys_2_usmp";//unarmed vehicle to be used by police.

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//These are as-per the rebel template.
//Assembled
NATOMG = "uns_m2_high";
staticATOccupants = "uns_m2_high";
staticAAOccupants = "uns_m2_high";
NATOMortar = "uns_M1_81mm_mortar";

//Static Weapon Bags
MGStaticNATOB = "uns_m60_bunker_large";
ATStaticNATOB = "uns_M40_106mm_US";
AAStaticNATOB = "Uns_M55_Quad";
MortStaticNATOB = "Uns_M102_artillery";
//Short Support
supportStaticNATOB = "uns_m60_low";
//Tall Support
supportStaticNATOB2 = "uns_m60_high";
//Mortar Support
supportStaticNATOB3 = "Uns_M114_artillery";
