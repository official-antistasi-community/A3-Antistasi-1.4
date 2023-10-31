    class Aegis_Base : Base
    {
        requiredAddons[] = {"Weapons_1_F_lxWS","A3_Aegis_Armor_F_Aegis_APC_Tracked_02", "A3_Atlas_Armor_F_Atlas_APC_Tracked_02", "A3_Opf_Armor_F_Opf_APC_Tracked_02"};
        logo = "A3_Aegis\data_f_aegis\logos\arma3_aegis_logo_ca.paa";
        basepath = QPATHTOFOLDER(Templates\Templates\Aegis); //the path to the template folder
        priority = 20;
        equipFlags[] = {"vanilla"};
    };

    class Aegis_AUKUS_Arid : Aegis_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_CO.paa";
        name = "Aegis AUKUS Arid";
        file = "Aegis_AI_AUKUS_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aegis_aukus;
    };
    class Aegis_AUKUS_Temperate : Aegis_AUKUS_Arid
    {
        name = "Aegis AUKUS Temperate";
        file = "Aegis_AI_AUKUS_Temperate";
        climate[] = {"temperate"};
    };
    class Aegis_AUKUS_Tropical : Aegis_AUKUS_Arid
    {
        name = "Aegis AUKUS Tropical";
        file = "Aegis_AI_AUKUS_Tropical";
        climate[] = {"tropical"};
    };

    class Aegis_AFRF_Arid : Aegis_Base
    {
        side = "Inv";
        flagTexture = "\A3_Aegis\Data_F_Aegis\Flags\flag_RUS_CO.paa";
        name = "Aegis AFRF Arid";
        file = "Aegis_AI_AFRF_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aegis_afrf;
    };

    class Aegis_AFRF_Temperate : Aegis_Base
    {
        side = "Inv";
        flagTexture = "\A3_Aegis\Data_F_Aegis\Flags\flag_RUS_CO.paa";
        name = "Aegis AFRF Temperate";
        file = "Aegis_AI_AFRF_Temperate";
        climate[] = {"temperate"};
        description = $STR_A3AP_setupFactionsTab_aegis_afrf;
    };

    class Aegis_AAF : Aegis_Base
    {
        side = "Occ";
        flagTexture = "a3\data_f\flags\flag_aaf_co.paa";
        name = "Aegis AAF";
        file = "Aegis_AI_AAF";
        maps[] = {"altis", "malden"};
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_aaf;
    };

    class Aegis_CSAT_Arid : Aegis_Base
    {
        side = "Inv";
        flagTexture = "A3\Data_F\Flags\Flag_CSAT_CO.paa";
        name = "Aegis CSAT Arid";
        file = "Aegis_AI_CSAT_Arid";
        climate[] = {"arid", "arctic"};
        description = $STR_A3AP_setupFactionsTab_csat;
    };
    class Aegis_CSAT_Temperate : Aegis_CSAT_Arid
    {
        name = "Aegis CSAT Temperate";
        file = "Aegis_AI_CSAT_Temperate";
        climate[] = {"temperate"};
    };

    class Aegis_NATO_Arid : Aegis_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\Flag_NATO_CO.paa";
        name = "Aegis NATO Arid";
        file = "Aegis_AI_NATO_Arid";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_nato;
    };
    class Aegis_NATO_Temperate : Aegis_NATO_Arid
    {
        name = "Aegis NATO Temperate";
        file = "Aegis_AI_NATO_Temperate";
        climate[] = {"temperate"};
    };
    class Aegis_NATO_Tropical : Aegis_NATO_Arid
    {
        name = "Aegis NATO Tropical";
        file = "Aegis_AI_NATO_Tropical";
        climate[] = {"tropical"};
    };

    class Aegis_FIA : Aegis_Base
    {
        side = "Reb";
        flagTexture = "a3\data_f\flags\flag_fia_co.paa";
        name = "Aegis FIA";
        file = "Aegis_Reb_FIA";
        climate[] = {"arid"};
        description = $STR_A3AP_setupFactionsTab_fia;
    };

    class Aegis_SDK : Aegis_Base
    {
        side = "Reb";
        flagTexture = "\A3\Data_F_Exp\Flags\flag_SYND_CO.paa";
        name = "Aegis SDK";
        file = "Aegis_Reb_SDK";
        climate[] = {"tropical"};
        description = $STR_A3AP_setupFactionsTab_sdk;
    };

    class Aegis_LM : Aegis_Base
    {
        side = "Reb";
        flagTexture = "\A3_Aegis\Data_F_Aegis\Flags\flag_Looters_CO.paa";
        name = "Aegis LM";
        file = "Aegis_Reb_LM";
        climate[] = {"temperate"};
        description = $STR_A3AP_setupFactionsTab_lm;
    };

    class Aegis_CHDKZ : Aegis_Base
    {
        side = "Riv";
        flagTexture = "A3_Opf\Data_F_Opf\Flags\flag_ChDKZ_CO.paa";
        name = "Aegis CHDKZ";
        file = "Aegis_Riv_CHDKZ";
        description = $STR_A3AP_setupFactionsTab_chdkz;
    };

    class Aegis_Ion : Aegis_Base
    {
        side = "Riv";
        flagTexture = "A3_Aegis\Data_F_Aegis\Flags\flag_ION_CO.paa";
        name = "Aegis Ion PMC";
        file = "Aegis_Riv_Ion";
        description = $STR_A3AP_setupFactionsTab_ion;
    };

    class Aegis_Civ : Aegis_Base
    {
        side = "Civ";
        flagTexture = "\A3\Data_F\Flags\Flag_Altis_CO.paa";
        name = "Aegis";
        file = "Aegis_Civ";
        description = $STR_A3AP_setupFactionsTab_vanilla_civ;
    };