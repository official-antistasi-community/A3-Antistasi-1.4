#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
params ["_targetPos", "_radius", "_side"];

//ServerDebug_1("Radius: %1", _radius);

private _result = false;
{	
	//ServerDebug_1("Group: %1", _x);
	If (_x == grpNull) exitWith {};

	if (alive (leader _x)) then {
		//ServerDebug_2("Target Distance %1 | Group: %2", ((leader _x) distance _targetPos), _x);
		if (((leader _x) distance2D _targetPos) < _radius) exitwith {
			//ServerDebug_1("TRUE group: %1", _x);
			_result = true; 
			_result
		};
	};
} foreach (allGroups select {side _x == _side});

_result