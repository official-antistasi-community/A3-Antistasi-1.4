CSATGrunt = "O_Soldier_F";
CSATOfficer = "O_Officer_F";
CSATBodyG = "O_V_Soldier_hex_F";
CSATCrew = "O_Crew_F";
CSATMarksman = "O_Soldier_M_F";
staticCrewInvaders = "O_support_MG_F";
CSATPilot = "O_Pilot_F";

CSATMortar = "O_Mortar_01_F";
CSATMG = "O_HMG_01_high_F";
staticATInvaders = "O_static_AT_F";
staticAAInvaders = "O_static_AA_F";

//CSAT PvP Loadouts
CSATPlayerLoadouts = [
	//Team Leader
	"O_T_Recon_TL_F",
	//Medic
	"O_T_Recon_Medic_F",
	//Autorifleman
	"O_Soldier_AR_F",
	//Marksman
	"O_T_Recon_M_F",
	//Anti-tank Scout
	"O_T_Recon_LAT_F",
	//Anti-tank Scout
	"O_T_Recon_LAT_F"
];

vehCSATPVP = ["O_MRAP_02_F","O_LSV_02_unarmed_F","O_MRAP_02_hmg_F","O_LSV_02_armed_F"];//This array contains the vehicles CSAT-PvP players can spawn near their flag.

vehCSATLightArmed = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_LSV_02_armed_F"];
vehCSATLightUnarmed = ["O_MRAP_02_F","O_LSV_02_unarmed_F"];
vehCSATTrucks = ["O_Truck_03_transport_F","O_Truck_03_covered_F"];
vehCSATAmmoTruck = "O_Truck_03_ammo_F";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["O_APC_Wheeled_02_rcws_v2_F","O_APC_Tracked_02_cannon_F"];
vehCSATTank = "O_MBT_02_cannon_F";
vehCSATAA = "O_APC_Tracked_02_AA_F";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "O_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"O_APC_Wheeled_02_rcws_v2_F"];
vehCSATPlane = "O_Plane_CAS_02_dynamicLoadout_F";
vehCSATPlaneAA = "O_Plane_Fighter_02_F";
vehCSATPatrolHeli = "O_Heli_Light_02_unarmed_F";
vehCSATTransportHelis = ["O_T_VTOL_02_infantry_F","O_Heli_Transport_04_bench_F",vehCSATPatrolHeli]; //VTOL isn't available without APEX nor there is a replacement, i'd leave it there regardles it's Altis
vehCSATAttackHelis = ["O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Attack_02_F"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA];
vehCSATUAV = "O_UAV_02_F";
vehCSATUAVSmall = "O_UAV_01_F";
vehCSATMRLS = "O_MBT_02_arty_F";
vehCSATMRLSMags = "32Rnd_155mm_Mo_shells"; // I HOPE THEY ARE THE SAME!
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "O_Truck_03_fuel_F", "O_Truck_03_medical_F", "O_Truck_03_repair_F"];


vehCSATBike = "O_Quadbike_01_F";

CSATFlag = "Flag_CSAT_F";
CSATFlagTexture = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
CSATAmmoBox = "O_supplyCrate_F";
groupsCSATSentry = ["O_soldier_GL_F","O_soldier_F"];
groupsCSATSniper = ["O_sniper_F","O_spotter_F"];
groupsCSATsmall = [groupsCSATSentry,["O_recon_M_F","O_recon_F"],groupsCSATSniper];
groupsCSATAA = ["O_soldier_TL_F","O_soldier_AA_F","O_soldier_AA_F","O_soldier_AAA_F"];
groupsCSATAT = ["O_soldier_TL_F","O_soldier_AT_F","O_soldier_AT_F","O_soldier_AAT_F"];
groupsCSATmid = [["O_soldier_TL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_LAT_F"],groupsCSATAA,groupsCSATAT];
CSATSquad = ["O_soldier_SL_F","O_soldier_F","O_soldier_LAT_F","O_soldier_M_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F"];
CSATSpecOp = ["O_V_Soldier_TL_hex_F","O_V_Soldier_JTAC_hex_F","O_V_Soldier_M_hex_F","O_V_Soldier_Exp_hex_F","O_V_Soldier_LAT_hex_F","O_V_Soldier_Medic_hex_F"];
factionMaleInvaders = "OPF_V_F";
groupsCSATSquad = [CSATSquad,["O_soldier_SL_F","O_soldier_AR_F","O_soldier_GL_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AAT_F","O_soldier_A_F","O_medic_F"],["O_soldier_SL_F","O_soldier_LAT_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_Support_Mort_F","O_Support_AMort_F"],["O_soldier_SL_F","O_soldier_LAT_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_Support_MG_F","O_Support_AMG_F"],["O_soldier_SL_F","O_soldier_LAT_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_soldier_AA_F","O_soldier_AAA_F"],["O_soldier_SL_F","O_soldier_LAT_F","O_soldier_TL_F","O_soldier_AR_F","O_soldier_A_F","O_medic_F","O_engineer_F","O_engineer_F"]];
supportStaticCSATB = "O_HMG_01_support_F";
ATStaticCSATB = "O_AT_01_weapon_F";
MGStaticCSATB = "O_HMG_01_high_weapon_F";
supportStaticCSATB2 = "O_HMG_01_support_high_F";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "O_Mortar_01_weapon_F";
supportStaticCSATB3 = "O_Mortar_01_support_F";

weaponsCSAT append ["srifle_DMR_04_F","arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_Katiba_C_F","srifle_DMR_05_tan_f","arifle_Katiba_F","arifle_Katiba_GL_F","srifle_DMR_02_sniper_F","MMG_01_tan_F","srifle_DMR_01_F","launch_RPG32_F","LMG_Zafir_F"];
ammunitionCSAT append ["30Rnd_65x39_caseless_green","10Rnd_762x54_Mag","150Rnd_762x54_Box","6Rnd_45ACP_Cylinder","150Rnd_93x64_Mag","10Rnd_127x54_Mag","30Rnd_9x21_Mag","5Rnd_127x108_Mag","10Rnd_93x64_DMR_05_Mag"]; //not sure
flagCSATmrk = "flag_CSAT";
nameInvaders = "CSAT";
if (isServer) then {"CSAT_carrier" setMarkerText "CSAT Carrier"};
