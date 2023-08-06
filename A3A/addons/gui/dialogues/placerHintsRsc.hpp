#include "ids.inc"


#define CENTER_GRID_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_GRID_Y ((getResolution select 3) * 0.5 * pixelH)

class A3A_PlacerHints {
        idd = IDD_PLACERHINT;
        fadeIn = 0;
        fadeOut = 0;
        duration = 999999;
        enableSimulation = 1;
		onLoad = "['onLoad', _this] spawn A3A_fnc_setUpPlacerHints";
        class controls {
			// snaping mode
            class IconALT: A3A_Picture {
                idc = IDC_PLACERHINT_ALT;
                text = A3A_Icon_key_alt;
				x = CENTER_GRID_X + 85 * GRID_W;
                y = CENTER_GRID_Y + 29 * GRID_H;
                w = 7 * GRID_W;
                h = 7 * GRID_H;
            };
            class TextALT: A3A_Text {
                idc = IDC_PLACERHINT_ALT_TEXT;
                text = "";
				x = CENTER_GRID_X + 94 * GRID_W;
                y = CENTER_GRID_Y + 30 * GRID_H;
                w = 45 * GRID_W;
                h = 4 * GRID_H;
                sizeEx = 2.25 * GRID_H;
            };

			// ROTATION_MODEs
            class IconEKEY: IconALT {
                idc = IDC_PLACERHINT_E;
                text = A3A_Icon_key_e;
				y = CENTER_GRID_Y + 35 * GRID_H;
            };
            class TextEKEY: TextALT {
                idc = IDC_PLACERHINT_E_TEXT;
				y = CENTER_GRID_Y + 36 * GRID_H;
            };
			class IconRKEY: IconALT {
                idc = IDC_PLACERHINT_R;
                text = A3A_Icon_key_r;
				y = CENTER_GRID_Y + 41 * GRID_H;
            };
            class TextRKEY: TextALT {
                idc = IDC_PLACERHINT_R_TEXT;
				y = CENTER_GRID_Y + 42 * GRID_H;
            };

			// UNSAFE_MODEs
			class IconSHIFT: IconALT {
                idc = IDC_PLACERHINT_SHIFT;
                text = A3A_Icon_key_shift;
				y = CENTER_GRID_Y + 46 * GRID_H;
            };
            class TextSHIFT: TextALT {
                idc = IDC_PLACERHINT_SHIFT_TEXT;
				y = CENTER_GRID_Y + 47 * GRID_H;
			};
			// end key
			class IconCKEY: IconALT {
                idc = IDC_PLACERHINT_C;
                text = A3A_Icon_key_c;
				y = CENTER_GRID_Y + 51 * GRID_H;
            };
            class TextCKEY: TextALT {
                idc = IDC_PLACERHINT_C_TEXT;
				y = CENTER_GRID_Y + 52 * GRID_H;
			};
			// place key
			class IconSpaceKEY: IconALT {
                idc = IDC_PLACERHINT_SPACE;
                text = A3A_Icon_key_space;
				x = CENTER_GRID_X + 81 * GRID_W;
				y = CENTER_GRID_Y + 52 * GRID_H;
				w = 10 * GRID_W;
                h = 15 * GRID_H;
            };
            class TextSpaceKEY: TextALT {
                idc = IDC_PLACERHINT_SPACE_TEXT;
				y = CENTER_GRID_Y + 57 * GRID_H;
            };
        };
    };