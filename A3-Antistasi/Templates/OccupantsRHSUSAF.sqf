NATOGrunt = "rhsusf_usmc_marpat_wd_rifleman_light";
NATOOfficer = "rhsusf_usmc_marpat_wd_officer";
NATOOfficer2 = "rhsgref_cdf_b_reg_general";
NATOBodyG = "rhsusf_socom_marsoc_teamleader";
NATOCrew = "rhsusf_usmc_marpat_wd_crewman";
NATOUnarmed = "B_G_Survivor_F";
NATOMarksman = "rhsusf_usmc_marpat_wd_marksman";
staticCrewOccupants = "rhsusf_usmc_marpat_wd_rifleman";
NATOPilot = "rhsusf_airforce_jetpilot";

NATOMG = "RHS_M2StaticMG_USMC_WD";
NATOMortar = "RHS_M252_USMC_WD";
staticATOccupants = "RHS_TOW_TriPod_USMC_WD";
staticAAOccupants = "RHS_Stinger_AA_pod_D";

//NATO PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	["rhs_usaf_teamLeader"] call A3A_fnc_getLoadout,
	//Medic
	["rhs_usaf_medic"] call A3A_fnc_getLoadout,
	//Autorifleman
	["rhs_usaf_machineGunner"] call A3A_fnc_getLoadout,
	//Marksman
	["rhs_usaf_marksman"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_usaf_AT"] call A3A_fnc_getLoadout,
	//Anti-tank Scout
	["rhs_usaf_rifleman"] call A3A_fnc_getLoadout
];

