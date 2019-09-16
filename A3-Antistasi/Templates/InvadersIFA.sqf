CSATGrunt = "LIB_SOV_rifleman";
CSATOfficer = "LIB_SOV_captain_summer";
CSATBodyG = "LIB_SOV_scout_mgunner";
CSATCrew = "LIB_SOV_tank_crew";
CSATMarksman = "LIB_SOV_scout_sniper";
staticCrewInvaders = "LIB_SOV_gun_crew";
CSATPilot = "LIB_SOV_pilot";

CSATMortar = "LIB_BM37";
CSATMG = "LIB_Maxim_M30_Trench";
staticATInvaders = "LIB_Zis3";
staticAAInvaders = "LIB_61k";

//CSAT PvP Loadouts
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
	//Anti-tank Scout
	"LIB_SOV_LAT_Soldier"
];

vehCSATPVP = ["LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Willys_MB","LIB_Scout_M3"];//This array contains the vehicles CSAT-PvP players can spawn near their flag.

vehCSATLightArmed = ["LIB_Scout_M3"];
vehCSATLightUnarmed = ["LIB_GazM1_SOV","LIB_GazM1_SOV_camo_sand","LIB_Willys_MB"];
vehCSATTrucks = ["LIB_Zis5v","LIB_US6_Tent","LIB_US6_Open"];
vehCSATAmmoTruck = "LIB_US6_Ammo";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["LIB_SdKfz251_captured","LIB_SU85","LIB_T34_76","LIB_T34_85"];
vehCSATTank = "LIB_JS2_43";
vehCSATAA = "LIB_Zis5v_61K";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat];
vehCSATPlane = "LIB_Pe2";
vehCSATPlaneAA = "LIB_P39";
vehCSATTransportPlanes = ["LIB_Li2", "LIB_Li2", "LIB_Li2", "LIB_Li2"];
vehCSATPatrolHeli = "LIB_Li2";
vehCSATTransportHelis = [];
vehCSATAttackHelis = ["LIB_RA_P39_3","LIB_RA_P39_2"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA] + vehCSATTransportPlanes;
vehCSATUAV = "not_supported";
vehCSATUAVSmall = "not_supported";
vehCSATMRLS = "LIB_US6_BM13";
vehCSATMRLSMags = "LIB_16Rnd_BM13";
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck,"LIB_Zis5v_Med","LIB_Zis5v_Fuel","LIB_Zis6_Parm"];
vehCSATBike = "O_T_Quadbike_01_ghex_F";

CSATFlag = "LIB_FlagCarrier_SU";
CSATFlagTexture = "ww2\core_t\if_decals_t\ussr\flag_su_co.paa";
CSATAmmoBox = "O_supplyCrate_F";
//cfgCSATInf = (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry");
groupsCSATSentry = ["LIB_SOV_LC_rifleman_summer","LIB_SOV_rifleman"];///"O_T_InfSentry";///
groupsCSATSniper = ["LIB_SOV_scout_sniper_autumn","LIB_SOV_scout_sergeant"];
groupsCSATsmall = [groupsCSATSentry,groupsCSATSniper];///[groupsCSATSentry,"O_T_reconSentry","O_T_SniperTeam"];///
groupsCSATAA = ["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_smgunner_summer","LIB_SOV_smgunner_summer"];
groupsCSATAT = ["LIB_SOV_sergeant","LIB_SOV_rifleman","LIB_SOV_AT_soldier","LIB_SOV_AT_grenadier"];
groupsCSATmid = [["LIB_SOV_sergeant","LIB_SOV_LC_rifleman_summer","LIB_SOV_smgunner_summer","LIB_SOV_LC_rifleman_summer"],groupsCSATAA,groupsCSATAT];///["O_T_InfTeam","O_T_InfTeam_AA","O_T_InfTeam_AT"];///
CSATSquad = ["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_LC_rifleman_summer","LIB_SOV_smgunner_summer","LIB_SOV_smgunner_summer","LIB_SOV_AT_soldier","LIB_SOV_AT_grenadier","LIB_SOV_medic"];///"O_T_InfSquad";///
CSATSpecOp = ["LIB_SOV_scout_p_officer","LIB_SOV_scout_sergeant","LIB_SOV_scout_mgunner","LIB_SOV_scout_smgunner","LIB_SOV_scout_rifleman","LIB_SOV_scout_smgunner","LIB_SOV_scout_sniper","LIB_SOV_scout_sniper"];///(configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam");///
factionMaleInvaders = "";
groupsCSATSquad = [CSATSquad,["LIB_SOV_sergeant","LIB_SOV_mgunner","LIB_SOV_LC_rifleman_summer","LIB_SOV_sapper","LIB_SOV_smgunner_summer","LIB_SOV_AT_soldier","LIB_SOV_assault_smgunner","LIB_SOV_medic"]];//[CSATSquad,"O_T_InfSquad_Weapons"];///"O_T_Engineer_F"

supportStaticCSATB = "not_supported";
ATStaticCSATB = "not_supported";
MGStaticCSATB = "not_supported";
supportStaticCSATB2 = "not_supported";
AAStaticCSATB = "not_supported";
MortStaticCSATB = "not_supported";
supportStaticCSATB3 = "not_supported";

weaponsCSAT append ["LIB_SVT_40","LIB_M9130","LIB_DP28","LIB_PPSh41_m","LIB_PPSh41_d","LIB_M9130PU","LIB_RPzB","LIB_FLARE_PISTOL","LIB_TT33"];
ammunitionCSAT append ["LIB_10Rnd_762x54","LIB_5Rnd_762x54","LIB_1Rnd_flare_red","LIB_F1","LIB_1Rnd_flare_green","LIB_1Rnd_flare_yellow","LIB_Rg42","LIB_47Rnd_762x54","LIB_35Rnd_762x25","LIB_8Rnd_762x25","LIB_71Rnd_762x25","LIB_1Rnd_RPzB","LIB_Rpg6","LIB_RDG"];
flagCSATmrk = "LIB_faction_RKKA";
nameInvaders = "Soviets";
if (isServer) then {"CSAT_carrier" setMarkerText "Soviet Reinforcements"};

{helmets pushBackUnique (getUnitLoadout _x select 6)} forEach CSATSquad;
