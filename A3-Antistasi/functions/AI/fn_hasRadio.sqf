/*
Author: Håkon
Description:
    checks if unit should be considered as having a radio.

    this is the more general check over hasARadio, as this also returns true if the flag haveRadio is true,
    or if its IFA and the group has a unit of type SDKGL (dont know why GL here but...)

Arguments:
0. <Object> unit to consider

Return Value: <Bool> if we considere the unit as having a radio

Scope: Any
Environment: Any
Public: Yes
Dependencies:
Performance: varies depending on condition run, from instant, to around 0.02ms

Example: [_unit] call A3A_fnc_hasRadio;

License: MIT License
*/
params ["_unit"];

haveRadio
|| {_unit call A3A_fnc_hasARadio}
|| {A3A_hasIFA && {(units group _unit) findIf {(_x getVariable "unitType") in SDKGL} > -1}}
