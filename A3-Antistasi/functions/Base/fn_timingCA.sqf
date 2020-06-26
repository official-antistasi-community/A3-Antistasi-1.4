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
