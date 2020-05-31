/*  Returns a weighted and balanced vehicle pool for the given side and filter

    Execution on: All

    Scope: External

    Params:
        _side: SIDE : The side for which the vehicle pool should be used
        _filter: ARRAY of STRINGS : The bases classes of units that should be filtered out (for example ["LandVehicle"] or ["Air"])

    Returns:
        _vehiclePool: ARRAY : [vehicleName, weight, vehicleName2, weight2]
*/

params ["_side", ["_filter", []]];

private _vehicleSelection = [];
//In general is Invaders always a bit less chill than the occupants, they will use heavier vehicles more often and earlier
switch (tierWar) do
{
    //General idea: Send only ground units as players should be able to loot and grab the crate before the enemy arrives with a QRF
    case (1):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehPoliceCar, 50],
                [vehFIACar, 30],
                [vehFIATruck, 15],
                [vehFIAArmedCar, 5]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATLightUnarmed, 50],
                [vehCSATTrucks, 30],
                [vehCSATLight, 20]
            ];
        };
    };
    //General idea: Enemies get airborne, police units are reduced and replaced by military units
    case (2):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehPoliceCar, 20],
                [vehFIAArmedCar, 20],
                [vehNATOLightUnarmed, 20],
                [vehNATOTrucks, 20],
                [vehNATOLightArmed, 10],
                [vehNATOPatrolHeli, 10]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATLight, 30],
                [vehCSATTrucks, 30],
                [vehCSATLightArmed, 10],
                [vehCSATPatrolHeli, 30]
            ];
        };
    };
    //General idea: No police units any more, armed vehicles and first sightings of APCs
    case (3):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOLightUnarmed, 10],
                [vehNATOLightArmed, 30],
                [vehNATOTrucks, 20],
                [vehNATOPatrolHeli, 35],
                [vehNATOAPC, 5]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATLight, 5],
                [vehCSATTrucks, 20],
                [vehCSATLightArmed, 25],
                [vehCSATPatrolHeli, 35],
                [vehCSATAPC, 15]
            ];
        };
    };
    //General idea: Unarmed vehicles vanish, trucks start to get replaced by APCs, first sighting of transport helicopters
    case (4):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOLightArmed, 15],
                [vehNATOTrucks, 10],
                [vehNATOPatrolHeli, 25],
                [vehNATOAPC, 35],
                [vehNATOTransportHelis, 15]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATTrucks, 5],
                [vehCSATLightArmed, 15],
                [vehCSATPatrolHeli, 25],
                [vehCSATAPC, 30],
                [vehCSATTransportHelis, 25]
            ];
        };
    };
    //General idea: Get rid of any unarmed vehicle, Invaders start to bring the big guns
    case (5):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOLightArmed, 10],
                [vehNATOPatrolHeli, 20],
                [vehNATOAPC, 45],
                [vehNATOTransportHelis, 25]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATPatrolHeli, 15],
                [vehCSATAPC, 35],
                [vehCSATTransportHelis, 35],
                [vehCSATAA, 15]
            ];
        };
    };
    //General idea: No light vehicles any more, Invaders start to bring attack helicopter
    case (6):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOPatrolHeli, 15],
                [vehNATOAPC, 35],
                [vehNATOTransportHelis, 40],
                [vehNATOAA, 10]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATPatrolHeli, 5],
                [vehCSATAPC, 30],
                [vehCSATTransportHelis, 30],
                [vehCSATAA, 15],
                [vehCSATAttackHelis, 20]
            ];
        };
    };
    //General idea: Getting rid of light helis, Invaders start the endgame
    case (7):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOAPC, 30],
                [vehNATOTransportHelis, 40],
                [vehNATOAA, 15],
                [vehNATOAttackHelis, 15]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATAPC, 15],
                [vehCSATTransportHelis, 15],
                [vehCSATAA, 15],
                [vehCSATAttackHelis, 20],
                [vehCSATTank, 15],
                [vehCSATTransportPlanes, 20]
            ];
        };
    };
    //General idea, Occupants start to throw in everything, Invaders upgrade to maximum
    case (8):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOAPC, 20],
                [vehNATOTransportHelis, 25],
                [vehNATOAA, 10],
                [vehNATOAttackHelis, 30],
                [vehNATOTank, 15]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATAPC, 15],
                [vehCSATTransportHelis, 10],
                [vehCSATAA, 15],
                [vehCSATAttackHelis, 15],
                [vehCSATTank, 20],
                [vehCSATTransportPlanes, 15],
                [vehCSATPlane, 5],
                [vehCSATPlaneAA, 5]
            ];
        };
    };
    //General idea: Occupants get access to all, invaders start to heavily rely on tanks and attack helis
    case (9):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOAPC, 15],
                [vehNATOTransportHelis, 10],
                [vehNATOAA, 10],
                [vehNATOAttackHelis, 20],
                [vehNATOTank, 15],
                [vehNATOTransportPlanes, 15],
                [vehNATOPlane, 10],
                [vehNATOPlaneAA, 5]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATAPC, 10],
                [vehCSATTransportHelis, 5],
                [vehCSATAA, 10],
                [vehCSATAttackHelis, 20],
                [vehCSATTank, 20],
                [vehCSATTransportPlanes, 15],
                [vehCSATPlane, 10],
                [vehCSATPlaneAA, 10]
            ];
        };
    };
    //General idea: Occupants finish with a focus on infantry units supported by combat vehicles, while Invaders tend to use heavy armor
    case (10):
    {
        if(_side == Occupants) then
        {
            _vehicleSelection =
            [
                [vehNATOAPC, 10],
                [vehNATOTransportHelis, 10],
                [vehNATOAA, 5],
                [vehNATOAttackHelis, 20],
                [vehNATOTank, 20],
                [vehNATOTransportPlanes, 15],
                [vehNATOPlane, 10],
                [vehNATOPlaneAA, 10]
            ];
        };
        if(_side == Invaders) then
        {
            _vehicleSelection =
            [
                [vehCSATAPC, 10],
                [vehCSATAA, 10],
                [vehCSATAttackHelis, 25],
                [vehCSATTank, 25],
                [vehCSATTransportPlanes, 15],
                [vehCSATPlane, 5],
                [vehCSATPlaneAA, 10]
            ];
        };
    };
};

