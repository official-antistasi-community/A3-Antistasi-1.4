    class IFA_Base
    {
        requiredAddons[] = {"IFA3_Core"};
        basepath = QPATHTOFOLDER(Templates\Templates\IFA);
        logo = QPATHTOFOLDER(Templates\Templates\IFA\ifa_logo.paa);
        priority = 15;
        equipFlags[] = {"lowTech"};
    };

    class IFA_WEH_Temperate : IFA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "IFA WEH Temperate";
        file = "IFA_AI_WEH_Temperate";
        climate[] = {"temperate","tropical"};
    };
    class IFA_WEH_Arid : IFA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "IFA Afrika Korp";
        file = "IFA_AI_WEH_Arid";
        climate[] = {"arid"};
    };

    class IFA_WEH_Arctic : IFA_Base
    {
        side = "Occ";
        flagTexture = "ww2\core_t\if_decals_t\german\flag_ger_co.paa";
        name = "IFA WEH Winter";
        file = "IFA_AI_WEH_Arctic";
        climate[] = {"arctic"};
    };

    class IFA_SOV_Temperate : IFA_Base
    {
        side = "Inv";
        flagTexture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
        name = "IFA SOV Temperate";
        file = "IFA_AI_SOV_Temperate";
        climate[] = {"temperate","tropical","arid"};
    };

    class IFA_SOV_Arctic : IFA_Base
    {
        side = "Inv";
        flagTexture = "\WW2\Core_t\IF_Decals_t\Ussr\flag_SU_co.paa";
        name = "IFA SOV Winter";
        file = "IFA_AI_SOV_Arctic";
        climate[] = {"arctic"};
    };

    class IFA_UK_Arctic : IFA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "IFA UK Winter";
        file = "IFA_AI_UK_Arctic";
        climate[] = {"arctic"};
    };	

    class IFA_UK_Arid : IFA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "IFA UK Arid";
        file = "IFA_AI_UK_Arid";
        climate[] = {"arid"};
    };	
	
    class IFA_UK_Temperate : IFA_Base
    {
        side = "Inv";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "IFA UK Temperate";
        file = "IFA_AI_UK_Temperate";
        climate[] = {"temperate","tropical"};
    };		

    class IFA_USA_Arctic : IFA_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "IFA USA Winter";
        file = "IFA_AI_USA_Arctic";
        climate[] = {"arctic"};
    };	

    class IFA_USA_Arid : IFA_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "IFA USA Arid";
        file = "IFA_AI_USA_Arid";
        climate[] = {"arid"};
    };	
	
    class IFA_USA_Temperate : IFA_Base
    {
        side = "Inv";
        flagTexture = "a3\data_f\flags\flag_us_co.paa";
        name = "IFA USA Temperate";
        file = "IFA_AI_USA_Temperate";
        climate[] = {"temperate","tropical"};
    };		

    class IFA_Reb : IFA_Base
    {
        side = "Reb";
        flagTexture = QPATHTOFOLDER(Templates\Templates\IFA\flag_poland_army_co.paa);
        name = "IFA POL";
        file = "IFA_Reb_POL";
    };

    class IFA_CIV : IFA_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\IFA\flag_poland_co.paa);
        name = "IFA Civs";
        file = "IFA_CIV";
        climate[] = {"temperate","tropical","arid"};
    };

    class IFA_CIV_Zombie_Soldiers : IFA_CIV
    {
        requiredAddons[] = {"IFA3_Core", "WBK_ZombieCreatures"};
        priority = 14;
        name = "IFA Soldier Zombies";
        file = "IFA_CIV_Zombie_Soldiers";
    };
    class IFA_CIV_Zombie : IFA_CIV_Zombie_Soldiers
    {
        name = "IFA Civ Zombies";
        file = "IFA_CIV_Zombie";
    };
	
    class IFA_CIV_Arctic : IFA_Base
    {
        side = "Civ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\IFA\flag_poland_co.paa);
        name = "IFA Civs Winter";
        file = "IFA_CIV_Arctic";
        climate[] = {"arctic"};
    };
    class IFA_RIV_COMU : IFA_Base
    {
        side = "Riv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\IFA\flag_poland_co.paa);
        name = "IFA Communists";
        file = "IFA_Riv_COMU";
    };