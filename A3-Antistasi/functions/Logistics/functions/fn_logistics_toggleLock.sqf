/*
    Author: [Håkon]
    [Description]
        Refreshes lock with added/removed seats to lock

    Arguments:
    0. <Object> Vehicle to lock seats of
    1. <Bool>   Are the seats being locked
    2. <Array>  Seat index's that are being locked/unlocked (optional - leave nil to lock/unlock all seats of the vehicle)

    Return Value:
    <Nil>

    Scope: Clients
    Environment: Scheduled
    Public: [No]
    Dependencies:

    Example: [_vehicle, true, _seats] remoteExecCall ["A3A_fnc_logistics_toggleLock", 0, _vehicle];
*/
params ["_vehicle", "_lock", "_seats"];

//toggle lock of the propper seats
_vehicle lockCargo false;
if !(isNil "_seats") then {//for vehicle loading cargo
    private _crew = crew _vehicle;
    private _crewCargoIndex = _crew apply {_vehicle getCargoIndex _x};

    private _seatsToLock = _vehicle getVariable ["Logistics_occupiedSeats", []];
    if (_lock) then {
        _seatsToLock append _seats
    } else {
        _seatsToLock = _seatsToLock - _seats;
    };
    _vehicle setVariable ["Logistics_occupiedSeats", _seatsToLock, true];

    {
        if (_x in _crewCargoIndex) then {
            moveOut (_crew # (_crewCargoIndex find _x)); //incase someone got into the seat before it is locked in the loading process
        };
        _vehicle lockCargo [_x, true];
    } forEach _seatsToLock;
} else {//for cargo, lock it fully and kick out any crew
    if (_vehicle isKindOf "StaticWeapon") exitWith {}; // dont lock statics, cant get out otherwise
    _vehicle lock _lock;
    if (_lock) then {
        //move out crew
        {moveOut _x}forEach crew _vehicle;

        //detach tow ropes attached to cargo
        {
            _veh = ropeAttachedTo _x;
            if (!isNull _veh) then {[_veh,player] call SA_Put_Away_Tow_Ropes};
        } forEach attachedObjects _vehicle;

        //detach tow ropes from cargo
        [_vehicle,player] call SA_Put_Away_Tow_Ropes
    };
};
