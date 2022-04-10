/*
    Author: [Spoffy]

    Description:
		Check if side is enemy.

    Arguments:
		<Side> Side who wants to know.
		<Side> Side you want to see is an enemy

    Return Value:
		<Number> Decimal value between 0.0 to 1.0

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_unitSide, _otherSide] call A3A_fnc_patrolSideIsEnemy;
		
    License: MIT License
*/

params ["_side1", "_side2"];

private _sides = [east, west, independent, civilian, sideUnknown, sideEnemy, sideFriendly, sideLogic, sideEmpty, sideAmbientLife];

private _friendshipConst = 0.6;

private _index = _sides find _side2;

if (_index isEqualTo 6) exitWith {false};

if (_index isEqualTo 5) exitWith {true};

if (_index < 0 || _index >= 4) exitWith {false};

_side1 getFriend _side2 < _friendshipConst;