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