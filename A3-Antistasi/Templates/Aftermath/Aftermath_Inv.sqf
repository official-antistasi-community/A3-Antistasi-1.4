////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////

//This is the same as the Occ template with a couple of assets not listed as they are not used by Inv.

//Name Used for notifications
nameInvaders = "Caesar's Legion";

//SF Faction
factionMaleInvaders = "CLF";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "CLF"};

//Flag Images
CSATFlag = "Flag_CSAT_F";
CSATFlagTexture = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
flagCSATmrk = "flag_CSAT";
if (isServer) then {"CSAT_carrier" setMarkerText "Caesar's Legion Hexareme"};

//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout,
	//Medic
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout,
	//Autorifleman
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout,
	//Marksman
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout,
	//AT2
	["Templates\Aftermath\Loadouts\LegionRecruit"] call A3A_fnc_getLoadout
];

//PVP Player Vehicles
vehCSATPVP = ["O_MRAP_02_F","O_MRAP_02_hmg_F"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "legion_recruit_01_body";
CSATOfficer = "legion_recruit_06_body";
CSATBodyG = "legion_pret_01_body";
CSATCrew = "legion_recruit_14_body";
CSATMarksman = "legion_recruit_05_body";
staticCrewInvaders = "legion_recruit_11_body";
CSATPilot = "legion_recruit_14_body";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "legion_recruit_11_body";
	FIAMarksman = "legion_recruit_05_body";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["legion_recruit_11_body","legion_recruit_11_body"];
groupsCSATSniper = ["legion_recruit_05_body","legion_frum_01_body"];
groupsCSATsmall = [groupsCSATSentry,["legion_recruit_07_body","legion_decan_01_body"],groupsCSATSniper];
//Fireteams
groupsCSATAA = ["recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body"];
groupsCSATAT = ["recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body"];
groupsCSATmid = [["legion_cent_01_body","legion_recruit_11_body","legion_recruit_01_body","legion_recruit_05_body"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["legion_cent_01_body","legion_decan_01_body","recruit_legion_08_body","recruit_legion_08_body","legion_recruit_11_body","legion_recruit_11_body","legion_recruit_05_body","legion_recruit_05_body"];
CSATSpecOp = ["legion_frum_01_body","legion_frum_01_body","legion_frum_01_body","legion_decan_01_body","legion_recruit_05_body","legion_recruit_05_body"];
groupsCSATSquad =
	[
	CSATSquad,
	CSATSquad
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		["legion_decan_01_body",FIARifleman],
		[FIAMarksman,FIARifleman],
		["legion_recruit_11_body","legion_recruit_11_body"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["legion_decan_01_body","legion_recruit_11_body","legion_recruit_11_body",FIAMarksman],
		["legion_decan_01_body","legion_recruit_11_body","legion_recruit_11_body","recruit_legion_08_body"],
		["legion_decan_01_body","legion_recruit_11_body","legion_recruit_11_body","recruit_legion_08_body"]
		];
	//Squads
	FIASquad = ["legion_decan_01_body","legion_recruit_11_body","legion_recruit_11_body",FIARifleman,FIARifleman,FIAMarksman,"recruit_legion_08_body","recruit_legion_08_body"];
	groupsFIASquad =
		[
		FIASquad,
		["legion_decan_01_body","legion_recruit_11_body","legion_recruit_11_body",FIARifleman,"recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body","recruit_legion_08_body"]
		];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "C_Quadbike_01_F";
vehCSATLightArmed = ["uns_willysmg50", "uns_willysmg", "uns_willysm40"];
vehCSATLightUnarmed = ["uns_willys", "uns_willys_2", "uns_willys_2_usmc"];
vehCSATTrucks = ["uns_M35A2","uns_M35A2_Open"];
vehCSATAmmoTruck = "uns_M35A2_ammo";
vehCSATRepairTruck = "uns_M35A2_repair";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["uns_M113", "uns_M113_M134", "uns_M113_M2", "uns_M113_M60", "uns_M113_transport", "uns_M113_XM182"];
vehCSATTank = "uns_m48a3";
vehCSATAA = "uns_m163";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "uns_pbr";
vehCSATRBoat = "O_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"uns_pbr"];
//Planes
vehCSATPlane = "uns_A1J_CAS";
vehCSATPlaneAA = "uns_A7_CAP";
vehCSATTransportPlanes = ["uns_C130_H"];
//Heli
vehCSATPatrolHeli = "uns_h13_gunship_Army";
vehCSATTransportHelis = ["uns_oh6_transport","uns_ch47_m60_army"];
vehCSATAttackHelis = ["uns_UH1D_M60", "uns_UH1C_M21_M158"];
//UAV
vehCSATUAV = "O_UAV_02_F";
vehCSATUAVSmall = "O_UAV_01_F";
//Artillery
vehCSATMRLS = "O_MBT_02_arty_F";
vehCSATMRLSMags = "32Rnd_155mm_Mo_shells";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "uns_willysmg";//Light armed vehicle for low war level troops
	vehFIATruck = "uns_M35A2";//Tranport truck for low war level troops
	vehFIACar = "uns_willys";//unarmed vehicle for low war level troops
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "uns_m2_high";
staticATInvaders = "uns_m2_high";
staticAAInvaders = "uns_m2_high";
CSATMortar = "uns_M1_81mm_mortar";

//Static Weapon Bags
MGStaticCSATB = "uns_m60_bunker_large";
ATStaticCSATB = "uns_M40_106mm_US";
AAStaticCSATB = "Uns_M55_Quad";
MortStaticCSATB = "Uns_M102_artillery";
//Short Support
supportStaticCSATB = "uns_m60_low";
//Tall Support
supportStaticCSATB2 = "uns_m60_high";
//Mortar Support
supportStaticCSATB3 = "Uns_M114_artillery";
