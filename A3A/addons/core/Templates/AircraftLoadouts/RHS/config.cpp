#include "..\..\..\script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rhsgref_main_loadorder"};
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
            class RHS_A10 : baseCAS {
                //Pylons
                loadout[] = {"rhs_mag_ANALQ131","rhs_mag_M151_7_USAF_LAU131","rhs_mag_agm65d_3","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_M151_7_USAF_LAU131","","rhs_mag_M151_7_USAF_LAU131","rhs_mag_M151_21_USAF_LAU131_3","rhs_mag_agm65d_3","rhs_mag_M151_7_USAF_LAU131","","rhsusf_ANALE40_CMFlare_Chaff_Magazine_x16"};
                //Weapons
                mainGun[] = {"RHS_weap_gau8"};
                rocketLauncher[] = {"rhs_weap_FFARLauncher"};
                missileLauncher[] = {"rhs_weap_agm65d"};
            }
        };
        class CAPPlane
        {

        };
        class Helicopter
        {

        };
    };
};
