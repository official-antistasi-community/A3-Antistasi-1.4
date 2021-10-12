params ["_side", "_position"];

/*  Checks if the QRF support is available

    Execution on: Server

    Scope: Internal

    Parameters:
        _side: SIDE : The side which wants to call the support
        _position: POSITION : The position to which the support needs to be called

    Returns:
        0 if QRF is possible, -1 otherwise
*/

#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()

//QRFs always run on the server at the moment, so leave a buffer for wavedCAs
if ([_side] call A3A_fnc_remUnitCount < 40) exitWith
{
    Debug("Blocked QRF because unit count on server is too high");
    -1;
};

if ([_position,false] call A3A_fnc_fogCheck < 0.3) exitWith
{
    Debug("Blocked QRF to %1 due to heavy fog", _position);
    -1;
};

//Do a quick check for at least one available airport
private _index = airportsX findIf
{
    sidesX getVariable [_x, sideUnknown] == _side &&
    {(getMarkerPos _x) distance2D _position < distanceForAirAttack &&
    {[_x, true] call A3A_fnc_airportCanAttack}}
};
if(_index != -1) exitWith
{
    0;
};

//No airport found, search for bases
_index = outposts findIf
{
    sidesX getVariable [_x, sideUnknown] == _side &&
    {(getMarkerPos _x) distance2D _position < distanceForLandAttack &&
    {[_x, true] call A3A_fnc_airportCanAttack &&
    {[getMarkerPos _x, _position] call A3A_fnc_arePositionsConnected}}}
};
if(_index != -1) exitWith
{
    0;
};

-1;
