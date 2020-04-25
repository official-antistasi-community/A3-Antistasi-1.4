params ["_occupantsChanged","_invadersChanged"];

/*  Adds a new aggro spike to the current stack

    Execution on: Server

    Scope: External

    Params:
        _occupantsChanged: NUMBER : The amount the aggro is gonna change for occupants
        _invadersChanged: NUMBER : The amount the aggro is gonna change for invaders

    Returns:
        Nothing
*/

//Wait until all other aggro change operations are done
waitUntil {!prestigeIsChanging};
prestigeIsChanging = true;

//Negating effect for vs Gov or vs Inv only modes
if(gameMode == 4) then {_occupantsChanged = 0;};
if(gameMode == 3) then {_invadersChanged = 0;};

if(_occupantsChanged != 0) then
{
    //The current formula is not that punishing, for really punishing results use
    // ((0.4/(100000000)) * (aggro - 100) * (aggro - 100) * (aggro - 100) * (aggro - 100)) + 0.1
    private _decayRate = ((1/25000) * (aggressionOccupants - 100) * (aggressionOccupants - 100)) + 0.1;
    //Round to four digit behind the point
    _decayRate = (round (10000 * _decayRate)) / 10000;
    if (_occupantsChanged > 0) then {_decayRate = _decayRate * -1};
    aggressionStackOccupants pushBack [_occupantsChanged, _decayRate];
};

if(_invadersChanged != 0) then
{
    //The current formula is not that punishing, for really punishing results use
    // ((0.4/(100000000)) * (aggro - 100) * (aggro - 100) * (aggro - 100) * (aggro - 100)) + 0.1
    private _decayRate = ((1/25000) * (aggressionInvaders - 100) * (aggressionInvaders - 100)) + 0.1;
    //Round to four digit behind the point
    _decayRate = (round (10000 * _decayRate)) / 10000;
    if (_invadersChanged > 0) then {_decayRate = _decayRate * -1};
    aggressionStackInvaders pushBack [_invadersChanged, _decayRate];
};

[] call A3A_fnc_calculateAggression;
prestigeIsChanging = false;
