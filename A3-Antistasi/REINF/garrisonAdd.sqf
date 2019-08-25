private ["_REBELhr","_REBELmoney","_UNITtype","_UNITcost","_garrison","_garrison","_posGARR","_unit","_groupX","_veh","_pos"];

_REBELhr = server getVariable "hr";

if (_REBELhr < 1) exitWith {hint "You lack of HR to make a new recruitment"};

_REBELmoney = server getVariable "resourcesFIA";

_UNITtype = _this select 0;

_UNITcost = 0;

if (_UNITtype isEqualType "") then
	{
	_UNITcost = server getVariable _UNITtype;
	_UNITcost = _UNITcost + ([REBELmortar] call A3A_fnc_vehiclePrice);
	}
else
	{
	_UNITtype = if (random 20 <= skillFIA) then {_UNITtype select 1} else {_UNITtype select 0};  // Chance to be a military unit instead of guerilla
	_UNITcost = server getVariable _UNITtype;
	};

if (_UNITcost > _REBELmoney) exitWith {hint format ["You do not have enough money for this kind of unit (%1 € needed)",_UNITcost]};

_garrison = REBELgarrisonREINF;

if ((_UNITtype == REBELstaticCREW) and (_garrison in outpostsFIA)) exitWith {hint "You cannot add mortars to a Roadblock garrison"};

_posGARR = getMarkerPos _garrison;

if (surfaceIsWater _posGARR) exitWith {hint "This Garrison is still updating, please try again in a few seconds"};

if ([_posGARR,500] call A3A_fnc_enemyNearCheck) exitWith {Hint "You cannot Recruit Garrison Units with enemies near the zone"};
_nul = [-1,-_UNITcost] remoteExec ["A3A_fnc_REBELmoney",2];

_countX = count (garrison getVariable _garrison);
[_UNITtype,teamPlayer,_garrison,1] remoteExec ["A3A_fnc_garrisonUpdate",2];
waitUntil {(_countX < count (garrison getVariable _garrison)) or (sidesX getVariable [_garrison,sideUnknown] != teamPlayer)};

if (sidesX getVariable [_garrison,sideUnknown] == teamPlayer) then
	{
	hint format ["Soldier recruited.%1",[_garrison] call A3A_fnc_garrisonInfo];

	if (spawner getVariable _garrison != 2) then
		{
		[_garrison,_UNITtype] remoteExec ["A3A_fnc_createREBELgarrisonTEMP",2];
		};
	};

