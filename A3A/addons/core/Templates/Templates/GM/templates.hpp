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
    class GM_VSBD : GM_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\GM\flag_VSBD.paa);
        name = "GM VSBD";
        file = "GM_Riv_VSBD";
        description = "A remnant from the recent dark past of Germany, determined to restore a long failed regime and ideology.";
    };