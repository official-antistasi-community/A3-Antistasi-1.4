/*
Maintainer: Wurzel0701
    Adds a given amount of aggression to the given side

Arguments:
    <SIDE> The side for which the aggro should be added
    <NUMBER> The amount of aggro to add
    <NUMBER> The amount of minutes the aggro should stay

Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> gameMode
    <SIDE> Occupants
    <ARRAY> aggressionStackOccupants
    <SIDE> Invaders
    <ARRAY> aggressionStackInvaders

Example:
[Occupants, 50, 15] call A3A_fnc_addAggression;
*/

params
[
    ["_side", sideUnknown, [sideUnknown]],
    ["_aggroChange", 0, [0]],
    ["_aggroTime", 0, [0]]
];

_fn_convertMinutesToDecayRate =
{
    params ["_points", "_minutes"];
    if(_minutes == 0) then
    {
        [1, "Minute parameter is 0, assuming 1", "addAggression"] call A3A_fnc_log;
        _minutes = 1;
    };
    private _decayRate = (-1) * (_points / _minutes);
    _decayRate;
};

if(_aggroChange == 0) exitWith
{
    [1, format ["Tried to a 0 aggression change, parameter where %1", _this], "addAggression"] call A3A_fnc_log;
};

//Wait until all other aggro change operations are done
waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;

private _decayRate = [_aggroChange, _aggroTime] call _fn_convertMinutesToDecayRate;

if(gameMode != 4 && (_side == Occupants)) then
{
    aggressionStackOccupants pushBack [_aggroChange, _decayRate];
};

if(gameMode != 3 && (_side == Invaders)) then
{
    aggressionStackInvaders pushBack [_aggroChange, _decayRate];
};

[] call A3A_fnc_calculateAggression;
prestigeIsChanging = false;
