CSATGrunt = "rhs_vmf_flora_rifleman";
CSATOfficer = "rhs_vmf_flora_officer";
CSATBodyG = "rhs_vmf_recon_efreitor";
CSATCrew = "rhs_vmf_flora_armoredcrew";
CSATMarksman = "rhs_vmf_flora_marksman";
staticCrewMuyMalos = "rhs_vmf_flora_rifleman_lite";
CSATPilot = "rhs_pilot_tan";

CSATMortar = "rhs_2b14_82mm_vmf";
CSATMG = "rhs_KORD_high_VMF";
staticATmuyMalos = "rhs_Kornet_9M133_2_vmf";
staticAAmuyMalos = "RHS_ZU23_MSV";

vehCSATLightArmed = ["rhsgref_BRDM2_vdv","rhsgref_BRDM2_HQ_vdv","rhsgref_BRDM2_ATGM_vdv","rhs_tigr_sts_vdv"];
vehCSATLightUnarmed = ["rhs_tigr_vdv","rhs_uaz_vdv"];
vehCSATTrucks = ["rhs_kamaz5350_vdv","rhs_kamaz5350_open_vdv","RHS_Ural_Open_VDV_01","rhs_gaz66_vdv"];
vehCSATAmmoTruck = "rhs_gaz66_ammo_vmf";
vehCSATLight = vehCSATLightArmed + vehCSATLightUnarmed;
vehCSATAPC = ["rhs_bmp2d_vdv","rhs_bmp1p_vdv"];
vehCSATTank = "rhs_sprut_vdv";
vehCSATAA = "rhs_zsu234_aa";
vehCSATAttack = vehCSATAPC + [vehCSATTank];
vehCSATBoat = "O_T_Boat_Armed_01_hmg_F";
vehCSATRBoat = "O_T_Boat_Transport_01_F";
vehCSATBoats = [vehCSATBoat,vehCSATRBoat,"rhs_btr80a_vdv"];
vehCSATPlane = "RHS_Su25SM_CAS_vvs";
vehCSATPlaneAA = "RHS_T50_vvs_051";
vehCSATPatrolHeli = "rhs_ka60_c";
vehCSATTransportHelis = ["RHS_Mi8mt_vdv","RHS_Mi8mt_vv","RHS_Mi8mt_Cargo_vv",vehCSATPatrolHeli];
vehCSATAttackHelis = ["RHS_Mi24V_vdv","RHS_Mi8MTV3_FAB_vdv"];
vehCSATAir = vehCSATTransportHelis + vehCSATAttackHelis + [vehCSATPlane,vehCSATPlaneAA];
vehCSATUAV = "rhs_pchela1t_vvs";
vehCSATUAVSmall = "O_UAV_01_F";
vehCSATMRLS = "rhs_2s3_tv";
vehCSATMRLSMags = "rhs_mag_HE_2a33";
vehCSATNormal = vehCSATLight + vehCSATTrucks + [vehCSATAmmoTruck, "rhs_gaz66_repair_vdv","RHS_Ural_Fuel_VDV_01"];
vehCSATBike = "O_T_Quadbike_01_ghex_F";

CSATFlag = "rhs_Flag_Russia_F";
CSATFlagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
CSATAmmoBox = "O_supplyCrate_F";
//cfgCSATInf = (configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "Infantry");
gruposCSATSentry = ["rhs_vdv_efreitor","rhs_vdv_rifleman"];///"O_T_InfSentry";///
gruposCSATSniper = ["rhs_vdv_marksman_asval","rhs_vdv_rifleman_asval"];
gruposCSATsmall = [gruposCSATSentry,["rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout_akm"],gruposCSATSniper];///[gruposCSATSentry,"O_T_reconSentry","O_T_SniperTeam"];///
gruposCSATAA = ["rhs_vdv_flora_junior_sergeant","rhs_vdv_flora_aa","rhs_vdv_flora_aa","rhs_vdv_flora_aa"];
gruposCSATAT = ["rhs_vdv_flora_junior_sergeant","rhs_vdv_flora_at","rhs_vdv_flora_strelok_rpg_assist","rhs_vdv_flora_LAT"];
gruposCSATmid = [["rhs_vdv_flora_efreitor","rhs_vdv_flora_rifleman","rhs_vdv_flora_rifleman","rhs_vdv_flora_medic"],gruposCSATAA,gruposCSATAT];///["O_T_InfTeam","O_T_InfTeam_AA","O_T_InfTeam_AT"];///
CSATSquad = ["rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_at","rhs_vdv_mflora_strelok_rpg_assist","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_medic"];///"O_T_InfSquad";///
CSATSpecOp = ["rhs_vmf_recon_sergeant","rhs_vmf_recon_efreitor","rhs_vmf_recon_arifleman","rhs_vmf_recon_machinegunner_assistant","rhs_vmf_recon_grenadier","rhs_vdv_recon_medic"];///(configfile >> "CfgGroups" >> "East" >> "OPF_T_F" >> "SpecOps" >> "O_T_ViperTeam");///
factionMachoMuyMalos = "rhs_faction_vmf";
gruposCSATSquad = [CSATSquad,["rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_marksman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_LAT","rhs_vdv_mflora_medic"],["rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_marksman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_aa","rhs_vdv_mflora_medic"]];//[CSATSquad,"O_T_InfSquad_Weapons"];///

