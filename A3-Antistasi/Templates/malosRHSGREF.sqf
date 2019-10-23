NATOGrunt = "rhsgref_ins_g_rifleman_akm";
NATOOfficer = "rhsgref_ins_g_commander";
NATOOfficer2 = "rhsgref_ins_g_militiaman_mosin";
NATOBodyG = "rhsgref_ins_g_saboteur";
NATOCrew = "rhsgref_ins_g_crew";
NATOUnarmed = "I_G_Survivor_F";
NATOMarksman = "rhsgref_ins_g_sniper";
staticCrewMalos = "rhsgref_ins_g_rifleman";
NATOPilot = "rhsgref_ins_g_pilot";

NATOMG = "rhsgref_ins_g_DSHKM";
NATOMortar = "rhsgref_ins_g_2b14";
staticATmalos = "rhsgref_ins_g_SPG9M";
staticAAmalos = "rhsgref_ins_g_Igla_AA_pod";

vehNATOLightArmed = ["rhsgref_ins_g_uaz_ags","rhsgref_ins_g_uaz_dshkm_chdkz","rhsgref_ins_g_uaz_spg9"];
vehNATOLightUnarmed = ["rhsgref_ins_g_uaz","rhsgref_ins_g_uaz_open","rhsgref_BRDM2UM_ins_g"];
vehNATOTrucks = ["rhsgref_ins_g_gaz66","rhsgref_ins_g_ural","rhsgref_ins_g_ural_open","rhsgref_ins_g_gaz66o"];
vehNATOAmmoTruck = "rhsgref_ins_g_gaz66_ammo";
vehNATORepairTruck = "rhsgref_ins_g_ural_repair";
vehNATOLight = vehNATOLightArmed + vehNATOLightUnarmed;
vehNATOAPC = ["rhsgref_ins_g_btr60","rhsgref_ins_g_btr70","rhsgref_BRDM2_ins_g","rhsgref_ins_g_bmp2k"];//"B_T_APC_Tracked_01_CRV_F" has no cargo seats
vehNATOTank = "rhsgref_ins_g_t72bc";
vehNATOAA = "rhsgref_ins_g_zsu234";
vehNATOAttack = vehNATOAPC + [vehNATOTank];
vehNATOBoat = "I_Boat_Armed_01_minigun_F";
vehNATORBoat = "I_Boat_Transport_01_F";
vehNATOBoats = [vehNATOBoat,vehNATORBoat];
vehNATOPlane = "rhsgref_cdf_su25";
vehNATOPlaneAA = "rhsgref_cdf_mig29s";
vehNATOPatrolHeli = "rhsgref_ins_g_Mi8amt";
vehNATOTransportHelis = ["rhsgref_ins_g_Mi8amt","rhsgref_cdf_reg_Mi8amt"];
vehNATOAttackHelis = ["rhsgref_cdf_Mi24D","rhsgref_cdf_Mi35","rhsgref_cdf_reg_Mi17Sh"];
vehNATOAir = vehNATOTransportHelis + vehNATOAttackHelis + [vehNATOPlane,vehNATOPlaneAA];
vehNATOUAV = "I_UAV_02_dynamicLoadout_F";
vehNATOUAVSmall = "I_UAV_01_F";
vehNATOMRLS = "rhsgref_ins_g_BM21";
vehNATOMRLSMags = "rhs_mag_40Rnd_122mm_rockets";//[R Alpha 1-1:1 (Alberto),"rhs_weap_grad","rhs_weap_grad","Close_salvo","rhs_ammo_m21OF_HE",,73: rocket_230mm_f.p3d,R Alpha 1-1:1 (Alberto)]
vehNATONormal = vehNATOLight + vehNATOTrucks + [vehNATOAmmoTruck, "rhsgref_BRDM2_ATGM_ins_g", vehNATORepairTruck];
vehNATOBike = "I_Quadbike_01_F";
NATOFlag = "Flag_AltisColonial_F";
NATOFlagTexture = "\A3\Data_F\Flags\Flag_AltisColonial_CO.paa";
NATOAmmobox = "I_supplyCrate_F";

