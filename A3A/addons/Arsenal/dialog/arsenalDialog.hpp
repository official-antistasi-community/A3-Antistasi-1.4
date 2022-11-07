#define CENTER_GRID_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_GRID_Y ((getResolution select 3) * 0.5 * pixelH)
#define TOP safeZoneY
#define BOTTOM safeZoneH + safeZoneY
#define LEFT safeZoneX
#define RIGHT safeZoneW + safeZoneX

#include "ids.inc"

class A3A_Antistasi_Arsenal
{
    idd = A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
    onLoad = "['onLoad'] spawn A3A_fnc_antistasiArsenal";
    class ControlsBackground
    {
        // 2 backgrounds
        class LeftBackground: A3A_Background
        {
            idc = A3A_IDC_ANTISTASI_ARSENAL_LEFT_BACKGROUND;
            x = LEFT + GRID_W * 9;
            y = TOP + GRID_H * 12;
            w = 40 * GRID_W;
            h = 105 * GRID_H;
        }; 

        // class RightBackground: A3A_Background
        // {
        //     idc = A3A_IDC_ANTISTASI_ARSENAL_RIGHT_BACKGROUND;
        // }; 

        class TabsBackground: A3A_Background
        {
            idc = -1;
            x = GRID_W * 2 + LEFT;
            y = TOP + GRID_H * 2;
            w = 5 * GRID_W;
            h = 75 * GRID_H;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
        }
    };

    class Controls 
    {
        class TabButtons: A3A_ControlsGroupNoScrollbars 
        {
            idc = A3A_IDC_ARSENAL_DIALOG_TAB_BUTTONS;
            x = LEFT;
            y = TOP + GRID_H * 2;
            w = 7 * GRID_W;
            h = 5 * GRID_H;

            class Controls 
            {
                // main tabs that show on the left
                class RifleTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_RIFLE_TAB_BUTTON;
                    onButtonClick = "[""switchTab"", [""Rifle""]] call A3A_fnc_antistasiArsenal";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    x = GRID_W * 2;
                    y = 0 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                // class LauncherTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_LAUNCHER_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Launcher""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                //     x = GRID_W * 2;
                //     y = 5 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class HandgunTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_HANDGUN_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Handgun""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\handgun_ca.paa";
                //     x = GRID_W * 2;
                //     y = 10 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class UniformTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_UNIFORM_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Uniform""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\uniform_ca.paa";
                //     x = GRID_W * 2;
                //     y = 15 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class VestTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_VEST_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Vest""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\vest_ca.paa";
                //     x = GRID_W * 2;
                //     y = 20 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class BackpackTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_BACKPACK_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Backpack""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa";
                //     x = GRID_W * 2;
                //     y = 25 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class HeadgearTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_HEADGEAR_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Headgear""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\headgear_ca.paa";
                //     x = GRID_W * 2;
                //     y = 30 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class FacewearTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_FACEWEAR_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Facewear""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\goggles_ca.paa";
                //     x = GRID_W * 2;
                //     y = 35 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class NVGTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_NVG_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""NVG""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\nvgs_ca.paa";
                //     x = GRID_W * 2;
                //     y = 40 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class BinocularTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_BINOCULAR_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Binocular""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\binoculars_ca.paa";
                //     x = GRID_W * 2;
                //     y = 45 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class MapTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_MAP_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Map""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\map_ca.paa";
                //     x = GRID_W * 2;
                //     y = 50 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class TerminalTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_TERMINAL_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Terminal""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\gps_ca.paa";
                //     x = GRID_W * 2;
                //     y = 55 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class CommunicationTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_COMMUNICATION_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Communication""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\radio_ca.paa";
                //     x = GRID_W * 2;
                //     y = 60 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class NavigationabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_NAGIVATION_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Navigation""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\compass_ca.paa";
                //     x = GRID_W * 2;
                //     y = 65 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };
                // class WatchTabButton: A3A_ActivePicture 
                // {
                //     idc = A3A_IDC_WATCH_TAB_BUTTON;
                //     //onButtonClick = "[""switchTab"", [""Watch""]] call A3A_fnc_antistasiArsenal";
                //     text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\watch_ca.paa";
                //     x = GRID_W * 2;
                //     y = 70 * GRID_H;
                //     w = 5 * GRID_W;
                //     h = 5 * GRID_H;
                // };

