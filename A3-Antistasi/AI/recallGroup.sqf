private _grupo = _this;
private _array = if (_grupo isEqualType grpNull) then {((units _grupo) - [_grupo getVariable ["mortero",objNull]])} else {[_grupo]};
{
_x forceSpeed -1;
_x setVariable ["maniobrando",false];
if (_x == leader _x) then
	{
	_wp = currentWaypoint group _x;
	_dest = waypointPosition [group _x,_wp];
	_x doMove _dest;
	}
else
	{
	_x doFollow leader _x;
	};
} forEach _array;
(group (_array select 0)) setVariable ["ocupadas",[]];