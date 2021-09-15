#include "\a3\ui_f\hpp\definecommongrids.inc"
#include "\a3\3DEN\UI\macros.inc"
#include "\a3\3DEN\UI\macroexecs.inc"

//import RscText;
import RscListNBox;
//import RscButton;
import ctrlStatic;
import ctrlButton;
import ctrlButtonPicture;
import RscButtonArsenal;
//import RscControlsGroupNoScrollbars;

#include "arsenalLimitsIDCs.hpp"

class ArsenalLimitsDialog {
	idd=-1;
	movingenable=false;

    onLoad = "[_this select 0, -1] call A3A_fnc_arsenalLimits_typeSelect";
    onUnload = "publicVariable 'A3A_arsenalLimits'";

    class ControlsBackground {
        class blackAllBlack: ctrlStatic {
            colorBackground[]={0.1,0.1,0.1,0.8};
            x = CENTER_X - 80*GRID_W;
            y = safezoneY + 30*GRID_H;
            w = 160*GRID_W;
            h = safezoneH - 60*GRID_H;
        };
		class TitleBar: RscText {
			colorBackground[]={0.7,0.3,0,1};
			style = ST_CENTER;
            sizeEx = 6*GRID_H;
			text = "ARSENAL NON-MEMBER LIMITS";
			font = "TahomaB";
            x = CENTER_X - 80*GRID_W;
            y = safezoneY + 20*GRID_H;
            w = 160*GRID_W;
            h = 10*GRID_H;
		};
	};

	class controls {
        class ArrowLeft: ctrlButton {
            idc = IDC_arrowMinus;
            text = "-";
            colorBackground[]={0,0,0,0.8};
            onButtonClick = "[ctrlParent (_this#0), -1] call A3A_fnc_arsenalLimits_listButton";
            fade = 1;
            enable = 0;
            w = 6*GRID_W;			// x/y ignored
            h = 6*GRID_H;
            sizeEx = 6*GRID_H;
        };
        class ArrowRight: ArrowLeft {
            idc = IDC_arrowPlus;
            onButtonClick = "[ctrlParent (_this#0), 1] call A3A_fnc_arsenalLimits_listButton";
            text="+";
        };
        class MainListBox : RscListNBox {
            idc = IDC_listBox;
            colorBackground[]={0,0,0.5,0.8};			// completely ignored?
            colorSelectBackground[]={0.7,0.3,0,0.5};
            colorSelectBackground2[]={0.7,0.3,0,0.5};
            colorPictureSelected[]={1,1,1,1};
            colorSelect[]={1,1,1,1};
            colorSelect2[]={1,1,1,1};
            colorPictureRightSelected[]={1,1,1,1};
            columns[]={0.05, 0.67, 0.80};
            idcLeft = IDC_arrowMinus;
            idcRIght = IDC_arrowPlus;
            drawSideArrows=1;
            disableOverflow=1;
            x = CENTER_X - 60*GRID_W;
            y = safezoneY + 36*GRID_H;
            w = 130*GRID_W;
            h = safezoneH - 80*GRID_H;
            sizeEx = 5*GRID_H;
        };
		class HeaderCurrent : RscText {
			idc = -1;
            colorBackground[]={0,0,0,0};
            colorText[]={1,1,1,0.8};
			x = CENTER_X - 60*GRID_W + 85*GRID_W;
			y = safezoneY + 30*GRID_H;
			w = 50*GRID_W;
			h = 6*GRID_H;
            sizeEx = 5*GRID_H;
			text = "Current"
		};
		class HeaderLimit : HeaderCurrent {
			x = CENTER_X - 60*GRID_W + 104*GRID_W;
			text = "Limit";
		};

		class CloseButton : RscButton {
			idc = IDC_closeButton;
			colorBackground[]={0.7,0.3,0,1};
			colorFocused[]={0.7,0.3,0,1};
			colorText[]={1,1,1,1};
			font = "PuristaBold";
			style = ST_CENTER;
            sizeEx = 6*GRID_H;
            x = CENTER_X - 80*GRID_W;
            y = safezoneY + safezoneH - 38*GRID_H;
            w = 40*GRID_W;
            h = 8*GRID_H;
			text = "CLOSE";
            onButtonClick = "publicVariable 'A3A_arsenalLimits'; closeDialog 0"
		};
		class StepButton : CloseButton {
			idc = IDC_stepButton;
            x = CENTER_X + 40*GRID_W;
			text = "STEP ±5";
            onButtonClick = "_ctrl = (_this#0); _ctrl ctrlSetText (['STEP ±5', 'STEP ±1'] select ('5' in ctrlText _ctrl))";
		};

