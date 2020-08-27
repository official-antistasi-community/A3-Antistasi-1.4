#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class CHVD_rscXSliderH
{
	style="0x400	+ 0x10";
	shadow=0;
	x=0;
	y=0;
	h=0.029412;
	w=0.40000001;
	color[]={1,1,1,0.60000002};
	colorActive[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.2};
	arrowEmpty="\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull="\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border="\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb="\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
};
class CHVD_rscCheckbox
{
	type=77;
	style=0;
	checked=0;
	x="0.375 * safezoneW + safezoneX";
	y="0.36 * safezoneH + safezoneY";
	w="0.025 * safezoneW";
	h="0.04 * safezoneH";
	color[]={1,1,1,0.69999999};
	colorFocused[]={1,1,1,1};
	colorHover[]={1,1,1,1};
	colorPressed[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.2};
	colorBackground[]={0,0,0,0};
	colorBackgroundFocused[]={0,0,0,0};
	colorBackgroundHover[]={0,0,0,0};
	colorBackgroundPressed[]={0,0,0,0};
	colorBackgroundDisabled[]={0,0,0,0};
	textureChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureFocusedChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureFocusedUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureHoverChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureHoverUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	texturePressedChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	texturePressedUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	textureDisabledChecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_checked_ca.paa";
	textureDisabledUnchecked="\A3\Ui_f\data\GUI\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	soundEnter[]=
	{
		"",
		0.1,
		1
	};
	soundPush[]=
	{
		"",
		0.1,
		1
	};
	soundClick[]=
	{
		"",
		0.1,
		1
	};
	soundEscape[]=
	{
		"",
		0.1,
		1
	};
};
class CHVD_rscButton
{
	type=16;
	style="0x02 + 0xC0";
	default=0;
	shadow=0;
	x=0;
	y=0;
	w=0.095588997;
	h=0.039216001;
	animTextureNormal="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled="#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver="#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused="#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed="#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault="#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[]={0,0,0,0.80000001};
	colorBackgroundFocused[]={1,1,1,1};
	colorBackground2[]={0.75,0.75,0.75,1};
	color[]={1,1,1,1};
	colorFocused[]={0,0,0,1};
	color2[]={0,0,0,1};
	colorText[]={1,1,1,1};
	colorDisabled[]={1,1,1,0.25};
	period=1.2;
	periodFocus=1.2;
	periodOver=1.2;
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	font="PuristaLight";
	class TextPos
	{
		left="0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right=0.0049999999;
		bottom=0;
	};
	class Attributes
	{
		font="PuristaLight";
		color="#E5E5E5";
		align="left";
		shadow="false";
	};
	class ShortcutPos
	{
		left="(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top=0.0049999999;
		w=0.022500001;
		h=0.029999999;
	};
	soundEnter[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",
		0.090000004,
		1
	};
	soundPush[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundPush",
		0.090000004,
		1
	};
	soundClick[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundClick",
		0.090000004,
		1
	};
	soundEscape[]=
	{
		"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",
		0.090000004,
		1
	};
	textureNoShortcut="#(argb,8,8,3)color(0,0,0,0)";
	class HitZone
	{
		left=0;
		top=0;
		right=0;
		bottom=0;
	};
	class AttributesImage
	{
		font="PuristaMedium";
		color="#E5E5E5";
		align="left";
	};
};
class CHVD_rscText
{
	type = 0;
	x=0;
	y=0;
	h=0.037;
	w=0.30000001;
	style=0;
	shadow=0;
	colorShadow[]={0,0,0,0.5};
	font="PuristaMedium";
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	SizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]={1,1,1,1};
	colorBackground[]={0,0,0,0};
	linespacing=1;
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	text = "";
};
class CHVD_rscTextRight
{
	type = 0;
	x=0;
	y=0;
	h=0.037;
	w=0.30000001;
	style=0x01;
	shadow=0;
	colorShadow[]={0,0,0,0.5};
	font="PuristaMedium";
	size="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	SizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[]={1,1,1,1};
	colorBackground[]={0,0,0,0};
	linespacing=1;
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	text = "";
};
class CHVD_rscFrame
{
	type = 0;
	idc = -1;
	style = 0;
	shadow = 1;
	colorBackground[] = 
	{
		0,
		0,
		0,
		0
	};
	colorText[] = 
	{
		1,
		1,
		1,
		1
	};
	font = "PuristaMedium";
	sizeEx = 0.02;
	text = "";
};
class CHVD_rscXListBox
{
	deletable = 0;
	fade = 0;
	idc = -1;
	type = 42;
	x = 0.1;
	y = 0.1;
	color[] = {1, 1, 1, 0.6};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorText[] = {1, 1, 1, 1};
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect", 0.09, 1};
	colorPicture[] = {1, 1, 1, 1};
	colorPictureSelected[] = {1, 1, 1, 1};
	colorPictudeDisabled[] = {1, 1, 1, 0.25};
	tooltipColorText[] = {1, 1, 1, 1};
	tooltipColorBox[] = {1, 1, 1, 1};
	tooltipColorShade[] = {0, 0, 0, 0.65};
	style = "0x400 + 0x02 +	0x10";
	shadow = 2;
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	w = 0.14706;
	h = 0.039216;
	font = "PuristaMedium";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorPictureDisabled[] = {1, 1, 1, 1};
};
class CHVD_rscEdit
{
	type=2;
	style="0x40";
	autocomplete = "";
	font="PuristaMedium";
	shadow=2;
	sizeEx="(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorBackground[]={0,0,0,1};
	colorText[]={0.94999999,0.94999999,0.94999999,1};
	colorDisabled[]={1,1,1,0.25};
	colorSelection[]=
	{
		"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])",
		"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",
		1
	};
	canModify=1;
	tooltipColorText[]={1,1,1,1};
	tooltipColorBox[]={1,1,1,1};
	tooltipColorShade[]={0,0,0,0.64999998};
	text = "";
};
class CHVD_dialog
{
	idd = 2900;
	movingEnable = false;
	moving = 1;
	onLoad = "[_this] call CHVD_fnc_localize";
	onUnload = "";
	
