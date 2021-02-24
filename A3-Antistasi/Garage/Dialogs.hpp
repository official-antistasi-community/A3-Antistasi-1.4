#include "defines.inc"
#include "defines.hpp"
class HR_GRG_VehicleSelect
{
    idd=HR_GRG_IDD_Garage;
    movingenable=false;
    onLoad = "[] spawn HR_GRG_fnc_onLoad;";
    onUnload = "[] spawn HR_GRG_fnc_onUnload;";
    class controls
    {
        // Title text left
        class HR_GRG_CatText: HR_GRG_RscStructuredText
        {
            idc = HR_GRG_IDC_CatText;
            x = SCREEN_LEFT;
            y = SCREEN_TOP;
            w = 39 * GRID_NOUISCALE_W;
            h = 4 * GRID_NOUISCALE_H;
            size = TEXT_SIZE_LARGE;
        };

        // Vehicle listboxes
        class HR_GRG_ListCars: HR_GRG_RscListbox
        {
            idc = HR_GRG_IDC_CatCar;
            x = SCREEN_LEFT;
            y = SCREEN_TOP + 4 * GRID_NOUISCALE_H;
            w = 39 * GRID_NOUISCALE_W;
            h = safeZoneH - (11 * GRID_NOUISCALE_H); // Screen height - title and buttons height
            size = TEXT_SIZE_MEDIUM;
            rowHeight = 3 * GRID_NOUISCALE_H;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };
        class HR_GRG_ListArmored: HR_GRG_ListCars
        {
            idc = HR_GRG_IDC_CatArmored;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };
        class HR_GRG_ListAir: HR_GRG_ListCars
        {
            idc = HR_GRG_IDC_CatAir;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };
        class HR_GRG_ListBoat: HR_GRG_ListCars
        {
            idc = HR_GRG_IDC_CatBoat;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };
        class HR_GRG_ListStatic: HR_GRG_ListCars
        {
            idc = HR_GRG_IDC_CatStatic;
            onMouseButtonClick = "_this call HR_GRG_fnc_selectionChange;";
        };

        // Bottom left buttons
        class HR_GRG_ButtonsControlsGroup: HR_GRG_RscControlsGroup
        {
            idc = -1;
            x = SCREEN_LEFT;
            y = SCREEN_BOTTOM - 7 * GRID_NOUISCALE_H;
            w = 39 * GRID_NOUISCALE_W;
            h = 7 * GRID_NOUISCALE_H;

            class controls
            {
                class HR_GRG_Cancel: HR_GRG_RscButton
                {
                    idc = HR_GRG_IDC_Cancel;
                    text = $STR_HR_GRG_Generic_Cancel;
                    x = 0;
                    y = 0;
                    w = 13 * GRID_NOUISCALE_W;
                    h = 7 * GRID_NOUISCALE_H;
                    action = "closeDialog 0;";
                    sizeEx = TEXT_SIZE_LARGE;
                };
                class HR_GRG_toggleLock: HR_GRG_RscButton
                {
                    idc = HR_GRG_IDC_tLock;
                    text = $STR_HR_GRG_Generic_Lock;
                    x = 13 * GRID_NOUISCALE_W;
                    y = 0;
                    w = 13 * GRID_NOUISCALE_W;
                    h = 7 * GRID_NOUISCALE_H;
                    action = "[HR_GRG_PlayerUID, player, HR_GRG_SelectedVehicles] remoteExecCall ['HR_GRG_fnc_toggleLock',2];";
                    sizeEx = TEXT_SIZE_LARGE;
                };
                class HR_GRG_Confirm: HR_GRG_RscButton
                {
                    idc = HR_GRG_IDC_Confirm;
                    text = $STR_HR_GRG_Generic_Confirm;
                    x = 26 * GRID_NOUISCALE_W;
                    y = 0;
                    w = 13 * GRID_NOUISCALE_W;
                    h = 7 * GRID_NOUISCALE_H;
                    action = "[] call HR_GRG_fnc_confirm;";
                    sizeEx = TEXT_SIZE_LARGE;
                };
            };
        };

        // Vehicle HR_GRG_categories buttons
        class HR_GRG_categories: HR_GRG_RscListbox
        {
            idc = HR_GRG_IDC_CatList;
            x = SCREEN_LEFT + 39 * GRID_NOUISCALE_W;
            y = SCREEN_TOP;
            w = 10 * GRID_NOUISCALE_W;
            h = 20 * GRID_NOUISCALE_H;
            rowHeight = 4 * GRID_NOUISCALE_H;
            onLBSelChanged = "_this call HR_GRG_fnc_switchCategory;";
        };

        //vehicle extras buttons
        class HR_GRG_ExtraList: HR_GRG_RscListbox
        {
            idc = HR_GRG_IDC_ExtraList;
            x = SCREEN_RIGHT - 49 * GRID_NOUISCALE_W;
            y = SCREEN_TOP;
            w = 10 * GRID_NOUISCALE_W;
            h = 16 * GRID_NOUISCALE_H;
            rowHeight = 4 * GRID_NOUISCALE_H;
            onLBSelChanged = "_this call HR_GRG_fnc_switchExtrasMenu;";
        };


        // Vehicle Extras | Right side panel

