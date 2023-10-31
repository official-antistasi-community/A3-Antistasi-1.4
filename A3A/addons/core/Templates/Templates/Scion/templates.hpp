    class Scion_Base
    {
        basepath = QPATHTOFOLDER(Templates\Templates\Scion);
        logo = "sc_props\data\flags\flag_se_co.paa";
        priority = 80;
    };

    class Scion_Republic : Scion_Base
    {
        requiredAddons[] = {"sc_weapons", "sc_ext_vehicles", "screbornvehicles", "WBK_SciFiWeaponary"};
        side = "Inv";
        flagTexture = "sc_props\data\flags\flag_ar_co.paa";
        name = "Amalgamate Republic";
        file = "Scion_AI_Republic";
        description = "The Republic Algamate, fighting in the Scion Empire age.";
    };

    class Scion_Empire : Scion_Republic
    {
        side = "Occ";
        flagTexture = "sc_props\data\flags\flag_se_co.paa";
        name = "Scion Empire";
        file = "Scion_AI_Empire";
        description = "The Scion Empire.";
    };

    class Scion_Replikas : Scion_Base
    {
        requiredAddons[] = {"sc_weapons", "sc_ext_vehicles", "screbornvehicles", "WBK_SciFiWeaponary", "SSV_Android"};
        side = "Reb";
        flagTexture = "sc_props\data\flags\flag_ac_co.paa";
        name = "Replikas";
        file = "Scion_Reb_Replikas";
        description = "The Replikas are a faction of androids, previously controlled by the factions of the Scion era. Now they've rebelled and are ready to take their stake in the galaxy.";
    };

    class Scion_Civ : Scion_Base
    {
        requiredAddons[] = {"sc_weapons", "sc_ext_vehicles", "screbornvehicles", "SSV_Android"};
        side = "Civ";
        flagTexture = "sc_props\data\flags\flag_se_co.paa";
        name = "Androids";
        file = "Scion_Civ";
        description = "The Androids are the main inhabitants of the planets now. They are like civilians, except for the worker robots.";
    };