//standardised values
#define HR_GRG_FontSize "safeZoneW / safeZoneH min 1.2 / 1.2 / 25"
#define HR_GRG_colorBG {0.43,0.43,0.43,0.75}
#define HR_GRG_FontStyle "PuristaMedium"

////////////////
//Base Classes//
////////////////

class HR_GRG_RscText
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    linespacing = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    text = "";
    shadow = 0;
    font = HR_GRG_FontStyle;
    SizeEx = HR_GRG_FontSize;
    fixedWidth = 0;
    x = 0;
    y = 0;
    h = 0;
    w = 0;

};

class HR_GRG_RscStructuredText
{
    idc = -1;
    type = CT_STRUCTURED_TEXT;
    style = ST_LEFT;
    colorBackground[] = HR_GRG_colorBG;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    size = HR_GRG_FontSize;
    text = "";
    class Attributes
    {
        font = HR_GRG_FontStyle;
        color = "#FFFFFF";
        align = "left";
        valign = "middle";
        shadow = false;
        shadowColor = "#F5F5F5";
        size = "1";
    };
};
class HR_GRG_RscStructuredTextNoBG : HR_GRG_RscStructuredText
{
    colorBackground[] = {0,0,0,0};
};

class HR_GRG_RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = HR_GRG_FontStyle;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.05;
    h = 0.05;
};

class HR_GRG_RscButton
{
    access = 0;
    type = CT_BUTTON;
    text = "";
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.7,0,0,1};
    colorBackground[] = HR_GRG_colorBG;
    colorBackgroundDisabled[] = HR_GRG_colorBG;
    colorBackgroundActive[] = HR_GRG_colorBG;
    colorFocused[] = {0.53,0.53,0.53,0.75};
    colorShadow[] = HR_GRG_colorBG;
    colorBorder[] = HR_GRG_colorBG;
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    style = 2;
    x = 0;
    y = 0;
    w = 0.06;
    h = 0.05;
    shadow = 0;
    font = HR_GRG_FontStyle;
    sizeEx = HR_GRG_FontSize;
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
    onMouseEnter = "(_this select 0) ctrlSetTextColor [0.85,0.85,0.55,1]";
    onMouseExit = "(_this select 0) ctrlSetTextColor [1,1,1,1]";
};

class HR_GRG_RscFrame
{
    type = CT_STATIC;
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_FRAME;
    shadow = 0;
    colorBackground[] = HR_GRG_colorBG;
    colorText[] = {1,1,1,1};
    font = HR_GRG_FontStyle;
    sizeEx = HR_GRG_FontSize;
    text = "";
};

class HR_GRG_RscBox
{
   type = CT_STATIC;
    idc = -1;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_CENTER;
    shadow = 0;
    colorText[] = HR_GRG_colorBG;
    font = HR_GRG_FontStyle;
    sizeEx = HR_GRG_FontSize;
    colorBackground[] = HR_GRG_colorBG;
    text = "";
};

class HR_GRG_RscListbox
{
     access = 0;
     type = CT_LISTBOX;
     style = 0;
     w = 0.4;
     h = 0.4;
     font = HR_GRG_FontStyle;
     sizeEx = HR_GRG_FontSize;
     rowHeight = 0;
     colorText[] = {1,1,1,1};
     colorScrollbar[] = {0.34,0.34,0.34,1};
     colorSelect[] = {1,1,1,0.75};
     colorSelect2[] = {0.85,0.85,0.55,0.75};
     colorSelectBackground[] = {0.53,0.53,0.53,0.75};
     colorSelectBackground2[] = HR_GRG_colorBG;
     colorBackground[] = HR_GRG_colorBG;
     colorDisabled[] = {0,0,0,0};
     maxHistoryDelay = 1.0;
     soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     period = 1;
     autoScrollSpeed = -1;
     autoScrollDelay = 5;
     autoScrollRewind = 0;
     arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
     arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
     shadow = 0;
     class ListScrollBar
     {
          color[] = {0.1,0.1,0.1,1};
          colorActive[] = {0.1,0.1,0.1,1};
          colorDisabled[] = {0.74,0.74,0.74,0.15};
          thumb = "#(argb,8,8,3)color(1,1,1,1)";
          arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
          arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
          border = "#(argb,8,8,3)color(1,1,1,1)";
          shadow = 0;
     };
};

class HR_GRG_ScrollBar
{
    color[] = HR_GRG_colorBG;
    colorActive[] = HR_GRG_colorBG;
    colorDisabled[] = HR_GRG_colorBG;
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 0;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class HR_GRG_RscControlsGroup
{
    idc = -1;
    deletable = 1;
    type = CT_CONTROLS_GROUP;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    style = ST_MULTI;
    shadow = 0;
    fade = 0;
    class VScrollbar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
        width = 0.02;
        autoScrollEnabled = 1;
    };
    class HScrollbar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
        height = 0.02;
    };
    class Controls
    {
    };
};