//cfgNATOInf = (configfile >> "CfgGroups" >> "West" >> "BLU_T_F" >> "Infantry");///
gruposNATOSentry = ["rhsgref_ins_g_grenadier",NATOGrunt];//"B_T_InfSentry";//
gruposNATOSniper = ["rhsgref_ins_g_sniper","rhsgref_ins_g_spotter"];
gruposNATOsmall = [gruposNATOSentry,gruposNATOSniper]; //[gruposNATOSentry,"B_T_SniperTeam","B_T_ReconSentry"];///
gruposNATOAA = ["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_specialist_aa","rhsgref_ins_g_specialist_aa"];
gruposNATOAT = ["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_grenadier_rpg"];
gruposNATOmid = [["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_RPG26"],gruposNATOAA,gruposNATOAT];//["B_T_InfTeam","B_T_InfTeam_AA","B_T_InfTeam_AT"];///
NATOSquad = ["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_grenadier","rhsgref_ins_g_medic"];//"B_T_InfSquad";//
NATOSpecOp = ["rhsgref_ins_g_grenadier","rhsgref_ins_g_spotter","rhsgref_ins_g_grenadier","rhsgref_ins_g_saboteur","rhsgref_ins_g_saboteur","rhsgref_ins_g_sniper","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_medic"];//(configfile >> "CfgGroups" >> "West" >> "BLU_CTRG_F" >> "Infantry" >> "CTRG_InfSquad");
factionMachoMalos = "";
gruposNATOSquad = [NATOSquad,["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_specialist_aa","rhsgref_ins_g_specialist_aa","rhsgref_ins_g_medic"],["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_grenadier_rpg","rhsgref_ins_g_medic","rhsgref_ins_g_grenadier_rpg"],["rhsgref_ins_g_grenadier","rhsgref_ins_g_machinegunner","rhsgref_ins_g_machinegunner","rhsgref_ins_g_rifleman","rhsgref_ins_g_rifleman_RPG26","rhsgref_ins_g_medic","rhsgref_ins_g_engineer","rhsgref_ins_g_saboteur"]]; //[NATOSquad,"B_T_InfSquad_Weapons"];///

soporteStaticNATOB = "RHS_SPG9_Tripod_Bag";
ATStaticNATOB = "RHS_SPG9_Gun_Bag";
MGStaticNATOB = "RHS_DShkM_Gun_Bag";
soporteStaticNATOB2 = "RHS_DShkM_TripodHigh_Bag";
AAStaticNATOB = "no_exists";
MortStaticNATOB = "RHS_Podnos_Gun_Bag";
soporteStaticNATOB3 = "RHS_Podnos_Bipod_Bag";

armasNATO = ["rhs_weap_akm_gp25","rhs_weap_pkm","rhs_weap_akms","rhs_weap_ak103","rhs_weap_akm","rhs_weap_aks74_2","rhs_weap_aks74u"];//possible weapons that spawn in NATO ammoboxes
humo = humo + ["rhs_mag_an_m8hc","rhs_mag_m18_purple","rhs_mag_m18_red","rhs_mag_m18_green","rhs_mag_m18_yellow","rhs_mag_rdg2_white"];
NVGoggles = NVGoggles + ["rhsusf_ANPVS_14"/*,"rhsusf_ANPVS_15"*/];
itemsAAF = itemsAAF + ["rhsusf_acc_grip2","rhsusf_acc_grip2_tan","rhsusf_acc_anpeq15side_bk","rhsusf_acc_anpeq15_bk_top","rhsusf_acc_anpeq15","rhsusf_acc_anpeq15_light","rhsusf_acc_anpeq15_bk","rhsusf_acc_anpeq15_bk_light","rhsusf_acc_anpeq15A","rhsusf_acc_ARDEC_M240","rhsusf_acc_nt4_black","rhsusf_acc_nt4_tan","rhsusf_acc_SFMB556"];
//opticasAAF = opticasAAF + ["rhsusf_acc_anpas13gv1","rhsusf_acc_ACOG2_USMC","rhsusf_acc_ACOG3_USMC","rhsusf_acc_ACOG_USMC","rhsusf_acc_anpvs27","rhsusf_acc_ARDEC_M240","rhsusf_acc_ELCAN","rhsusf_acc_ELCAN_ard","rhsusf_acc_ACOG","rhsusf_acc_ACOG3","rhsusf_acc_ACOG_anpvs27","rhsusf_acc_M2A1","rhsusf_acc_compm4","rhsusf_acc_M8541","rhsusf_acc_premier_low","rhsusf_acc_premier_anpvs27","rhsusf_acc_premier","rhsusf_acc_LEUPOLDMK4","rhsusf_acc_LEUPOLDMK4_2","rhsusf_acc_LEUPOLDMK4_2_d","optic_MRD","rhs_weap_optic_smaw","rhsusf_acc_SpecterDR","rhsusf_acc_SpecterDR_D","rhsusf_acc_SpecterDR_A","rhsusf_acc_ACOG_MDO","rhsusf_acc_ACOG_RMR","rhsusf_acc_eotech_xps3"];
municionNATO = [];
{
_nombre = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nombre / "magazines");
municionNATO pushBack (_magazines select 0);
} forEach armasNATO;
flagNATOmrk = "rhs_flag_insurgents";//ok

lamparaMalos = "rhs_acc_2dpZenit";
nameMalos = "ChDKZ";
if (isServer) then {"NATO_carrier" setMarkerText "ChDKZ Carrier"};
