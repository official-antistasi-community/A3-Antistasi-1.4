/*
Maintainer: Wurzel0701
    Checks if the HQ can currently be moved

Arguments:
    <NIL>

Return Value:
    <ARRAY> If the HQ can be moved right now, first element bool, every other afterwards string, at least 2 elements

Scope: Local
Environment: Any
Public: Yes
Dependencies:
    <OBJECT> theBoss
    <OBJECT> boxX
    <OBJECT> petros

Example:
[] call A3A_fnc_canMoveHQ;
*/

private _result = [false];
private _titleStr = localize "STR_A3A_fn_base_canmovehq_title";

if (player != theBoss) then
{
    [_titleStr, localize "STR_A3A_fn_base_canmovehq_no_comm"] call A3A_fnc_customHint;
    _result pushBack "Commander only";// localize "STR_A3A_fn_base_canmovehq_comm_only"
};

if ((count weaponCargo boxX >0) or (count magazineCargo boxX >0) or (count itemCargo boxX >0) or (count backpackCargo boxX >0)) then
{
    if(count _result == 1) then
    {
        [_titleStr, localize "STR_A3A_fn_base_canmovehq_no_empty1"] call A3A_fnc_customHint;
    };
    _result pushBack "Arsenal inventory must be empty";// localize "STR_A3A_fn_base_canmovehq_no_empty2"
};

if !(isNull attachedTo petros) then
{
    if(count _result == 1) then
    {
        [_titleStr, localize "STR_A3A_fn_base_canmovehq_petros_down"] call A3A_fnc_customHint;
    };
    _result pushBack "Petros currently picked up";// localize "STR_A3A_fn_base_canmovehq_petros_pickedup"
};

if(count _result != 1) exitWith
{
    _result;
};

[true, ""];
