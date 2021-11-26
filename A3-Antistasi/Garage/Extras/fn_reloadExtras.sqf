/*
    Author: [Håkon]
    [Description]
        Rebuilds the extras lists base on local garage pool data

    Arguments:
    0. <String> Selected vehicle class

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies: A3A_hasAce

    Example: [true] call HR_GRG_fnc_reloadExtras;

    License: APL-ND
*/
#include "defines.inc"
FIX_LINE_NUMBERS()
params [["_reloadMounts", false, [true]]];
private _class = HR_GRG_SelectedVehicles param [2, "", [""]];
Trace("Reloading Extras");
//Mounts
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrl = _disp displayCtrl HR_GRG_IDC_ExtraMounts;
lbClear _ctrl;
private _vehNodes = [HR_GRG_previewVeh] call A3A_fnc_logistics_getVehicleNodes;
if (_vehNodes isEqualType []) then {
    private _capacity = count _vehNodes;
    {
        _y params ["_displayName", "_staticClass", "_lockedUID", "_checkedOut"];

        private _block =false;
        if !(_lockedUID in ["", HR_GRG_PlayerUID]) then {_block = true};
        if !(_checkedOut in ["", HR_GRG_PlayerUID]) then {_block = true};
        if !(isClass (configFile >> "CfgVehicles" >> _class)) then {_block = true};

        //check if its loadable
        private _model = getText (configFile >> "CfgVehicles" >> _staticClass >> "model");
        private _type = -1;
        {
            if ((_x#0) isEqualTo _model) exitWith {_type = +(_x#3)};
        }forEach A3A_logistics_attachmentOffset;

        //is weapon allowed
        private _vehModel = getText (configFile >> "CfgVehicles" >> typeOf HR_GRG_previewVeh >> "model");
        private _allowed = true;
        {
            _x params ["_wep", "_blacklistVehicles"];
            if (_wep isEqualTo _model) exitWith {
                if (_vehModel in _blacklistVehicles) then {_allowed = false};
            };
        } forEach A3A_logistics_weapons;

        //add entry
        if ( (_allowed) && (_type != -1) && (_capacity >= _type) && !_block) then { //static is loadable and vehicle can fit it
            private _index = _ctrl lbAdd _displayName;
            _ctrl lbSetData [_index, _staticClass];
            _ctrl lbSetValue [_index, _x];
            _ctrl lbsetpicture [_index,checkboxTextures select (_checkedOut isEqualTo HR_GRG_PlayerUID)];
            _ctrl lbSetTextRight [_index, format ["Size: %1", _type]];
            Trace_4("Mount Added to list | Class: %1 | UID: %2 | Checked: %3 | Size: %4", _staticClass, _x, (_checkedOut isEqualTo HR_GRG_PlayerUID), _type);
        };
    } forEach (HR_GRG_Vehicles#4);//statics
};
if (_reloadMounts) then { [] call HR_GRG_fnc_reloadMounts };

private _customisation = [HR_GRG_previewVeh] call BIS_fnc_getVehicleCustomization;
//textures
HR_GRG_curTexture = _customisation#0;
private _badInit = HR_GRG_curTexture isEqualTo [];
private _ctrl = _disp displayCtrl HR_GRG_IDC_ExtraTexture;
lbClear _ctrl;
{
    private _displayName = getText (_x >> "displayName");
    private _cfgName = configname _x;
    if (_displayName != "" && {!(_displayName in HR_GRG_blackListCamo)}) then {
        private _index = _ctrl lbAdd _displayName;
        _ctrl lbsetdata [_index,_cfgName];
        if (_badInit) then {
            _ctrl lbsetpicture [_index,checkboxTextures#0];
        } else {
            _ctrl lbsetpicture [_index,checkboxTextures select ((HR_GRG_curTexture#0) isEqualTo _cfgName)];
        };
    };
} foreach (configProperties [(configfile >> "CfgVehicles" >> _class >> "textureSources"),"isclass _x",true]);
lbSort _ctrl;

//animations
private _ctrl = _disp displayCtrl HR_GRG_IDC_ExtraAnim;
lbClear _ctrl;
{
    _configName = configname _x;
    _displayName = getText (_x >> "displayName");
    if (_displayName != "") then {
        _textures = getArray (_x >> "textures");
        _index = _ctrl lbAdd _displayName;
        _ctrl lbSetData [_index,_configName];
        private _phase = ceil (HR_GRG_PreviewVeh animationPhase _configName);
        _ctrl lbSetPicture [_index,checkboxTextures#_phase];
    };
} foreach (configProperties [(configfile >> "CfgVehicles" >> _class >> "animationSources"),"isclass _x",true]);
lbSort _ctrl;

HR_GRG_curAnims = _customisation#1;
[HR_GRG_previewVeh, HR_GRG_curTexture, HR_GRG_curAnims] call BIS_fnc_initVehicle;

//update source panel
private _ctrl = _disp displayCtrl HR_GRG_IDC_SourcePanelAmmo;
_ctrl ctrlSetStructuredText composeText ["   ", image RearmIcon, " ", image (checkboxTextures select (HR_GRG_hasAmmoSource && !HR_GRG_ServiceDisabled_Rearm))];
_ctrl ctrlSetTooltip ([
    localize "STR_HR_GRG_SourcePanel_toolTip_Ammo_Unavailable"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Ammo_Available"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Ammo_Disabled"
] select (if (HR_GRG_ServiceDisabled_Rearm) then {2} else {HR_GRG_hasAmmoSource}));

private _ctrl = _disp displayCtrl HR_GRG_IDC_SourcePanelFuel;
_ctrl ctrlSetStructuredText composeText ["   ", image RefuelIcon, " ", image (checkboxTextures select (HR_GRG_hasFuelSource && !HR_GRG_ServiceDisabled_Refuel))];
_ctrl ctrlSetTooltip ([
    localize "STR_HR_GRG_SourcePanel_toolTip_Fuel_Unavailable"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Fuel_Available"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Fuel_Disabled"
] select (if (HR_GRG_ServiceDisabled_Refuel) then {2} else {HR_GRG_hasFuelSource}));

private _ctrl = _disp displayCtrl HR_GRG_IDC_SourcePanelRepair;
_ctrl ctrlSetStructuredText composeText ["   ", image RepairIcon, " ", image (checkboxTextures select (HR_GRG_hasRepairSource && !HR_GRG_ServiceDisabled_Repair))];
_ctrl ctrlSetTooltip ([
    localize "STR_HR_GRG_SourcePanel_toolTip_Repair_Unavailable"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Repair_Available"
    , localize "STR_HR_GRG_SourcePanel_toolTip_Repair_Disabled"
] select (if (HR_GRG_ServiceDisabled_Repair) then {2} else {HR_GRG_hasRepairSource}));

if (isNull HR_GRG_previewVeh) exitWith {};
//update info panel
private _ctrl = _disp displayCtrl HR_GRG_IDC_InfoPanel;
private _spacer = composeText [lineBreak, lineBreak];
private _topBar = composeText [
    image cfgIcon(_class), " ", cfgDispName(_class)
];

//is source
private _source = [
    [HR_GRG_previewVeh] call HR_GRG_fnc_isAmmoSource
    ,[HR_GRG_previewVeh] call HR_GRG_fnc_isFuelSource
    ,[HR_GRG_previewVeh] call HR_GRG_fnc_isRepairSource
];
private _typeSource = switch (_source find true) do {
    case 0: {localize "STR_HR_GRG_InfoPanel_isAmmoSource"};
    case 1: {localize "STR_HR_GRG_InfoPanel_isFuelSource"};
    case 2: {localize "STR_HR_GRG_InfoPanel_isRepairSource"};
    default {localize "STR_HR_GRG_InfoPanel_isNotSource"};
};

//Crew
private _fullCrew = fullCrew [HR_GRG_previewVeh, "", true];
private _driver = [];
private _gunner = [];
private _commander = [];
private _cargo = [];
{
    _return = call {
        if ((_x#2) > -1) exitWith {0};
        if ((_x#1) isEqualTo "driver") exitWith {1};
        if ((_x#1) isEqualTo "commander") exitWith {2};
        3
    };
    switch _return do {
        case 0: {_cargo pushBack _x};
        case 1: {_driver pushBack _x};
        case 2: {_commander pushBack _x};
        case 3: {_gunner pushBack _x};
    };
} forEach _fullCrew;
private _countCargo = count _cargo;
private _totalSeats = count _fullCrew;
private _seatsInfo = composeText [
    localize "STR_HR_GRG_InfoPanel_Seats"," ", str (_totalSeats - HR_GRG_LockedSeats), "/", str _totalSeats, lineBreak, "    ",
    image DriverIcon, ": ", str count _driver, "    "
    ,image GunnerIcon, ": ", str count _gunner, "    "
    ,image CommanderIcon, ": ", str count _commander, "    "
    ,image CargoIcon, ": ", str (_countCargo - HR_GRG_LockedSeats), "/", str _countCargo
];

//Cargo
private _nodes = HR_GRG_previewVeh getVariable ["logisticsCargoNodes",nil];
if (isNil "_nodes") then {
    _nodes = [HR_GRG_previewVeh] call A3A_fnc_logistics_getVehicleNodes;
    HR_GRG_previewVeh setVariable ["logisticsCargoNodes", _nodes];
};
if (_nodes isEqualType 0) then {_nodes = []};
private _cargoCapacity = count _nodes;
private _availableCapacity = _cargoCapacity - HR_GRG_usedCapacity;
private _aceCargo = if (A3A_hasAce) then {
    composeText [lineBreak, "    ", localize "STR_HR_GRG_InfoPanel_AceCargo"," ", str cfgAceCargo(_class)]
} else {""};

private _cargoInfo = composeText [
    image VehCargoIcon, localize "STR_HR_GRG_InfoPanel_Cargo", lineBreak, "    "
    ,localize "STR_HR_GRG_InfoPanel_Capacity"," ", str _cargoCapacity,  lineBreak, "    "
    ,localize "STR_HR_GRG_InfoPanel_Available"," ", str _availableCapacity
    ,_aceCargo
];

//general
private _topSpeed = cfgMaxSpeed(_class);
private _horsePower = cfgEnginePower(_class);
private _mass = HR_GRG_previewVeh getVariable ["default_mass", getMass HR_GRG_previewVeh];
{ _mass = _mass + getMass _x } forEach attachedObjects HR_GRG_previewVeh; //the only thing attached is mounts
_generalInfo = composeText [
    image SpeedIcon," ", localize "STR_HR_GRG_InfoPanel_Speed"," ", str _topSpeed, lineBreak
    ,image MassIcon," ",localize "STR_HR_GRG_InfoPanel_Mass"," ", str _mass
];

_ctrl ctrlSetStructuredText composeText [_topBar, lineBreak, _typeSource, _spacer, _seatsInfo, _spacer, _cargoInfo, _spacer, _generalInfo];
