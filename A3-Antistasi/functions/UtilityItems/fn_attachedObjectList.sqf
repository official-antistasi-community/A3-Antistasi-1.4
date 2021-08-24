/*
    Author: [Håkon, Killerswin2]
    Description:
        Generic attachedObjects counter with standardised exceptions

        Exceptions:
        Null
        Source ("#particelSource" etc.)

    Arguments:
    0. <Object> Object to count attached objects off

    Return Value:
    <Array> a multiset of attached objects

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_object] call A3A_fnc_attachedObjectList;

    License: MIT License

	Notes: a multiset means that elements can be repeated in a set.
*/
params [["_object", objNull, [objNull]]];
private _listOfAttachedObjects = attachedObjects _object;

for "_i" from 0 to (count _listOfAttachedObjects) -1 do {
    if (isNull _x && {("#" in typeOf _x)}) then {
        _listOfAttachedObjects deleteAt _i;
    };
};

_listOfAttachedObjects;