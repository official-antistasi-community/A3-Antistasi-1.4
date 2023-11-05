//IslaDuala3 - config.cpp

#include "..\script_component.hpp"


class CfgPatches 
{
    class PATCHNAME(IslaDuala3) 
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Data_F_AoW_Loadorder","A3_Map_IslaDuala3"};
        skipWhenMissingDependencies = 1;
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};
//class CfgWorlds {
//    class IslaDuala3 {
//        class Names {
//            class a3a_Obmeya {
//                angle = 0;
//                name = "Noord Obmeya";
//                position[] = {5056.12,5151.08};
//                radiusA = 314.321;
//                radiusB = 251.388;
//                type = "NameCity";
//            };
//            //class imalia {
//            //    angle = 0;                          // never seen this non-zero
//            //    name = "Imalia";
//            //    position[] = {8942,620.74};     // 2d map coords
//            //    radiusA = 300;                      // I think these are supposed to be outer/inner radius but Antistasi uses them as X/Y. Probably a bug.
//            //    radiusB = 150;
//            //    type = "NameVillage";               // NameCity also works, I don't think Antistasi cares
//            //};
//        };
//    };
//};