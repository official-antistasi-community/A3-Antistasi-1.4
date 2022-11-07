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
    //onLoad = "['onLoad'] spawn A3A_fnc_antistasiArsenal";
    movingenabled = false;

    class ControlsBackground
    {
        // 2 backgrounds
        // class LeftBackground: A3A_Background
        // {
        //     idc = A3A_IDC_ANTISTASI_ARSENAL_LEFT_BACKGROUND;
        // }; 

        // class RightBackground: A3A_Background
        // {
        //     idc = A3A_IDC_ANTISTASI_ARSENAL_RIGHT_BACKGROUND;
        // }; 

        class TabsBackground: A3A_Background
        {
            idc = -1;
            x = GRID_W * 2 + LEFT;
            y = TOP;
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
            y = TOP;
            w = RIGHT;
            h = BOTTOM;
            class Controls 
            {
                // main tabs that show on the left
                class RifleTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_RIFLE_TAB_BUTTON;
                    onButtonClick = "systemChat 'rifle selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    x = GRID_W * 2;
                    y = 0 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class LauncherTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_LAUNCHER_TAB_BUTTON;
                    onButtonClick = "systemChat 'launcher selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    x = GRID_W * 2;
                    y = 5 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class HandgunTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_HANDGUN_TAB_BUTTON;
                    onButtonClick = "systemChat 'handgun selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\handgun_ca.paa";
                    x = GRID_W * 2;
                    y = 10 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class UniformTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_UNIFORM_TAB_BUTTON;
                    onButtonClick = "systemChat 'uniform selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\uniform_ca.paa";
                    x = GRID_W * 2;
                    y = 15 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class VestTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_VEST_TAB_BUTTON;
                    onButtonClick = "systemChat 'vest selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\vest_ca.paa";
                    x = GRID_W * 2;
                    y = 20 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class BackpackTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_BACKPACK_TAB_BUTTON;
                    onButtonClick = "systemChat 'backpack selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa";
                    x = GRID_W * 2;
                    y = 25 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class HeadgearTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_HEADGEAR_TAB_BUTTON;
                    onButtonClick = "systemChat 'headgear selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\headgear_ca.paa";
                    x = GRID_W * 2;
                    y = 30 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class FacewearTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_FACEWEAR_TAB_BUTTON;
                    onButtonClick = "systemChat 'facewear selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\goggles_ca.paa";
                    x = GRID_W * 2;
                    y = 35 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class NVGTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_NVG_TAB_BUTTON;
                    onButtonClick = "systemChat 'NVG selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\nvgs_ca.paa";
                    x = GRID_W * 2;
                    y = 40 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class BinocularTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_BINOCULAR_TAB_BUTTON;
                    onButtonClick = "systemChat 'binocular selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\binoculars_ca.paa";
                    x = GRID_W * 2;
                    y = 45 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class MapTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_MAP_TAB_BUTTON;
                    onButtonClick = "systemChat 'map selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\map_ca.paa";
                    x = GRID_W * 2;
                    y = 50 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class TerminalTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_TERMINAL_TAB_BUTTON;
                    onButtonClick = "systemChat 'terminal selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\gps_ca.paa";
                    x = GRID_W * 2;
                    y = 55 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class CommunicationTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_COMMUNICATION_TAB_BUTTON;
                    onButtonClick = "systemChat 'communication selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\radio_ca.paa";
                    x = GRID_W * 2;
                    y = 60 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class NavigationabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_NAGIVATION_TAB_BUTTON;
                    onButtonClick = "systemChat 'navigation selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\compass_ca.paa";
                    x = GRID_W * 2;
                    y = 65 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };
                class WatchTabButton: A3A_ActivePicture 
                {
                    idc = A3A_IDC_WATCH_TAB_BUTTON;
                    onButtonClick = "systemChat 'watch selected'";
                    text = "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\watch_ca.paa";
                    x = GRID_W * 2;
                    y = 70 * GRID_H;
                    w = 5 * GRID_W;
                    h = 5 * GRID_H;
                };

                // // Sub tabs that show on the right, context pending

                // // weapon context
                // class OpticsSubTabButton: A3A_ActivePicture {};
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
    };

    // main tabs that show on the left
    class RifleTab: A3A_DefaultControlsGroup
    {

    };
    class LauncherTab: A3A_DefaultControlsGroup
    {
        
    };
    class HandgunTab {};
    class UniformTab {};
    class VestTab {};
    class BackpackTab {};
    class HeadgearTab {};
    class FacewearTab {};
    class NVGTab {};
    class BinocularTab {};
    class MapTab {};
    class TerminalTab {};
    class CommunicationTab {};
    class NavigationTab {};
    class WatchTab {};

    // Sub tabs that show on the right, context pending

    // weapon context
    class OpticsSubTab {};
    class RailSubTab {};
    class MuzzleSubTab {};
    class BipodSubTab {};

    // container context
    class CompatWeaponMagSubTab {};
    class MagSubTab {};
    class GrenadeSubTab {};
    class ExplosivesSubTab {};
    class MiscSubTab {};

};
