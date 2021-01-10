// Author: Antistasi Community
//
// Description:
// delete task _tsk and delete mission from missionsX
// _timeX - timeout for deleting task
//
// Returns:
// nothing
//
// How to use:
// [15, "outpostsFIA"] spawn A3A_fnc_deleteTask;

params [["_timeX", 0], "_tsk"];

if (isNil "_tsk") exitWith {};

if (_timeX > 0)
then { sleep ((_timeX / 2) + (random _timeX)); };

if (count missionsX > 0)
then
{
	missionsX deleteAt (missionsX findIf { _x # 0 == _tsk });
	publicVariable "missionsX";
};

[_tsk] call BIS_fnc_deleteTask;
