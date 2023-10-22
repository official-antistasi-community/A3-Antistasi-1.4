//3CB - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(3CB) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","UK3CB_Factions_Vehicles_SUV"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
    };
};

#include "CfgVehicles.hpp"
