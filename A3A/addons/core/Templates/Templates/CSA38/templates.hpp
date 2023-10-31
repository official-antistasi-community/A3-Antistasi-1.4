    class CSA_Base
    {
        requiredAddons[] = {"IFA3_Core", "CSA38_IFA3_Compat3", "csa38ii_data"};
        basepath = QPATHTOFOLDER(Templates\Templates\CSA38);
        logo = QPATHTOFOLDER(Templates\Templates\CSA38\flag_Czech.paa);
        priority = 16;
        equipFlags[] = {"lowTech"};
    };

    class CSA_WEH_Temperate : CSA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "CSA WEH Temperate";
        file = "CSA_AI_WEH_Temperate";
        climate[] = {"temperate","tropical"};
    };
    class CSA_WEH_Arid : CSA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "CSA Afrika Korp";
        file = "CSA_AI_WEH_Arid";
        climate[] = {"arid"};
    };

    class CSA_WEH_Arctic : CSA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "CSA WEH Winter";
        file = "CSA_AI_WEH_Arctic";
        climate[] = {"arctic"};
    };

    class CSA_UK_Arctic : CSA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CSA UK Winter";
        file = "CSA_AI_UK_Arctic";
        climate[] = {"arctic"};
    };	

    class CSA_UK_Arid : CSA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CSA UK Arid";
        file = "CSA_AI_UK_Arid";
        climate[] = {"arid"};
    };	
	
    class CSA_UK_Temperate : CSA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "CSA UK Temperate";
        file = "CSA_AI_UK_Temperate";
        climate[] = {"temperate","tropical"};
    };			

    class CSA_Reb : CSA_Base
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\CSA38\flag_Czech.paa);
        name = "CSA Czech";
        file = "CSA_Reb_CZE";
    };
	