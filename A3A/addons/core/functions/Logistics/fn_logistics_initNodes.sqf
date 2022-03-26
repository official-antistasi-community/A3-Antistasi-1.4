/*
    Author: [Håkon]
    [Description]
        handles finalising of the logistics nodes and distributing them to clients

    Arguments:
    0. <Nil>

    Return Value:
    <Nil>

    Scope: Server
    Environment: Any
    Public: [Yes]
    Dependencies:

    Example: call A3A_fnc_logistics_initNodes;
*/
{
    private _blackList = _x#1;
    {
        if (isClass (configFile/"CfgVehicles"/_x)) then {continue};
        if !(_x isEqualTo "") then {_blackList pushBackUnique _x};
    } forEach A3A_logistics_coveredVehicles;
} forEach A3A_logistics_weapons;
A3A_logistics_coveredVehicles = A3A_logistics_coveredVehicles select {isClass(configFile/"CfgVehicles"/_x)};

publicVariable "A3A_logistics_vehicleHardpoints";
publicVariable "A3A_logistics_attachmentOffset";
publicVariable "A3A_logistics_coveredVehicles";
publicVariable "A3A_logistics_weapons";
