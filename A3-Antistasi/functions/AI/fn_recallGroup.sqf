private _groupX = _this;
private _array = if (_groupX isEqualType grpNull) then {((units _groupX) - [_groupX getVariable ["mortarX",objNull]])} else {[_groupX]};
{
_x forceSpeed -1;
_x setVariable ["maneuvering",false];
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
(group (_array select 0)) setVariable ["occupiedX",[]];