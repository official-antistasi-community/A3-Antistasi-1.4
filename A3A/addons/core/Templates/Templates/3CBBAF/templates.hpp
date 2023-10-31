    // ***************************** 3CB BAF *****************************

    class 3CBBAF_Base
    {
        requiredAddons[] = {"UK3CB_BAF_Weapons","UK3CB_BAF_Vehicles","UK3CB_BAF_Units_Common","UK3CB_BAF_Equipment","rhsgref_main"};
        //requiredAddons[] = {"UK3CB_BAF_Units_Common"};              // has weapons/equipment/vehicles dependencies
        basepath = QPATHTOFOLDER(Templates\Templates\3CBBAF);
        logo = "\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Ammo\data\ui\logo_small_3cb_ca.paa";
        priority = 50;
    };

    class 3CBBAF_Arid : 3CBBAF_Base
    {
        side = "Occ";
        flagTexture = "\A3\Data_F\Flags\flag_uk_co.paa";
        name = "3CB BAF Arid";
        file = "3CB_AI_BAF_Arid";
        climate[] = {"arid"};
    };
    class 3CBBAF_Arctic : 3CBBAF_Arid
    {
        name = "3CB BAF Arctic";
        file = "3CB_AI_BAF_Arctic";
        climate[] = {"arctic"};
    };
    class 3CBBAF_Temperate : 3CBBAF_Arid
    {
        name = "3CB BAF Temperate";
        file = "3CB_AI_BAF_Temperate";
        climate[] = {"temperate"};
    };
    class 3CBBAF_Tropical : 3CBBAF_Arid
    {
        name = "3CB BAF Tropical";
        file = "3CB_AI_BAF_Tropical";
        climate[] = {"tropical"};
    };