                // // Sub tabs that show on the right, context pending

                // // weapon context
                // class OpticSubTabButton: A3A_ActivePicture {};
                // class RailSubTabButton: A3A_ActivePicture {};
                // class MuzzleSubTabButton: A3A_ActivePicture {};
                // class BipodSubTabButton: A3A_ActivePicture {};

                // // container context
                // class CompatWeaponMagSubTabButton: A3A_ActivePicture {};
                // class MagSubTabButton: A3A_ActivePicture {};
                // class GrenadeSubTabButton: A3A_ActivePicture {};
                // class ExplosivesSubTabButton: A3A_ActivePicture {};
                // class MiscSubTabButton: A3A_ActivePicture {};

            };
        };

        // main tabs that show on the left
        class RifleTab: A3A_DefaultControlsGroup
        {
            idc = A3A_IDC_ARSENAL_RIFLE_TAB;
            show = false;
            x = LEFT + GRID_W * 9;
            y = TOP + GRID_H * 12;
            w = RIGHT - GRID_W * 9;
            h = BOTTOM;

            class Controls 
            {
                class RifleTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
                {
                    idc = A3A_IDC_ARSENAL_RIFLE_TAB_CONTROL_GROUP;
                    x = 0;
                    y = 0;
                    w = RIGHT;
                    h = BOTTOM;
                };
            };
        };
        // class LauncherTab: A3A_DefaultControlsGroup
        // {
        //     idc = A3A_IDC_ARSENAL_LAUNCHER_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class LauncherTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_LAUNCHER_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class HandgunTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_HANDGUN_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class HandgunTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_HANDGUN_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class UniformTab: A3A_DefaultControlsGroup
        // {
        //     idc = A3A_IDC_ARSENAL_UNIFORM_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class UniformTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_UNIFORM_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class VestTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_VEST_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class VestTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_VEST_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class BackpackTab: A3A_DefaultControlsGroup
        // {
        //     idc = A3A_IDC_ARSENAL_BACKPACK_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class BackpackTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_BACKPACK_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class HeadgearTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_HEADGEAR_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class HeadgearTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_HEADGEAR_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class FacewearTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_FACEWEAR_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class FacewearTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_FACEWEAR_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class NVGTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_NVG_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class NVGTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_NVG_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class BinocularTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_BINOCULAR_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class BinocularTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_BINOCULAR_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class MapTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_MAP_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class MapTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_MAP_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class TerminalTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_TERMINAL_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class TerminalTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_TERMINAL_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class CommunicationTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_COMMUNICATION_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class CommunicationTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_COMMUNICATION_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class NavigationTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_NAVIGATION_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class NavigationTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_NAVIGATION_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };
        // class WatchTab: A3A_DefaultControlsGroup 
        // {
        //     idc = A3A_IDC_ARSENAL_WATCH_TAB;
        //     show = false;
        //     class Controls 
        //     {
        //         class WatchTabControlsGroup: A3A_ControlsGroupNoHScrollbars 
        //         {
        //             idc = A3A_IDC_ARSENAL_WATCH_TAB_CONTROL_GROUP;
                    
        //         };
        //     };
        // };

        // Sub tabs that show on the right, context pending

        // // weapon context
        // class OpticSubTab {};
        // class RailSubTab {};
        // class MuzzleSubTab {};
        // class BipodSubTab {};

        // // container context
        // class CompatWeaponMagSubTab {};
        // class MagSubTab {};
        // class GrenadeSubTab {};
        // class ExplosivesSubTab {};
        // class MiscSubTab {};

        // this is the helper stuff

        class SearchField: A3A_Edit {
            idc = -1;
            x = LEFT + GRID_W * 9;
            y = TOP + GRID_H * 2;
            w = 35 * GRID_W;
            h = 5 * GRID_H;
        };

        class SearchFieldButton: A3A_ActivePicture {
            idc = -1;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
            x = LEFT + GRID_W * 44;
            y = TOP + GRID_H * 2;
            w = 5 * GRID_W;
            h = 5 * GRID_H;
        };

        class SortTabCombo: A3A_ComboBox {
            idc = -1;
            x = LEFT + GRID_W * 9;
            y = TOP + GRID_H * 2;
            w = 40 * GRID_W;
            h = 5 * GRID_H;
        };
    };
};
