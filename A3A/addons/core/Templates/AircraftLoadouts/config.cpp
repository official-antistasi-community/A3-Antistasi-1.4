#include "..\..\script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
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
            class baseCAS
            {
                //Pylons
                loadout[] = {};
                //Weapons
                mainGun[] = {};
                rocketLauncher[] = {};
                missileLauncher[] = {};
                //Dive bombing requirements
                bombRacks[] = {};
                diveParams[] = {};
                //General script, runs just after spawn
                code = "";
            };
        };
        class CAPPlane
        {
            class baseCAP
            {
                loadout[] = {};
                code = "";
            };
        };
        class Helicopter
        {
            class baseHelicopter
            {
                loadout[] = {};
                code = "";
            };
        };
    };
};
