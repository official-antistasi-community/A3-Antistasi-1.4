    class PLA_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "Z10_LK", "mas_chi_army"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\PLA);
        logo = QPATHTOFOLDER(Templates\Templates\PLA\flag_china.paa);
        priority = 100;
    };

    class PLA_CHI_Temperate : PLA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\PLA\flag_china.paa);
        name = "PLA China Temperate";
        file = "PLA_AI_CHI_Temperate";
        climate[] = {"temperate","tropical"};
    };

    class PLA_CHI_Arid : PLA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\PLA\flag_china.paa);
        name = "PLA China Arid";
        file = "PLA_AI_CHI_Arid";
        climate[] = {"arid"};
    };
	
    class PLA_CHI_Arctic : PLA_Base
    {
        side = "Inv";
        flagTexture = QPATHTOFOLDER(Templates\Templates\PLA\flag_china.paa);
        name = "PLA China Arctic";
        file = "PLA_AI_CHI_Arctic";
        climate[] = {"arctic"};
    };