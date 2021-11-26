/*
    Author: [Håkon, Killerswin2]
    Description:
        AttachedObjects filtered list of attached objects with standardised exceptions

        Exceptions:
        Null
        Source ("#particelSource" etc.)

    Arguments:
    0. <Object> Object to count attached objects off

    Return Value:
    <Array> a set of attached objects

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_object] call A3A_fnc_attachedObjectList;

    License: MIT License

*/
params [["_object", objNull, [objNull]]];
attachedObjects _object select {
    !isNull _x
    && {!("#" in typeOf _x)} //example "#particleSource"
};