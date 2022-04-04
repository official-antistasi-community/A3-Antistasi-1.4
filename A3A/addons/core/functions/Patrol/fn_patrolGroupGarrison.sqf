#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_group", "_position", "_radius", "_moveInstantly"];

private _units = units _group;

if (count _units == 0) exitwith {};

if (isNil {_group getVariable "PATCOM_Garrison_buildings"}) then {
    _group setVariable ["PATCOM_Garrison_buildings", []];
};

private _garrisonedBuildings = _group getVariable ["PATCOM_Garrison_buildings", []];

if (!_moveInstantly) then {
    _group lockWP true;
};

private _buildings = [];
_buildings = nearestObjects [_position, keys PATCOM_Garrison_Positions, _radius];

if (count _buildings == 0) then {
    _buildings = [_position, floor(_radius/2)] call A3A_fnc_patrolEnterableBuildings;
};

{
    if (count _units == 0) exitWith {};

    private _building = _x;
    private _class = typeOf _building;
    private _buildingIsEmpty = true;
    {
        if ((_x getVariable ["PATCOM_Garrison_buildings", []]) find _building != -1) exitWith {
            _buildingIsEmpty = false;
        };
    } forEach A3A_Patrol_Controlled_AI;

	if (_buildingIsEmpty) then {
    	private _buildingPositions = [];
    	if ((keys PATCOM_Garrison_Positions) find _class != -1) then {
        	{
            	private _buildingPos = _building buildingPos (selectRandom _y);
            	if !(_buildingPos isEqualTo [0,0,0]) then {
            	    _buildingPositions pushBack _buildingPos;
            	};
        	} forEach PATCOM_Garrison_Positions;
    	} else {
            _buildingPositions = _building buildingPos -1;
    	};

    	{
 
    	} foreach _buildingPositions;
	};
} forEach _buildings;
