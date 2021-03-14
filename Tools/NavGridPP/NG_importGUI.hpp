/*  Enable when `import` becomes avalable (projected to be Arma 3 - 2.02)
import RscEditMulti;
import RscText;
import RscFrame;
import RscButton;
*/

// Delete CT, ST and Rsc base classes when `import` becomes avalable (projected to be Arma 3 2.02)
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define ST_LEFT           0x00
#define ST_CENTER         0x02
#define ST_MULTI          0x10
#define ST_FRAME          0x40

class CommonRsc {
    deletable = 0;
    fade = 0;
    access = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0.95,0.95,0.95,1};
    colorDisabled[] = {1,1,1,0.25};
    font = "RobotoCondensed";
    text = "";
    shadow = 2;
    idc = -1;
    type = CT_STATIC;
};
class RscText : CommonRsc {
    fixedWidth = 0;
    style = ST_LEFT;
    colorShadow[] = {0,0,0,0.5};
    SizeEx = 0.05;
    linespacing = 1;
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
};
class RscEditMulti : RscText
{
    type = CT_EDIT;
    colorSelection[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",1};
    autocomplete = "";
    style = ST_MULTI;
    canModify = 1;
};
class RscFrame : CommonRsc {
    style = ST_FRAME;
};
class RscButton : CommonRsc {
    type = CT_BUTTON;
    colorBackgroundDisabled[] = {0,0,0,0.5};
    colorBackgroundActive[] = {0,0,0,1};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {0,0,0,1};
    soundEnter[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundPush",
        0.09,
        1
    };
    soundClick[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundClick",
        0.09,
        1
    };
    soundEscape[] =
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    style = ST_CENTER;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0;
    offsetPressedY = 0;
    borderSize = 0;
};
// End of CT, ST and Rsc base classes

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