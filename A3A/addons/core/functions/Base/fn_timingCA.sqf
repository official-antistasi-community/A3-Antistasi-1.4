/*  Adds a random amount of the given one to the attack counter (Why tho?)

    Execution on: Server

    Scope: External

    Params:
        _timeToAdd: NUMBER : The amount of seconds to add
        _side: SIDE : To which side will the amount be added

    Returns:
        Nothing
*/

params ["_timeToAdd", "_side"];

// Function is obsolete but still used by mission rewards
// for now, fudge some effect on attack/defence resources

if (_timeToAdd < 0) exitWith {};
[-_timeToAdd/10, _side, "defence"] call A3A_fnc_addResources;
[-_timeToAdd/10, _side, "attack"] call A3A_fnc_addResources;
if (true) exitWith {};

/*
if (isNil "_timeToAdd") exitWith {};
if !(_timeToAdd isEqualType 0) exitWith {};

if (_timeToAdd < 0) then
{
    //Easy difficulty
    if(skillMult == 1) then
    {
        _timeToAdd = round (_timeToAdd * 0.75);
    };
    //Hard difficulty
    if(skillMult == 3) then
    {
        _timeToAdd = round (_timeToAdd * 1.25);
    };
}
else
{
    //Easy difficulty
    if(skillMult == 1) then
    {
        _timeToAdd = round (_timeToAdd * 1.25);
    };
    //Hard difficulty
    if(skillMult == 3) then
    {
        _timeToAdd = round (_timeToAdd * 0.75);
    };
};

if(_side == Occupants) then
{
    attackCountdownOccupants = attackCountdownOccupants + _timeToAdd;
    publicVariable "attackCountdownOccupants";
};

if(_side == Invaders) then
{
    attackCountdownInvaders = attackCountdownInvaders + _timeToAdd;
    publicVariable "attackCountdownInvaders";
};
*/