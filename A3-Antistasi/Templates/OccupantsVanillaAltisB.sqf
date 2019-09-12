NATOGrunt = "I_Soldier_F";
NATOOfficer = "I_Officer_F";
NATOOfficer2 = "I_G_officer_F";
NATOBodyG = "I_Soldier_SL_F";
NATOCrew = "I_Crew_F";
NATOUnarmed = "I_G_Survivor_F";
NATOMarksman = "I_Soldier_M_F";
staticCrewOccupants = "I_support_MG_F";

NATOMG = "I_HMG_01_high_F";
NATOMortar = "I_Mortar_01_F";
staticATOccupants = "I_static_AT_F";
staticAAOccupants = "I_static_AA_F";
NATOPilot = "I_Helipilot_F";

//NATO PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["rhs_gref_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["rhs_gref_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["rhs_gref_breacher"] call A3A_fnc_getLoadout,
	//Marksman
	["rhs_gref_sniper"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_gref_demolition"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_gref_demolition"] call A3A_fnc_getLoadout
];

vehNATOPVP = ["I_MRAP_03_F","I_MRAP_03_hmg_F"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["I_MRAP_03_hmg_F"];
vehNATOLightUnarmed = ["I_MRAP_03_F"];
vehNATOTrucks = ["I_Truck_02_covered_F","I_Truck_02_transport_F"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "I_Truck_02_ammo_F";
vehNATORepairTruck = "I_Truck_02_box_F";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["I_APC_Wheeled_03_cannon_F"];
vehNATOTank = "I_MBT_03_cannon_F";
vehNATOAA = "I_LT_01_AA_F";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "I_Boat_Armed_01_minigun_F";
vehNATORBoat = "I_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
vehNATOPlane = "I_Plane_Fighter_03_dynamicLoadout_F";
vehNATOPlaneAA = "I_Plane_Fighter_04_F";
vehNATOTransportPlanes = [];
vehNATOPatrolHeli = "I_Heli_light_03_unarmed_F";
vehNATOTransportHelis = ["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F"];
vehNATOAttackHelis = ["I_Heli_light_03_dynamicLoadout_F"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;
vehNATOUAV = "I_UAV_02_dynamicLoadout_F";
vehNATOUAVSmall = "I_UAV_01_F";
vehNATOMRLS = "I_Truck_02_MRL_F";
vehNATOMRLSMags = "12Rnd_230mm_rockets";//[R Alpha 1-2:2 (Alberto),"rockets_230mm_GAT","rockets_230mm_GAT","Mode_1","R_230mm_HE","12Rnd_230mm_rockets",41: rocket_230mm_f.p3d,R Alpha 1-2:2 (Alberto)]
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "I_Truck_02_fuel_F", "I_Truck_02_medical_F", vehNATORepairTruck,"I_APC_tracked_03_cannon_F"];
vehNATOBike = "I_Quadbike_01_F";
NATOFlag = "Flag_AltisColonial_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_AltisColonial_CO.paa";
NATOAmmobox = "I_supplyCrate_F";
//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["I_Soldier_GL_F","I_soldier_F"];//"B_T_InfSentry";//
groupsNATOSniper = ["I_sniper_F","I_spotter_F"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["I_Soldier_TL_F","I_Soldier_AA_F","I_Soldier_AA_F","I_Soldier_AAA_F"];
groupsNATOAT = ["I_soldier_TL_F","I_soldier_AT_F","I_soldier_AT_F","I_soldier_AAT_F"];
groupsNATOmid = [["I_Soldier_TL_F","I_Soldier_GL_F","I_Soldier_AR_F","I_Soldier_LAT_F"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["I_soldier_SL_F",NATOGrunt,"I_soldier_LAT_F","I_Soldier_GL_F","I_Soldier_M_F","B_soldier_AR_F","I_soldier_A_F","I_medic_F"];//"B_T_InfSquad";//
NATOSpecOp = ["I_soldier_SL_F",NATOGrunt,"I_soldier_LAT_F","I_Soldier_GL_F","I_soldier_TL_F","B_soldier_AR_F","I_soldier_A_F","I_medic_F"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMaleOccupants = "";
groupsNATOSquad = [NATOSquad,["B_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_support_Mort_F","I_support_AMort_F","I_medic_F"],["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_support_MG_F","I_support_AMG_F","I_medic_F"],["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_soldier_AA_F","I_soldier_AAA_F","I_medic_F"],["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_soldier_AT_F","I_soldier_AAT_F","I_medic_F"],["I_soldier_SL_F",NATOGrunt,"I_soldier_TL_F","I_soldier_AR_F","I_soldier_A_F","I_engineer_F","I_engineer_F","I_medic_F"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///"B_engineer_F"

supportStaticNATOB = "I_HMG_01_support_F";
ATStaticNATOB = "I_AT_01_weapon_F";
MGStaticNATOB = "I_HMG_01_high_weapon_F";
supportStaticNATOB2 = "I_HMG_01_support_high_F";
AAStaticNATOB = "I_AA_01_weapon_F";
MortStaticNATOB = "I_Mortar_01_weapon_F";
supportStaticNATOB3 = "I_Mortar_01_support_F";

weaponsNato append ["launch_NLAW_F","arifle_Mk20_F","arifle_Mk20C_F","LMG_Mk200_F","arifle_Mk20_GL_F","srifle_EBR_F","arifle_SDAR_F","srifle_GM6_F"];
ammunitionNATO append ["30Rnd_556x45_Stanag","200Rnd_65x39_cased_Box","20Rnd_556x45_UW_mag","20Rnd_762x51_Mag","5Rnd_127x108_Mag","1Rnd_HE_Grenade_shell","UGL_FlareWhite_F","UGL_FlareGreen_F","1Rnd_Smoke_Grenade_shell","3Rnd_HE_Grenade_shell","HandGrenade"];//possible ammo that spawn in NATO ammoboxes
flagNATOmrk = "flag_AltisColonial";

nameOccupants = "AAF";
if (isServer) then {"NATO_carrier" setMarkerText "AAF Carrier"};

vehPoliceCar = vehFIACar;
policeOfficer = FIARifleman;
policeGrunt = FIARifleman;
groupsNATOGen = [policeOfficer,policeGrunt];
factionGEN = "IND_C_F";

if (gameMode != 4) then
	{
	FIARifleman = "I_C_Soldier_Para_7_F";
	FIAMarksman = "I_C_Soldier_Para_2_F";
	vehFIAArmedCar = "I_C_Offroad_02_LMG_F";
	vehFIATruck = "I_C_Van_01_transport_F";
	vehFIACar = "I_C_Offroad_01_F";
	groupsFIASmall = [["I_C_Soldier_Para_6_F",FIARifleman],[FIAMarksman,FIARifleman],[FIAMarksman,FIAMarksman]];
	groupsFIAMid = [["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F"],["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_5_F"]];
	FIASquad = ["I_C_Soldier_Para_2_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_7_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_3_F"];
	groupsFIASquad = [FIASquad];
	factionFIA = "IND_C_F";
	};