NATOGrunt = "rhsgref_cdf_reg_rifleman";
NATOOfficer = "rhsgref_cdf_reg_general";
NATOOfficer2 = "rhsgref_cdf_ngd_commander";
NATOBodyG = "rhsgref_cdf_ngd_rifleman_lite";
NATOCrew = "rhsgref_cdf_ngd_crew";
NATOUnarmed = "I_G_Survivor_F";
NATOMarksman = "rhsgref_cdf_reg_marksman";
staticCrewOccupants = "rhsgref_cdf_ngd_rifleman_lite";
NATOPilot = "rhsgref_cdf_air_pilot";

NATOMG = "rhsgref_cdf_DSHKM";
NATOMortar = "rhsgref_cdf_reg_m252";
staticATOccupants = "rhsgref_cdf_SPG9M";
staticAAOccupants = "rhsgref_cdf_Igla_AA_pod";

//NATO PvP Loadouts
NATOPlayerLoadouts = [
	//Team Leader
	"rhsgref_cdf_para_squadleader",
	//Medic
	"rhsgref_cdf_para_medic",
	//Autorifleman
	"rhsgref_cdf_para_autorifleman",
	//Marksman
	"rhsgref_cdf_para_marksman",
	//Anti-tank Scout
	"rhsgref_cdf_para_grenadier",
	//Anti-tank Scout
	"rhsgref_cdf_para_grenadier"
];

vehNATOPVP = ["rhsgref_ins_g_uaz","rhsgref_ins_g_uaz_open","rhsgref_BRDM2UM_ins_g","rhsgref_ins_g_uaz_dshkm_chdkz"];//This array contains the vehicles Nato-PvP players can spawn near their flag.

vehNATOLightArmed = ["rhsgref_cdf_uaz_ags","rhsgref_cdf_reg_uaz_dshkm","rhsgref_cdf_reg_uaz_spg9","rhsgref_BRDM2_HQ"];
vehNATOLightUnarmed = ["rhsgref_cdf_reg_uaz","rhsgref_cdf_reg_uaz_open","rhsgref_BRDM2UM"];
vehNATOTrucks = ["rhsgref_cdf_gaz66","rhsgref_cdf_ural","rhsgref_cdf_ural_open","rhsgref_cdf_gaz66o","rhsgref_cdf_zil131","rhsgref_cdf_zil131_open"];
vehNATOCargoTrucks = [];
vehNATOAmmoTruck = "rhsgref_cdf_gaz66_ammo";
vehNATORepairTruck = "rhsgref_cdf_gaz66_repair";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["rhsgref_cdf_btr60","rhsgref_cdf_btr70","rhsgref_BRDM2","rhsgref_cdf_bmp2k","rhsgref_cdf_bmp2e","rhsgref_cdf_bmd2","rhsgref_cdf_bmd1k","rhsgref_cdf_bmp1"];//"B_T_APC_Tracked_01_CRV_F" has no cargo seats
vehNATOTank = "rhsgref_cdf_t72ba_tv";
vehNATOAA = "rhsgref_cdf_zsu234";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "I_Boat_Armed_01_minigun_F";
vehNATORBoat = "I_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
vehNATOPlane = "rhs_l159_CDF";
vehNATOPlaneAA = "rhsgref_cdf_mig29s";
vehNATOPatrolHeli = "rhsgref_cdf_reg_Mi8amt";
vehNATOTransportHelis = ["rhsgref_cdf_reg_Mi8amt"];
vehNATOAttackHelis = ["rhsgref_cdf_Mi24D","rhsgref_cdf_Mi35","rhsgref_cdf_reg_Mi17Sh","rhsgref_mi24g_CAS"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA];
vehNATOUAV = "I_UAV_02_dynamicLoadout_F";
vehNATOUAVSmall = "I_UAV_01_F";
vehNATOMRLS = "rhsgref_cdf_reg_BM21";
vehNATOMRLSMags = "rhs_mag_9m28f_1";//[R Alpha 1-1:1 (Alberto),"rhs_weap_grad","rhs_weap_grad","Close_salvo","rhs_ammo_m21OF_HE",,73: rocket_230mm_f.p3d,R Alpha 1-1:1 (Alberto)]
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "rhsgref_BRDM2_ATGM", vehNATORepairTruck];
vehNATOBike = "I_Quadbike_01_F";
NATOFlag = "Flag_AltisColonial_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_AltisColonial_CO.paa";
NATOAmmobox = "I_supplyCrate_F";

//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
groupsNATOSentry = ["rhsgref_cdf_reg_grenadier",NATOGrunt];//"B_T_InfSentry";//
groupsNATOSniper = ["rhsgref_cdf_reg_marksman","rhsgref_cdf_para_marksman"];
groupsNATOsmall = [groupsNATOSentry,groupsNATOSniper]; //[groupsNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
groupsNATOAA = ["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_specialist_aa","rhsgref_cdf_reg_specialist_aa"];
groupsNATOAT = ["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_grenadier_rpg","rhsgref_cdf_reg_grenadier_rpg"];
groupsNATOmid = [["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_rifleman_rpg75"],groupsNATOAA,groupsNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_cdf_reg_rifleman_akm","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_medic"];//"B_T_InfSquad";//
NATOSpecOp = ["rhsgref_cdf_para_grenadier_rpg","rhsgref_cdf_para_squadleader","rhsgref_cdf_para_grenadier","rhsgref_cdf_para_autorifleman","rhsgref_cdf_para_marksman","rhsgref_cdf_para_engineer","rhsgref_cdf_para_specialist_aa","rhsgref_cdf_para_medic"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMaleOccupants = "";
groupsNATOSquad = [NATOSquad,["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_cdf_reg_specialist_aa","rhsgref_cdf_reg_specialist_aa","rhsgref_cdf_reg_medic"],["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman_akm","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_ins_g_grenadier_rpg","rhsgref_cdf_reg_medic","rhsgref_ins_g_grenadier_rpg"],["rhsgref_cdf_reg_grenadier","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_reg_rifleman","rhsgref_cdf_reg_rifleman_rpg75","rhsgref_cdf_reg_medic","rhsgref_ins_g_engineer","rhsgref_ins_g_saboteur"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///

supportStaticNATOB = "RHS_SPG9_Tripod_Bag";
ATStaticNATOB = "RHS_SPG9_Gun_Bag";
MGStaticNATOB = "RHS_DShkM_Gun_Bag";
supportStaticNATOB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticNATOB = "no_exists";
MortStaticNATOB = "RHS_Podnos_Gun_Bag";
supportStaticNATOB3 = "RHS_Podnos_Bipod_Bag";

weaponsNato append ["rhs_weap_akm_gp25","rhs_weap_pkm","rhs_weap_akms","rhs_weap_ak103","rhs_weap_akm","rhs_weap_aks74_2","rhs_weap_aks74u"];//possible weapons that spawn in NATO ammoboxes
smokeX = smokeX + ["rhs_mag_an_m8hc","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_green","rhs_mag_m18_yellow","rhs_mag_rdg2_white"];
NVGoggles = NVGoggles + ["rhsusf_ANPVS_14"/*,"rhsusf_ANPVS_15"*/];
itemsAAF = itemsAAF + ["rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15A","rhsusf_acc_ARDEC_M240","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","rhsusf_acc_SFMB556"];


flagNATOmrk = "rhs_flag_insurgents";//ok

lampOccupants = "rhs_acc_2dpZenit";
nameOccupants = "CDF";
if (isServer) then {"NATO_carrier" setMarkerText "CDF Carrier"};
