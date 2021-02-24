#include "defines.inc"
#include "defines.hpp"
class VehicleSelect
{
    idd=IDD_Garage;
    movingenable=false;
    onLoad = "[] spawn HR_GRG_fnc_onLoad;";
    onUnload = "[] spawn HR_GRG_fnc_onUnload;";
    class controls
    {
        //vehicle categories
        class categories: HR_GRG_RscListbox
        {
            idc = IDC_CatList;
            x = 0.180 * safezoneW + safezoneX;
            y = 0.000 * safezoneH + safezoneY;
            w = safeZoneW / safeZoneH min 1.2 / 1.2 / 37.5 / 0.273;
            h = 0.150 * safezoneH;
            rowHeight = "0.030 * safezoneH";
            onLBSelChanged = "_this call HR_GRG_fnc_switchCategory;";
        };
        class ListCars: HR_GRG_RscListbox
        {
            idc = IDC_CatCar;
            x = 0.000 * safezoneW + safezoneX;
            y = 0.030 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.920 * safezoneH;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };
        class ListArmored: ListCars { idc = IDC_CatArmored };
        class ListAir: ListCars { idc = IDC_CatAir };
        class ListBoat: ListCars { idc = IDC_CatBoat };
        class ListStatic: ListCars { idc = IDC_CatStatic };

        //vehicle extras
        class ExtraList: HR_GRG_RscListbox
        {
            idc = IDC_ExtraList;
            x = 0.790 * safezoneW + safezoneX;
            y = 0.000 * safezoneH + safezoneY;
            w = 0.030 * safezoneW;
            h = 0.090 * safezoneH;
            rowHeight = "0.030 * safezoneH";
            onLBSelChanged = "_this call HR_GRG_fnc_switchExtrasMenu;";
        };
        class ExtraMount: HR_GRG_RscListbox
        {
            idc = IDC_ExtraMounts;
            x = 0.820 * safezoneW + safezoneX;
            y = 0.030 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.590 * safezoneH;
            onMouseButtonClick = "_this call HR_GRG_fnc_requestMount;";
        };
        class ExtraTexture: ExtraMount { idc = IDC_ExtraTexture };
        class ExtraAnim: ExtraMount { idc = IDC_ExtraAnim };
        class ExtraPylons: HR_GRG_RscControlsGroup
        {
            idc = IDC_ExtraPylons;
            x = 0.5 * safezoneW + safezoneX;
            y = 0.030 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.590 * safezoneH;
        };

        //general
        class Cancel: HR_GRG_RscButton
        {
            idc = IDC_Cancel;
            text = $STR_HR_GRG_Generic_Cancel;
            x = 0.00 * safezoneW + safezoneX;
            y = 0.95 * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.05 * safezoneH;
            action = "closeDialog 0;";
        };
        class toggleLock: HR_GRG_RscButton
        {
            idc = IDC_tLock;
            text = $STR_HR_GRG_Generic_Lock;
            x = 0.06 * safezoneW + safezoneX;
            y = 0.95 * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.05 * safezoneH;
            action = "[HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ['HR_GRG_fnc_toggleLock',2];";
        };
        class Confirm: HR_GRG_RscButton
        {
            idc = IDC_Confirm;
            text = $STR_HR_GRG_Generic_Confirm;
            x = 0.12 * safezoneW + safezoneX;
            y = 0.95 * safezoneH + safezoneY;
            w = 0.06 * safezoneW;
            h = 0.05 * safezoneH;
            action = "[] call HR_GRG_fnc_confirm;";
        };
        class InfoPanel: HR_GRG_RscStructuredText
        {
            idc = IDC_InfoPanel;
            x = 0.820 * safezoneW + safezoneX;
            y = 0.620 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.380 * safezoneH;
        };
        class CatText: HR_GRG_RscStructuredText
        {
            idc = IDC_CatText;
            x = 0.000 * safezoneW + safezoneX;
            y = 0.000 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.030 * safezoneH;
        };
        class ExtrasText: HR_GRG_RscStructuredText
        {
            idc = IDC_ExtrasText;
            x = 0.820 * safezoneW + safezoneX;
            y = 0.000 * safezoneH + safezoneY;
            w = 0.180 * safezoneW;
            h = 0.030 * safezoneH;
        };
        class KeyBindHint: HR_GRG_RscStructuredText
        {
            idc = IDC_KeyBindHint;
            size = safeZoneW / safeZoneH min 1.2 / 1.2 / 37.5;
            x = 0.180 * safezoneW + safezoneX;
            y = 0.950 * safezoneH + safezoneY;
            w = safeZoneW / safeZoneH min 1.2 / 1.2 / 37.5 / 0.07; //get right lenght for text
            h = 0.050 * safezoneH;
        };
    };
};
