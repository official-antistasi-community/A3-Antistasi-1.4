/*  Find an empty spawn position on marker of a specific type

Environment: Any. Has network timing risks which should be mitigated using addTimeForIdle

Arguments:
    <STRING> Marker name to search
    <STRING> Type of spawn place to search, "vehicle", "mortar", "heli" or "plane"

Return Value:
    <ARRAY<
        <POSAGL> Central position of spawn place
        <NUMBER> Direction of spawn place 
        <ARRAY> Data to pass to freeSpawnPositions to free this spawn place
    >>
    or false if no empty spawn positions of that type were found
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_marker", "_type"];

// check marker lockout?

private _varName = format ["%1_%2", _marker, tolower _type];
private _varNameUsed = _varName + "_used";
private _used = spawner getVariable [_varNameUsed, []];
private _index = _used find false;
if (_index == -1) exitWith {
    Info_1("%1 has no remaining spawn positions of type %2", _marker, _type);
    false;
};

_used set [_index, true];
spawner setVariable [_varNameUsed, _used, true];
private _return = spawner getVariable (_varName + "_places") select _index;
_return pushBack [_varNameUsed, _index];

Debug_2("Used place with varname %1 and index %2", _varName, _index);
_return;
