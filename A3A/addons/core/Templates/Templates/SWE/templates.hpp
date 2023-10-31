    class SFP_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "sfp_soldiers"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\SWE);
        logo = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        priority = 90;
    };

    class SFP_SWE_Temperate : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Temperate";
        file = "SFP_AI_SWE_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class SFP_SWE_Arid : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Arid";
        file = "SFP_AI_SWE_Arid";
        climate[] = {"arid"};
    };
	
    class SFP_SWE_Arctic : SFP_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\SWE\flag_sweden.paa);
        name = "SFP Sweden Winter";
        file = "SFP_AI_SWE_Arctic";
        climate[] = {"arctic"};
    };