vehNATOPVP = ["rhsusf_m1025_w_s","rhsusf_m998_w_s_2dr","rhsusf_m998_w_s_2dr_fulltop","rhsusf_m998_w_s_4dr","rhsusf_m1025_w_s_m2"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["rhsusf_m1025_w_s_m2","rhsusf_CGRCAT1A2_M2_usmc_wd","rhsusf_CGRAT1A2_Mk19_usmc_wd","rhsusf_M1117_W","rhsusf_M1220_M2_usarmy_wd","rhsusf_M1237_M2_usarmy_wd","rhsusf_M1238A1_M2_socom_d","rhsusf_m1045_w_s"];
vehNATOLightUnarmed = ["rhsusf_m1025_w_s","rhsusf_m998_w_s_2dr","rhsusf_m998_w_s_2dr_fulltop","rhsusf_m998_w_s_4dr","rhsusf_CGRCAT1A2_usmc_wd","rhsusf_M1232_usarmy_wd"];
vehNATOTrucks = ["rhsusf_M1078A1P2_wd_open_fmtv_usarmy","rhsusf_M1078A1P2_B_wd_fmtv_usarmy","rhsusf_M1078A1P2_B_wd_open_fmtv_usarmy","rhsusf_M1083A1P2_wd_fmtv_usarmy","rhsusf_M1083A1P2_B_M2_wd_fmtv_usarmy"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "rhsusf_M977A4_AMMO_BKIT_usarmy_wd";
vehNATORepairTruck = "rhsusf_M977A4_REPAIR_BKIT_usarmy_wd";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["rhsusf_stryker_m1126_m2_wd","RHS_M2A3_BUSKIII_wd","RHS_M2A3_BUSKI_wd","rhsusf_M1237_MK19_usarmy_wd","RHS_M2A2_BUSKI_WD","rhsusf_m113_usarmy","rhsusf_m113_usarmy_MK19","rhsusf_m113_usarmy"];//"B_T_APC_Tracked_01_CRV_F" has no cargo seats
vehNATOTank = "rhsusf_m1a1fep_wd";
vehNATOAA = "RHS_M6";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "rhsusf_mkvsoc";
vehNATORBoat = "B_T_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat,"rhsusf_m113_usarmy_MK19","rhsusf_m113_usarmy"];
vehNATOPlane = "RHS_A10_AT";
vehNATOPlaneAA = "rhsusf_f22";
vehNATOTransportPlanes = ["RHS_C130J"];
vehNATOPatrolHeli = "RHS_MELB_MH6M";
vehNATOTransportHelis = ["RHS_UH60M_d","RHS_CH_47F","rhsusf_CH53E_USMC_GAU21",vehNATOPatrolHeli];
vehNATOAttackHelis = ["RHS_MELB_AH6M_L","RHS_AH64D_wd","RHS_UH1Y","RHS_AH1Z_wd"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA] + vehNATOTransportPlanes;
vehNATOUAV = "B_UAV_02_F";//ok
vehNATOUAVSmall = "B_UAV_01_F";
vehNATOMRLS = "rhsusf_m109_usarmy";
vehNATOMRLSMags = "rhs_mag_155mm_m795_28";//["Sh_155mm_AMOS","rhs_mag_155mm_m795_28",<NULL-object>,B Alpha 1-1:3 (Alberto)]
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "rhsusf_M978A4_BKIT_usarmy_wd","rhsusf_m113_usarmy_medical", vehNATORepairTruck];
vehNATOBike = "B_T_Quadbike_01_F";
NATOFlag = "Flag_NATO_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_nato_CO.paa";
NATOAmmobox = "B_supplyCrate_F";

//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["rhsusf_usmc_marpat_wd_grenadier",NATOGrunt];//"B_T_InfSentry";//
groupsNATOSniper = ["rhsusf_socom_marsoc_sniper","rhsusf_socom_marsoc_spotter"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_stinger"];
groupsNATOAT = ["rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_javelin"];
groupsNATOmid = [["rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_riflemanat"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_navy_marpat_wd_medic","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_wd_marksman"];//"B_T_InfSquad";//
NATOSpecOp = ["rhsusf_socom_marsoc_teamleader","rhsusf_socom_marsoc_teamchief","rhsusf_socom_marsoc_cso_mk17","rhsusf_socom_marsoc_marksman","rhsusf_socom_marsoc_cso_breacher","rhsusf_socom_marsoc_cso_eod","rhsusf_socom_marsoc_cso_grenadier","rhsusf_socom_marsoc_sarc"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMaleOccupants = "rhs_faction_socom";
groupsNATOSquad = [NATOSquad,["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_javelin","rhsusf_usmc_marpat_d_javelin_assistant","rhsusf_navy_sarc_d"],["rhsusf_usmc_marpat_d_squadleader","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_d_riflemanat","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_grenadier","rhsusf_usmc_marpat_d_stinger","rhsusf_usmc_marpat_d_rifleman_light","rhsusf_navy_sarc_d_fast"],["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_teamleader","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_navy_marpat_wd_medic","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_rifleman_m4","rhsusf_usmc_marpat_d_explosives"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///

supportStaticNATOB = "rhs_TOW_Tripod_Bag";
ATStaticNATOB = "rhs_Tow_Gun_Bag";
MGStaticNATOB = "RHS_M2_Gun_Bag";
supportStaticNATOB2 = "RHS_M2_Tripod_Bag";
AAStaticNATOB = "B_AA_01_weapon_F";
MortStaticNATOB = "rhs_M252_Gun_Bag";
supportStaticNATOB3 = "rhs_M252_Bipod_Bag";

weaponsNato append ["rhs_weap_hk416d10","rhs_weap_m16a4","rhs_weap_XM2010","rhs_weap_m24sws","rhs_weap_m27iar","rhs_weap_m4","rhs_weap_m40a5","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_blockII","rhs_weap_m4a1","rhs_weap_M590_8RD","rhs_weap_mk18","rhsusf_weap_MP7A2","hgun_Pistol_heavy_01_F","rhs_weap_fgm148","rhs_weap_fim92","rhsusf_weap_glock17g4","rhs_weap_M107","rhs_weap_M136","rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m14ebrri","rhs_weap_m72a7","rhsusf_weap_m9","rhs_weap_sr25","lerca_1200_black","lerca_1200_tan","Leupold_Mk4","rhs_weap_m240B","rhs_weap_m249","rhs_weap_smaw","rhs_weap_m39","rhs_weap_mk17_CQC","rhs_weap_mk17_LB","rhs_weap_mk17_STD","rhs_weap_SCARH_USA_STD","rhs_weap_maaws","rhs_weap_mk17_CQC","rhs_weap_m32"];//possible weapons that spawn in NATO ammoboxes
smokeX = smokeX + ["rhs_mag_an_m8hc","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_green","rhs_mag_m18_yellow"];
NVGoggles = NVGoggles + ["rhsusf_ANPVS_14"/*,"rhsusf_ANPVS_15"*/];
itemsAAF = itemsAAF + ["rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15A","rhsusf_acc_ARDEC_M240","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","rhsusf_acc_SFMB556"];
flagNATOmrk = "flag_USA";//ok

lampOccupants = "acc_flashlight";
nameOccupants = "USAF";
if (isServer) then {"NATO_carrier" setMarkerText "USMC Carrier"};

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		FIARifleman = "rhsgref_hidf_rifleman";
		FIAMarksman = "rhsgref_hidf_marksman";
		vehFIAArmedCar = "rhsgref_hidf_m1025_m2";
		vehFIATruck = "rhsgref_cdf_b_ural_open";
		vehFIACar = "rhsgref_hidf_m998_4dr";

		groupsFIASmall = [["rhsgref_hidf_grenadier","rhsgref_hidf_rifleman"],["rhsgref_hidf_marksman","rhsgref_hidf_rifleman"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		groupsFIAMid = [["rhsgref_hidf_teamleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_grenadier"],["rhsgref_hidf_teamleader","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier"]];//["IRG_InfAssault","IRG_InfTeam","IRG_InfTeam_AT"];///
		FIASquad = ["rhsgref_hidf_squadleader","rhsgref_hidf_machinegunner","rhsgref_hidf_machinegunner_assist","rhsgref_hidf_rifleman","rhsgref_hidf_rifleman_m72","rhsgref_hidf_rifleman_m72","rhsgref_hidf_grenadier","rhsgref_hidf_medic"];//"IRG_InfSquad";///
		groupsFIASquad = [FIASquad];
		factionFIA = "rhsgref_faction_hidf";
		};
	};

vehPoliceCar = "rhsusf_mrzr4_d";
policeOfficer = "rhsusf_army_ucp_rifleman_m590";
policeGrunt = "rhsusf_army_ucp_rifleman_82nd";
groupsNATOGen = [policeOfficer,policeGrunt];
factionGEN = "BLU_GEN_F";