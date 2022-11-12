#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3A_core"};
        author = AUTHOR;
        authors[] = { AUTHORS };
        authorUrl = "";
        VERSION_CONFIG;
    };
};

class A3A {
    #include "mapInfo.hpp"
    #include "NavGrid.hpp"
};


#define A3A_BriefingName QUOTE(Antistasi Community - VERSION)

class CfgMissions
{
    class MPMissions
    {
        class Antistasi_Altis
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Altis.Altis";
        };
        class Antistasi_cam_lao_nam
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_cam_lao_nam.cam_lao_nam";
        };
        class Antistasi_vn_khe_sanh
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_vn_khe_sanh.vn_khe_sanh";
        };
        class Antistasi_chernarus_summer
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_chernarus_summer.chernarus_summer";
        };
        class Antistasi_chernarus_winter
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_chernarus_winter.chernarus_winter";
        };
        class Antistasi_chernarus
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_chernarus.chernarus";
        };
        class Antistasi_Enoch
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Enoch.Enoch";
        };
        class Antistasi_Kunduz
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Kunduz.Kunduz";
        };
        class Antistasi_Malden
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Malden.Malden";
        };
        class Antistasi_sara
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_sara.sara";
        };
#if __A3_DEBUG__
        class Antistasi_Stratis
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Stratis.Stratis";
        };
#endif
        class Antistasi_takistan
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_takistan.takistan";
        };
        class Antistasi_Tanoa
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Tanoa.Tanoa";
        };
        class Antistasi_tem_anizay
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_tem_anizay.tem_anizay";
        };
        class Antistasi_Tembelan
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_Tembelan.Tembelan";
        };
        class Antistasi_vt7
        {
            briefingName = A3A_BriefingName;
            directory = "x\A3A\addons\maps\Antistasi_vt7.vt7";
        };
    };
};
