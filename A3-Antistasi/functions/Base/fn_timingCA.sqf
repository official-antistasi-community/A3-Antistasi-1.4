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
if (_timeToAdd < 0) exitWith {};

//Easy difficulty
if(skillMult == 1) then
{
    _timeToAdd = round (_timeToAdd * 1.5);
};
if(skillMult == 2) then
{
    _timeToAdd = round (_timeToAdd * 1.25);
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
