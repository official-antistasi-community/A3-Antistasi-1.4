
/*
	Author: Genesis

	Description:
		Finds closest object from an array of objects

	Parameter(s):
		0: ARRAY - Array to search for closest object
		1: OBJECT - Object to search away from
		2: (Optional): BOOLEAN - Defines order to sort array. True: Ascending, false, descending
		3: (Optional): ???

	Returns:
		OBJECT
*/

params ["_list","_object","_order","_script"];

if (isNil "_order") then {_order = true};
if (isNil "_script") then {_script = "Nil";};

private _position = [0,0,0];
if (isNil "_object" || {isNil "_list"}) exitWith {_closestObject = [0,0,0];_closestObject};

switch (TypeName _object) do 
{
    case "OBJECT": {_position = getPosATL _object;};
    case "STRING": {_position = getMarkerPos _object;}; 
    case "ARRAY": {_position = _object;}; 
    case "GROUP": {_position = (getPosATL (leader _object));}; 
};

private _distanceArray = [];
if (typeName _list isEqualTo "SCALAR") then {systemChat format ["_script: %1",_script];};
private _newObjectDistance = 0;
{
	if !(isNil "_x") then
	{
		_compareObjectPos = [0,0,0];
		switch (TypeName _x) do 
		{
				case "OBJECT": {_compareObjectPos = getPosATL _x;};
				case "STRING": {_compareObjectPos = getMarkerPos _x;}; 
				case "ARRAY": {_compareObjectPos = _x;}; 
				case "GROUP": {_compareObjectPos = (getPosATL (leader _x));}; 
		};
		_newObjectDistance = _compareObjectPos distance2D _position;
		_distanceArray pushback [_newObjectDistance,_x];
	};
} forEach _list;

_distanceArray sort _order;

private _closestObject = ((_distanceArray select 0) select 1);

if (isNil "_closestObject") then {_closestObject = [0,0,0];};
_closestObject