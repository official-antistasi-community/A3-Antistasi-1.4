//IFA - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(A3) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"IFA3_Core","WW2_Assets_c_Weapons_InfantryWeapons_c"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