//Use this function to filter out any unwanted elements
_fn_checkElementAgainstFilter =
{
    params ["_element", "_filter"];

    private _passed = true;
    {
        if(_element isKindOf _x) exitWith
        {
            _passed = false;
            [
                3,
                format ["%1 didnt passed filter %2", _element, _x],
                "getVehiclePoolForQRFs"
            ] call A3A_fnc_log;
        };
    } forEach _filter;

    _passed;
};

//Break unit arrays down to single vehicles
private _vehiclePool = [];
{
    if((_x select 0) isEqualType []) then
    {
        private _points = (_x select 1)/(count (_x select 0));
        {
            if(([_x, _filter] call _fn_checkElementAgainstFilter) && {[_x] call A3A_fnc_vehAvailable}) then
            {
                _vehiclePool pushBack _x;
                _vehiclePool pushBack _points;
            };
        } forEach (_x select 0);
    }
    else
    {
        if(([_x select 0, _filter] call _fn_checkElementAgainstFilter) && {[_x select 0] call A3A_fnc_vehAvailable}) then
        {
            _vehiclePool pushBack (_x select 0);
            _vehiclePool pushBack (_x select 1);
        };
    };
} forEach _vehicleSelection;

[
    3,
    format ["For %1 and war level %2 selected units are %3, filter was %4", _side, tierWar, _vehiclePool, _filter],
    "getVehiclePoolForQRFs"
] call A3A_fnc_log;

_vehiclePool;
