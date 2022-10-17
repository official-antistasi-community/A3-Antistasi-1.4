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

class CfgMissions
{
    class MPMissions
    {
        class Antistasi_Altis
        {
            briefingName = $STR_antistasi_mission_info_Altis_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Altis.Altis";
        };
        class Antistasi_cam_lao_nam
        {
            briefingName = $STR_antistasi_mission_info_cam_lao_nam_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_cam_lao_nam.cam_lao_nam";
        };
        class Antistasi_vn_khe_sanh
        {
            briefingName = $STR_antistasi_mission_info_vn_khe_sanh_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_vn_khe_sanh.vn_khe_sanh";
        };
        class Antistasi_chernarus_summer
        {
            briefingName = $STR_antistasi_mission_info_chernarus_summer_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_chernarus_summer.chernarus_summer";
        };
        class Antistasi_chernarus_winter
        {
            briefingName = $STR_antistasi_mission_info_chernarus_winter_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_chernarus_winter.chernarus_winter";
        };
        class Antistasi_chernarus
        {
            briefingName = $STR_antistasi_mission_info_chernarus_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_chernarus.chernarus";
        };
        class Antistasi_Enoch
        {
            briefingName = $STR_antistasi_mission_info_Enoch_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Enoch.Enoch";
        };
        class Antistasi_Kunduz
        {
            briefingName = $STR_antistasi_mission_info_kunduz_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Kunduz.Kunduz";
        };
        class Antistasi_Malden
        {
            briefingName = $STR_antistasi_mission_info_Malden_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Malden.Malden";
        };
        class Antistasi_sara
        {
            briefingName = $STR_antistasi_mission_info_sara_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_sara.sara";
        };
#if __A3_DEBUG__
        class Antistasi_Stratis
        {
            briefingName = $STR_antistasi_mission_info_Stratis_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Stratis.Stratis";
        };
#endif
        class Antistasi_takistan
        {
            briefingName = $STR_antistasi_mission_info_takistan_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_takistan.takistan";
        };
        class Antistasi_Tanoa
        {
            briefingName = $STR_antistasi_mission_info_Tanoa_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Tanoa.Tanoa";
        };
        class Antistasi_tem_anizay
        {
            briefingName = $STR_antistasi_mission_info_anizay_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_tem_anizay.tem_anizay";
        };
        class Antistasi_Tembelan
        {
            briefingName = $STR_antistasi_mission_info_Tembelan_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_Tembelan.Tembelan";
        };
        class Antistasi_vt7
        {
            briefingName = $STR_antistasi_mission_info_vt7_mapname_text;
            directory = "x\A3A\addons\maps\Antistasi_vt7.vt7";
        };
    };
};
