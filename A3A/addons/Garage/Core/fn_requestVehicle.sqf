/*
    Author: [Håkon]
    [Description]
        request checking out of vehicle

    Arguments:
    0. <String> Player UID
    1. <Int>    Category of vehicle
    2. <Int>    Index of vehicle

    Return Value:
    <Bool> Vehicle checked out

    Scope: Server
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_UID, _cat, _index] call HR_GRG_fnc_requestVehicle;

    License: APL-ND
*/
params [["_UID","",[""]], ["_cat",0,[0]], ["_index",0,[0]]];
if (!isServer) exitWith {false};
if (_UID isEqualTo "") exitWith {false};

private _veh = (HR_GRG_Vehicles#_cat) get _index;
if ( (_veh#3) isEqualTo "") exitWith {_veh set [3, _UID]; call HR_GRG_fnc_broadcast; true};
false;
