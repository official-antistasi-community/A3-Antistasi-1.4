#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        #if __has_include("\CUP\Weapons\CUP_Weapons_DynamicLoadout\mk82\CUP_mk82_pod.p3d")
        requiredAddons[] = {"A3_Weapons_F", "CUP_Weapons_DynamicLoadout"};
        #else
        requiredAddons[] = {"A3_Weapons_F"};
        #endif
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};


#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"