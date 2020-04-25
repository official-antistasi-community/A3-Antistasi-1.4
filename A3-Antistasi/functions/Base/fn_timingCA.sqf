/*  Adds a random amount of the given one to the attack counter (Why tho?)
*/

params ["_timeToAdd"];

if (isNil "_timeToAdd") exitWith {};
if !(_timeToAdd isEqualType 0) exitWith {};

private _mayor = if (_timeToAdd >= 3600) then {true} else {false};
_timeToAdd = _timeToAdd - (((tierWar + difficultyCoef) - 1) * 400);

if (_timeToAdd < 0) exitWith {};

attackCountdown = attackCountdown + round (random _timeToAdd);
if (_mayor and (attackCountdown < 1200)) then {attackCountdown = 1200};
publicVariable "attackCountdown";
