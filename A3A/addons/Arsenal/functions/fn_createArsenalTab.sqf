#include "..\dialog\ids.inc"
#include "..\script_component.hpp"
#include "\x\A3A\addons\GUI\dialogues\defines.hpp"
#define TOP safeZoneY
#define BOTTOM safeZoneH + safeZoneY
#define LEFT safeZoneX
#define RIGHT safeZoneW + safeZoneX


params ["_selectedTab"];


private _display = findDisplay A3A_IDD_ANTISTASI_ARSENAL_DIALOG;

private _selectedTabIDC = -1;
private _selectedTabCtrl = -1;
private _config = configFile >> "CfgVehicles";

switch(_selectedTab) do 
{
    case ("Rifle"): 
    {
        _selectedTabIDC = A3A_IDC_ARSENAL_RIFLE_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_RIFLE_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Launcher"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_LAUNCHER_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_LAUNCHER_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Handgun"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_HANDGUN_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_HANDGUN_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Uniform"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_UNIFORM_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_UNIFORM_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Vest"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_VEST_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_VEST_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Backpack"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_BACKPACK_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_BACKPACK_TAB_CONTROL_GROUP;
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Headgear"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_HEADGEAR_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_HEADGEAR_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Facewear"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_FACEWEAR_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_FACEWEAR_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgGlasses";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("NVG"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_NVG_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_NVG_TAB_CONTROL_GROUP;
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Binocular"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_BINOCULAR_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_BINOCULAR_TAB_CONTROL_GROUP;
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Map"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_MAP_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_MAP_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Terminal"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_TERMINAL_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_TERMINAL_TAB_CONTROL_GROUP;
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Communication"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_COMMUNICATION_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_COMMUNICATION_TAB_CONTROL_GROUP;
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Navigation"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_NAVIGATION_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_NAVIGATION_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };

    case ("Watch"): {
        _selectedTabIDC = A3A_IDC_ARSENAL_WATCH_TAB;
        _selectedTabCtrl = A3A_IDC_ARSENAL_WATCH_TAB_CONTROL_GROUP;
        _config = configFile >> "CfgWeapons";
        Debug_1("Creating tab %1", _selectedTab);
    };
        
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
    Error("Tried to access a tab, might not exist: %1",_selectedTab);
};
if (_selectedTabCtrl == -1) ExitWith {
    Error("Tried to assign a ctrl group, might not exist: %1",_selectedTab);
};

private _controlsGroup = _display displayCtrl _selectedTabCtrl;


// the ArsenalData doesn't exist
if(isNil "A3A_ArsenalData") ExitWith {Debug("Arsenal data does not exist")};

// get the items to create
private _arsenalData = A3A_ArsenalData getOrDefault [_selectedTab, []];
if (_arsenalData isEqualTo []) ExitWith { Debug_1("Data array is empty for: %1",_selectedTab)};
private _createdCtrls = [];

{
    [_x, _y ] params ["_className", "_amount"];

    private _configClass = _config >> _className;
    private _displayName = getText (_configClass >> "displayName");
    private _picturePreview = getText (_configClass >> "picture");
    private _model = getText (_configClass >> "model");


    private _itemYPos =  _forEachIndex * (40 * GRID_H);

    
    private _itemControlsGroup = _display ctrlCreate ["A3A_ControlsGroupNoScrollbars", -100, _controlsGroup];
    _itemControlsGroup ctrlSetPosition[0, _itemYpos, 40 * GRID_W, 40 * GRID_H];
    _itemControlsGroup ctrlSetFade 1;
    _itemControlsGroup ctrlCommit 0;

    private _previewButton = _display ctrlCreate ["A3A_ActivePicture", A3A_IDC_ARSENAL_ITEM_PREVIEW, _itemControlsGroup];
    _previewButton ctrlSetPosition [0, 0, 40 * GRID_W, 20 * GRID_H];
    _previewButton ctrlSetText _picturePreview;
    _previewButton ctrlCommit 0;


    private _button = _display ctrlCreate ["A3A_ShortcutButton", -1, _itemControlsGroup];
    _button ctrlSetPosition [0, 20 * GRID_H, 40 * GRID_W, 12 * GRID_H];
    _button ctrlSetText _displayName;
    _button ctrlSetTooltip _className;
    _button ctrlCommit 0;


    private _amountText = _display ctrlCreate ["A3A_InfoTextLeft", -1, _itemControlsGroup];
    _amountText ctrlSetPosition [0, 0, 40 * GRID_W, 5 * GRID_H];
    _amountText ctrlSetText format["Amount %1", _amount];
    _amountText ctrlCommit 0;


    _itemControlsGroup setVariable ["className", _className];
    _itemControlsGroup setVariable ["displayName", _displayName];
    _button setVariable ["className", _className];
    _button setVariable ["selectedTab", _selectedTab];

    _button ctrladdeventhandler ["ButtonClick", {
        params ["_control"];
        systemChat "Clicked";
        private _className = _control getVariable ["className", ""];
        private _selectedTab = _control getVariable ["selectedTab", ""];
        if(_className isEqualTo "" || _selectedTab isEqualTo "") exitwith {};
        [_selectedTab, _className] call A3A_fnc_addItems;
    }];

    _itemControlsGroup ctrlSetFade 0;
    _itemControlsGroup ctrlCommit 0.1;

    _createdCtrls pushBack _itemControlsGroup;


} forEach _arsenalData;

//copyToClipboard str _createdCtrls;
_display setVariable [(_selectedTab + "Ctrls"), _createdCtrls];