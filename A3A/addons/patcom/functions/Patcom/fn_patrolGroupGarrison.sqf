/*
    Author: [Hazey]
    Description:
		Sends group directly to garrison positions

    Arguments:
        <Group> Group to run action on.
        <Array> Position you want group to look for garrison positions.
        <Number> How far you want to look for potential positions

    Return Value:
    	<Group> Returns group if not enough buildings or positions are found.

    Scope: Any
    Environment: Any
    Public: No

    Example: 
        private _garrisonGroups = [_group, getMarkerPos _markerX, _size] call A3A_fnc_patrolGroupGarrison;

    License: MIT License
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_position", "_radius"];

private _units = units _group;
private _buildings = [];
private _newGroups = [];

if (count _units == 0) exitwith {};

_group lockWP true;
_buildings = nearestObjects [_position, keys PATCOM_Garrison_Positions, _radius];

if (count _buildings == 0) then {
    _buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;
};

_buildings = _buildings call BIS_fnc_arrayShuffle;

{
    if (count _units == 0) exitWith {};
    private _building = _x;
    private _class = typeOf _building;
    private _buildingPositions = [];

    if (_class in PATCOM_Garrison_Positions) then {
        {
            private _buildingPos = _building buildingPos _x;
            if !(_buildingPos isEqualTo [0,0,0]) then {
                _buildingPositions pushBack _buildingPos;
            };
        } forEach (PATCOM_Garrison_Positions get _class);
    } else {
        _buildingPositions = _building buildingPos -1;
    };

    {
        if (count _units == 0) exitWith {};
        private _unit = _units select 0;
        private _position = _x;
        _unit setposATL _position;
        _unit setdir ((_unit getRelDir _building)-180);
        _unit disableAI "PATH";
        _unit setUnitPos "UP";

        dostop _unit;

        _units deleteAt 0;
    } foreach _buildingPositions;
} forEach _buildings;

// Splits Garrison AI into an additional defense group if not enough buildings/positions were found.
if (count _units > 0) then {
   private _groupSplit = createGroup (side _group);
   _newGroups pushBack _groupSplit;
   _units joinSilent _groupSplit;
   [_groupSplit, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
};
_newGroups