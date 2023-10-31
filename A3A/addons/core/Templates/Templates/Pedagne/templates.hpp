    class PED_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "ASZ_Weapons_A3"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\Pedagne);
        logo = QPATHTOFOLDER(Templates\Templates\Pedagne\flag_italy_co.paa);
        priority = 80;
    };

    class PED_ITA_Temperate : PED_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Pedagne\flag_italy_co.paa);
        name = "PED Italy Temperate";
        file = "PED_AI_ITA_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };
    class PED_ITA_Arid : PED_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\Pedagne\flag_italy_co.paa);
        name = "PED Italy Arid";
        file = "PED_AI_ITA_Arid";
        climate[] = {"arid"};
    };