/*
	Author: Genesis

	Description:
		Finds highest and lowest points in an area.

	Parameter(s):
		0: OBJECT - Center object
		1: NUMBER - Radius around object to search
		2 (Optional): NUMBER - Precision, recommended not setting lower than 5 (Default 50)
		3 (Optional): BOOLEAN - Sort output. true: ascending, false: descending (Default: true)

	Returns:
		ARRAY
	
	Example1: 
		_Test = [Object Center,radius,Precision (Recommended no lower than 5),false] call VCM_fnc_Heights;
		//player setposASL (_Test select 0 select 1); -> Highest point
		//player setposASL (_Test ((count _Test) - 1) select 1); -> Lowest Point
*/

params ["_obj","_range","_prec","_sort"];
if (isNil "_prec") then {private _prec = 50};
if (_prec < 1) then {_prec = 1};
if (isNil "_sort") then {private _sort = true};

private _rng = (_range/2);
private _array1 = [];
private _centerPos = (getpos _obj);
private _startingPos = [(_centerPos select 0) - _rng,(_centerPos select 1) - _rng,(_centerPos select 2)];
private _endingPos = [(_centerPos select 0) + _rng,(_centerPos select 1) + _rng,(_centerPos select 2)];
private _starterArray = [];
private _counter = 0;
private _limit = (round (_range/_prec));
while {_counter < _limit} do
{
	_starterArray pushback _startingPos;
	_startingPos = [(_startingPos select 0),(_startingPos select 1)+_prec,(_startingPos select 2)];
	_array1 pushback _startingPos;	
	_counter = _counter + 1;
};

{
	_markerPos = _x;
	_startingPos = [(_markerPos select 0)+_prec,(_markerPos select 1),(_markerPos select 2)];
	_counter = 0;
	while {_counter < _limit} do
	{
		_array1 pushback _startingPos;
		_startingPos = [(_startingPos select 0) + _prec,(_startingPos select 1),(_startingPos select 2)];	
		_counter = _counter + 1;		
	};
} foreach _starterArray;

private _finalArray = [];
{
	private _height = [(_x select 0),(_x select 1),(getTerrainHeightASL _x)];
	private _FinalPush = [(_height select 2),_height];
	_finalArray pushback _FinalPush;
} foreach _array1;

//False is the highest. True is the shortest.
_finalArray sort _sort;

_finalArray

