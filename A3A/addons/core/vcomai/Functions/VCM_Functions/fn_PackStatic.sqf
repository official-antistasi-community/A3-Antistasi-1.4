
/*
	Author: Genesis

	Description:
		This function will constantly monitor the unit and see if the static weapon needs to be dissassembled or not. 
		The amount of time on a static will be a base variable with additional time every time an enemy is spotted.

	Parameter(s):
		0: OBJECT - Gunner
		1: STRING - Backpack classname
		2: OBJECT - Static weapon

	Returns:
		NOTHING
*/

params ["_unit","_backpack","_staticCreated"];

sleep 10;

private _staticGreen = true;
private _statictime = 180;

while {_staticGreen && {alive _unit} && {alive _staticCreated} && {!(isNull (gunner _staticCreated))}} do
{
	sleep 5;
	private _enemy = _unit findNearestEnemy _unit;
	if (!(isNull _enemy)) then 
	{
			private _cansee = [_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _enemy];
			if (_cansee > 0) then {_statictime = _statictime + 3;} else {_statictime = _statictime - 5;};
	}
	else
	{
		_statictime = _statictime - 5;
	};
	if (_statictime < 1) then {_staticGreen = false;};
};

//Okay, time to move!
if (alive _unit) then
{
	_unit leaveVehicle _staticCreated;
	[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
	sleep 3;
	deleteVehicle _staticCreated;
	sleep 1;
	_unit addBackpackGlobal _backpack;
};