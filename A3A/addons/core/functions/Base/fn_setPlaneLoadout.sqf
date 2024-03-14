params ["_plane", "_type"];

/*  Equips a plane with the needed loadout
    Params:
        _plane: OBJECT : The actual plane object
        _type: STRING : The type of attack plane, either "CAS" or "AA"
    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _validInput = false;
private _loadout = [];

if (_type == "CAS") then
{
    _validInput = true;
    switch (typeOf _plane) do
    {
        //Vanilla NATO CAS (A-10)
        case "B_D_Plane_CAS_01_dynamicLoadout_lxWS";
        case "B_Plane_CAS_01_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_HE_F"];
            _plane setVariable ["mainGun", "Gatling_30mm_Plane_CAS_01_F"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_HE_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"]];
        };
        //Vanilla CSAT CAS
        case "O_Plane_CAS_02_dynamicLoadout_F":
        {
            _loadout = ["PylonMissile_1Rnd_LG_scalpel","PylonRack_19Rnd_Rocket_Skyfire","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_19Rnd_Rocket_Skyfire","PylonMissile_1Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Cannon_30mm_Plane_CAS_02_F"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_AP_Plane_CAS_02_F", "rockets_Skyfire"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
        };
        //Vanilla IND CAS
        case "a3a_Plane_Fighter_03_grey_F";
        case "I_Plane_Fighter_03_dynamicLoadout_F":
        {
//            _loadout = ["PylonRack_1Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_1Rnd_LG_scalpel"];
            _loadout = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_1Rnd_Missile_AGM_02_F","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_Missile_AGM_02_F","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F", "missiles_SCALPEL"]];
        };
        //RHS US CAS (A-10)
        case "RHS_A10";
        case "UK3CB_CW_US_B_EARLY_A10":

        {
            _loadout = ["rhs_mag_ANALQ131","rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d_3","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_M151_7_USAF_LAU131","","rhs_mag_M151_7_USAF_LAU131","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_agm65d_3","rhs_mag_M151_7_USAF_LAU131","","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"];
            _plane setVariable ["mainGun", "RHS_weap_gau8"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_agm65d"]];
        };
        //RHS CDF
        case "rhs_l159_cdf_b_CDF":
        {
            _loadout = ["rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_zpl20_apit","rhs_mag_agm65d","rhs_mag_agm65d","rhs_mag_M151_7_USAF_LAU131","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "RHS_weap_zpl20"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_agm65d"]];
        };
        //RHS/3CB
        case "RHS_Su25SM_vvsc";
        case "RHS_Su25SM_CAS_vvs";
        case "rhsgref_cdf_b_su25";
        case "UK3CB_TKA_B_Su25SM_CAS";
        case "UK3CB_LDF_B_Su25SM_CAS";
        case "UK3CB_ADA_I_Su25SM_CAS";
        case "UK3CB_KDF_B_Su25SM_CAS";
        case "UK3CB_CW_SOV_O_LATE_Su25SM_CAS":
        {
            _loadout = ["rhs_mag_kh29D","rhs_mag_kh29D","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_b8m1_s8kom","rhs_mag_b8m1_s8kom","rhs_mag_R60M","rhs_mag_R60M","rhs_ASO2_CMFlare_Chaff_Magazine_x4"];
            _plane setVariable ["mainGun", "rhs_weap_gsh302"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_kh29d_Launcher", "rhs_weap_kh25mtp_Launcher"]];
        };
        case "rhssaf_airforce_l_18":
        {
            _loadout = ["rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_b8m1_bd3_umk2a_s8kom","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_kh25MTP_apu68_mig29","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_gsh301"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8", "rhs_weap_s8df"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_kh25mtp_Launcher"]];
        };
        case "UK3CB_B_Mystere_HIDF_CAS1";
        case "UK3CB_MDF_B_Mystere_CAS1":
        {
            _loadout = ["PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonRack_3Rnd_Missile_AGM_02_F"];
            _plane setVariable ["mainGun", "uk3cb_mystere_cannon_30mm"];
            _plane setVariable ["rocketLauncher", ["missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F"]];
        };
        case "UK3CB_ADA_B_L39_PYLON";
        case "UK3CB_AAF_B_L39_PYLON";
        case "UK3CB_KRG_B_L39_PYLON";
        case "UK3CB_LDF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F", "missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
        };
        case "UK3CB_TKA_B_MIG21_AT":
        {
            _loadout = ["uk3cb_mag_kh25MA","rhs_mag_b8m1_bd3_umk2a_s8t","rhs_mag_b8m1_bd3_umk2a_s8t","uk3cb_mag_kh25MA"];
            _plane setVariable ["mainGun", "uk3cb_mig21_GSh23L_23mm"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8t"]];
            _plane setVariable ["missileLauncher", ["uk3cb_weap_kh25ma_Launcher"]];
        };
        case "UK3CB_AAF_B_Gripen_G";
        case "UK3CB_AAF_B_Gripen_DG":
        {
            _loadout = ["","","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x2","PylonRack_Missile_AGM_02_x2"];
            _plane setVariable ["mainGun", "weapon_Fighter_Gun20mm_AA"];
            _plane setVariable ["missileLauncher", ["weapon_AGM_65Launcher"]];
        };
        case "RHSGREF_A29B_HIDF":
        {
            _loadout = ["PylonRack_3Rnd_LG_scalpel","rhs_mag_M151_7_USAF_LAU131","","rhs_mag_M151_7_USAF_LAU131","PylonRack_3Rnd_LG_scalpel","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_M3W_A29"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
            [_plane] spawn {
                params["_plane"];
                while {((gunner _plane) isEqualTo objNull)} do {sleep 1};
                (gunner _plane) forceWeaponFire ["rhs_weap_laserDesignator_AI", "rhs_weap_laserDesignator_AI"];
            };
        };
        case "UK3CB_AAF_B_T28Trojan_CAS";
        case "UK3CB_ION_B_Desert_T28Trojan_CAS";
        case "UK3CB_B_T28Trojan_HIDF_CAS";
        case "UK3CB_MDF_B_T28Trojan_NAVY_CAS";
        case "UK3CB_MDF_B_T28Trojan_CAS":
        {
            _loadout = ["PylonRack_3Rnd_LG_scalpel","PylonWeapon_300Rnd_20mm_shells","PylonWeapon_300Rnd_20mm_shells","PylonRack_3Rnd_LG_scalpel"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm_gunpod"];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
            [_plane] spawn {
                params["_plane"];
                while {((gunner _plane) isEqualTo objNull)} do {sleep 1};
                (gunner _plane) forceWeaponFire ["Laserdesignator_mounted", "Laserdesignator_mounted"];
            };
        };
        //SOG:PF
        case "vn_b_air_f4c_at":
        {
            _loadout = ["vn_missile_f4_out_agm45_mag_x1","vn_missile_f4_out_agm45_mag_x1","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_bomb_f4_out_750_blu1b_fb_mag_x3","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_ffar_275in_launcher_m229"]];
            _plane setVariable ["missileLauncher", ["vn_missile_agm45_launcher"]];
        };
        case "vn_b_air_f100d_at":
        {
            _loadout = ["vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_camo_01_mag","vn_fuel_f100_335_camo_01_mag","vn_missile_agm45_03_mag_x1","vn_missile_agm45_03_mag_x1"];
            _plane setVariable ["mainGun", "vn_m39a1_v_quad"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_ffar_275in_launcher_m229"]];
            _plane setVariable ["missileLauncher", ["vn_missile_agm45_launcher"]];
        };
        case "vn_o_air_mig19_at":
        {
            _loadout = ["vn_rocket_s5_heat_x16","vn_rocket_s5_heat_x16","vn_missile_kh66_mag_01_x1","vn_missile_kh66_mag_01_x1"];
            _plane setVariable ["mainGun", "vn_nr30_v_01"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_s5_heat_launcher"]];
            _plane setVariable ["missileLauncher", ["vn_missile_kh66_launcher"]];
        };
        case "vn_o_air_mig21_cas":
        {
            _loadout = ["vn_missile_mig21_kh66_mag_x1","vn_missile_mig21_kh66_mag_x1","vn_gunpod_gsh23l_v_200_mag"];
            _plane setVariable ["mainGun", "vn_gunpod_gsh23l"];
            _plane setVariable ["missileLauncher", ["vn_missile_kh66_launcher"]];
        };
        // cup aircraft
        case "CUP_B_L39_CZ":
        {
            _loadout = ["CUP_PylonPod_20Rnd_S8_plane_M","PylonRack_1Rnd_Missile_AGM_01_F","PylonRack_1Rnd_Missile_AGM_01_F","CUP_PylonPod_20Rnd_S8_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh23L_L39"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_S8_veh"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_01_Plane_CAS_02_F"]];
        };
        case "CUP_B_Su25_Dyn_CDF";
        case "CUP_O_Su25_Dyn_RU";
        case "CUP_O_Su25_Dyn_SLA";
        case "CUP_O_Su25_Dyn_TKA":
        {
            _loadout = ["CUP_PylonPod_1Rnd_R73_Vympel","PylonRack_20Rnd_Rocket_03_HE_F","PylonRack_20Rnd_Rocket_03_AP_F","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","CUP_PylonPod_1Rnd_Kh29_M","PylonRack_20Rnd_Rocket_03_AP_F","PylonRack_20Rnd_Rocket_03_HE_F","CUP_PylonPod_1Rnd_R73_Vympel"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GSh302K_veh"];
            _plane setVariable ["rocketLauncher", ["Rocket_03_HE_Plane_CAS_02_F", "Rocket_03_AP_Plane_CAS_02_F"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_Kh29L_veh"]];
        };
        case "CUP_B_A10_DYN_USA":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_Rocket_FFAR_plane_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU8_veh"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_FFAR_veh", "CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","PylonWeapon_300Rnd_20mm_shells","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        case "CUP_B_AV8B_DYN_USMC":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_FAT_plane_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_1Rnd_AGM65_Maverick_M","CUP_PylonPod_19Rnd_CRV7_FAT_plane_M"];
            _plane setVariable ["mainGun", "CUP_Vacannon_GAU12_veh"];
            _plane setVariable ["rocketLauncher", ["CUP_Vmlauncher_CRV7_veh"]];
            _plane setVariable ["missileLauncher", ["CUP_Vmlauncher_AGM65pod_veh"]];
        };
        //Unsung
        case "uns_Mig21_CAS":
        {
            _loadout = ["","","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_32Rnd_Rocket_57_HE","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_1Rnd_Bomb_kab500","uns_pylonRack_96Rnd_Rocket_57_HE"];
            _plane setVariable ["mainGun", "uns_NR30"];
            _plane setVariable ["rocketLauncher", ["uns_57mmLauncher_dl"]];
        };
        case "uns_A1J_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_1Rnd_Rocket_HVAR_AT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_fuel_A1"];
            _plane setVariable ["mainGun", "uns_Uns_M2_4x20mm"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_HEAT_Launcher_dl", "Uns_HVARLauncher_dl"]];
        };
        case "uns_A7_CAS":
        {
            _loadout = ["uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_19Rnd_Rocket_FFAR_WP","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_19Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E"];
            _plane setVariable ["mainGun", "uns_M61A1"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_WP_Launcher_dl", "Uns_FFAR_HEAT_Launcher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };
        case "uns_A6_Intruder_CAS":
        {
            _loadout = ["uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_12Rnd_Rocket_Zuni_AT","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12"];
            _plane setVariable ["rocketLauncher", ["Uns_ZuniLauncher_dl", "Uns_HVARLauncher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };
        case "uns_F4J_CAS":
        {
            _loadout = ["uns_pylonRack_1Rnd_AGM12","uns_pylonRack_1Rnd_AGM12","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_f4_38Rnd_Rocket_FFAR_HEAT","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AGM12"];
            _plane setVariable ["rocketLauncher", ["Uns_FFAR_HEAT_Launcher_dl"]];
            _plane setVariable ["missileLauncher", ["uns_AGM12_Launcher_dl"]];
        };
        case "Tornado_AWS_camo_ger":
        {
            _loadout = ["Tornado_AWS_ECMpod_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_Brimstone_DM_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","FIR_Brimstone_DM_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_IRIS_T_P_1rnd_M","Tornado_AWS_AIRCMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"];
            _plane setVariable ["mainGun", "Tornado_AWS_CANNON_W"];
            _plane setVariable ["missileLauncher", ["FIR_Brimstone"]];
        };
        // IFA test planes
        case "LIB_Ju87": {
            _loadout = ["LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50"];
            _plane setVariable ["mainGun", "LIB_2xMG151_JU87"];
            _plane setVariable ["bombRacks", ["LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [15, -2]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "LIB_Pe2": {
            _loadout = ["LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250"];
            _plane setVariable ["mainGun", "LIB_UBK_PE2"];
            _plane setVariable ["bombRacks", ["LIB_FAB250_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [12, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        // SPE planes
        case "SPE_FW190F8": {
            _loadout = ["SPE_250Rnd_MG151","SPE_250Rnd_MG151","SPE_400Rnd_MG131","SPE_400Rnd_MG131","SPE_1Rnd_SC50","SPE_1Rnd_SC50","SPE_1Rnd_SC500","SPE_1Rnd_SC50","SPE_1Rnd_SC50"];
            _plane setVariable ["mainGun", "SPE_2xMG151"];
            _plane setVariable ["bombRacks", ["SPE_SC500_Bomb_Mount","SPE_SC50_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 300, 110, 55, 15, [0, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        case "SPE_P47": {
            _loadout = ["SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_425rnd_M2_P47","SPE_3Rnd_M8_P47","SPE_3Rnd_M8_P47","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb","SPE_1Rnd_US_500lb"];
            _plane setVariable ["mainGun", "SPE_8xM2_P47"];
            _plane setVariable ["rocketLauncher", ["SPE_M8_Launcher_P47"]];
            _plane setVariable ["bombRacks", ["SPE_US_500lb_Bomb_Mount"]];
            _plane setVariable ["diveParams", [1200, 350, 110, 55, 15, [3, 0]]];        // start (m), end (m), diveSpeed (m/s), dive start angle (deg), turnRate (deg/s), bombOffset (m)
        };
        default
        {
            Error_1("Plane type %1 currently not supported for CAS, please add the case!", typeOf _plane);
        };
    };
};
if (_type == "AA") then
{
    switch (typeOf _plane) do
    {
        //Vanilla NATO Air superiority fighter
        case "B_Plane_Fighter_01_F":
        {
            _loadout = ["PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"];
        };
        //Vanilla CSAT Air superiority fighter
        case "O_Plane_Fighter_02_F":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1"];
        };
        //Vanilla IND Air superiority fighter
        case "a3a_Plane_Fighter_04_grey_F";
        case "I_Plane_Fighter_04_F":
        {
            _loadout = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_BIM9X_x2","PylonRack_Missile_BIM9X_x2"];
        };
        //RHS US Air superiority fighter
        case "rhsusf_f22":
        {
            _loadout = ["rhs_mag_Sidewinder_int","rhs_mag_aim120d_int","rhs_mag_aim120d_2_F22_l","rhs_mag_aim120d_2_F22_r","rhs_mag_aim120d_int","rhs_mag_Sidewinder_int","rhsusf_ANALE52_CMFlare_Chaff_Magazine_x4"];
        };
        case "rhs_l159_cdf_b_CDF_CAP":
        {
            _loadout = ["rhs_mag_aim9m","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_zpl20_mixed","rhs_mag_aim120","rhs_mag_aim120","rhs_mag_aim9m","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
        };
        //RHS Russian Air superiority
        case "rhs_mig29sm_vvs";
        case "rhs_mig29s_vvs";
        case "rhsgref_cdf_b_mig29s";
        case "UK3CB_TKA_O_MIG29SM";
        case "UK3CB_CW_SOV_O_LATE_MIG29S";
        case "UK3CB_LDF_B_MIG29SM";
        case "UK3CB_KDF_B_MIG29SM";
        case "UK3CB_AAF_O_MIG29S":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R77_AKU170_MIG29","rhs_mag_R77_AKU170_MIG29","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
        };
        case "RHS_T50_vvs_generic_ext":
        {
            _loadout = ["rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R74M2_int","rhs_mag_R74M2_int","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170"];
        };
        case "rhssaf_airforce_o_l_18_101":
        {
            _loadout = ["rhs_mag_R27ER_APU470","rhs_mag_R27ER_APU470","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
        };
        case "UK3CB_ANA_B_L39_PYLON";
        case "UK3CB_ADA_B_L39_PYLON";
        case "UK3CB_ADA_I_L39_PYLON";
        case "UK3CB_TKA_B_L39_PYLON";
        case "UK3CB_KRG_B_L39_PYLON";
        case "UK3CB_LDF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_GAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_GAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
        };
        case "UK3CB_AAF_B_Gripen_G";
        case "UK3CB_AAF_B_Gripen_DG":
        {
            _loadout = ["PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x1","PylonRack_Missile_AMRAAM_C_x2","PylonRack_Missile_AMRAAM_C_x2"];
        };
        case "UK3CB_LDF_B_MIG21_AA";
        case "UK3CB_TKA_B_MIG21_AA":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73"];
        };
        case "UK3CB_LDF_B_MIG21_AA";
        case "UK3CB_TKA_B_MIG21_AA":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73"];
        };
        case "vn_b_air_f4c_cap":
        {
            _loadout = ["vn_fuel_f4_370_mag","vn_fuel_f4_370_mag","","","vn_fuel_f4_600_mag","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
        };
        case "vn_b_air_f100d_cap":
        {
            _loadout = ["vn_rocket_ffar_f4_lau59_m229_he_x21","vn_rocket_ffar_f4_lau59_m229_he_x21","vn_fuel_f100_335_mag","vn_fuel_f100_335_mag","vn_missile_aim9e_mag_x1","vn_missile_aim9e_mag_x1"];
        };
        case "vn_o_air_mig19_cap":
        {
            _loadout = ["vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1","vn_missile_mig19_01_aa2_mag_x1"];
        };
        case "vn_o_air_mig21_cap":
        {
            _loadout = ["vn_missile_mig21_aa2_mag_x1","vn_missile_mig21_aa2_mag_x1","vn_gunpod_gsh23l_v_200_mag"];
        };
        case "UK3CB_B_Mystere_HIDF_AA1";
        case "UK3CB_MDF_B_Mystere_AA1":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
        };
        // cup aircraft
        case "CUP_B_L39_CZ":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1"];
        };
        case "CUP_O_L39_TK":
        {
            _loadout = ["PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1"];
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["CUP_PylonPod_19Rnd_CRV7_HE_plane_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","PylonRack_1Rnd_AAA_missiles"];
        };
        case "CUP_B_SU34_CDF";
        case "CUP_O_SU34_RU";
        case "CUP_O_SU34_SLA":
        {
            _loadout = ["CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel","CUP_PylonPod_1Rnd_R73_Vympel"];
        };
        case "CUP_B_F35B_USMC":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonWeapon_220Rnd_TE1_Red_Tracer_GAU22_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_B_GR9_DYN_GB":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_ALQ_131","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_B_AV8B_DYN_USMC":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M"];
        };
        case "CUP_I_JAS39_RACS":
        {
            _loadout = ["CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M","CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M"];
        };
        //Unsung
        case "uns_f100b_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_fuel_f100","uns_pylonRack_1Rnd_fuel_f100","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_AIM9D","uns_pylonRack_1Rnd_fuel_f100"];
        };
        case "uns_F4E_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_fuel_f4","uns_pylonRack_1Rnd_fuel_f4","","","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM9E","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_AIM7","uns_pylonRack_1Rnd_fuel_f4"];
        };
        case "uns_Mig21_CAP":
        {
            _loadout = ["uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1Rnd_K13","uns_pylonRack_1rnd_fuel_mig21","uns_pylonRack_1rnd_fuel_mig21","uns_pylonRack_1rnd_fuel_mig21"];

        };
        //SEAD but no other Ground Weapons so AA
        case "Tornado_AWS_ecr_ger":
        {
            _loadout = ["Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","","FIR_AGM88_P_1rnd_M","FIR_AGM88_P_1rnd_M","","","","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","",""];
        };
        case "Tornado_AWS_GER":
        {
            _loadout = ["Tornado_AWS_AIRCMpod_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_Litening_std_P_1rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_Brimstone_type1_P_3rnd_M","FIR_GBU12_P_1rnd_M","FIR_Brimstone_type2_P_3rnd_M","FIR_Brimstone_type2_P_3rnd_M","Tornado_AWS_fuelsmall_1rnd_M","FIR_AIM9L_P_1rnd_M","Tornado_AWS_ECMpod_1rnd_M","FIR_BK27_R_M","FIR_BK27_L_M"];
        };
        default
        {
            Error_1("Plane type %1 currently not supported for AA, please add the case!", typeOf _plane);
        };
    };
};

if !(_loadout isEqualTo []) then
{
    Debug("Selected new loadout for plane, now equiping plane with it");
    {
        _plane setPylonLoadout [_forEachIndex + 1, _x, true];
        _plane setVariable ["loadout", _loadout];
    } forEach _loadout;
};
