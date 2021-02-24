/*
    Author: [Håkon]
    [Description]
        Reloads mounted statics

    Arguments:
    0. <nil>

    Return Value:
    <nil>

    Scope: Clients
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [] call HR_GRG_fnc_reloadMounts

    License: MIT License
*/
#include "defines.inc"
Trace("Reloading mounts");
private _disp = findDisplay HR_GRG_IDD_Garage;
private _ctrl = _disp displayCtrl HR_GRG_IDC_ExtraMounts;
//remove old statics
{
    [HR_GRG_previewVeh, true] call A3A_fnc_logistics_unload;
    deleteVehicle _x;
} forEach attachedObjects HR_GRG_previewVeh;

//remove unticked statics
private _toRemove = [];
{
    private _class = _ctrl lbData _forEachIndex;
    private _index = _ctrl lbValue _forEachIndex;
    if ( (checkboxTextures find (_ctrl lbPicture _forEachIndex)) isEqualTo 0 ) then {_toRemove pushBack [_class, _index]};
} forEach (HR_GRG_vehicles#4);
HR_GRG_Mounts = HR_GRG_Mounts - _toRemove;

//add new statics to the list
for "_i" from 0 to (lbSize _ctrl) -1 do {
    if (HR_GRG_Mounts findIf {_i isEqualTo (_x#1)} isEqualTo -1) then { //not in list
        if ( (checkboxTextures find (_ctrl lbPicture _i)) isEqualTo 1 ) then { //and checked
            HR_GRG_Mounts pushBackUnique [_ctrl lbData _i, _ctrl lbValue _i];
        };
    };
};

//add new statics
private _lockedSeats = 0;
private _usedCapacity = 0;
{
    //load preview static onto preview vehicle
    _x params ["_class", "_index"];
    private _static = _class createVehicleLocal [random 100,random 100,10000 + random 10000];
    _static enableSimulation false;
    _static allowDamage false;
    _loadInfo = [HR_GRG_previewVeh, _static] call A3A_fnc_logistics_canLoad;
    if (_loadInfo isEqualType 0) exitWith {};
    (_loadInfo + [true]) call A3A_fnc_logistics_load;

    //get new load info
    private _nodes = _loadInfo#2;
    _usedCapacity = _usedCapacity + count _nodes;
    {_lockedSeats = _lockedSeats + count (_x#2)} forEach _nodes;

    //correct rotation bug
    private _offsetAndDir = [_static] call A3A_fnc_logistics_getCargoOffsetAndDir;
    _static setVectorDir (_offsetAndDir#1);
} forEach HR_GRG_Mounts;
HR_GRG_usedCapacity = _usedCapacity;
HR_GRG_LockedSeats = _lockedSeats;

//clear any loading hints
hintSilent "";
