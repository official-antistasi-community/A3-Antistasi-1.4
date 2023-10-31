    class FFAA_Base
    {
        requiredAddons[] = {"CUP_Creatures_People_Civil_Russia", "CUP_BaseConfigs", "CUP_AirVehicles_Core", "ffaa_data"};        // units, weapons, vehicles
        basepath = QPATHTOFOLDER(Templates\Templates\FFAA);
        logo = QPATHTOFOLDER(Templates\Templates\FFAA\flag_spain_co.paa);
        priority = 90;
    };

    class FFAA_SPA_Temperate : FFAA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\FFAA\flag_spain_co.paa);
        name = "FFAA Spain Temperate";
        file = "FFAA_AI_SPA_Temperate";
        climate[] = {"temperate","tropical","arctic"};
    };

    class FFAA_SPA_Arid : FFAA_Base
    {
        side = "Occ";
        flagTexture = QPATHTOFOLDER(Templates\Templates\FFAA\flag_spain_co.paa);
        name = "FFAA Spain Arid";
        file = "FFAA_AI_SPA_Arid";
        climate[] = {"arid"};
    };