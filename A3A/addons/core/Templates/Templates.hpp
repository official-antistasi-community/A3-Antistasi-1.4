
class Templates
{
    // ***************************** Vanilla *****************************
    class Vanilla_Base
    {
        requiredAddons[] = {};
        logo = "a3\ui_f\data\logos\arma3_white_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Vanilla); //the path to the template folder
        priority = 10;
        equipFlags[] = {"vanilla"};
    };

    class Vanilla_CSAT_Arid : Vanilla_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "A3 CSAT Arid";
        file = "Vanilla_AI_CSAT_Arid";
        climate[] = {"arid", "arctic"};
    };
    class Vanilla_CSAT_Temperate : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Temperate";
        file = "Vanilla_AI_CSAT_Enoch";
        climate[] = {"temperate","tropical"};
    };
    class Vanilla_CSAT_Apex : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Apex";
        file = "Vanilla_AI_CSAT_Apex";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };
    class Vanilla_CSAT_Enoch : Vanilla_CSAT_Arid
    {
        name = "A3 CSAT Enoch";
        file = "Vanilla_AI_CSAT_Enoch";
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
    };

    class Vanilla_NATO_Arid : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "A3 NATO Arid";
        file = "Vanilla_AI_NATO_Arid";
        climate[] = {"arid"};
    };
    class Vanilla_NATO_Tropical : Vanilla_NATO_Arid
    {
        name = "A3 NATO Tropical";
        file = "Vanilla_AI_NATO_Tropical";
        climate[] = {"tropical"};
    };
    class Vanilla_NATO_Temperate : Vanilla_NATO_Arid
    {
        name = "A3 NATO Temperate";
        file = "Vanilla_AI_NATO_Temperate";
        climate[] = {"temperate", "arctic"};
    };
    class Vanilla_NATO_Apex : Vanilla_NATO_Arid
    {
        name = "A3 NATO Apex";
        file = "Vanilla_AI_NATO_Apex";
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };

    class Vanilla_LDF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "A3 LDF";
        file = "Vanilla_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
    };

    class Vanilla_AAF : Vanilla_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "A3 AAF";
        file = "Vanilla_AI_AAF";
        maps[] = {"altis"};
        climate[] = {"arid"};
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
        climate[] = {"tropical"};
        forceDLC[] = {"expansion"};
    };

    class Vanilla_LFF : Vanilla_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_Enoch\Flags\flag_looters_co.paa";
        name = "A3 LFF";
        file = "Vanilla_Reb_LFF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
        forceDLC[] = {"enoch"};
    };
    class Vanilla_Civ : Vanilla_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "Vanilla";
        file = "Vanilla_Civ";
    };

    // ***************************** Western Sahara *****************************
    class WS_Base : Vanilla_Base
    {
        requiredAddons[] = {"Weapons_1_F_lxWS"};
        logo = "\lxWS\data_f_lxWS\Logos\arma3_lxws_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\WS); //the path to the template folder
        priority = 5;
        forceDLC[] = {"ws"};
        climate[] = {"arid"};
    };
    class WS_ION : WS_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "WS ION";
        file = "WS_AI_ION";
    };
    class WS_SIFA : WS_Base
    {
        side = "Inv";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_SFIA_CO.paa";
        name = "WS SFIA";
        file = "WS_AI_SFIA";
    };
    class WS_ADF : WS_Base
    {
        side = "Occ";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_Argana_CO.paa";
        name = "WS ADF";
        file = "WS_AI_ADF";
    };
    class WS_CSAT : WS_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "WS CSAT North Africa";
        file = "WS_AI_CSAT_NAfrica";
    };
    class WS_TURA : WS_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "WS Tura";
        file = "WS_Reb_TURA";
    };
    class WS_Civ : WS_Base
    {
        side = "Civ";
        flagTexture = "\lxws\data_f_lxws\img\flags\flag_Argana_CO.paa";
        name = "Western Sahara";
        file = "WS_Civ";
    };
    class WS_NATO : WS_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "WS NATO Desert";
        file = "WS_AI_NATO_Desert";
    };
    // ***************************** VN *****************************

    class VN_Base
    {
        requiredAddons[] = {"vn_weapons"};
        logo = "\vn\data_f_vietnam\logos\vn_sml_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\VN);
        priority = 20;
        equipFlags[] = {"lowTech","replaceCompass","replaceWatch"};
        forceDLC[] = {"vn"};
    };

    class VN_MACV : VN_Base
    {
        side = "Inv";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_usa_co.paa";
        name = "VN MACV";
        file = "VN_AI_MACV";
    };

    class VN_PAVN : VN_Base
    {
        side = "Occ";
        flagTexture = "vn\objects_f_vietnam\flags\data\vn_flag_01_pavn_co.paa";
        name = "VN PAVN";
        file = "VN_AI_PAVN";
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

    // ***************************** RHS *****************************

    class RHS_Base
    {
        requiredAddons[] = {"rhsgref_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhsusf\addons\rhsusf_main\data\rhs_logo_ca.paa";
        priority = 30;
    };

    class RHS_AFRF_Arid : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsafrf\addons\rhs_main\data\flag_rus_co.paa";
        logo = "\rhsafrf\addons\rhs_main\data\rhs_logo_ca.paa";
        name = "RHS AFRF Arid";
        file = "RHS_AI_AFRF_Arid";
        climate[] = {"arid"};
    };
    class RHS_AFRF_Temperate : RHS_AFRF_Arid
    {
        name = "RHS AFRF Temperate";
        file = "RHS_AI_AFRF_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class RHS_CHDKZ : RHS_Base
    {
        side = "Inv";
        flagTexture = "rhsgref\addons\rhsgref_main\data\flag_chdkz_co.paa";
        name = "RHS ChDKZ";
        file = "RHS_AI_ChDKZ";
        maps[] = {"chernarus_summer","chernarus_winter","chernarus"};
        logo = "\rhsgref\addons\rhsgref_main\data\rhs_logo_ca.paa";
    };
    
    class RHS_CDF : RHS_Base
    {
        side = "Occ";
        flagTexture = "\rhsgref\addons\rhsgref_main\data\Flags\flag_cdf_co.paa";
        name = "RHS CDF";
        file = "RHS_AI_CDF";
        maps[] = {"chernarus_summer","chernarus_winter","chernarus"};
    };

    class RHS_USAF_Army_Arid : RHS_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "RHS US Army Arid";
        file = "RHS_AI_USAF_Army_Arid";
        climate[] = {"arid"};
    };
    class RHS_USAF_Army_Temperate : RHS_USAF_Army_Arid
    {
        name = "RHS US Army Temperate";
        file = "RHS_AI_USAF_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
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

    class RHS_SAF_Base
    {
        requiredAddons[] = {"rhssaf_main"};
        basepath = QPATHTOFOLDER(Templates\Templates\RHS);
        logo = "\rhssaf\addons\rhssaf_main\data\rhs_logo_ca.paa";
        priority = 30;
    };
    class RHS_SAF : RHS_SAF_Base
    {
        side = "Inv";
        flagTexture = "rhssaf\addons\rhssaf_main\data\flags\flag_serbia_co.paa";
        name = "RHS SAF";
        file = "RHS_AI_SAF";
    };

    // ***************************** 3CB Factions *****************************

    class 3CBF_Base
    {
        requiredAddons[] = {"UK3CB_Factions_Vehicles_SUV"};
        basepath = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = QPATHTOFOLDER(Templates\Templates\3CB\logo_small_3cb_ca.paa);            // unknown, may need rethink
        priority = 40;
    };

    class 3CBF_ADA : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_adc\flag\adc_flag_co.paa";
        name = "3CB ADA";
        file = "3CB_AI_ADA";
        climate[] = {"arid"};
    };

    class 3CBF_ANA : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ana\flag\afg_13_flag_co.paa";
        name = "3CB ANA";
        file = "3CB_AI_ANA";
        climate[] = {"arid"};
    };

    class 3CBF_CW_SOV : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_cw_sov\flag\cw_sov_army_flag_co.paa";
        name = "3CB Cold War USSR";
        file = "3CB_AI_CW_Sov";
        climate[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_CW_US : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "3CB Cold War US";
        file = "3CB_AI_CW_US";
        climate[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_HIDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "3CB HIDF";
        file = "3CB_AI_HIDF";
        maps[] = {"tanoa"};
        climate[] = {"temperate","tropical","arctic"};
    };

    class 3CBF_MDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_mdf\flag\mal_flag_co.paa";
        name = "3CB MDF";
        file = "3CB_AI_MDF";
        maps[] = {"malden"};
        climate[] = {"arid"};
    };

    class 3CBF_TKA_East : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "UK3CB_Factions\addons\UK3CB_Factions_TKA\Flag\tka_flag_co.paa";
        name = "3CB TKA East";
        file = "3CB_AI_TKA_East";
        maps[] = {"takistan","tem_anizay","kunduz"};
        climate[] = {"arid"};
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
        climate[] = {"arid"};
    };
    class 3CBF_AAF_arid : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "3CB AAF Brown";
        file = "3CB_AI_AAF_arid";
        maps[] = {"altis"};
        climate[] = {"arid"};
    };

    class 3CBF_LDF : 3CBF_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_enoch\flags\flag_enoch_co.paa";
        name = "3CB LDF";
        file = "3CB_AI_LDF";
        maps[] = {"enoch","vt7"};
        climate[] = {"temperate"};
    };

    class 3CBF_KRG : 3CBF_Base
    {
        // TODO: What is this faction?
        side = "Occ";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_krg\flag\krg_flag_co.paa";
        name = "3CB KRG";
        file = "3CB_AI_KRG";
        climate[] = {"arid"};
    };
    class 3CBF_ION_Arid : 3CBF_Base
    {
        side = "Inv";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CB ION Arid";
        file = "3CB_AI_ION_Arid";
        climate[] = {"arid"};
    };
        class 3CBF_ION_Temperate : 3CBF_ION_Arid
    {
        name = "3CB ION Temperate";
        file = "3CB_AI_ION_Temperate";
        climate[] = {"temperate","tropical"};
    };
        class 3CBF_ION_Arctic : 3CBF_ION_Arid
    {
        name = "3CB ION Arctic";
        file = "3CB_AI_ION_Arctic";
        climate[] = {"arctic"};
    };
    class 3CBF_CCM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
        name = "3CB CCM";
        file = "3CB_Reb_CNM";
    };
    class 3CB_Reb_ION : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_ion\flag\ion_flag_co.paa";
        name = "3CB ION Rebels";
        file = "3CB_Reb_ION";
    };
    class 3CBF_TKM : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "uk3cb_factions\addons\uk3cb_factions_tkm\flag\tkm_b_flag_co.paa";
        name = "3CB TKM";
        file = "3CB_Reb_TKM";
        maps[] = {"takistan","tem_anizay","kunduz"};
    };
    class 3CB_Reb_FIA : 3CBF_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "3CB FIA Rebels";
        file = "3CB_Reb_FIA";
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

    // ***************************** 3CB BAF *****************************

    class 3CBBAF_Base
    {
        requiredAddons[] = {"UK3CB_BAF_Weapons","UK3CB_BAF_Vehicles","UK3CB_BAF_Units_Common","UK3CB_BAF_Equipment","rhsgref_main"};
        //requiredAddons[] = {"UK3CB_BAF_Units_Common"};              // has weapons/equipment/vehicles dependencies
        basepath = QPATHTOFOLDER(Templates\Templates\3CB);
        logo = "\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Ammo\data\ui\logo_small_3cb_ca.paa";
        priority = 50;
    };

    class 3CBBAF_Arid : 3CBBAF_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "3CB BAF Arid";
        file = "3CB_AI_BAF_Arid";
        climate[] = {"arid"};
    };
    class 3CBBAF_Arctic : 3CBBAF_Arid
    {
        name = "3CB BAF Arctic";
        file = "3CB_AI_BAF_Arctic";
        climate[] = {"arctic"};
    };
    class 3CBBAF_Temperate : 3CBBAF_Arid
    {
        name = "3CB BAF Temperate";
        file = "3CB_AI_BAF_Temperate";
        climate[] = {"temperate"};
    };
    class 3CBBAF_Tropical : 3CBBAF_Arid
    {
        name = "3CB BAF Tropical";
        file = "3CB_AI_BAF_Tropical";
        climate[] = {"tropical"};
    };

    // ***************************** CUP *****************************

    class CUP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};        // units, weapons, vehicles
        //requiredAddons[] = {"CUP_AirVehicles_Core"};        // vehicles requires units & weapons
        basepath = QPATHTOFOLDER(Templates\Templates\CUP);
        logo = "\CUP\Creatures\People\CUP_Creatures_People_Core\ui\logo_cup_ca_small.paa";
        priority = 60;
    };

    class CUP_ACR_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cz_co.paa";
        name = "CUP ACR Arid";
        file = "CUP_AI_ACR_Arid";
        climate[] = {"arid"};
    };
    class CUP_ACR_Temperate : CUP_ACR_Arid
    {
        name = "CUP ACR Temperate";
        file = "CUP_AI_ACR_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_AFRF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_rus_co.paa";
        name = "CUP AFRF Arid";
        file = "CUP_AI_AFRF_Arid";
        climate[] = {"arid"};
    };
    class CUP_AFRF_Temperate : CUP_AFRF_Arid
    {
        name = "CUP AFRF Temperate";
        file = "CUP_AI_AFRF_Temperate";
        climate[] = {"temperate","tropical"};
    };
    class CUP_AFRF_Arctic : CUP_AFRF_Arid
    {
        name = "CUP AFRF Arctic";
        file = "CUP_AI_AFRF_Arctic";
        climate[] = {"arctic"};
    };

    class CUP_BAF_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CUP BAF Arid";
        file = "CUP_AI_BAF_Arid";
        climate[] = {"arid"};
    };
    class CUP_BAF_Temperate : CUP_BAF_Arid
    {
        name = "CUP BAF Temperate";
        file = "CUP_AI_BAF_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_CDF_Arctic : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_cdf_co.paa";
        name = "CUP CDF Arctic";
        file = "CUP_AI_CDF_Arctic";
        climate[] = {"arctic"};
        maps[] = {"chernarus_winter"};
    };
    class CUP_CDF_Temperate : CUP_CDF_Arctic
    {
        name = "CUP CDF Temperate";
        file = "CUP_AI_CDF_Temperate";
        climate[] = {"temperate"};
        maps[] = {"chernarus_summer","chernarus"};
    };

    class CUP_RACS_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_racs_co.paa";
        name = "CUP RACS Arid";
        file = "CUP_AI_RACS_Arid";
        climate[] = {"arid"};
        maps[] = {"sara"};
    };
    class CUP_RACS_Tropical : CUP_RACS_Arid
    {
        name = "CUP RACS Tropical";
        file = "CUP_AI_RACS_Tropical";
        climate[] = {"tropical"};
        maps[] = {"tanoa"};
    };

    class CUP_SLA : CUP_Base
    {
        side = "Inv";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_sla_co.paa";
        name = "CUP SLA";
        file = "CUP_AI_SLA_Temperate";          // Sahrani is a bit weird
        climate[] = {"arid","temperate"};
        maps[] = {"sara"};
    };

    class CUP_TKA : CUP_Base
    {
        side = "Occ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKA";
        file = "CUP_AI_TKA_Arid";
        climate[] = {"arid"};
        maps[] = {"takistan","kunduz"};
    };

    class CUP_USAF_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP US Army Arid";
        file = "CUP_AI_US_Army_Arid";
        climate[] = {"arid"};
    };
    class CUP_USAF_Temperate : CUP_USAF_Arid
    {
        name = "CUP US Army Temperate";
        file = "CUP_AI_US_Army_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_USMC_Arid : CUP_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "CUP USMC Arid";
        file = "CUP_AI_US_Marine_Arid";
        climate[] = {"arid"};
    };
    class CUP_USMC_Temperate : CUP_USMC_Arid
    {
        name = "CUP USMC Temperate";
        file = "CUP_AI_US_Marine_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class CUP_ION_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_ion_CO.paa";
        name = "CUP ION Arid";
        file = "CUP_AI_ION_Arid";
        climate[] = {"arid","temperate","tropical"};
    };
    class CUP_ION_Temperate : CUP_ION_Arid
    {
        name = "CUP ION Arctic";
        file = "CUP_AI_ION_Arctic";
        climate[] = {"arctic"};
    };

    class CUP_BW_Arid : CUP_Base
    {
        side = "Occ";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_ger_co.paa";
        name = "CUP BW Arid";
        file = "CUP_AI_BW_Arid";
        climate[] = {"arid"};
    };
        class CUP_BW_Temperate : CUP_BW_Arid
    {
        name = "CUP BW Temperate";
        file = "CUP_AI_BW_Temperate";
        climate[] = {"arctic","temperate","tropical"};
    };
        class CUP_HIL : CUP_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f_exp\flags\flag_tanoa_co.paa";
        name = "CUP HIL";
        file = "CUP_AI_HIL";
        climate[] = {"temperate","tropical"};
    };
    class CUP_TKM : CUP_Base
    {
        side = "Reb";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKM";
        file = "CUP_Reb_TKM";
    };
    class CUP_Reb : CUP_Base
    {
        side = "Reb";
        flagTexture = "cup\baseconfigs\cup_baseconfigs\data\flags\flag_napa_co.paa";
        name = "CUP NAPA";
        file = "CUP_Reb_NAPA";
    };
    class CUP_TKC : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_tka_co.paa";
        name = "CUP TKC";
        file = "CUP_Civ_TKC";
    };
    class CUP_Civ : CUP_Base
    {
        side = "Civ";
        flagTexture = "\CUP\BaseConfigs\CUP_BaseConfigs\data\Flags\flag_chernarus_co.paa";
        name = "CUP CHC";
        file = "CUP_Civ_CHC";
    };

    //***************************** Unsung *****************************

    class UNS_Base
    {
        requiredAddons[] = {"uns_weap_w"};
        basepath = QPATHTOFOLDER(Templates\Templates\UNS);
        logo = "\uns_main\data\unsung_logo.paa";
        priority = 70;
        equipFlags[] = {"lowTech"};
    };

    class UNS_US : UNS_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "Unsung US";
        file = "UNS_AI_US";
    };

    class UNS_PAVN : UNS_Base
    {
        side = "Occ";
        flagTexture = "\uns_flags\flag_pavn_co.paa";
        name = "Unsung PAVN";
        file = "UNS_AI_PAVN";
    };

    class UNS_VC : UNS_Base
    {
        side = "Reb";
        flagTexture = "\uns_flags\flag_vc_co.paa";
        name = "Unsung VC";
        file = "UNS_Reb_VC";
    };

    class UNS_Civ : UNS_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Unsung civs";
        file = "UNS_Civ";
    };

    // ***************************** Global Mobilization *****************************

    class GM_Base
    {
        requiredAddons[] = {"gm_weapons_items","CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\GM);
        logo = "\gm\gm_core\data\logos\gm_logo_ca.paa";
        priority = 80;
        equipFlags[] = {"specialGM"};
        forceDLC[] = {"gm"};
    };

    class GM_NVA : GM_Base
    {
        side = "Inv";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_gc_co";
        name = "GM Nationale Volksarmee Temperate";
        file = "GM_AI_NVA";
        climate[] = {"temperate","tropical","arid"};
    };

    class GM_NVA_Arctic : GM_Base
    {
        side = "Inv";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_gc_co";
        name = "GM Nationale Volksarmee Arctic";
        file = "GM_AI_NVA_arctic";
        climate[] = {"arctic"};
    };

    class GM_BW : GM_Base
    {
        side = "Occ";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_ge_co";
        name = "GM Bundeswehr Temperate";
        file = "GM_AI_BW";
        climate[] = {"temperate","tropical","arid"};
    };

    class GM_BW_Arctic : GM_Base
    {
        side = "Occ";
        flagTexture = "\gm\gm_core\data\flags\gm_flag_ge_co";
        name = "GM Bundeswehr Arctic";
        file = "GM_AI_BW_arctic";
        climate[] = {"arctic"};
    };

    class GM_Reb : GM_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "GM FIA";
        file = "GM_Reb";
    };

    class GM_Civ : GM_Base
    {
        side = "Civ";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "GM civs";
        file = "GM_Civ";
    };

    // ***************************** BWA3 *****************************

    class BWA3_Base
    {
        requiredAddons[] = {"bwa3_common"};
        basepath = QPATHTOFOLDER(Templates\Templates\BWA3);
        logo = QPATHTOFOLDER(Templates\Templates\BWA3\bwa3_logo.paa);
        priority = 65;
    };

    class BWA3_BW_Arid : BWA3_Base
    {
        side = "Occ";
        flagTexture = "bwa3_common\data\bwa3_flag_germany_co.paa";
        name = "BWA3 BW Arid";
        file = "BWA3_AI_BW_Arid";
        climate[] = {"arid"};
    };
    class BWA3_BW_Temperate : BWA3_BW_Arid
    {
        name = "BWA3 BW Temperate";
        file = "BWA3_AI_BW_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };
    
    // ***************************** Spe *****************************
/*    //Commented out as no vehiclesPlanesTransport exist and the templates don't work without them
    class SPE_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE);
        logo = QPATHTOFOLDER(Templates\Templates\SPE\spe_logo.paa);
        priority = 80;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPE_US : SPE_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_us.paa);
        name = "SPE US";
        file = "SPE_AI_US";
    };

    class SPE_WEH : SPE_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_ger.paa);
        name = "SPE WEH";
        file = "SPE_AI_WEH";
    };

    class SPE_Reb : SPE_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE FFF";
        file = "SPE_Reb_FFF";
    };

    class SPE_CIV : SPE_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE\flag_fr.paa);
        name = "SPE Civs";
        file = "SPE_CIV";
    };
*/
    // ***************************** SPE with IFA *****************************

    class SPE_IFA_Base
    {
        requiredAddons[] = {"ww2_spe_assets_c_characters_germans_c","IFA3_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\SPE_IFA);
        logo = QPATHTOFOLDER(Templates\Templates\SPE_IFA\spe_ifa_logo.paa);
        priority = 80;
        equipFlags[] = {"lowTech"};
        forceDLC[] = {"spe"};
    };

    class SPE_IFA_US : SPE_IFA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_us.paa);
        name = "SPE_IFA US";
        file = "SPE_IFA_AI_US";
    };

    class SPE_IFA_WEH : SPE_IFA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_ger.paa);
        name = "SPE_IFA WEH";
        file = "SPE_IFA_AI_WEH";
    };

    class SPE_IFA_Reb : SPE_IFA_Base
    {
        side = "Reb";
        flagTexture = "\WW2\SPE_Core_t\Data_t\Flags\flag_FFF_co.paa";
        name = "SPE_IFA FFF";
        file = "SPE_IFA_Reb_FFF";
    };

    class SPE_IFA_CIV : SPE_IFA_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SPE_IFA\flag_fr.paa);
        name = "SPE_IFA Civs";
        file = "SPE_IFA_CIV";
    };
};
