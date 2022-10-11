
class Templates
{
    class Vanilla_Base
    {
        requiredAddons[] = {};
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Vanilla\); //the path to the template folder
        priority = 10;
        nodes[] = {"Vanilla_Logistics_Nodes.sqf"};
        equipFlags[] = {"vanilla"};
    };

    class Vanilla_CSAT_Arid : Vanilla_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "A3 CSAT Arid";
        file = "Vanilla_AI_CSAT_Arid";
        camo[] = {"arid", "arctic"};
    };
    class Vanilla_CSAT_Tropical : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Tropical";
        file = "Vanilla_AI_CSAT_Tropical";
        camo[] = {"tropical"};
    };
    class Vanilla_CSAT_Temperate : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Temperate";
        file = "Vanilla_AI_CSAT_Enoch";
        camo[] = {"temperate"};
    };

    class Vanilla_NATO_Arid : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "A3 NATO Arid";
        file = "Vanilla_AI_NATO_Arid";
        camo[] = {"arid"};
    };
    class Vanilla_NATO_Tropical : Vanilla_NATO_Arid
    {
        name = "A3 NATO Tropical";
        file = "Vanilla_AI_NATO_Tropical";
        camo[] = {"tropical"};
    };
    class Vanilla_NATO_Temperate : Vanilla_NATO_Arid
    {
        name = "A3 NATO Temperate";
        file = "Vanilla_AI_NATO_Temperate";
        camo[] = {"temperate", "arctic"};
    };

    class Vanilla_LDF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "A3 LDF";
        file = "Vanilla_AI_LDF";
        maps[] = {"enoch","vt7"};
        camo[] = {"temperate"};
    };

    class Vanilla_AAF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "A3 AAF";
        file = "Vanilla_AI_AAF";
        maps[] = {"altis"};
        camo[] = {"arid"};
    };

    class Vanilla_FIA : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "A3 FIA";
        file = "Vanilla_Reb_FIA";
    };

    class Vanilla_SDK : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_exp\Flags\Flag_Synd_CO.paa";
        name = "A3 SDK";
        file = "Vanilla_Reb_SDK";
        maps[] = {"Tanoa"};
        camo[] = {"tropical"};
    };
    
    class Vanilla_Civ : Vanilla_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "Vanilla";
        file = "Vanilla_Civ";
    };

    //************* VN ********************************************************

    class VN_Base
    {
        requiredAddons[] = {"vn_weapons"};
        logo = "\vn\data_f_vietnam\logos\vn_sml_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\VN\);
        priority = 20;
        nodes[] = {"VN_Logistics_Nodes.sqf"};
        equipFlags[] = {"lowTech","replaceCompass","replaceWatch"};
        forceDLC[] = {"vn"};
//        maps = {"cam_lao_nam"};
    };

    class VN_MACV : VN_Base
    {
        side = "Inv";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
        name = "VN MACV";
        file = "VN_AI_MACV";
        camo[] = {"temperate"};
    };

    class VN_PAVN : VN_Base
    {
        side = "Occ";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
        name = "VN PAVN";
        file = "VN_AI_PAVN";
        camo[] = {"temperate"};
    };

    class VN_POF : VN_Base
    {
        side = "Reb";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_lao_dmg_ca.paa";
        name = "VN POF";
        file = "VN_Reb_POF";
    };

    class VN_Civ : VN_Base
    {
        side = "Civ";
        flagTexture = "\vn\objects_f_vietnam\flags\vn_flag_01_lao_co.paa";
        name = "Cam Lao Nam";
        file = "VN_Civ";
    };

    //************* RHS ********************************************************

    class RHS_Base
    {
        requiredAddons[] = {"rhsgref_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS\);
        logo = "\rhsusf\addons\rhsusf_main\data\rhs_logo_ca.paa";
        priority = 30;
        nodes[] = {"RHS_Logistics_Nodes.sqf"};
    };

    class RHS_AFRF_Arid : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
        name = "RHS AFRF Arid";
        file = "RHS_AI_AFRF_Arid";
        camo[] = {"arid"};
    };
    class RHS_AFRF_Temperate : RHS_AFRF_Arid
    {
        name = "RHS AFRF Temperate";
        file = "RHS_AI_AFRF_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };

    class RHS_CDF : RHS_Base
    {
        side = "Occ";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";
        name = "RHS CDF";
        file = "RHS_AI_CDF";
        maps[] = {"chernarus_summer","chernarus_winter"};
    };

    class RHS_USAF_Army_Arid : RHS_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "RHS US Army Arid";
        file = "RHS_AI_USAF_Army_Arid";
        camo[] = {"arid"};
    };
    class RHS_USAF_Army_Temperate : RHS_USAF_Army_Arid
    {
        name = "RHS US Army Temperate";
        file = "RHS_AI_USAF_Army_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };
    class RHS_USAF_Marines_Arid : RHS_USAF_Army_Arid
    {
        name = "RHS USMC Arid";
        file = "RHS_AI_USAF_Marines_Arid";
    };
    class RHS_USAF_Marines_Temperate : RHS_USAF_Army_Temperate
    {
        name = "RHS USMC Temperate";
        file = "RHS_AI_USAF_Marines_Temperate";
    };

    class RHS_NAPA : RHS_Base
    {
        side = "Reb";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_NAPA_co.paa";
        name = "RHS NAPA";
        file = "RHS_Reb_NAPA";
    };

    class RHS_Civ : RHS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "RHS";
        file = "RHS_Civ";
    };

    //************* 3CB Factions ***************************************************

    class 3CBF_Base
    {
        requiredAddons[] = {"UK3CB_Factions_Vehicles_SUV"};
        basepath = QPATHTOFOLDER(Templates\Templates\3CB\);
        //logo = "";            // unknown, may need rethink
        priority = 40;
        nodes[] = {"3CBFactions_Logistics_Nodes.sqf"};
    };

    class 3CBF_ADA : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa";
        name = "3CB ADA";
        file = "3CB_AI_ADA";
        camo[] = {"arid"};
    };

    class 3CBF_ANA : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ana\flag\afg_13_flag_co.paa";
        name = "3CB ANA";
        file = "3CB_AI_ANA";
        camo[] = {"arid"};
    };

    class 3CBF_CW_SOV : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa";
        name = "3CB Cold War USSR";
        file = "3CB_AI_CW_Sov";
        camo[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_CW_US : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "3CB Cold War US";
        file = "3CB_AI_CW_US";
        camo[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_HIDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "3CB HIDF";
        file = "3CB_AI_HIDF";
        maps[] = {"tanoa"};
        camo[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_MDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa";
        name = "3CB MDF";
        file = "3CB_AI_MDF";
        maps[] = {"malden"};
        camo[] = {"arid"};
    };

    class 3CBF_TKA_East : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
        name = "3CB TKA East";
        file = "3CB_AI_TKA_East";
        maps[] = {"takistan","tem_anizay","kunduz"};
        camo[] = {"arid"};
    };
    class 3CBF_TKA_West : 3CBF_TKA_East
    {
        side = "Occ";
        name = "3CB TKA West";
        file = "3CB_AI_TKA_West";
    };
    class 3CBF_TKA_Mix : 3CBF_TKA_East
    {
        side = "Occ";
        name = "3CB TKA Mix";
        file = "3CB_AI_TKA_Mix";
        priority = 39;               // not default anywhere
    };

    class 3CBF_AAF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "3CB AAF";
        file = "3CB_AI_AAF";
        maps[] = {"altis"};
        camo[] = {"arid"};
    };

    class 3CBF_LDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "3CB LDF";
        file = "3CB_AI_LDF";
        maps[] = {"enoch","vt7"};
        camo[] = {"temperate"};
    };

    class 3CBF_KRG : 3CBF_Base
    {
        // TODO: What is this faction?
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_krg\flag\krg_flag_co.paa";
        name = "3CB KRG";
        file = "3CB_AI_KRG";
        camo[] = {"arid"};
    };

    class 3CBF_CNM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
        name = "3CB CNM";
        file = "3CB_Reb_CNM";
    };

    class 3CBF_TKM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
        name = "3CB TKM";
        file = "3CB_Reb_TKM";
        maps[] = {"takistan","tem_anizay","kunduz"};
    };

    class 3CBF_CHC : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB Cherno";
        file = "3CB_Civ_CHC";
    };

    class 3CBF_TKC : 3CBF_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB Takistan";
        file = "3CB_Civ_TKC";
        maps[] = {"takistan","tem_anizay","kunduz"};
    };

    // ***************************** 3CB BAF *************************************************

    class 3CBBAF_Base
    {
        requiredAddons[] = {"UK3CB_BAF_Weapons","UK3CB_BAF_Vehicles","UK3CB_BAF_Units_Common","UK3CB_BAF_Equipment"};
        //requiredAddons[] = {"UK3CB_BAF_Units_Common"};              // has weapons/equipment/vehicles dependencies
        basepath = QPATHTOFOLDER(Templates\Templates\3CB\);
        logo = "\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Ammo\data\ui\logo_small_3cb_ca.paa";
        priority = 50;
        nodes[] = {"3CBBAF_Logistics_Nodes.sqf"};
    };

    class 3CBBAF_Arid : 3CBBAF_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "3CB BAF Arid";
        file = "3CB_AI_BAF_Arid";
        camo[] = {"arid"};
    };
    class 3CBBAF_Arctic : 3CBBAF_Arid
    {
        name = "3CB BAF Arctic";
        file = "3CB_AI_BAF_Arctic";
        camo[] = {"arctic"};
    };
    class 3CBBAF_Temperate : 3CBBAF_Arid
    {
        name = "3CB BAF Temperate";
        file = "3CB_AI_BAF_Temperate";
        camo[] = {"temperate"};
    };
    class 3CBBAF_Tropical : 3CBBAF_Arid
    {
        name = "3CB BAF Tropical";
        file = "3CB_AI_BAF_Tropical";
        camo[] = {"tropical"};
    };

    // ************************************** CUP *******************************************************

    class CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\CUP\);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";
        priority = 60;
        nodes[] = {"CUP_Logistics_Nodes.sqf"};
    };

    class CUP_ACR_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa";
        name = "CUP ACR Arid";
        file = "CUP_AI_ACR_Arid";
        camo[] = {"arid"};
    };
    class CUP_ACR_Temperate : CUP_ACR_Arid
    {
        name = "CUP ACR Temperate";
        file = "CUP_AI_ACR_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };

    class CUP_AFRF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa";
        name = "CUP AFRF Arid";
        file = "CUP_AI_AFRF_Arid";
        camo[] = {"arid"};
    };
    class CUP_AFRF_Temperate : CUP_AFRF_Arid
    {
        name = "CUP AFRF Temperate";
        file = "CUP_AI_AFRF_Temperate";
        camo[] = {"temperate","tropical"};
    };
    class CUP_AFRF_Arctic : CUP_AFRF_Arid
    {
        name = "CUP AFRF Arctic";
        file = "CUP_AI_AFRF_Arctic";
        camo[] = {"arctic"};
    };

    class CUP_BAF_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CUP BAF Arid";
        file = "CUP_AI_BAF_Arid";
        camo[] = {"arid"};
    };
    class CUP_BAF_Temperate : CUP_BAF_Arid
    {
        name = "CUP BAF Temperate";
        file = "CUP_AI_BAF_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };

    class CUP_CDF_Arctic : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa";
        name = "CUP CDF Arctic";
        file = "CUP_AI_CDF_Arctic";
        camo[] = {"arctic"};
        maps[] = {"chernarus_winter"};
    };
    class CUP_CDF_Temperate : CUP_CDF_Arctic
    {
        name = "CUP CDF Temperate";
        file = "CUP_AI_CDF_Temperate";
        camo[] = {"temperate"};
        maps[] = {"chernarus_summer"};
    };

    class CUP_RACS_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa";
        name = "CUP RACS Arid";
        file = "CUP_AI_RACS_Arid";
        camo[] = {"arid"};
        maps[] = {"sara"};
    };
    class CUP_RACS_Tropical : CUP_RACS_Arid
    {
        name = "CUP RACS Tropical";
        file = "CUP_AI_RACS_Tropical";
        camo[] = {"tropical"};
        maps[] = {"tanoa"};
    };

    class CUP_SLA : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa";
        name = "CUP SLA";
        file = "CUP_AI_SLA_Temperate";          // Sahrani is a bit weird
        camo[] = {"arid","temperate"};
        maps[] = {"sara"};
    };

    class CUP_TKA : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKA";
        file = "CUP_AI_TKA_Arid";
        camo[] = {"arid"};
        maps[] = {"takistan","kunduz"};
    };

    class CUP_USAF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP US Army Arid";
        file = "CUP_AI_US_Army_Arid";
        camo[] = {"arid"};
    };
    class CUP_USAF_Temperate : CUP_USAF_Arid
    {
        name = "CUP US Army Temperate";
        file = "CUP_AI_US_Army_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };

    class CUP_USMC_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP USMC Arid";
        file = "CUP_AI_US_Marine_Arid";
        camo[] = {"arid"};
    };
    class CUP_USMC_Temperate : CUP_USMC_Arid
    {
        name = "CUP USMC Temperate";
        file = "CUP_AI_US_Marine_Temperate";
        camo[] = {"temperate","tropical","arctic"};
    };

    class CUP_ION_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "CUP ION Arid";
        file = "CUP_AI_ION_Arid";
        camo[] = {"arid","temperate","tropical"};
    };
    class CUP_ION_Temperate : CUP_ION_Arid
    {
        name = "CUP ION Arctic";
        file = "CUP_AI_ION_Arctic";
        camo[] = {"arctic"};
    };

    class CUP_NAPA : CUP_Base
    {
        side = "Reb";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        name = "CUP NAPA";
        file = "CUP_Reb_NAPA";
    };
    
    class CUP_Civ : CUP_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "CUP civs";
        file = "CUP_Civ";
    };

    // ************************************* Unsung *******************************************************

    class UNS_Base
    {
        requiredAddons[] = {"uns_weap_w"};
        basepath = QPATHTOFOLDER(Templates\Templates\UNS\);
        logo = "\uns_main\data\unsung_logo.paa";
        priority = 70;
        equipFlags[] = {"lowTech"};
        nodes[] = {"UNS_Logistics_Nodes.sqf"};
    };

    class UNS_US : UNS_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "Unsung US";
        file = "UNS_AI_US";
        camo[] = {"tropical"};
    };

    class UNS_NVA : UNS_Base
    {
        side = "Occ";
        flagTexture = "\uns_flags\flag_pavn_co.paa";
        name = "Unsung NVA";
        file = "UNS_AI_NVA";
        camo[] = {"tropical"};
    };

    class UNS_VC : UNS_Base
    {
        side = "Reb";
        flagTexture = "\uns_flags\flag_vc_co.paa";
        name = "Unsung VC";
        file = "UNS_Reb_VC";
        camo[] = {"tropical"};
    };

    class UNS_Civ : UNS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Unsung civs";
        file = "UNS_Civ";
    };

};
