/*
    Author: [Håkon]
    Description:
        Generic attachedObjects counter with standardised exceptions

        Exceptions:
        Null
        Source ("#particelSource" etc.)

    Arguments:
    0. <Object> Object to count attached objects off

    Return Value:
    <Int> Number of attached object

    Scope: Any
    Environment: Any
    Public: Yes
    Dependencies:

    Example: [_object] call A3A_fnc_countAttachedObjects;

    License: MIT License
*/
params [["_object", objNull, [objNull]]];
{
    !isNull _x
    && {!("#" in typeOf _x)} //example "#particleSource"
} count attachedObjects _object;
