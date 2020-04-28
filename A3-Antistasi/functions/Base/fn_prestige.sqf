params ["_occupantsChanged","_invadersChanged"];

/*  Adds a new aggro spike to the current stack

    Execution on: Server

    Scope: External

    Params:
        _occupantsChanged: ARRAY : [change, time in minutes]
        _invadersChanged: ARRAY : [change, time in minutes]

    Returns:
        Nothing
*/

_fn_convertMinutesToDecayRate =
{
    params ["_points", "_minutes"];
    if(_minutes == 0) then
    {
        [1, "Minute parameter is 0, assuming 1", "prestige"] call A3A_fnc_log;
        _minutes = 1;
    };
    private _decayRate = (-1) * (_points / _minutes);
    _decayRate;
};

//Wait until all other aggro change operations are done
waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;

if(gameMode != 4 && ((_occupantsChanged select 0) != 0)) then
{
    private _decayRate = _occupantsChanged call _fn_convertMinutesToDecayRate;
    aggressionStackOccupants pushBack [_occupantsChanged select 0, _decayRate];
};

if(gameMode != 3 && ((_invadersChanged select 0) != 0)) then
{
    private _decayRate = _invadersChanged call _fn_convertMinutesToDecayRate;
    aggressionStackInvaders pushBack [_invadersChanged select 0, _decayRate];
};

[] call A3A_fnc_calculateAggression;
prestigeIsChanging = false;
