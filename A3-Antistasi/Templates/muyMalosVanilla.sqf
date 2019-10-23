if (worldName == "Altis") exitWith {call compile preProcessFileLineNumbers "Templates\muyMalosVanillaAltis.sqf"};

CSATGrunt = "O_T_Soldier_F";
CSATOfficer = "O_T_Officer_F";
CSATBodyG = "O_V_Soldier_ghex_F";
CSATCrew = "O_T_Crew_F";
CSATMarksman = "O_T_Soldier_M_F";
staticCrewMuyMalos = "O_T_support_MG_F";
CSATPilot = "O_T_Pilot_F";

CSATMortar = "O_Mortar_01_F";
CSATMG = "O_HMG_01_high_F";
staticATmuyMalos = "O_T_static_AT_F";
staticAAmuyMalos = "O_static_AA_F";

vehCSATLightArmed = ["O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_LSV_02_armed_F"];
vehCSATLightUnarmed = ["O_T_MRAP_02_ghex_F","O_T_LSV_02_unarmed_F"];
vehCSATTrucks = ["O_T_Truck_03_transport_ghex_F","O_T_Truck_03_covered_ghex_F"];
vehCSATAmmoTruck = "O_T_Truck_03_ammo_ghex_F";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["O_T_APC_Wheeled_02_rcws_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F"];
vehCSATTank = "O_T_MBT_02_cannon_ghex_F";
vehCSATAA = "O_T_APC_Tracked_02_AA_ghex_F";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"O_T_APC_Wheeled_02_rcws_ghex_F"];
vehCSATPlane = "O_Plane_CAS_02_F";
vehCSATPlaneAA = "O_Plane_Fighter_02_F";
vehCSATPatrolHeli = "O_Heli_Light_02_unarmed_F";
vehCSATTransportHelis = ["O_T_VTOL_02_infantry_F","O_Heli_Transport_04_bench_F",vehCSATPatrolHeli];
vehCSATAttackHelis = ["O_Heli_Light_02_F","O_Heli_Attack_02_F"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA];
vehCSATUAV = "O_UAV_02_F";
vehCSATUAVSmall = "O_UAV_01_F";
vehCSATMRLS = "O_T_MBT_02_arty_ghex_F";
vehCSATMRLSMags = "32Rnd_155mm_Mo_shells";
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "O_T_Truck_03_fuel_ghex_F", "O_T_Truck_03_medical_ghex_F", "O_T_Truck_03_repair_ghex_F"];
vehCSATBike = "O_T_Quadbike_01_ghex_F";

CSATFlag = "Flag_CSAT_F";
CSATFlagTexture = "\A3\Data_F\Flags\Flag_CSAT_CO.paa";
CSATAmmoBox = "O_supplyCrate_F";
//cfgCSATInf = (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry");
gruposCSATSentry = ["O_T_soldier_GL_F","O_T_soldier_F"];///"O_T_InfSentry";///
gruposCSATSniper = ["O_T_sniper_F","O_T_spotter_F"];
gruposCSATsmall = [gruposCSATSentry,["O_T_recon_M_F","O_T_recon_F"],gruposCSATSniper];///[gruposCSATSentry,"O_T_reconSentry","O_T_SniperTeam"];///
gruposCSATAA = ["O_T_soldier_TL_F","O_T_soldier_AA_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"];
gruposCSATAT = ["O_T_soldier_TL_F","O_T_soldier_AT_F","O_T_soldier_AT_F","O_T_soldier_AAT_F"];
gruposCSATmid = [["O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_LAT_F"],gruposCSATAA,gruposCSATAT];///["O_T_InfTeam","O_T_InfTeam_AA","O_T_InfTeam_AT"];///
CSATSquad = ["O_T_soldier_SL_F","O_T_soldier_F","O_T_soldier_LAT_F","O_T_soldier_M_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F"];///"O_T_InfSquad";///
CSATSpecOp = ["O_V_Soldier_TL_ghex_F","O_V_Soldier_JTAC_ghex_F","O_V_Soldier_M_ghex_F","O_V_Soldier_Exp_ghex_F","O_V_Soldier_LAT_ghex_F","O_V_Soldier_Medic_ghex_F"];///(configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam");///
factionMachoMuyMalos = "OPF_V_F";
gruposCSATSquad = [CSATSquad,["O_T_soldier_SL_F","O_T_soldier_AR_F","O_T_soldier_GL_F","O_T_soldier_M_F","O_T_soldier_AT_F","O_T_soldier_AAT_F","O_T_soldier_A_F","O_T_medic_F"],["O_T_soldier_SL_F","O_T_soldier_LAT_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_Support_Mort_F","O_T_Support_AMort_F"],["O_T_soldier_SL_F","O_T_soldier_LAT_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_Support_MG_F","O_T_Support_AMG_F"],["O_T_soldier_SL_F","O_T_soldier_LAT_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_soldier_AA_F","O_T_soldier_AAA_F"],["O_T_soldier_SL_F","O_T_soldier_LAT_F","O_T_soldier_TL_F","O_T_soldier_AR_F","O_T_soldier_A_F","O_T_medic_F","O_T_Engineer_F","O_T_Engineer_F"]];//[CSATSquad,"O_T_InfSquad_Weapons"];///"O_T_Engineer_F"

soporteStaticCSATB = "O_HMG_01_support_F";
ATStaticCSATB = "O_AT_01_weapon_F";
MGStaticCSATB = "O_HMG_01_weapon_F";
soporteStaticCSATB2 = "O_HMG_01_support_high_F";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "O_Mortar_01_weapon_F";
soporteStaticCSATB3 = "O_Mortar_01_support_F";

armasCSAT = ["srifle_DMR_01_F","LMG_Zafir_F","hgun_Pistol_heavy_02_F","arifle_Katiba_F","MMG_01_hex_F","srifle_DMR_04_F","arifle_Katiba_GL_F","SMG_02_F","srifle_GM6_camo_F","srifle_DMR_05_blk_F","arifle_AK12_F","arifle_AK12_GL_F"];
municionCSAT = ["30Rnd_65x39_caseless_green","10Rnd_762x54_Mag","150Rnd_762x54_Box","6Rnd_45ACP_Cylinder","150Rnd_93x64_Mag","10Rnd_127x54_Mag","30Rnd_9x21_Mag","5Rnd_127x108_Mag","10Rnd_93x64_DMR_05_Mag"];
flagCSATmrk = "flag_CSAT";
nameMuyMalos = "CSAT";
if (isServer) then {"CSAT_carrier" setMarkerText "CSAT Carrier"};