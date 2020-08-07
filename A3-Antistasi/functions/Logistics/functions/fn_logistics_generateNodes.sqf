/*
	Function: Generates a set of nodeArrays from start and end point of the cargo plane

	Arguments: [Start, End, Center]
		Start:  Relative position array
		End:    Relative position array
		Center: (optional default false) center points on cargo plane

	Return: Array or node arrays (note locked seats array alwayts empty and needs to be filled manualy)
*/


params ["_start", "_end", ["_center", false]];

//validate input
if ((isNil "_start") or (isNil "_end")) exitWith {"Both start and end position has to be defined"};
if !((_start isEqualType []) or (_end isEqualType [])) exitWith {"Both start and end needs to be 'position relative' arrays"};
if !(((count _start) isEqualTo 3) or ((count _end) isEqualTo 3)) exitWith {"Both start and end requires 3 elements"};


private _diameter = -0.8;
private _radius = (_diameter/2);// get some distance from walls
private _plane = _start vectorDiff _end;

private _nodeArray = [];
_lastNode = { _nodeArray select ((count _nodeArray)-1)};

private _node = _start vectorAdd [0,_radius,0];//first point
while {(-_radius) < (_plane#1)} do {
	_plane = _plane vectorAdd [0,_diameter,0];
    _nodeArray pushBack _node;
    _node = _node vectorAdd [0,_diameter,0];
};

if (_nodeArray isEqualTo []) exitWith {"No nodes generated"};

if (_center) then {
	_node = call _lastNode;
	private _remainder = _end vectorDiff _node;
	_remainder set [1, (_remainder#1)/2]; //half to get adjustment

	private _adjustedArray = [];
	{
		_element = _x vectorAdd _remainder;
		_adjustedArray pushBack _element;
	} forEach _nodeArray;

	_nodeArray = _adjustedArray;
};

//fix nodeArray with rest of information
private _newArray = [];
{
	_newArray pushBack [1, _x, []];
} forEach _nodeArray;
_nodeArray = _newArray;

_nodeArray;