/*  Carpet bomb target area

Environment: Server, must be spawned

Arguments:
    <STRING> Unique support name (mostly for logging)
    <SIDE> Side to send support from
    <SCALAR> Delay time in seconds
    <POS2D> Target position for airstrike
    <SCALAR> Amount of information to reveal to rebels, 0-1

*/

params ["_supportName", "_side", "_delay", "_targPos", "_reveal"];

sleep _delay;

//["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"]
[_reveal, _targPos, _side, "CarpetBombs", 200, 120] spawn A3A_fnc_showInterceptedSupportCall;

private _carrierMarker = if (_side == Occupants) then {"NATO_carrier"} else {"CSAT_carrier"};
private _dir = _targPos getDir markerPos _carrierMarker;

private _vectorDir = [[1,0], _dir] call BIS_fnc_rotateVector2D;
private _vectorRight = [[1,0], _dir + 90] call BIS_fnc_rotateVector2D;
_vectorDir pushBack 0;
_vectorRight pushBack 0;

private _lengthDistanceBetweenBombs = 75;//65;
private _widthDistanceBetweenBombs = 40;//25;

//The logic for bomb positioning, first bomb is always of tho, no idea why
for "_counter" from 0 to 20 do
{
    private _dropPos = _targPos vectorAdd (_vectorDir vectorMultiply ((_counter * (_lengthDistanceBetweenBombs/5)) - (2.2 * _lengthDistanceBetweenBombs)));

    private _sideOffset = 0;
    if(_counter < 3) then
    {
        _sideOffset = _counter - 1;
    }
    else
    {
        if(_counter < 18) then
        {
            _sideOffset = ((_counter - 3) % 5) - 2;
        }
        else
        {
            _sideOffset = _counter - 19;
        };
    };
    _dropPos = _dropPos vectorAdd (_vectorRight vectorMultiply (_sideOffset * _widthDistanceBetweenBombs));
    _dropPos set [2, 1000];

    private _bomb = createVehicle ["Bo_Mk82", _dropPos, [], 0 , "CAN_COLLIDE"];
    _bomb setVectorDirAndUp [[0,0,-1], [1,0,0]];
    _bomb setVelocity [0, 0, -75];

    sleep 0.35;
};
