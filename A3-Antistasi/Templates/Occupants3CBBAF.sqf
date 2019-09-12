if (side petros == west) exitWith {call compile preProcessFileLineNumbers "Templates\Occupants3CBTKA.sqf"};
if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\Occupants3CBBAFT.sqf"};
//Call to FFAA Template
if ((gameMode != 4) and (hasFFAA)) then	{call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"};
////////////////////////////////////
//       NAMES AND FLAGS         ///
////////////////////////////////////
//Name Used for notifications
nameOccupants = "BAF";

//Police Faction
factionGEN = "BLU_GEN_F";
//SF Faction
factionMaleOccupants = "UK3CB_BAF_Faction_Army_Desert";
//Miltia Faction
if ((gameMode != 4) and (!hasFFAA)) then {factionFIA = "UK3CB_TKP_B"};

//Flag Images
NATOFlag = "Flag_UK_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_UK.paa";
flagNATOmrk = "flag_UK";
if (isServer) then {"NATO_carrier" setMarkerText "HMS Ark Royal"};
	
//Loot Crate
NATOAmmobox = "B_supplyCrate_F";

////////////////////////////////////
//   PVP LOADOUTS AND VEHICLES   ///
////////////////////////////////////
//PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	"UK3CB_BAF_SC_DDPM_REC",
	//Medic
	"UK3CB_BAF_Medic_DDPM_REC",
	//Autorifleman
	"UK3CB_BAF_MGLMG_DDPM_REC",
	//Marksman
	"UK3CB_BAF_Marksman_DDPM_REC",
	//Anti-tank Scout
	"UK3CB_BAF_Explosive_DDPM_REC",
	//AT2
	"UK3CB_BAF_FAC_DDPM_REC"
];

//PVP Player Vehicles
vehNATOPVP = ["UK3CB_BAF_MAN_HX60_Container_Servicing_Air_Sand","UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Snatch_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM"];

////////////////////////////////////
//             UNITS             ///
////////////////////////////////////
//Military Units
NATOGrunt = "UK3CB_BAF_Rifleman_DDPM";
NATOOfficer = "UK3CB_BAF_SL_DDPM";
NATOOfficer2 = "UK3CB_BAF_Officer_DDPM";
NATOBodyG = "UK3CB_BAF_Crewman_RTR_DDPM";
NATOCrew = "UK3CB_BAF_Crewman_DDPM";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "UK3CB_BAF_Marksman_DDPM";
staticCrewOccupants = "UK3CB_BAF_GunnerStatic_DDPM";;
NATOPilot = "UK3CB_BAF_HeliPilot_RAF_DDPM";

//Militia Units
if ((gameMode != 4) and (!hasFFAA)) then
	{
	FIARifleman = "UK3CB_BAF_Rifleman_Smock_DPMW";
	FIAMarksman = "UK3CB_BAF_Pointman_Smock_DPMW";
	};

//Police Units
policeOfficer = "UK3CB_ANP_B_TL";
policeGrunt = "UK3CB_ANP_B_RIF_1";

////////////////////////////////////
//            GROUPS             ///
////////////////////////////////////
//Military Groups
//Teams
groupsNATOSentry = ["UK3CB_BAF_Grenadier_DDPM",NATOGrunt];
groupsNATOSniper = ["UK3CB_BAF_Sniper_DDPM_Ghillie_L115_RM","UK3CB_BAF_Spotter_DDPM_Ghillie_L129_RM"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper];
//Fireteams
groupsNATOAA = ["rhsusf_army_ocp_fso","rhsusf_army_ocp_aa","rhsusf_army_ocp_aa","rhsusf_army_ocp_aa"];
groupsNATOAT = ["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MATC_DDPM"];
groupsNATOmid = [["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MGLMG_DDPM","UK3CB_BAF_Grenadier_DDPM","UK3CB_BAF_GunnerM6_DDPM"],groupsNATOAA,groupsNATOAT];
//Squads
NATOSquad = ["UK3CB_BAF_Officer_DDPM",NATOGrunt,"UK3CB_BAF_GunnerM6_DDPM",NATOMarksman,"UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"];
NATOSpecOp = ["UK3CB_BAF_Officer_DDPM_RM","UK3CB_BAF_Rifleman_DDPM_RM",NATOBodyG,"UK3CB_BAF_LAT_DDPM_RM","UK3CB_BAF_FAC_DDPM_RM","UK3CB_BAF_Explosive_DDPM_RM","UK3CB_BAF_LSW_DDPM_RM","UK3CB_BAF_Medic_DDPM_RM"];
groupsNATOSquad =
	[
	NATOSquad,
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_LAT_DDPM","UK3CB_BAF_MATC_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_GunnerM6_DDPM","UK3CB_BAF_Officer_DDPM","UK3CB_BAF_MGLMG_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Grenadier_DDPM","UK3CB_BAF_Grenadier_762_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_MAT_DDPM","UK3CB_BAF_MAT_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"],
	["UK3CB_BAF_Officer_DDPM","UK3CB_BAF_LSW_DDPM","UK3CB_BAF_Grenadier_DDPM",NATOMarksman,"UK3CB_BAF_Engineer_DDPM","UK3CB_BAF_Engineer_DDPM","UK3CB_BAF_Explosive_DDPM","UK3CB_BAF_Medic_DDPM"]
	];

