import RscEditMulti;
import RscText;
import RscFrame;
import RscButton;

#define NG_FRAME_X (0.05 * safezoneW + safezoneX)
#define NG_FRAME_Y (0.1 * safezoneH + safezoneY)
#define NG_FRAME_WIDTH (0.9 * safezoneW)
#define NG_FRAME_HEIGHT (0.8 * safezoneH)

#define NG_CONTENTS_X (NG_FRAME_X + NG_FRAME_WIDTH * 0.005)
#define NG_CONTENTS_Y (NG_FRAME_Y + NG_FRAME_HEIGHT * 0.025)
#define NG_CONTENTS_WIDTH (NG_FRAME_WIDTH * 0.99)
#define NG_CONTENTS_HEIGHT (NG_FRAME_HEIGHT * 0.95)

class A3A_NG_import_dialogue {
    idd = -1;
    access = 0;
    movingEnable = true;
    enableSimulation = true;
    class Controls {
        class GreyBox : RscText {
            colorBackground[] = { 0.2,0.2,0.2, 0.9 };

            x = NG_FRAME_X;
            y = NG_FRAME_Y;
            w = NG_FRAME_WIDTH;
            h = NG_FRAME_HEIGHT;
        };

        class Frame : RscFrame {
            colorBackground[] = {1,1,1,1};
            sizeEx = 0.05;

            text = "Import navGridDB";
            x = NG_FRAME_X;
            y = NG_FRAME_Y;
            w = NG_FRAME_WIDTH;
            h = NG_FRAME_HEIGHT;
        };

        class EditBox : RscEditMulti {
            text = "Ctrl+A then Ctrl+V";

            size = 0.55;
            access = 1;
            sizeEx = 0.025;
            linespacing = 1;
            idc = 42069;
            x = NG_CONTENTS_X;
            y = NG_CONTENTS_Y;
            w = NG_CONTENTS_WIDTH;
            h = NG_CONTENTS_HEIGHT * 0.9;
        };

        class ImportButton : RscButton {

            text = "Import";
            sizeEx = 0.1;
            x = NG_CONTENTS_X;
            y = NG_CONTENTS_Y + NG_CONTENTS_HEIGHT * 0.9;
            w = NG_CONTENTS_WIDTH;
            h = NG_CONTENTS_HEIGHT * 0.1;
            action = "A3A_NG_import_NGDB_formatted = ctrlText 42069; closeDialog 1;";
        };
    };
};

#define NGSA_FRAME_X (0.375 * safezoneW + safezoneX)
#define NGSA_FRAME_Y (0.2 * safezoneH + safezoneY)
#define NGSA_FRAME_WIDTH (0.25 * safezoneW)
#define NGSA_FRAME_HEIGHT (0.6 * safezoneH)

#define NGSA_CONTENTS_X (NGSA_FRAME_X + NGSA_FRAME_WIDTH * 0.05)
#define NGSA_CONTENTS_Y (NGSA_FRAME_Y + NGSA_FRAME_HEIGHT * 0.10)
#define NGSA_CONTENTS_WIDTH (NGSA_FRAME_WIDTH * 0.90)
#define NGSA_CONTENTS_HEIGHT (NGSA_FRAME_HEIGHT * 0.85)

class A3A_NGSA_startup_dialogue {
    idd = -1;
    access = 0;
    movingEnable = true;
    enableSimulation = true;
    class Controls {
        class GreyBox : RscText {
            moving = true;
            colorBackground[] = { 0.2,0.2,0.2, 0.9 };

            x = NGSA_FRAME_X - NGSA_FRAME_WIDTH * 0.0125;
            y = NGSA_FRAME_Y - NGSA_FRAME_HEIGHT * 0.0125;
            w = NGSA_FRAME_WIDTH * 1.025;
            h = NGSA_FRAME_HEIGHT * 1.025;
        };

        class Frame : RscFrame {
            moving = true;
            colorBackground[] = {1,1,1,1};
            sizeEx = 0.05;

            text = "Hello! What would you like to do?";
            x = NGSA_FRAME_X;
            y = NGSA_FRAME_Y;
            w = NGSA_FRAME_WIDTH;
            h = NGSA_FRAME_HEIGHT;
        };

        class BtnGenerate : RscButton {
            text = "Generate NavGridDB with Default Settings";
            sizeEx = 0.05;
            x = NGSA_CONTENTS_X;
            y = NGSA_CONTENTS_Y + NGSA_CONTENTS_HEIGHT * 0.00;
            w = NGSA_CONTENTS_WIDTH;
            h = NGSA_CONTENTS_HEIGHT * 0.24;
            action = "[] spawn A3A_fnc_NG_main; closeDialog 1;";
        };

        class BtnImport : RscButton {
            text = "Import Existing NavGridDB";
            sizeEx = 0.05;
            x = NGSA_CONTENTS_X;
            y = NGSA_CONTENTS_Y + NGSA_CONTENTS_HEIGHT * 0.25;
            w = NGSA_CONTENTS_WIDTH;
            h = NGSA_CONTENTS_HEIGHT * 0.24;
            action = "[] spawn A3A_fnc_NGSA_main; closeDialog 1;";
        };

        class BtnStartEmpty : RscButton {
            text = "Start Fresh from an Empty Grid";
            sizeEx = 0.05;
            x = NGSA_CONTENTS_X;
            y = NGSA_CONTENTS_Y + NGSA_CONTENTS_HEIGHT * 0.50;
            w = NGSA_CONTENTS_WIDTH;
            h = NGSA_CONTENTS_HEIGHT * 0.24;
            action = "[true] spawn A3A_fnc_NGSA_main; closeDialog 1;";
        };

        class BtnCLI : RscButton {
            text = "Close Menu to use Command Line";
            sizeEx = 0.05;
            x = NGSA_CONTENTS_X;
            y = NGSA_CONTENTS_Y + NGSA_CONTENTS_HEIGHT * 0.75;
            w = NGSA_CONTENTS_WIDTH;
            h = NGSA_CONTENTS_HEIGHT * 0.24;
            action = "closeDialog 2;";
        };
    };
};