class HR_GRG_RscCombo
{
    deletable = 1;
    fade = 0;
    access = 0;
    type = CT_COMBO;
    colorSelect[] = {1,1,1,0.75};
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.75};
    colorScrollbar[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorPicture[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    colorTextRight[] = {1,1,1,1};
    colorSelectRight[] = {1,1,1,0.75};
    colorSelect2Right[] = {0.85,0.85,0.55,0.75};
    tooltipColorText[] = {1,1,1,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
    soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
    maxHistoryDelay = 1;
    class ComboScrollBar: HR_GRG_ScrollBar
    {
        color[] = {1,1,1,1};
    };
    style = ST_MULTI + ST_NO_RECT;
    font = HR_GRG_FontStyle;
    sizeEx = HR_GRG_FontSize;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    colorSelectBackground[] = {0.53,0.53,0.53,0.75};
    arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
    arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
    wholeHeight = 0.45 * safeZoneH;
    colorActive[] = {1,0,0,1};
};

class HR_GRG_RscCheckBox
	{
		idc = -1;
		type = 77;
		style = 0;
		checked = 0;
		x = "0.375 * safezoneW + safezoneX";
		y = "0.36 * safezoneH + safezoneY";
		w = "0.025 * safezoneW";
		h = "0.04 * safezoneH";
		color[] = {1, 1, 1, 0.7};
		colorFocused[] = {1, 1, 1, 1};
		colorHover[] = {1, 1, 1, 1};
		colorPressed[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.2};
		colorBackground[] = {0, 0, 0, 0};
		colorBackgroundFocused[] = {0, 0, 0, 0};
		colorBackgroundHover[] = {0, 0, 0, 0};
		colorBackgroundPressed[] = {0, 0, 0, 0};
		colorBackgroundDisabled[] = {0, 0, 0, 0};
		textureChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
		textureUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
		textureFocusedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
		textureFocusedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
		textureHoverChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
		textureHoverUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
		texturePressedChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
		texturePressedUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
		textureDisabledChecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
		textureDisabledUnchecked = "A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
		tooltipColorText[] = {1, 1, 1, 1};
		tooltipColorBox[] = {1, 1, 1, 1};
		tooltipColorShade[] = {0, 0, 0, 0.65};
		soundEnter[] = {"", 0.1, 1};
		soundPush[] = {"", 0.1, 1};
		soundClick[] = {"", 0.1, 1};
		soundEscape[] = {"", 0.1, 1};
	};

class ctrlDefault
{
    access = 0;
    idc = -1;
    style = 0;
    default = 0;
    show = 1;
    fade = 0;
    blinkingPeriod = 0;
    deletable = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;
    tooltip = "";
    tooltipMaxWidth = 0.5;
    tooltipColorShade[] = {0, 0, 0, 1};
    tooltipColorText[] = {1, 1, 1, 1};
    tooltipColorBox[] = {0, 0, 0, 0};
    class ScrollBar
    {
        width = 0;
        height = 0;
        scrollSpeed = 0.06;
        arrowEmpty = "\a3\3DEN\Data\Controls\ctrlDefault\arrowEmpty_ca.paa";
        arrowFull = "\a3\3DEN\Data\Controls\ctrlDefault\arrowFull_ca.paa";
        border = "\a3\3DEN\Data\Controls\ctrlDefault\border_ca.paa";
        thumb = "\a3\3DEN\Data\Controls\ctrlDefault\thumb_ca.paa";
        color[] = {1, 1, 1, 1};
    };
};

class ctrlDefaultText: ctrlDefault
{
    sizeEx = "4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
    font = "RobotoCondensedLight";
    shadow = 1;
};

class ctrlDefaultButton: ctrlDefaultText
{
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick", 0.09, 1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter", 0.09, 1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush", 0.09, 1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape", 0.09, 1};
};

class ctrlButton: ctrlDefaultButton
{
    type = 1;
    style = "0x02 + 0xC0";
    colorBackground[] = {0, 0, 0, 1};
    colorBackgroundDisabled[] = {0, 0, 0, 0.5};
    colorBackgroundActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
    colorFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
    font = "PuristaLight";
    text = "";
    colorText[] = {1, 1, 1, 1};
    colorDisabled[] = {1, 1, 1, 0.25};
    borderSize = 0;
    colorBorder[] = {0, 0, 0, 0};
    colorShadow[] = {0, 0, 0, 0};
    offsetX = 0;
    offsetY = 0;
    offsetPressedX = "pixelW";
    offsetPressedY = "pixelH";
    period = 0;
    periodFocus = 2;
    periodOver = 0.5;
    class KeyHints
    {
        class A
        {
            key = "0x00050000 + 0";
            hint = "KEY_XBOX_A";
        };
    };
    onCanDestroy = "";
    onDestroy = "";
    onMouseEnter = "";
    onMouseExit = "";
    onSetFocus = "";
    onKillFocus = "";
    onKeyDown = "";
    onKeyUp = "";
    onMouseButtonDown = "";
    onMouseButtonUp = "";
    onMouseButtonClick = "";
    onMouseButtonDblClick = "";
    onMouseZChanged = "";
    onMouseMoving = "";
    onMouseHolding = "";
    onButtonClick = "";
    onButtonDown = "";
    onButtonUp = "";
};

class HR_GRG_ctrlButtonPictureKeepAspect: ctrlButton
{
    style = "0x02 + 0x30 + 0x800";
};
