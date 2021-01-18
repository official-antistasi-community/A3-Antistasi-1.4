/*
    Author: [Håkon]
    [Description]
        Cleans cargo/node list on vehicle if it gets the objNull bug, but is really empty.

    Arguments:
    0. <Object> Vehicle to clean cargo/node list of

    Return Value:
    <nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_vehicle] call A3A_fnc_logistics_refreshVehicleLoad;
*/
params ["_vehicle"];

private _cargo = _vehicle getVariable ["Cargo",[]];
if (_cargo findIf {!((_x#0) isEqualTo objNull)} isEqualTo -1) then { //if all remaining cargo on list is objNull, reset list
    private _nodes = [_vehicle] call A3A_fnc_logistics_getVehicleNodes;
    _vehicle setVariable ["logisticsCargoNodes",_nodes];
    _vehicle setVariable ["Cargo", []];
};
