//CUP - config.cpp

#include "..\script_component.hpp"

#if __has_include("\CUP\Vehicles\CUP_Vehicles_LoadOrder\config.bin")

class CfgPatches 
{
    class PATCHNAME(CUP) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","CUP_Vehicles_LoadOrder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
//#include "CfgMagazines.hpp"
//#include "CfgVehicles.hpp"
//#include "CfgWeapons.hpp"

#endif      // __has_include("\CUP\Vehicles\CUP_Vehicles_LoadOrder\config.bin")