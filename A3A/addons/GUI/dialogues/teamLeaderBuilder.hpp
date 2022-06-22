//#define DIALOG_W 160 // Width of dialog in pixelGrid units
//#define DIALOG_H 25 // Height of dialog in pixelGrid units
//#define DIALOG_X CENTER_X(DIALOG_W) // Global x pos of dialog
//#define DIALOG_Y CENTER_Y(DIALOG_H) // Global y pos of dialog

#define CENTER_GRID_X ((getResolution select 2) * 0.5 * pixelW)
#define CENTER_GRID_Y ((getResolution select 3) * 0.5 * pixelH)
#define BOTTOM safeZoneH + safeZoneY


class A3A_teamLeaderBuilder
{
  	idd = A3A_IDD_TEAMLEADERDIALOG;
  	onLoad = "[""onLoad""] spawn A3A_fnc_teamLeaderRTSPlacerDialog";
	  movingenable = true;

	class ControlsBackground
    {
        class TitleBarBackground : A3A_Background
        {
            moving = true;
            colorBackground[] = A3A_COLOR_TITLEBAR_BACKGROUND;
            x = CENTER_X(160);
            y = BOTTOM - PX_H(41);
            w = PX_W(160);
            h = PX_H(5);
        };

        class Background : A3A_Background
        {
            x = CENTER_X(160);
            y = BOTTOM - PX_H(36);
            w = PX_W(160);
            h = PX_H(36);
        };
    };

  class Controls
  {
    class TitlebarText : A3A_TitlebarText
    {
      idc = -1;
      text = "Builder";
      x = CENTER_X(160);
      y = BOTTOM - PX_H(41);
      w = PX_W(160);
      h = PX_H(5);
    };

    // Main content
    class MainContent : A3A_DefaultControlsGroup
    {
      	idc = A3A_IDC_TEAMLEADERBUILDERMAIN;
	  	  x = CENTER_X(160);
        y = BOTTOM - PX_H(36);
        w = PX_W(160);
        h = PX_H(36);

      class Controls
      {
        class BuildingControlsGroup : A3A_ControlsGroupNoHScrollbars
        {
          idc = A3A_IDC_TEAMLEADERBUILDINGGROUP;
          x = 0;
          y = PX_H(4);
          w = PX_W(160);
          h = PX_H(36);
        };
      };
    };
  };
};