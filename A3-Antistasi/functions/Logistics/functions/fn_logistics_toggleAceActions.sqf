/*
    Author: [Håkon]
    [Description]
        Toggles ace actions; Drag, Carry, and Load. on/off

    Arguments:
    0. <Object> Cargo to toggle ace actions on/off

    Return Value:
    <Nil>

    Scope: Any
    Environment: Any
    Public: [No]
    Dependencies:

    Example: [_cargo] call A3A_fnc_logistics_toggleAceActions;
*/
params ["_object"];

if (isNil "_object") exitWith {};

private _actions = _object getVariable ["LogisticsAceToggle", nil];
private _removeAction = false;
if (isNil "_actions") then {_removeAction = true};

if (_removeAction) then {
    //check if actions are on the object
    private _canDrag = _object getVariable ["ace_dragging_canDrag",false];
    private _canCarry = _object getVariable ["ace_dragging_canCarry",false];
    private _canLoad = getNumber (configFile >> "CfgVehicles" >> typeOf _object >> "ace_cargo_canLoad") isEqualTo 1;

    //save old actions
    _object setVariable ["LogisticsAceToggle", [_canDrag, _canCarry, _canLoad], true];

    //disable ACE dragging
    _object setVariable ["ace_dragging_canDrag",false, true];
    _object setVariable ["ace_dragging_canCarry",false, true];
    _object setvariable ["ace_cargo_canLoad",false, true];
} else {
    _actions params ["_canDrag","_canCarry","_canLoad"];

    //set actions to the state it was before load
    _object setVariable ["ace_dragging_canDrag",_canDrag, true];
    _object setVariable ["ace_dragging_canCarry",_canCarry, true];
    _object setvariable ["ace_cargo_canLoad",_canLoad, true];

    _object setVariable ["LogisticsAceToggle", nil, true];
};
