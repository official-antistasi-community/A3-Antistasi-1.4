params ["_group"];

_group = _group call A3A_fnc_getObjectGroup;

// Don't create waypoints on each machine.
if !(local _group) exitWith {};

// Get nearestBuilding around group leader to search.
private _buildings = nearestObjects [leader _group, ["House", "Building"], 50];

// Exit if no buildings are found around group leader.
if (count _buildings == 0) exitwith {};

// Get random building inside the building array.
private _building = selectRandom _buildings;

// Exit if for some reason the group leader is further than 250m of the building.
if ((leader _group) distance _building > 250) exitwith {};

[_group, _building] spawn {
    params ["_group", "_building"];
    private _leader = leader _group;

    // Add a waypoint to regroup after the search
    _group lockWP true;
    private _wp = _group addWaypoint [getPosASL _leader, -1, currentWaypoint _group];
    private _cond = "({unitReady _x || !(alive _x)} count thisList) == count thisList";
    private _comp = format ["this setFormation '%1'; this setBehaviour '%2'; deleteWaypoint [group this, currentWaypoint (group this)];", formation _group, behaviour _leader];
    _wp setWaypointStatements [_cond, _comp];

    // Prepare group to search
    _group setBehaviour "AWARE";
    _group setFormDir ([_leader, _building] call BIS_fnc_dirTo);

    // Leader will only wait outside if group larger than 5
    if (count (units _group) <= 5) then {
        _leader = objNull;
    };

    // Search while there are still available positions
    private _positions = _building buildingPos -1;
    while {_positions isNotEqualTo []} do {

        // Update units in case of death
        private _units = (units _group) - [_leader];

        // Abort search if the group has no units left
        if (_units isEqualTo []) exitWith {};

        // Send all available units to the next available position
        {
            if (_positions isEqualTo []) exitWith {};
            if (unitReady _x) then {
                private _pos = _positions deleteAt 0;
                _x commandMove _pos;
                sleep 5;
            };
        } forEach _units;
    };
    _group lockWP false;

    // A bit of hacky code to tell units to move to the next waypoint after it completes.
    // If current waypoint is not advanced +1 the group will bounce back to the initial waypoint and call search again.
	_index = currentWaypoint _group;
	_group setCurrentWaypoint [_group, _index + 1];
};