soporteStaticCSATB = "RHS_Kord_Tripod_Bag";
ATStaticCSATB = "RHS_Kornet_Gun_Bag";
MGStaticCSATB = "RHS_Kord_Gun_Bag";
soporteStaticCSATB2 = "RHS_Kornet_Tripod_Bag";
AAStaticCSATB = "O_AA_01_weapon_F";
MortStaticCSATB = "RHS_Podnos_Gun_Bag";
soporteStaticCSATB3 = "RHS_Podnos_Bipod_Bag";

armasCSAT = ["rhs_weap_ak103","rhs_weap_ak104_npz","rhs_weap_ak105_npz","arifle_AK12_F","arifle_AK12_GL_F","rhs_weap_ak74_2","rhs_weap_ak74_gp25","rhs_weap_ak74m_2mag","rhs_weap_ak74m_gp25_1p29","rhs_weap_ak74n_gp25","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_asval","rhs_weap_svdp","rhs_weap_svds","rhs_weap_t5000","rhs_weap_vss","rhs_weap_aks74u","rhs_weap_rpg26","rhs_weap_rpg7","hgun_Pistol_heavy_01_F","rhs_weap_igla","rhs_weap_pya","rhs_weap_pkm","rhs_weap_pkp","rhs_weap_makarov_pm","rhs_weap_rpg7_pgo","rhs_weap_rshg2"];
municionCSAT = ["rhs_mag_nspn_yellow","rhs_mag_nspn_red","rhs_mag_nspn_green"];
{
_nombre = [_x] call BIS_fnc_baseWeapon;
_magazines = getArray (configFile / "CfgWeapons" / _nombre / "magazines");
municionCSAT pushBack (_magazines select 0);
} forEach armasCSAT;
humo = humo + ["rhs_mag_nspd","rhs_mag_rdg2_white","rhs_mag_rdg2_black"];
NVGoggles = NVGoggles + ["rhs_1PN138"];
//opticasAAF = opticasAAF + ["rhs_acc_1p29","rhs_acc_1p63","rhs_acc_rakursPM","rhs_acc_1p78","rhs_acc_1pn93_1","rhs_acc_1pn93_2","rhs_acc_dh520x56","rhs_acc_ekp1","rhs_acc_pgo7v","rhs_acc_pgo7v2","rhs_acc_pgo7v3","rhs_acc_pkas","rhs_acc_pso1m2","rhs_acc_pso1m21"];
itemsAAF = itemsAAF + ["rhs_acc_2dpZenit","rhs_acc_2dpZenit_ris","rhs_acc_uuk","rhs_acc_dtk1l","rhs_acc_ak5","rhs_acc_dtk","rhs_acc_dtk1983","rhs_acc_dtk1","rhs_acc_dtk1p","rhs_acc_dtk2","rhs_acc_dtk3","rhs_acc_dtk4short","rhs_acc_dtk4screws","rhs_acc_dtk4long","rhs_item_flightrecorder","rhs_acc_pbs1","rhs_acc_pbs4","rhs_acc_perst1ik","rhs_acc_perst1ik_ris","rhs_acc_perst3","rhs_acc_perst3_top","rhs_acc_perst3_2dp_h","rhs_acc_perst3_2dp_light_h","rhs_acc_pgs64","rhs_acc_pgs64_74u","rhs_acc_pgs64_74un","rhs_acc_grip_rk2","rhs_acc_grip_rk6","rhs_acc_tgpa","rhs_acc_tgpv"];

lamparaMuyMalos = "rhs_acc_2dpZenit";
flagCSATmrk = "rhs_flag_vmf";
nameMuyMalos = "AFRF";
if (isServer) then {"CSAT_carrier" setMarkerText "Russian Carrier"};