	class controlsBackground
	{
		class CHVD_rscBackground: CHVD_rscFrame
		{
			idc = 1800;

			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.1 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 22.4 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.7};
		};
		class CHVD_rscTitle: CHVD_rscText
		{
			idc = 1000;

			text = "VIEW DISTANCE SETTINGS"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 0 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
		};
		class CHVD_rscFootHeaderText: CHVD_rscTextRight
		{
			idc = 1001;

			text = "ON FOOT"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 1.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class CHVD_rscFootViewText: CHVD_rscTextRight
		{
			idc = 1002;

			text = "VIEW:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootObjText: CHVD_rscTextRight
		{
			idc = 1003;

			text = "OBJECT:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 4.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootTerrainText: CHVD_rscTextRight
		{
			idc = 1005;

			text = "TERRAIN:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 7.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarHeaderText: CHVD_rscTextRight
		{
			idc = 1008;

			text = "IN CAR"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 8.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class CHVD_rscCarViewText: CHVD_rscTextRight
		{
			idc = 1010;

			text = "VIEW:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirObjText: CHVD_rscTextRight
		{
			idc = 1011;

			text = "OBJECT:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarTerrainText: CHVD_rscTextRight
		{
			idc = 1012;

			text = "TERRAIN:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirHeaderText: CHVD_rscTextRight
		{
			idc = 1015;

			text = "IN AIR"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 16 * GUI_GRID_H + GUI_GRID_Y;
			w = 7 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
		class CHVD_rscAirViewText: CHVD_rscTextRight
		{
			idc = 1016;

			text = "VIEW:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirTerrainText: CHVD_rscTextRight
		{
			idc = 1019;

			text = "TERRAIN:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 21.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarObjText: CHVD_rscTextRight
		{
			idc = 1021;

			text = "OBJECT:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootSyncText: CHVD_rscTextRight
		{
			idc = 1403;

			text = "SYNC MODE:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 5.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};		
		class CHVD_rscCarSyncText: CHVD_rscTextRight
		{
			idc = 1405;

			text = "SYNC MODE:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};		
		class CHVD_rscAirSyncText: CHVD_rscTextRight
		{
			idc = 1407;

			text = "SYNC MODE:"; //--- ToDo: Localize;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 20.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 6.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
	class controls
	{
		class CHVD_rscFootViewSlider: CHVD_rscXSliderH
		{
			idc = 1900;
			type = 43;
			onSliderPosChanged = "['CHVD_foot', _this select 0, _this select 1, 1006, 'CHVD_footObj', 1901, 1007, 'CHVD_footSyncMode', 'CHVD_footSyncPercentage'] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 2.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootObjSlider: CHVD_rscXSliderH
		{
			idc = 1901;
			type = 43;
			onSliderPosChanged = "['CHVD_footObj', _this select 0, _this select 1, 1007] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 4.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarViewSlider: CHVD_rscXSliderH
		{
			idc = 1902;
			type = 43;
			onSliderPosChanged = "['CHVD_car', _this select 0, _this select 1, 1013, 'CHVD_carObj', 1903, 1014, 'CHVD_carSyncMode', 'CHVD_carSyncPercentage'] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarObjSlider: CHVD_rscXSliderH
		{
			idc = 1903;
			type = 43;
			onSliderPosChanged = "['CHVD_carObj', _this select 0, _this select 1, 1014] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirViewSlider: CHVD_rscXSliderH
		{
			idc = 1904;
			type = 43;
			onSliderPosChanged = "['CHVD_air', _this select 0, _this select 1, 1017, 'CHVD_airObj', 1905, 1018, 'CHVD_airSyncMode', 'CHVD_airSyncPercentage'] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirObjSlider: CHVD_rscXSliderH
		{
			idc = 1905;
			type = 43;
			onSliderPosChanged = "['CHVD_airObj', _this select 0, _this select 1, 1018] call CHVD_fnc_onSliderChange";

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 18.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootViewDistance: CHVD_rscEdit
		{
			idc = 1006;
			onKeyDown = "['CHVD_foot', 1900, _this select 0, 'CHVD_footObj', 1901, 1007, 'CHVD_footSyncMode', 'CHVD_footSyncPercentage'] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 2.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscFootObjDistance: CHVD_rscEdit
		{
			idc = 1007;
			onKeyDown = "['CHVD_footObj', 1901, _this select 0] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 4.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarViewDistance: CHVD_rscEdit
		{
			idc = 1013;
			onKeyDown = "['CHVD_car', 1902, _this select 0, 'CHVD_carObj', 1903, 1014, 'CHVD_carSyncMode', 'CHVD_carSyncPercentage'] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 10 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscCarObjDistance: CHVD_rscEdit
		{
			idc = 1014;
			onKeyDown = "['CHVD_carObj', 1903, _this select 0] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 11.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirViewDistance: CHVD_rscEdit
		{
			idc = 1017;
			onKeyDown = "['CHVD_air', 1904, _this select 0, 'CHVD_airObj', 1905, 1018, 'CHVD_airSyncMode', 'CHVD_airSyncPercentage'] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 17.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscAirObjDistance: CHVD_rscEdit
		{
			idc = 1018;
			onKeyDown = "['CHVD_airObj', 1905, _this select 0] call CHVD_fnc_onEBinput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 18.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_rscClose: CHVD_rscButton
		{
			idc = 1612;
			onButtonClick = "closeDialog 2900";

			text = "Close"; //--- ToDo: Localize;
			x = 7 * GUI_GRID_W + GUI_GRID_X;
			y = 23.53 * GUI_GRID_H + GUI_GRID_Y;
			w = 24.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_footTerrainListbox: CHVD_rscXListBox
		{
			idc = 1500;

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 7.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_carTerrainListbox: CHVD_rscXListBox
		{
			idc = 1501;

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_airTerrainListbox: CHVD_rscXListBox
		{
			idc = 1502;

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 21.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		
		class CHVD_footTerrainEdit: CHVD_rscEdit
		{
			idc = 1400;
			onKeyDown = "['CHVD_footTerrain', 1400, 1500] call CHVD_fnc_onEBterrainInput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 7.2 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_carTerrainEdit: CHVD_rscEdit
		{
			idc = 1401;
			onKeyDown = "['CHVD_carTerrain', 1401, 1501] call CHVD_fnc_onEBterrainInput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 14.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_airTerrainEdit: CHVD_rscEdit
		{
			idc = 1402;
			onKeyDown = "['CHVD_airTerrain', 1402, 1502] call CHVD_fnc_onEBterrainInput";
			maxChars = 5;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 21.9 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_footSyncListbox: CHVD_rscXListBox
		{
			idc = 1404;

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 5.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_carSyncListbox: CHVD_rscXListBox
		{
			idc = 1406;

			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_airSyncListbox: CHVD_rscXListBox
		{
			idc = 1408;
			
			x = 14 * GUI_GRID_W + GUI_GRID_X;
			y = 20.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 12.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_footSyncEdit: CHVD_rscEdit
		{
			idc = 1410;
			maxChars = 4;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 5.7 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_carSyncEdit: CHVD_rscEdit
		{
			idc = 1409;
			maxChars = 4;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 13 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
		class CHVD_airSyncEdit: CHVD_rscEdit
		{
			idc = 1411;
			maxChars = 4;

			x = 27 * GUI_GRID_W + GUI_GRID_X;
			y = 20.4 * GUI_GRID_H + GUI_GRID_Y;
			w = 3.5 * GUI_GRID_W;
			h = 1 * GUI_GRID_H;
		};
	};
};