		class TypeSelection : RscControlsGroupNoScrollbars {
            idc = IDC_typeSelection;
            x = CENTER_X - 76*GRID_W;
            y = safezoneY + 34*GRID_H;
            w = 10*GRID_W;
            h = safezoneH - 80*GRID_H;
            sizeEx = GUI_GRID_H;
            class controls {
                class buttonPrimaryWeapon : RscButtonArsenal {
                    idc = IDC_typesBase + 0;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\PrimaryWeapon_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_PrimaryWeapon";
                    onButtonClick = "[ctrlParent (_this#0), ctrlIDC (_this#0)] call A3A_fnc_arsenalLimits_typeSelect";
                    colorBackground[]={0,0,0,0.5};
					colorDisabled[] = {0,0,0,1};
					colorBackgroundDisabled[] = {1,1,1,1};
		            x = 0;
					y = 0;
					w = 8*GRID_W;		//GUI_GRID_CENTER_W;
					h = 8*GRID_H;
				};
                class buttonHandgun : buttonPrimaryWeapon {
                    idc = IDC_typesBase + 2;
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Handgun_ca.paa";
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Handgun";
	                y = 8*GRID_H;
                };
                class buttonSecondaryWeapon : buttonPrimaryWeapon {
                    idc = IDC_typesBase + 1;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_SecondaryWeapon";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\SecondaryWeapon_ca.paa";
	                y = 16*GRID_H;
                };
                class buttonHeadgear : buttonPrimaryWeapon {
                    idc = IDC_typesBase + 6;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Headgear";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Headgear_ca.paa";
	                y = 24*GRID_H;
                };
                class buttonUniform : buttonPrimaryWeapon {
                    idc = IDC_typesBase + 3;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Uniform";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Uniform_ca.paa";
	                y = 32*GRID_H;
                };
                class buttonVest: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 4;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Vest";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Vest_ca.paa";
	                y = 40*GRID_H;
                };
                class buttonBackpack: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 5;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Backpack";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Backpack_ca.paa";
	                y = 48*GRID_H;
                };
                class buttonNVG: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 8;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_NVGs";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\NVGs_ca.paa";
                    y = 56*GRID_H;
                };
                class buttonBinoculars: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 9;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Binoculars";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Binoculars_ca.paa";
                    y = 64*GRID_H;
                };
                class buttonGPS: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 11;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_GPS";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\GPS_ca.paa";
                    y = 72*GRID_H;
                };
                class buttonRadio: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 12;
                    tooltip="$STR_A3_RscDisplayArsenal_tab_Radio";
                    text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\Radio_ca.paa";
                    y = 80*GRID_H;
                };

				class buttonOptic: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 18;
					tooltip="$STR_A3_RscDisplayArsenal_tab_ItemOptic";
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemOptic_ca.paa";
					y = 92*GRID_H;
				};
				class buttonItemAcc: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 19;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemAcc_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_ItemAcc";
					y = 100*GRID_H;
				};
				class buttonMuzzle: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 20;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemMuzzle_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_ItemMuzzle";
					y = 108*GRID_H;
				};
				class buttonBipod: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 25;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\ItemBipod_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_ItemBipod";
					y = 116*GRID_H;
				};

				class buttonMag: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 26;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMagAll_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMagAll";
					y = 128*GRID_H;
				};
				class buttonThrow: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 22;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoThrow_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_CargoThrow";
					y = 136*GRID_H;
				};
				class buttonPut: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 23;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoPut_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_CargoPut";
					y = 144*GRID_H;
				};
				class buttonMisc: buttonPrimaryWeapon {
                    idc = IDC_typesBase + 24;
					text="\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\CargoMisc_ca.paa";
					tooltip="$STR_A3_RscDisplayArsenal_tab_CargoMisc";
					y = 152*GRID_H;
				};
			};
		};
	};
};

