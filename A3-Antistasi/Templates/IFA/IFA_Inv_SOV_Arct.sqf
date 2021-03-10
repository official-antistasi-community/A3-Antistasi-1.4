////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameInvaders = "Soviets";

//SF Faction
factionMaleInvaders = "";
//Miltia Faction
if (gameMode == 4) then {factionFIA = "LIB_NKVD"};

//Flag Images
CSATFlag = "LIB_FlagCarrier_SU";
CSATFlagTexture = "ww2\core_t\if_decals_t\ussr\flag_su_co.paa";
flagCSATmrk = "LIB_faction_RKKA";
if (isServer) then {"CSAT_carrier" setMarkerText "Soviet Reinforcements"};
	
//Loot Crate
CSATAmmoBox = "O_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	"LIB_SOV_scout_p_officer",
	//Medic
	"LIB_SOV_medic",
	//Autorifleman
	"LIB_SOV_mgunner",
	//Marksman
	"LIB_SOV_scout_sniper",
	//Anti-tank Scout
	"LIB_SOV_LAT_Soldier",
	//AT2
	"LIB_SOV_LAT_Soldier"
];

//PVP Player Vehicles
vehCSATPVP = ["LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Willys_MB","LIB_Scout_M3"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
CSATGrunt = "LIB_SOV_rifleman";
CSATOfficer = "LIB_SOV_captain_summer";
CSATBodyG = "LIB_SOV_scout_mgunner";
CSATCrew = "LIB_SOV_tank_crew";
CSATMarksman = "LIB_SOV_scout_sniper";
staticCrewInvaders = "LIB_SOV_gun_crew";
CSATPilot = "LIB_SOV_pilot";

//Militia Units
if (gameMode == 4) then
	{
	FIARifleman = "LIB_NKVD_rifleman";
	FIAMarksman = "LIB_NKVD_LC_rifleman";
	};

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsCSATSentry = ["LIB_SOV_LC_rifleman_summer","LIB_SOV_rifleman"];
groupsCSATSniper = ["LIB_SOV_scout_sniper_autumn","LIB_SOV_scout_sergeant"];
groupsCSATsmall = [groupsCSATSentry,groupsCSATSniper];
//Fireteams
groupsCSATAA = ["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_smgunner_summer","LIB_SOV_smgunner_summer"];
groupsCSATAT = ["LIB_SOV_sergeant","LIB_SOV_rifleman","LIB_SOV_AT_soldier","LIB_SOV_AT_grenadier"];
groupsCSATmid = [["LIB_SOV_sergeant","LIB_SOV_LC_rifleman_summer","LIB_SOV_smgunner_summer","LIB_SOV_LC_rifleman_summer"],groupsCSATAA,groupsCSATAT];
//Squads
CSATSquad = ["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_LC_rifleman_summer","LIB_SOV_smgunner_summer","LIB_SOV_smgunner_summer","LIB_SOV_AT_soldier","LIB_SOV_AT_grenadier","LIB_SOV_medic"];
CSATSpecOp = ["LIB_SOV_scout_p_officer","LIB_SOV_scout_sergeant","LIB_SOV_scout_mgunner","LIB_SOV_scout_smgunner","LIB_SOV_scout_rifleman","LIB_SOV_scout_smgunner","LIB_SOV_scout_sniper","LIB_SOV_scout_sniper"];
groupsCSATSquad =
	[
	CSATSquad,
	["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_LC_rifleman_summer","LIB_SOV_sapper","LIB_SOV_smgunner_summer","LIB_SOV_AT_soldier","LIB_SOV_assault_smgunner","LIB_SOV_medic"]
	];

//Militia Groups
if (gameMode == 4) then
	{
	//Teams
	groupsFIASmall =
		[
		[FIARifleman,FIARifleman],
		[FIAMarksman,FIARifleman]
		];
	//Fireteams
	groupsFIAMid =
		[
		["LIB_NKVD_p_officer","LIB_NKVD_smgunner","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman"]
		];
	//Squads
	FIASquad = ["LIB_NKVD_lieutenant","LIB_NKVD_smgunner","LIB_NKVD_smgunner","LIB_NKVD_p_officer","LIB_NKVD_p_officer","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman","LIB_SOV_medic"];
	groupsFIASquad = [FIASquad];
	};

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehCSATBike = "O_T_Quadbike_01_ghex_F";
vehCSATLightArmed = ["LIB_Scout_M3"];
vehCSATLightUnarmed = ["LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Willys_MB"];
vehCSATTrucks = ["LIB_Zis5v","LIB_US6_Tent","LIB_US6_Open"];
vehCSATAmmoTruck = "LIB_US6_Ammo";
vehCSATRepairTruck = "LIB_Zis6_Parm";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
//Armored
vehCSATAPC = ["LIB_SdKfz251_captured","LIB_SU85","LIB_T34_76","LIB_T34_85"];
vehCSATTank = "LIB_JS2_43";
vehCSATAA = "LIB_Zis5v_61K";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
//Boats
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat];
//Planes
vehCSATPlane = "LIB_Pe2";
vehCSATPlaneAA = "LIB_P39";
vehCSATTransportPlanes = ["LIB_Li2", "LIB_Li2", "LIB_Li2", "LIB_Li2"];
//Heli
vehCSATPatrolHeli = "LIB_Li2";
vehCSATTransportHelis = [];
vehCSATAttackHelis = ["LIB_RA_P39_3","LIB_RA_P39_2"];
//UAV
vehCSATUAV = "not_supported";
vehCSATUAVSmall = "not_supported";
//Artillery
vehCSATMRLS = "LIB_US6_BM13";
vehCSATMRLSMags = "LIB_16Rnd_BM13";
//Combined Arrays
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, vehCSATRepairTruck,"LIB_Zis5v_Med","LIB_Zis5v_Fuel"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;

//Militia Vehicles
if (gameMode == 4) then
	{
	vehFIAArmedCar = "LIB_Scout_m3_w";
	vehFIATruck = "LIB_Zis5v_w";
	vehFIACar = "LIB_Willys_MB_w";
	};

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
CSATMG = "LIB_Maxim_M30_Trench";
staticATInvaders = "LIB_Zis3";
staticAAInvaders = "LIB_61k";
CSATMortar = "LIB_BM37";

//Static Weapon Bags
MGStaticCSATB = "not_supported";
ATStaticCSATB = "not_supported";
AAStaticCSATB = "not_supported";
MortStaticCSATB = "not_supported";
//Short Support
supportStaticCSATB = "not_supported";
//Tall Support
supportStaticCSATB2 = "not_supported";
//Mortar Support
supportStaticCSATB3 = "not_supported";
