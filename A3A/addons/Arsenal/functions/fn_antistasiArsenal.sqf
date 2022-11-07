
#include "..\dialog\ids.inc"
#include "..\script_component.hpp"



params[["_mode","onLoad"], ["_params",[]]];

switch (_mode) do
{
    case ("onLoad"):
    {

    };

    case ("switchTab"):
    {
        private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;
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

        Debug("Hiding all logs");

        {
            private _ctrl = _display displayCtrl _x;
            _ctrl ctrlShow false;
        } forEach _allTabs;

        // Show the tab!
        Debug("Showing selected tab!");
        private _selectedTabCtrl = _display displayCtrl _selectedTabIDC;
        _selectedTabCtrl ctrlShow true;
    };
};