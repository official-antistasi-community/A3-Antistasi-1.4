/*
Author: Wurzel0701
    Returns the index of the nearest nav node to a given position

Arguments:
    <POSITION> The start position from which should be searched

Return Value:
    <NUMBER> Index of the nearest nav node (-1 if none found)

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> navGrid

Example:
    [getPos player] call A3A_fnc_getNearestNavPoint;
*/

params
[
    ["_pos", [-1,-1,-1], [[]]]
];

private _fileName = "getNearestNavPoint";

if(isNil "roadDataDone") exitWith
{
	[1, "Road database not loaded yet, cannot get nodes", _fileName] call A3A_fnc_log;
	-1;
};

private _mainMarker = format ["%1/%2", floor ((_pos#0)/1000), floor ((_pos#1)/1000)];
private _navPoints =  missionNamespace getVariable [(format ["%1_navData", _mainMarker]), []];

private _currentNearest = -1;
private _currentDistance = 0;

{
    private _data = navGrid select _x;
    private _navPos = _data select 0;

    private _distance = _navPos distance _pos;
    if((_distance <= 300) && ((_currentNearest == -1) || {_currentDistance > _distance})) then
    {
        _currentNearest = _x;
        _currentDistance = _distance;
    };
} forEach _navPoints;

_currentNearest;
