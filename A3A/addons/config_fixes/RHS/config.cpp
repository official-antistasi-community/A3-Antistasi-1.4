#include "..\script_component.hpp"

#if __has_include("\rhsgref\addons\rhsgref_main\config.bin")

class CfgPatches {
    class PATCHNAME(RHS) {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","rhsgref_main_loadorder"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

// Uncomment when needed
//#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
//#include "CfgWeapons.hpp"

#endif      // __has_include("\rhsgref\addons\rhsgref_main\config.bin"