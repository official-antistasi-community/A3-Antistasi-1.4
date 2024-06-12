#include "..\..\..\script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"IFA3_Core"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    class Loadouts
    {
        class CASPlane
        {
            class baseCAS;
            class LIB_Ju87 : baseCAS {
                loadout[] = {"LIB_1Rnd_SC50","LIB_1Rnd_SC50","LIB_1Rnd_SC500","LIB_1Rnd_SC50","LIB_1Rnd_SC50"};
                mainGun[] = {"LIB_2xMG151_JU87"};
                bombRacks[] = {"LIB_SC500_Bomb_Mount","LIB_SC50_Bomb_Mount"};
                diveParams[] = {1200, 300, 110, 55, 15, {15, -2}};
            };
            class LIB_Pe2 : baseCAS {
                loadout[] = {"LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250","LIB_1Rnd_FAB250"};
                mainGun[] = {"LIB_UBK_PE2"};
                bombRacks[] = {"LIB_FAB250_Bomb_Mount"};
                diveParams[] = {1200, 300, 110, 55, 15, {12, 0}};
            };
        };
        class CAPPlane
        {
            class baseCAP;
        };
    };
};
