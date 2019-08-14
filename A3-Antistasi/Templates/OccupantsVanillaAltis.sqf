if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\OccupantsVanillaAltisB.sqf"};

NATOGrunt = "B_Soldier_F";
NATOOfficer = "B_Officer_F";
NATOOfficer2 = "B_G_officer_F";
NATOBodyG = "B_Patrol_Soldier_TL_F";
NATOCrew = "B_Crew_F";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "B_Sharpshooter_F";
staticCrewOccupants = "B_support_MG_F";

NATOMG = "B_HMG_01_high_F";
NATOMortar = "B_Mortar_01_F";
staticATOccupants = "B_static_AT_F";
staticAAOccupants = "B_static_AA_F";
NATOPilot = "B_Helipilot_F";

vehNATOPVP = ["B_T_MRAP_01_F","B_MRAP_01_hmg_F"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["B_MRAP_01_hmg_F"];
vehNATOLightUnarmed = ["B_T_MRAP_01_F"];
vehNATOTrucks = ["B_Truck_01_transport_F","B_Truck_01_covered_F"];
vehNATOCargoTrucks = ["B_Truck_01_cargo_F", "B_Truck_01_flatbed_F"];
vehNATOAmmoTruck = "B_Truck_01_ammo_F";
vehNATORepairTruck = "B_Truck_01_repair_F";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_rcws_F"];//"B_T_APC_Tracked_01_CRV_F" has no cargo seats
vehNATOTank = "B_MBT_01_cannon_F";
vehNATOAA = "B_APC_Tracked_01_AA_F";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "B_Boat_Armed_01_minigun_F";
vehNATORBoat = "B_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat,"B_APC_Wheeled_01_cannon_F"];
vehNATOPlane = "B_Plane_CAS_01_F";
vehNATOPlaneAA = "B_Plane_Fighter_01_F";
vehNATOPatrolHeli = "B_Heli_Light_01_F";
vehNATOTransportHelis = ["B_T_VTOL_01_infantry_F","B_Heli_Transport_03_F",vehNATOPatrolHeli,"B_Heli_Transport_01_camo_F"];
vehNATOAttackHelis = ["B_T_VTOL_01_armed_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA];
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
vehNATOMRLS = "B_MBT_01_arty_F";
vehNATOMRLSMags = "32Rnd_155mm_Mo_shells";
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "B_Truck_01_fuel_F", "B_Truck_01_medical_F", vehNATORepairTruck,"B_APC_Tracked_01_CRV_F"];
vehNATOBike = "B_Quadbike_01_F";
NATOFlag = "Flag_NATO_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
NATOAmmobox = "B_supplyCrate_F";
//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["B_soldier_GL_F",NATOGrunt];//"B_T_InfSentry";//
groupsNATOSniper = ["B_sniper_F","B_spotter_F"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper,["B_recon_JTAC_F","B_recon_F"]]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["B_Soldier_TL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AAA_F"];
groupsNATOAT = ["B_soldier_TL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AAT_F"];
groupsNATOmid = [["B_soldier_TL_F","B_soldier_AR_F","B_soldier_GL_F","B_soldier_LAT_F"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["B_soldier_SL_F",NATOGrunt,"B_soldier_LAT_F",NATOMarksman,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_medic_F"];//"B_T_InfSquad";//
NATOSpecOp = ["B_CTRG_Soldier_TL_tna_F","B_CTRG_Soldier_M_tna_F","B_CTRG_Soldier_Medic_tna_F",NATOBodyG,"B_CTRG_Soldier_LAT_tna_F","B_CTRG_Soldier_JTAC_tna_F","B_CTRG_Soldier_Exp_tna_F","B_CTRG_Soldier_AR_tna_F"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMaleOccupants = "BLU_CTRG_F";
groupsNATOSquad = [NATOSquad,["B_soldier_SL_F",NATOGrunt,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_support_Mort_F","B_support_AMort_F","B_medic_F"],["B_soldier_SL_F",NATOGrunt,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_support_MG_F","B_support_AMG_F","B_medic_F"],["B_soldier_SL_F",NATOGrunt,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_soldier_AA_F","B_soldier_AAA_F","B_medic_F"],["B_soldier_SL_F",NATOGrunt,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_soldier_AT_F","B_soldier_AAT_F","B_medic_F"],["B_soldier_SL_F",NATOGrunt,"B_soldier_TL_F","B_soldier_AR_F","B_soldier_A_F","B_engineer_F","B_engineer_F","B_medic_F"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///"B_engineer_F"

supportStaticNATOB = "B_HMG_01_support_F";
ATStaticNATOB = "B_AT_01_weapon_F";
MGStaticNATOB = "B_HMG_01_high_weapon_F";
supportStaticNATOB2 = "B_HMG_01_support_high_F";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "B_Mortar_01_weapon_F";
supportStaticNATOB3 = "B_Mortar_01_support_F";

weaponsNato append ["launch_NLAW_F","srifle_GM6_F","srifle_LRR_F","srifle_EBR_F","arifle_MX_GL_F","arifle_MX_F","arifle_MX_SW_F","arifle_MXC_F","arifle_MXM_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_snd_F","MMG_02_sand_F"];//possible weapons that spawn in NATO ammoboxes
ammunitionNATO append ["30Rnd_65x39_Caseless_mag","30Rnd_65x39_caseless_mag_Tracer","100Rnd_65x39_Caseless_mag","100Rnd_65x39_caseless_mag_Tracer","20Rnd_762x51_Mag","7Rnd_408_Mag","30Rnd_45ACP_Mag_SMG_01","30Rnd_45ACP_Mag_SMG_01_tracer_green","11Rnd_45ACP_Mag","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","1Rnd_Smoke_Grenade_shell","3Rnd_HE_Grenade_shell","HandGrenade","20Rnd_762x51_Mag","10Rnd_338_Mag","130Rnd_338_Mag"];//possible ammo that spawn in NATO ammoboxes
flagNATOmrk = "flag_NATO";

nameOccupants = "NATO";
if (isServer) then {"NATO_carrier" setMarkerText "NATO Carrier"};
