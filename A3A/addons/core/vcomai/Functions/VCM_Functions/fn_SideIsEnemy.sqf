/** 
	A version of BI's sideIsEnemy, without the massive performance overhead.
**/

params ["_center", "_side"];

private _sides = [east, west, independent, civilian, sideUnknown, sideEnemy, sideFriendly, sideLogic, sideEmpty, sideAmbientLife];
private _friendshipConst = 0.6;

private _index = _sides find _side;

if (_index isEqualTo 6) exitWith {false};
if (_index isEqualTo 5) exitWith {true};

if (_index < 0 || _index >= 4) exitWith {false};

_center getFriend _side < _friendshipConst;