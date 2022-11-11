
#include "..\dialog\ids.inc"
#include "..\script_component.hpp"
#include "\x\A3A\addons\GUI\dialogues\defines.hpp"

params[["_mode","onLoad"], ["_params",[]]];
private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;

switch (_mode) do
{
    case ("onLoad"):
    {
        // we need to create the tabs all of them
        ["Rifle"] call A3A_fnc_createArsenalTab;
        ["Launcher"] call A3A_fnc_createArsenalTab;
        ["Handgun"] call A3A_fnc_createArsenalTab;
        ["Uniform"] call A3A_fnc_createArsenalTab;
        ["Vest"] call A3A_fnc_createArsenalTab;
        ["Backpack"] call A3A_fnc_createArsenalTab;
        ["Headgear"] call A3A_fnc_createArsenalTab;
        ["Facewear"] call A3A_fnc_createArsenalTab;
        ["NVG"] call A3A_fnc_createArsenalTab;
        ["Binocular"] call A3A_fnc_createArsenalTab;
        ["Map"] call A3A_fnc_createArsenalTab;
        ["Terminal"] call A3A_fnc_createArsenalTab;
        ["Communication"] call A3A_fnc_createArsenalTab;
        ["Navigation"] call A3A_fnc_createArsenalTab;
        ["Watch"] call A3A_fnc_createArsenalTab;

        //combo box stuff
        call A3A_fnc_setUpComboBoxSort;
        ["initEvents", [""]] call A3A_fnc_antistasiArsenal;
    };

    case ("switchTab"):
    {
        private _selectedTab = _params select 0;

        Debug_1("Arsenal switiching tab to %1",_selectedTab);
        private _selectedTabIDC = -1;

        switch(_selectedTab) do 
        {
            case ("Rifle"): {_selectedTabIDC = A3A_IDC_ARSENAL_RIFLE_TAB};
            case ("Launcher"): {_selectedTabIDC = A3A_IDC_ARSENAL_LAUNCHER_TAB};
            case ("Handgun"): {_selectedTabIDC = A3A_IDC_ARSENAL_HANDGUN_TAB};
            case ("Uniform"): {_selectedTabIDC = A3A_IDC_ARSENAL_UNIFORM_TAB};
            case ("Vest"): {_selectedTabIDC = A3A_IDC_ARSENAL_VEST_TAB};
            case ("Backpack"): {_selectedTabIDC = A3A_IDC_ARSENAL_BACKPACK_TAB};
            case ("Headgear"): {_selectedTabIDC = A3A_IDC_ARSENAL_HEADGEAR_TAB};
            case ("Facewear"): {_selectedTabIDC = A3A_IDC_ARSENAL_FACEWEAR_TAB};
            case ("NVG"): {_selectedTabIDC = A3A_IDC_ARSENAL_NVG_TAB};
            case ("Binocular"): {_selectedTabIDC = A3A_IDC_ARSENAL_BINOCULAR_TAB};
            case ("Map"): {_selectedTabIDC = A3A_IDC_ARSENAL_MAP_TAB};
            case ("Terminal"): {_selectedTabIDC = A3A_IDC_ARSENAL_TERMINAL_TAB};
            case ("Communication"): {_selectedTabIDC = A3A_IDC_ARSENAL_COMMUNICATION_TAB};
            case ("Navigation"): {_selectedTabIDC = A3A_IDC_ARSENAL_NAVIGATION_TAB};
            case ("Watch"): {_selectedTabIDC = A3A_IDC_ARSENAL_WATCH_TAB};
            
            // context depend subtabs
            case ("Optic"): {};
            case ("Rail"): {};
            case ("Muzzle"): {};
            case ("Bipod"): {};
            case ("CompatMags"): {};
            case ("Magazines"): {};
            case ("Grenades"): {};
            case ("Explosives"): {};
            case ("Misc"): {};
        
        };

        if (_selectedTabIDC == -1) ExitWith {
            Error("Tried to access a tab, might not exist: %1", _selectedTab);
        };

        private _allTabs = [
            A3A_IDC_ARSENAL_RIFLE_TAB,
            A3A_IDC_ARSENAL_LAUNCHER_TAB,
            A3A_IDC_ARSENAL_HANDGUN_TAB,
            A3A_IDC_ARSENAL_UNIFORM_TAB,
            A3A_IDC_ARSENAL_VEST_TAB,
            A3A_IDC_ARSENAL_BACKPACK_TAB,
            A3A_IDC_ARSENAL_HEADGEAR_TAB,
            A3A_IDC_ARSENAL_FACEWEAR_TAB,
            A3A_IDC_ARSENAL_NVG_TAB,
            A3A_IDC_ARSENAL_BINOCULAR_TAB,
            A3A_IDC_ARSENAL_MAP_TAB,
            A3A_IDC_ARSENAL_TERMINAL_TAB,
            A3A_IDC_ARSENAL_COMMUNICATION_TAB,
            A3A_IDC_ARSENAL_NAVIGATION_TAB,
            A3A_IDC_ARSENAL_WATCH_TAB
        ];

        Debug("Hiding all tabs");

        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;

        // Show the tab!
        private _controls = (_display getVariable ((_selectedTab) + "Ctrls"));
        {
            _x ctrlSetPositionY _forEachIndex * (40 * GRID_H);
            _x ctrlCommit .5;
        } forEach _controls;

        Debug("Showing selected tab!");
        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;

        A3A_selectedTab = [_selectedTabIDC, _selectedTab];

    };

    case("initEvents"):
    {
        // create cam 
        [_display] call A3A_fnc_initArsenalEvents;
    };

    case("changeArsenalTarget"):
    {
        [_display, _params] call A3A_fnc_changeArsenalTarget;
    };
};