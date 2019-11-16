/****************************************************************
File: UPSMON_doparadrop.sqf
Author: Azroul13

Description:
	Eject the group from the helicopter. 

Parameter(s):
	<--- Vehicle which unload his cargo
	<--- Group disembarking
Returns:
	nothing
****************************************************************/

private["_transport","_grp","_unitsout","_grps"];				

_transport = _this select 0;
_unitsout = _this select 1;
_grp = _this select 2;

_transport setvariable ["UPSMON_disembarking",true];
_grp setvariable ["UPSMON_disembarking",true];


_grps = [];
_grps pushback _grp;

if (!alive _transport) exitwith{};	

{
	If (!(group _x in _grps)) then {_grps pushback (group _x)};
} foreach _unitsout;

{
	_x setvariable ["UPSMON_disembarking",true];
} foreach _grps;

//dogetout each of _jumpers
[_transport,_unitsout] call UPSMON_EjectUnits;

sleep 3;

[_transport] call UPSMON_Returnbase;

_timeout = 100 + time;
	
//Waits until all getout of heli
{
	waituntil {!canmove _x || !alive _x || movetofailed _x  || time > _timeout || isTouchingGround _x};
	_x switchMove "AmovPercMstpSrasWrflDnon";
} forEach _unitsout;


_transport setvariable ["UPSMON_disembarking",false];
{
	_x setvariable ["UPSMON_disembarking",false];
	If (_x getvariable ["UPSMON_InTransport",false]) then {_x setvariable ["UPSMON_InTransport",false]};
	If (_x getvariable ["UPSMON_Grpmission",""] == "WAITTRANSPORT") then {_x setvariable ["UPSMON_Grpmission","PATROL"]};
} foreach _grps;