//Militia Groups
if ((gameMode != 4) and (!hasFFAA)) then
	{
	//Teams
	groupsFIASmall =
		[
		["UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],
		["UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],
		["UK3CB_BAF_Sniper_Smock_DPMW_Ghillie","UK3CB_BAF_Spotter_Smock_DPMW_Ghillie"]
		];
	//Fireteams
	groupsFIAMid =
		[
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Pointman_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW"],
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_GunnerM6_Smock_DPMW","UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW"],
		["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW","UK3CB_BAF_MATC_Smock_DPMW","UK3CB_BAF_Engineer_Smock_DPMW"]
		];
	//Squads
	FIASquad = ["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW","UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW","UK3CB_BAF_Marksman_Smock_DPMW","UK3CB_BAF_Medic_Smock_DPMW"];
	groupsFIASquad = [FIASquad];
	};

//Police Groups
//Teams
groupsNATOGen = [policeOfficer,policeGrunt];

////////////////////////////////////
//           VEHICLES            ///
////////////////////////////////////
//Military Vehicles
//Lite
vehNATOBike = "B_T_Quadbike_01_F";
vehNATOLightArmed = ["UK3CB_BAF_LandRover_WMIK_HMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_GMG_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_WMIK_Milan_FFR_Sand_A_DDPM","UK3CB_BAF_Jackal2_L2A1_D_DDPM","UK3CB_BAF_Coyote_Logistics_L111A1_D_DDPM","UK3CB_BAF_Coyote_Passenger_L111A1_D_DDPM"];
vehNATOLightUnarmed = ["UK3CB_BAF_MAN_HX60_Container_Servicing_Air_Sand","UK3CB_BAF_LandRover_Hard_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Snatch_FFR_Sand_A_DDPM","UK3CB_BAF_LandRover_Soft_FFR_Sand_A_DDPM"];
vehNATOTrucks = ["UK3CB_BAF_MAN_HX58_Transport_Sand_DDPM","UK3CB_BAF_MAN_HX60_Transport_Sand_DDPM"];
vehNATOCargoTrucks = ["UK3CB_BAF_MAN_HX58_Cargo_Sand_A_DDPM","UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM"];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_usarmy_d";
vehNATORepairTruck = "UK3CB_BAF_MAN_HX58_Repair_Sand_DDPM";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
//Armored
vehNATOAPC = ["RHS_M2A3_BUSKIII_d","RHS_M2A3_BUSKI_d","RHS_M2A3_d","RHS_M2A3_d","UK3CB_BAF_FV432_Mk3_GPMG_Sand_DDPM","UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM"];
vehNATOTank = "rhsusf_m1a2sep1d_usarmy";
vehNATOAA = "RHS_M6";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
//Boats
vehNATOBoat = "UK3CB_BAF_RHIB_HMG_DDPM_RM";
vehNATORBoat = "UK3CB_BAF_RHIB_GPMG_DDPM_RM";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
//Planes
vehNATOPlane = "RHS_A10_AT";
vehNATOPlaneAA = "rhsusf_f22";
vehNATOTransportPlanes = ["UK3CB_BAF_Hercules_C3"];
//Heli
vehNATOPatrolHeli = "UK3CB_BAF_Merlin_HC3_CSAR";
vehNATOTransportHelis = ["UK3CB_BAF_Wildcat_AH1_TRN_8A_DDPM_RM","UK3CB_BAF_Merlin_HC3_18_GPMG_DDPM_RM",vehNATOPatrolHeli,"UK3CB_BAF_Chinook_HC1_DDPM"];
vehNATOAttackHelis = ["UK3CB_BAF_Apache_AH1_CAS_DDPM_RM","UK3CB_BAF_Apache_AH1_DDPM_RM","UK3CB_BAF_Wildcat_AH1_CAS_6A_DDPM_RM","UK3CB_BAF_Wildcat_AH1_CAS_8A"];
//UAV
vehNATOUAV = "B_UAV_02_F";
vehNATOUAVSmall = "B_UAV_01_F";
//Artillery
vehNATOMRLS = "rhsusf_m109d_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";
//Combined Arrays
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "UK3CB_BAF_MAN_HX58_Fuel_Green_DDPM", "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM", vehNATORepairTruck,"UK3CB_BAF_FV432_Mk3_RWS_Sand_DDPM"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;

//Militia Vehicles
if ((gameMode != 4) and (!hasFFAA)) then
	{
	vehFIAArmedCar = "UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_DPMW";
	vehFIATruck = "UK3CB_BAF_MAN_HX60_Cargo_Sand_A_DDPM";
	vehFIACar = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_DPMW";
	};

//Police Vehicles
vehPoliceCar = "UK3CB_TKP_B_Lada_Police";

////////////////////////////////////
//        STATIC WEAPONS         ///
////////////////////////////////////
//Assembled Statics
NATOMG = "UK3CB_BAF_Static_L111A1_Deployed_High_DDPM_RM";
staticATOccupants = "RHS_TOW_TriPod_USMC_D";
staticAAOccupants = "RHS_Stinger_AA_pod_D";
NATOMortar = "UK3CB_BAF_Static_L16_Deployed_DDPM_RM";

//Static Weapon Bags
MGStaticNATOB = "UK3CB_BAF_L111A1";
ATStaticNATOB = "rhs_Tow_Gun_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
//Short Support
supportStaticNATOB = "rhs_TOW_Tripod_Bag";
//Tall Support
supportStaticNATOB2 = "UK3CB_BAF_Tripod";
//Mortar Support
supportStaticNATOB3 = "UK3CB_BAF_L16_Tripod";

////////////////////////////////////
//             ITEMS             ///
////////////////////////////////////
weaponsNato append ["UK3CB_BAF_L1A1","UK3CB_BAF_L1A1_Wood","UK3CB_BAF_L110A3","UK3CB_BAF_L115A3","UK3CB_BAF_L118A1_Covert","UK3CB_BAF_L119A1_CQB","UK3CB_BAF_L22","UK3CB_BAF_L22A2","UK3CB_BAF_L7A2","UK3CB_BAF_L135A1","UK3CB_BAF_L85A2","UK3CB_BAF_L85A2_UGL_HWS","UK3CB_BAF_L86A2","UK3CB_BAF_L86A3","UK3CB_BAF_L91A1","UK3CB_BAF_L92A1","UK3CB_BAF_L128A1","UK3CB_BAF_L129A1","UK3CB_BAF_M6"];
smokeX append ["UK3CB_BAF_SmokeShell","UK3CB_BAF_SmokeShellRed","UK3CB_BAF_SmokeShellGreen","UK3CB_BAF_SmokeShellYellow","UK3CB_BAF_SmokeShellPurple","UK3CB_BAF_SmokeShellBlue","UK3CB_BAF_SmokeShellOrange"];
NVGoggles pushBack "UK3CB_BAF_HMNVS";
itemsAAF append ["rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15A","rhsusf_acc_ARDEC_M240","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","rhsusf_acc_SFMB556","UK3CB_BAF_SUIT","UK3CB_BAF_SUSAT","UK3CB_BAF_SUSAT_3D","UK3CB_BAF_TA648","UK3CB_BAF_TA648_308","UK3CB_BAF_TA31F","UK3CB_BAF_TA31F_Hornbill","UK3CB_BAF_TA31F_3D","UK3CB_BAF_TA31F_Hornbill_3D","UK3CB_BAF_Eotech","UK3CB_BAF_SB31250","UK3CB_BAF_SB31250_Ghillie","UK3CB_BAF_SB31250_Desert","UK3CB_BAF_SB31250_Desert_Ghillie","UK3CB_BAF_SpecterLDS","UK3CB_BAF_SpecterLDS_3D","UK3CB_BAF_SpecterLDS_Dot","UK3CB_BAF_SpecterLDS_Dot_3D","UK3CB_BAF_LLM_IR_Tan","UK3CB_BAF_LLM_IR_Black","UK3CB_BAF_LLM_Flashlight_Tan","UK3CB_BAF_LLM_Flashlight_Black","UK3CB_BAF_Flashlight_L131A1","UK3CB_BAF_SFFH","UK3CB_BAF_BFA_L85","UK3CB_BAF_BFA_L110","UK3CB_BAF_BFA_L129","UK3CB_BAF_BFA_L7","UK3CB_BAF_Silencer_L85","UK3CB_BAF_Silencer_L110","UK3CB_BAF_Silencer_L115A3","UK3CB_BAF_Silencer_L91A1","RKSL_optic_PMII_312","RKSL_optic_PMII_312_sunshade","RKSL_optic_PMII_312_wdl","RKSL_optic_PMII_312_sunshade_wdl","RKSL_optic_PMII_312_des","RKSL_optic_PMII_312_sunshade_des","RKSL_optic_PMII_525","RKSL_optic_PMII_525_wdl","RKSL_optic_PMII_525_des"];
