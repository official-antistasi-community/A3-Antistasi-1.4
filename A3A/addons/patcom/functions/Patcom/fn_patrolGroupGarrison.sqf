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
private _minimumUnits = 2; // Minimum units per building.

if (count _units == 0) exitwith {};

_group lockWP true;
_buildings = [_position, _radius] call A3A_fnc_patrolEnterableBuildings;

if (count _buildings == 0) exitWith {
    Error_1("PATCOM | No Valid Garrison buildings found near group: %1 | Defaulting to Defend.", _group);
    [_group, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
    _group
};

// Don't place units in destroyed buildings
_buildings = _buildings select { damage _x < 1 && !isObjectHidden _x };
_buildings = _buildings call BIS_fnc_arrayShuffle;

// Figure out how many units should be put in each building.
private _unitsPerBuilding = ceil(count _units / count _buildings);
if (_unitsPerBuilding < _minimumUnits) then {_unitsPerBuilding = _minimumUnits};

{
    if (count _units == 0) exitWith {};
    private _building = _x;
    private _class = typeOf _building;
    private _buildingPositions = [];
    private _staticsNear = (getPosATL _building) nearEntities ["StaticWeapon", round (sizeOf _class)];

    // Continue if statics are close to the building. 
    // We don't want garrison units clipping into their positions.
    if (count _staticsNear > 0) then {continue};

    // Check to see if building is in whitelist first for better unit positions.
    if (_class in PATCOM_Garrison_Positions_Whitelist) then {
        {
            private _buildingPos = _building buildingPos _x;
            if !(_buildingPos isEqualTo [0,0,0]) then {
                _buildingPositions pushBack _buildingPos;
            } else {
                Error_1("PATCOM | Bad building position found | Class: %1", _class);
            };
        } forEach (PATCOM_Garrison_Positions_Whitelist get _class);
    } else {
        // If no pre-defined building positions are found. We default to a random one.
        _buildingPositions = _building buildingPos -1;
    };

    // Mix up the building positions for better randomization.
    _buildingPositions = _buildingPositions call BIS_fnc_arrayShuffle;

    // Evenly distribute units between found amount of buildings.
    // Note: If more buildings are found than units, loop will exit when the unit pool reaches zero.
    for "_i" from 1 to _unitsPerBuilding do {
        if ((count _units == 0) || (count _buildingPositions == 0)) exitWith {};
        private _unit = _units deleteAt 0;
        private _position = _buildingPositions deleteAt 0;
        _unit setposATL _position;
        _unit setdir ((_unit getRelDir _building)-180);
        _unit setUnitPos "UP";
        dostop _unit;
    };
} forEach _buildings;

// Splits Garrison AI into additional defense groups if not enough buildings/positions were found.
if (count _units > 0) then {
   private _groupSplit = createGroup (side _group);
   _newGroups pushBack _groupSplit;
   _units joinSilent _groupSplit;
   [_groupSplit, "Patrol_Defend", 0, 100, -1, true, _position, false] call A3A_fnc_patrolLoop;
};
_newGroups