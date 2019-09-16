NATOGrunt = "LIB_GER_rifleman";
NATOOfficer = "LIB_GER_oberst";
NATOOfficer2 = "LIB_GER_hauptmann";
NATOBodyG = "SG_sturmtrooper_stggunner";
NATOCrew = "LIB_GER_tank_crew";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "LIB_GER_scout_sniper";
staticCrewOccupants = "LIB_GER_gun_crew";

NATOMG = "LIB_MG42_Lafette_Deployed";
NATOMortar = "LIB_GrWr34_g";
staticATOccupants = "LIB_FlaK_36";
staticAAOccupants = "LIB_Flakvierling_38";
NATOPilot = "LIB_GER_pilot";

//NATO PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	"LIB_FSJ_NCO",
	//Medic
	"LIB_FSJ_medic",
	//Autorifleman
	"LIB_FSJ_Soldier_2",
	//Marksman
	"LIB_FSJ_Sniper",
	//Anti-tank Scout
	"LIB_FSJ_LAT_Soldier",
	//Anti-tank Scout
	"LIB_FSJ_LAT_Soldier"
];

vehNATOPVP = ["LIB_Kfz1_Hood_sernyt","LIB_Kfz1_sernyt","LIB_Kfz1_MG42_sernyt"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["LIB_Kfz1_MG42_sernyt","LIB_SdKfz222"];
vehNATOLightUnarmed = ["LIB_Kfz1_Hood_sernyt","LIB_Kfz1_sernyt"];
vehNATOTrucks = ["LIB_OpelBlitz_Open_Y_Camo","LIB_OpelBlitz_Tent_Y_Camo"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "LIB_OpelBlitz_Ammo";
vehNATORepairTruck = "LIB_OpelBlitz_Parm";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["LIB_SdKfz251","LIB_SdKfz234_4","LIB_SdKfz234_3","LIB_SdKfz234_2"];
vehNATOTank = "LIB_PzKpfwVI_B_tarn51d";
vehNATOAA = "LIB_FlakPanzerIV_Wirbelwind";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "B_T_Boat_Armed_01_minigun_F";
vehNATORBoat = "B_T_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
vehNATOPlane = "LIB_ARR_Ju87";
vehNATOPlaneAA = "LIB_FW190F8";
vehNATOTransportPlanes = ["LIB_Ju52","LIB_Ju52","LIB_Ju52","LIB_Ju52"];
vehNATOPatrolHeli = "LIB_Ju52";
vehNATOTransportHelis = [];
vehNATOAttackHelis = ["LIB_Ju87"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;
vehNATOUAV = "not_supported";
vehNATOUAVSmall = "not_supported";
vehNATOMRLS = "LIB_SdKfz124";
vehNATOMRLSMags = "LIB_20x_Shell_105L28_Gr39HlC";
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck,"LIB_OpelBlitz_Fuel","LIB_OpelBlitz_Ambulance", vehNATORepairTruck,"LIB_SdKfz_7"];
vehNATOBike = "B_T_Quadbike_01_F";
NATOFlag = "LIB_FlagCarrier_GER";
NATOFlagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
NATOAmmobox = "B_supplyCrate_F";
//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["LIB_GER_Soldier3_base","LIB_GER_ober_rifleman"];//"B_T_InfSentry";//
groupsNATOSniper = ["LIB_GER_scout_sniper","LIB_GER_soldier_camo5_base"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["LIB_GER_unterofficer","LIB_GER_stggunner","LIB_GER_stggunner","LIB_GER_mgunner"];
groupsNATOAT = ["LIB_GER_unterofficer","LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_mgunner"];
groupsNATOmid = [["LIB_GER_unterofficer","LIB_GER_mgunner","LIB_GER_scout_ober_rifleman","LIB_GER_AT_grenadier"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["LIB_GER_unterofficer","LIB_GER_mgunner","LIB_GER_Soldier2_base","LIB_GER_scout_ober_rifleman","LIB_GER_stggunner","LIB_GER_AT_soldier","LIB_GER_AT_grenadier","LIB_GER_medic"];//"B_T_InfSquad";//
NATOSpecOp = ["LIB_FSJ_NCO","LIB_FSJ_Mgunner","LIB_FSJ_Soldier_2","LIB_FSJ_AT_soldier","LIB_FSJ_Soldier_2","LIB_FSJ_sapper","LIB_FSJ_Sniper","LIB_FSJ_medic"];
groupsNATOSquad = [NATOSquad,["LIB_GER_unterofficer","LIB_GER_mgunner","LIB_GER_smgunner","LIB_GER_AT_grenadier","LIB_GER_ober_rifleman","LIB_GER_sapper","LIB_GER_sapper_gefr","LIB_GER_medic"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///
factionMaleOccupants = "LIB_FSJ";

supportStaticNATOB = "not_supported";
ATStaticNATOB = "not_supported";
MGStaticNATOB = "not_supported";
supportStaticNATOB2 = "not_supported";
AAStaticNATOB = "not_supported";
MortStaticNATOB = "not_supported";
supportStaticNATOB3 = "not_supported";

weaponsNato append ["LIB_MP40","LIB_MP44","LIB_K98","LIB_G43","LIB_MG42","LIB_MP40","LIB_K98ZF39","LIB_RPzB","LIB_M1908"];//
ammunitionNATO append ["LIB_32Rnd_9x19","LIB_NB39","LIB_30Rnd_792x33","LIB_Shg24","LIB_5Rnd_792x57","LIB_10Rnd_792x57","LIB_50Rnd_792x57","LIB_1Rnd_RPzB","LIB_8Rnd_9x19_P08","LIB_Pwm"];//possible ammo that spawn in NATO ammoboxes
flagNATOmrk = "LIB_faction_WEHRMACHT";

nameOccupants = "Wehrmacht";
if (isServer) then {"NATO_carrier" setMarkerText "Wehrmacht Reinforcements"};

{helmets pushBackUnique (getUnitLoadout _x select 6)} forEach NATOSquad;

if (gameMode != 4) then
	{
	FIARifleman = "LIB_DAK_Soldier";
	FIAMarksman = "LIB_DAK_Sniper";
	vehFIAArmedCar = "LIB_Kfz1_MG42_camo";
	vehFIATruck = "LIB_OpelBlitz_Open_Y_Camo_w";
	vehFIACar = "LIB_Kfz1_hood_w";
	groupsFIASmall = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],[FIAMarksman,FIARifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	groupsFIAMid = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_AT_soldier","LIB_DAK_AT_grenadier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier","LIB_DAK_Sniper"]];
	FIASquad = ["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_AT_soldier","LIB_DAK_radioman","LIB_DAK_medic"];//"IRG_InfSquad";///
	groupsFIASquad = [FIASquad,["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_Sniper","LIB_DAK_radioman","LIB_DAK_medic"]];
	factionFIA = "LIB_DAK";
	};

factionGEN = "SG_STURMPANZER";
vehPoliceCar = "LIB_Kfz1_sernyt";
policeOfficer = "SG_sturmpanzer_unterofficer";
policeGrunt = "SG_sturmpanzer_crew";
groupsNATOGen = [policeOfficer,policeGrunt];