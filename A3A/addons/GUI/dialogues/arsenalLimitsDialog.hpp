// From 3den\UI\macros.inc. DoomGUI uses different values for GRID_W, GRID_H, CENTER_X, CENTER_Y
#define AL_GRID_W (pixelW * pixelGrid * 0.5)
#define AL_GRID_H (pixelH * pixelGrid * 0.5)
#define AL_CENTER_X ((getResolution select 2) * 0.5 * pixelW)
#define AL_CENTER_Y ((getResolution select 3) * 0.5 * pixelH)

#include "ids.inc"

import RscText;
import RscButton;
import RscListNBox;
import RscControlsGroup;

class A3A_ArsenalLimitsDialog {
    idd = A3A_IDD_ARSENALLIMITSDIALOG;
    movingenable = false;

    onLoad = "['typeSelect'] spawn A3A_fnc_arsenalLimitsDialog";
    onUnload = "publicVariable 'A3A_arsenalLimits'";

    class ControlsBackground {
        class blackAllBlack : RscText {
            colorBackground[]={0.1,0.1,0.1,0.8};
            x = AL_CENTER_X - 80*AL_GRID_W;
            y = safezoneY + 30*AL_GRID_H;
            w = 160*AL_GRID_W;
            h = safezoneH - 60*AL_GRID_H;
        };
        class TitleBar: RscText {
            colorBackground[]={0.7,0.3,0,1};
            style = ST_CENTER;
            sizeEx = 6*AL_GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_title;
            font = "TahomaB";
            x = AL_CENTER_X - 80*AL_GRID_W;
            y = safezoneY + 20*AL_GRID_H;
            w = 160*AL_GRID_W;
            h = 10*AL_GRID_H;
        };
    };

    class Controls {
        class ArrowLeft: RscButton {
            idc = A3A_IDC_ARSLIMARROWMINUS;
            text = "-";
            colorBackground[]={0,0,0,0.8};
            onButtonClick = "['listButton', [-1]] call A3A_fnc_arsenalLimitsDialog";
            fade = 1;
            enable = 0;
            w = 6*AL_GRID_W;			// x/y ignored
            h = 6*AL_GRID_H;
            sizeEx = 6*AL_GRID_H;
        };
        class ArrowRight: ArrowLeft {
            idc = A3A_IDC_ARSLIMARROWPLUS;
            onButtonClick = "['listButton', [1]] call A3A_fnc_arsenalLimitsDialog";
            text="+";
        };
        class MainListBox : RscListNBox {
            idc = A3A_IDC_ARSLIMLISTBOX;
            colorBackground[]={0,0,0.5,0.8};			// completely ignored?
            colorSelectBackground[]={0.7,0.3,0,0.5};
            colorSelectBackground2[]={0.7,0.3,0,0.5};
            colorPictureSelected[]={1,1,1,1};
            colorSelect[]={1,1,1,1};
            colorSelect2[]={1,1,1,1};
            colorPictureRightSelected[]={1,1,1,1};
            columns[]={0.05, 0.67, 0.80};
            idcLeft = A3A_IDC_ARSLIMARROWMINUS;
            idcRIght = A3A_IDC_ARSLIMARROWPLUS;
            drawSideArrows=1;
            disableOverflow=1;
            x = AL_CENTER_X - 60*AL_GRID_W;
            y = safezoneY + 36*AL_GRID_H;
            w = 130*AL_GRID_W;
            h = safezoneH - 80*AL_GRID_H;
            sizeEx = 5*AL_GRID_H;
        };
        class HeaderCurrent : RscText {
            idc = -1;
            colorBackground[]={0,0,0,0};
            colorText[]={1,1,1,0.8};
            x = AL_CENTER_X - 60*AL_GRID_W + 85*AL_GRID_W;
            y = safezoneY + 30*AL_GRID_H;
            w = 50*AL_GRID_W;
            h = 6*AL_GRID_H;
            sizeEx = 5*AL_GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_current;
        };
        class HeaderLimit : HeaderCurrent {
            x = AL_CENTER_X - 60*AL_GRID_W + 104*AL_GRID_W;
            text = $STR_antistasi_arsenal_limits_dialog_limit;
        };

