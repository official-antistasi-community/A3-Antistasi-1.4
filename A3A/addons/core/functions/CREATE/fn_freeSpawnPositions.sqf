/*  Free an array of spawn positions (data returned by findSpawnPosition)

Environment: Any.

Arguments:
    <ARRAY<
        <STRING> Var name for spawn places
        <NUMBER> Index of spawn place
    >>
*/

#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

{
    if !(_x isEqualTypeArray ["", 0]) then {
        Error_1("Invalid data provided: %1", _x);
        continue;
    };
    _x params ["_varName", "_index"];
    private _used = spawner getVariable [_varName, []];
    if (count _used <= _index) then {
        Error_3("Invalid index %3 provided for varname %1", _varName, _index);
        continue;
    };
    _used set [_index, false];
    spawner setVariable [_varName, _used, true];
    Debug_2("Freed place with varname %1 and index %2", _varName, _index);
} forEach _this;