        // Title text
        class HR_GRG_ExtrasText: HR_GRG_RscStructuredText
        {
            idc = HR_GRG_IDC_ExtrasText;
            x = SCREEN_RIGHT - 39 * GRID_NOUISCALE_W;
            y = SCREEN_TOP;
            w = 39 * GRID_NOUISCALE_W;
            h = 4 * GRID_NOUISCALE_H;
            size = TEXT_SIZE_LARGE;
        };

        // Vehicle extras lists/controlsgroup
        class HR_GRG_ExtraMount: HR_GRG_RscListbox
        {
            idc = HR_GRG_IDC_ExtraMounts;
            x = SCREEN_RIGHT - 39 * GRID_NOUISCALE_W;
            y = SCREEN_TOP + 4 * GRID_NOUISCALE_H;
            w = 39 * GRID_NOUISCALE_W;
            h = safeZoneH - (56 * GRID_NOUISCALE_H); // Screen height - title and buttons height
            size = TEXT_SIZE_MEDIUM;
            rowHeight = 3 * GRID_NOUISCALE_H;
            onMouseButtonClick = "_this call HR_GRG_fnc_requestMount;";
        };

        class HR_GRG_ExtraTexture: HR_GRG_ExtraMount
        {
            idc = HR_GRG_IDC_ExtraTexture;
            onMouseButtonClick = "_this call HR_GRG_fnc_switchTexture;";
        };

        class HR_GRG_ExtraAnim: HR_GRG_ExtraMount
        {
            idc = HR_GRG_IDC_ExtraAnim;
            onMouseButtonClick = "_this call HR_GRG_fnc_toggleAnim;";
        };

        class HR_GRG_ExtraPylonsContainer: HR_GRG_RscControlsGroup
        {
            idc = HR_GRG_IDC_ExtraPylonsContainer;
            x = SCREEN_RIGHT - 39 * GRID_NOUISCALE_W;
            y = SCREEN_TOP + 4 * GRID_NOUISCALE_H;
            w = 39 * GRID_NOUISCALE_W;
            h = safeZoneH - (56 * GRID_NOUISCALE_H); // Screen height - title and buttons height

            class controls
            {
                class HR_GRG_ExtraPylonsBg: HR_GRG_RscBox
                {
                    idc = -1;
                    x = 0;
                    y = 0;
                    w = 39 * GRID_NOUISCALE_W;
                    h = safeZoneH - (56 * GRID_NOUISCALE_H);
                };

                class HR_GRG_MirrorCheckbox: HR_GRG_RscCheckBox
                {
                    idc = HR_GRG_IDC_ExtraPylonsMirrorCheckbox;
                    x = 1 * GRID_NOUISCALE_W;
                    y = 0;
                    w = 3 * GRID_NOUISCALE_W;
                    h = 3 * GRID_NOUISCALE_H;
                };

                class HR_GRG_MirrorLabel: HR_GRG_RscText
                {
                    idc = HR_GRG_IDC_ExtraPylonsMirrorLabel;
                    x = 4 * GRID_NOUISCALE_W;
                    y = 0;
                    w = 8 * GRID_NOUISCALE_W;
                    h = 3 * GRID_NOUISCALE_H;
                    colorBackground[] = {0,0,0,0};
                };

                class HR_GRG_PresetsCombo: HR_GRG_RscCombo
                {
                    idc = HR_GRG_IDC_ExtraPylonsPresetsCombo;
                    x = 13 * GRID_NOUISCALE_W;
                    y = 0;
                    w = 25 * GRID_NOUISCALE_W;
                    h = 3 * GRID_NOUISCALE_H;
                    colorBackground[] = {0,0,0,1};
                };

                class HR_GRG_ExtraPylons: HR_GRG_RscControlsGroup
                {
                    idc = HR_GRG_IDC_ExtraPylons;
                    x = 0;
                    y = 4 * GRID_NOUISCALE_H;
                    w = 38 * GRID_NOUISCALE_W;
                    h = safeZoneH - (65 * GRID_NOUISCALE_H); // Screen height - title and buttons height 51
                };
            };
        };

        // Info Panel
        class HR_GRG_InfoPanel: HR_GRG_RscStructuredText
        {
            idc = HR_GRG_IDC_InfoPanel;
            x = SCREEN_RIGHT - 39 * GRID_NOUISCALE_W;
            y = SCREEN_BOTTOM - 52 * GRID_NOUISCALE_H;
            w = 39 * GRID_NOUISCALE_W;
            h = 52 * GRID_NOUISCALE_H;
            size = TEXT_SIZE_MEDIUM;
        };

        // Camera controls hint
        class HR_GRG_KeyBindHint: HR_GRG_RscStructuredText
        {
            idc = HR_GRG_IDC_KeyBindHint;
            // size = safeZoneW / safeZoneH min 1.2 / 1.2 / 37.5;
            x = SCREEN_LEFT + 39 * GRID_NOUISCALE_W;
            y = SCREEN_BOTTOM - 7 * GRID_NOUISCALE_H;
            w = 36 * GRID_NOUISCALE_W;
            h = 7 * GRID_NOUISCALE_H;
            size = TEXT_SIZE_SMALL;
        };
    };
};