        class CloseButton : RscButton {
            idc = A3A_IDC_ARSLIMCLOSEBUTTON;
            colorBackground[]={0.7,0.3,0,1};
            colorFocused[]={0.7,0.3,0,1};
            colorText[]={1,1,1,1};
            font = "PuristaBold";
            style = ST_CENTER;
            sizeEx = 6*AL_GRID_H;
            x = AL_CENTER_X - 80*AL_GRID_W;
            y = safezoneY + safezoneH - 38*AL_GRID_H;
            w = 40*AL_GRID_W;
            h = 8*AL_GRID_H;
            text = $STR_antistasi_arsenal_limits_dialog_close;
            onButtonClick = "closeDialog 0";
        };
        class StepButton : CloseButton {
            idc = A3A_IDC_ARSLIMSTEPBUTTON;
            x = AL_CENTER_X - 20*AL_GRID_W;
            text = "";              // stringtable combination doesn't work so prep in onLoad instead
            onButtonClick = "['stepButton'] call A3A_fnc_arsenalLimitsDialog";
            onLoad = "['stepButton'] spawn A3A_fnc_arsenalLimitsDialog";
        };
        class ResetButton : CloseButton {
            idc = A3A_IDC_ARSLIMRESETBUTTON;
            x = AL_CENTER_X + 40*AL_GRID_W;
            text = $STR_antistasi_arsenal_limits_dialog_reset;
            onButtonClick = "['resetButton'] call A3A_fnc_arsenalLimitsDialog";
        };

        class TypeSelection : RscControlsGroup {
            idc = A3A_IDC_ARSLIMTYPESELECT;
            x = AL_CENTER_X - 76*AL_GRID_W;
            y = safezoneY + 34*AL_GRID_H;
            w = 10*AL_GRID_W;
            h = safezoneH - 80*AL_GRID_H;
            class controls {
                class buttonPrimaryWeapon : RscButton {
                    style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
                    idc = A3A_IDC_ARSLIMTYPESBASE + 0;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
                    onButtonClick = "['typeSelect', [ctrlIDC (_this#0)]] call A3A_fnc_arsenalLimitsDialog";
                    colorBackground[]={0,0,0,0.5};
                    colorDisabled[] = {0,0,0,1};
                    colorBackgroundDisabled[] = {1,1,1,1};
                    x = 0;
                    y = 0;
                    w = 8*AL_GRID_W;
                    h = 8*AL_GRID_H;
                };
                class buttonHandgun : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 2;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Handgun";
                    y = 8*AL_GRID_H;
                };
                class buttonSecondaryWeapon : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 1;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
                    y = 16*AL_GRID_H;
                };
                class buttonHeadgear : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 6;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Headgear";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
                    y = 24*AL_GRID_H;
                };
                class buttonUniform : buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 3;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Uniform";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
                    y = 32*AL_GRID_H;
                };
                class buttonVest: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 4;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Vest";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
                    y = 40*AL_GRID_H;
                };
                class buttonBackpack: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 5;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Backpack";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
                    y = 48*AL_GRID_H;
                };
                class buttonNVG: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 8;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_NVGs";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = 56*AL_GRID_H;
                };
                class buttonBinoculars: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 9;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Binoculars";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = 64*AL_GRID_H;
                };
                class buttonGPS: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 11;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_GPS";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                    y = 72*AL_GRID_H;
                };
                class buttonRadio: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 12;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Radio";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = 80*AL_GRID_H;
                };

                class buttonOptic: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 18;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemOptic";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
                    y = 92*AL_GRID_H;
                };
                class buttonItemAcc: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 19;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemAcc";
                    y = 100*AL_GRID_H;
                };
                class buttonMuzzle: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 20;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
                    y = 108*AL_GRID_H;
                };
                class buttonBipod: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 25;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_ItemBipod";
                    y = 116*AL_GRID_H;
                };

                class buttonMag: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 26;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMagAll";
                    y = 128*AL_GRID_H;
                };
                class buttonThrow: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 22;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoThrow";
                    y = 136*AL_GRID_H;
                };
                class buttonPut: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 23;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoPut";
                    y = 144*AL_GRID_H;
                };
                class buttonMisc: buttonPrimaryWeapon {
                    idc = A3A_IDC_ARSLIMTYPESBASE + 24;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMisc";
                    y = 152*AL_GRID_H;
                };
            };
        };
    };
};
