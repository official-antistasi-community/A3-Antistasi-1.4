/*
Author: Caleb Serafin
    Recursively deletes nested child objects.
    Can delete self-referencing trees.
    Trying to do this by hand may cause memory leaks.
    NB: It will not remove the reference to the parent, it will hold locationNull.

Arguments:
    <VARSPACE/OBJECT> Parent variable space
    <BOOLEAN> Full object purge? Will delete objects as well. [DEFAULT=true]

Return Value:
    <BOOLEAN> true if success; false if access denied; nil if crashed;

Scope: Local, Interacts with many objects. Should not be networked.
Environment: Scheduled, Recommended as it recurses over entire sub-tree. Could be resource heavy.
Public: Yes

Example:
    [[missionNamespace, "A3A_UIDPlayers", "1234567890123456", "equipment", "weapon", "SMG_02_F"] call Col_fnc_nestLoc_set, "helmet", "H_Hat_grey"] call Col_fnc_nestLoc_set;
        // missionNamespace > "A3A_UIDPlayers" > "1234567890123456" > "equipment" > [multiple end values]
    _parent = [missionNamespace, "A3A_UIDPlayers", locationNull] call Col_fnc_nestLoc_get; // returns a <location> that's referenced by "A3A_UIDPlayers" in missionNamespace;
    [_parent] call Col_fnc_nestLoc_rem;
        // missionNamespace > "A3A_UIDPlayers" will have value locationNull.

    // Recursive (NB: There are not many good reasons to have self-referencing trees. However, if you wanted to delete the entire tree by deleting any sub node, this "practice" will achieve that.)
    _parent = [missionNamespace, "A3A_parent",nil,nil] call Col_fnc_nestLoc_set;
    [missionNamespace, "A3A_parent", "recursion", _parent] call Col_fnc_nestLoc_set;
        // missionNamespace > "A3A_parent" > "recursion"(A3A_parent) > "recursion"(A3A_parent) > "recursion"(A3A_parent) > "recursion"(A3A_parent) > ...
    [_parent] call Col_fnc_nestLoc_rem;
        // missionNamespace > "A3A_parent" will have value locationNull
*/
params [["_parent",locationNull],["_purge",true]];
private _filename = "Collections\fn_remNestedObject.sqf";

if (_parent isEqualType missionNamespace || {isNull _parent}) exitWith {false}; // Deleting all Namespace contents will cause great trouble.
private _childrenNames = allVariables _parent;
private _childrenLocations = [];
private _childrenObjects = [];
private _item = false;
{
    _item = _parent getVariable [_x, false];
    if (_item isEqualType locationNull) then {
        _childrenLocations pushBack _item;
    } else {if (_purge && {_item isEqualType objNull}) then {
        _childrenObjects pushBack _item;
    };};
} forEach _childrenNames;
_childrenNames = nil;  // clear redundant names-list memory before recursing.
deleteLocation _parent;  // Deleting the parent before recursing prevents infinite loop from self-referencing trees.
{
    deleteVehicle _x;
} forEach _childrenObjects;
{
    [_x,_purge] call Col_fnc_nestLoc_rem;
} forEach _childrenLocations;
true;
