    class OPTRE_Base
    {
        logo = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_mod_ca.paa);
        basepath = QPATHTOFOLDER(Templates\Templates\OPTRE);
        priority = 16;
        climate[] = {"temperate","tropical","arid","arctic"};
    };

    /*------------- START UNSC -------------*/
    class OPTRE_UNSC : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"}; // required addons (cfgPatches) to be loaded for this to show up
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_unsc_ca.paa);
        name = "UNSC";
        file = "OPTRE_AI_UNSC_New";
        climate[] = {"arid", "temperate"};
        description = "The UNSC";
    };

    class OPTRE_UNSC_desert : OPTRE_UNSC
    {
        name = "UNSC Desert";
        file = "OPTRE_AI_UNSC_desert_New";
        climate[] = {"arid", "temperate"};
    };
    
    class OPTRE_UNSC_snow : OPTRE_UNSC
    {
        name = "UNSC Snow";
        file = "OPTRE_AI_UNSC_snow_New";
        climate[] = {"arctic"};
    };

    class OPTRE_UNSC_tropical : OPTRE_UNSC
    {
        name = "UNSC Tropical";
        file = "OPTRE_AI_UNSC_tropical_New";
        climate[] = {"tropical"};
    };

    // class OPTRE_UNSC_ODST : OPTRE_UNSC
    // {
    //     requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"}; // required addons (cfgPatches) to be loaded for this to show up
    //     name = "UNSC (ODST)";
    //     file = "OPTRE_AI_UNSC_ODST";
    // };
    /*------------- END UNSC -------------*/

    /*------------- START COVENANT -------------*/
    class OPTRE_Cov : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core"};
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_covenant_ca.paa);
        name = "Covenant (Elites)";
        file = "OPTRE_AI_Covenant_New";
        description = "The Covenant (With OPTRE elites)";
    };

    class OPTRE_Cov_Grunts : OPTRE_Cov
    {
        requiredAddons[] = {"OPTRE_Core", "OPTRE_FC_Core", "WBK_Halo_Alients"};
        name = "Covenant (WBK Elites)";
        file = "OPTRE_AI_Covenant_Grunts_New";
        description = "The Covenant (With Webknights elites and grunts)";
    };
    /*------------- END COVENANT -------------*/

    class OPTRE_Reb : OPTRE_Base
    {
        requiredAddons[] = {"OPTRE_Core"};
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "Insurrectionists";
        file = "OPTRE_Reb_Ins";
        description = "Led by Jerald Mulkey Ander, this faction fights to be free from the reign of the UNSC. They are similar to the United Rebel Front, but have no army to back up their cause. Yet.";
    };

    class OPTRE_Riv : OPTRE_Reb
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "United Rebel Front";
        file = "OPTRE_Riv_Ins";
        description = "Led by Colonel Watts, this faction originally fought with the insurrectionists. They hate each other due to different ideals, but still use similar equipment.";
    };

    class OPTRE_Civ : OPTRE_Reb
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\OPTRE\images\flag_insurrection_ca.paa);
        name = "OPTRE Civs";
        file = "OPTRE_Civ";
        description = "OPTRE Civilians.";
    };
    class OPTRE_Civ_Flood : OPTRE_Civ
    {
        requiredAddons[] = {"OPTRE_Core", "dev_common"};
        name = "OPTRE Flood";
        file = "OPTRE_Civ_Flood";
        description = "OPTRE Flood Combat Forms.";
    };