params ["_plane", "_type"];

/*  Equips a plane with the needed loadout

    Params:
        _plane: OBJECT : The actual plane object
        _type: STRING : The type of attack plane, either "CAS" or "AA"

    Returns:
        Nothing
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

private _validInput = false;
private _loadout = [];

if (_type == "CAS") then
{
    _validInput = true;
    switch (typeOf _plane) do
    {
        //Vanilla NATO CAS (A-10)
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
        case "I_Plane_Fighter_03_dynamicLoadout_F":
        {
            _loadout = ["PylonRack_1Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","","PylonRack_3Rnd_LG_scalpel","PylonRack_3Rnd_LG_scalpel","PylonRack_1Rnd_LG_scalpel"];
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
        case "RHS_Su25SM_CAS_vvs";
        case "rhsgref_cdf_b_su25";
        case "UK3CB_TKA_B_Su25SM_CAS";
        case "UK3CB_CW_SOV_O_LATE_Su25SM_CAS":
        {
            _loadout = ["rhs_mag_kh29D","rhs_mag_kh29D","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_kh25MTP","rhs_mag_b8m1_s8kom","rhs_mag_b8m1_s8kom","rhs_mag_R60M","rhs_mag_R60M","rhs_ASO2_CMFlare_Chaff_Magazine_x4"];
            _plane setVariable ["mainGun", "rhs_weap_gsh302"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_s8"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_kh29d_Launcher", "rhs_weap_kh25mtp_Launcher"]];
        };
        case "vn_b_air_f4c_hcas":
        {
            _loadout = ["vn_missile_f4_out_agm45_mag_x1","vn_missile_f4_out_agm45_mag_x1","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_rocket_ffar_f4_lau3_m229_he_x57","vn_bomb_f4_out_750_blu1b_fb_mag_x3","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_ffar_275in_launcher_m229"]];
            _plane setVariable ["missileLauncher", ["vn_missile_agm45_launcher"]];
        };
        case "vn_o_air_mi2_04_04":
        {
            _loadout = ["vn_rocket_s5_heat_x16","vn_rocket_s5_heat_x16"];
            _plane setVariable ["mainGun", "vn_ns23_v_01"];
            _plane setVariable ["rocketLauncher", ["vn_rocket_s5_heat_launcher"]];
        };
        case "RHSGREF_A29B_HIDF":
        {
            _loadout = ["rhs_mag_AGM114K_2_plane","rhs_mag_FFAR_7_USAF","rhs_mag_mk82","rhs_mag_FFAR_7_USAF","rhs_mag_AGM114N_2_plane","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x2"];
            _plane setVariable ["mainGun", "rhs_weap_M3W_A29"];
            _plane setVariable ["rocketLauncher", ["rhs_weap_FFARLauncher"]];
            _plane setVariable ["missileLauncher", ["rhs_weap_AGM114K_Launcher", "RHS_weap_AGM114N_Launcher"]];
        };
        case "UK3CB_MDF_B_Mystere_CAS1":
        {
            _loadout = ["PylonRack_3Rnd_Missile_AGM_02_F","PylonRack_12Rnd_missiles","PylonRack_12Rnd_missiles","PylonRack_3Rnd_Missile_AGM_02_F"];
            _plane setVariable ["mainGun", "uk3cb_mystere_cannon_30mm"];
            _plane setVariable ["rocketLauncher", ["missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["Missile_AGM_02_Plane_CAS_01_F"]];
        };
        case "UK3CB_AAF_B_L39_PYLON":
        {
            _loadout = ["PylonRack_7Rnd_Rocket_04_AP_F","PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_12Rnd_missiles","PylonRack_3Rnd_LG_scalpel","PylonRack_7Rnd_Rocket_04_AP_F"];
            _plane setVariable ["mainGun", "Twin_Cannon_20mm"];
            _plane setVariable ["rocketLauncher", ["Rocket_04_AP_Plane_CAS_01_F", "missiles_DAR"]];
            _plane setVariable ["missileLauncher", ["missiles_SCALPEL"]];
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
        case "rhs_mig29s_vvs";
        case "rhsgref_cdf_b_mig29s";
        case "UK3CB_TKA_O_MIG29SM";
        case "UK3CB_CW_SOV_O_LATE_MIG29S";
        case "UK3CB_AAF_O_MIG29S":
        {
            _loadout = ["rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R73M_APU73","rhs_mag_R77_AKU170_MIG29","rhs_mag_R77_AKU170_MIG29","","rhs_BVP3026_CMFlare_Chaff_Magazine_x2"];
        };
        case "RHS_T50_vvs_generic_ext":
        {
            _loadout = ["rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R77M","rhs_mag_R74M2_int","rhs_mag_R74M2_int","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170","rhs_mag_R77M_AKU170"];
        };
        case "UK3CB_TKA_B_L39_PYLON":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonWeapon_300Rnd_20mm_shells","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
        };
        case "vn_b_air_f4c_cap":
        {
            _loadout = ["vn_fuel_f4_370_mag","vn_fuel_f4_370_mag","","","vn_fuel_f4_600_mag","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_f4_lau7_aim9e_mag_x2","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1","vn_missile_aim7e2_mag_x1"];
        };
        case "vn_o_air_mi2_05_06":
        {
            _loadout = ["vn_missile_at3_mag_01_x1","vn_missile_at3_mag_01_x1","vn_missile_at3_mag_01_x1","vn_missile_at3_mag_01_x1","vn_missile_sa7b_mag_x2","vn_missile_sa7b_mag_x2"];
        };
        case "UK3CB_B_Mystere_HIDF_AA1";
        case "UK3CB_MDF_B_Mystere_AA1":
        {
            _loadout = ["PylonRack_1Rnd_Missile_AA_04_F","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_AAA_missiles","PylonRack_1Rnd_Missile_AA_04_F"];
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
