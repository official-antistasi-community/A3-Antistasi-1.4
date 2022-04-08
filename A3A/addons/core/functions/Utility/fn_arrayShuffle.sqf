/*
    Author: [Hazey]
    Description:
		BIS Array Shuffle but with a definable count to increase shuffle.

    Arguments:
    	<Array> Array to shuffle
		<Number> Number of times to shuffle.
			0 - Will default to array count.

    Return Value:
    	<Array> Shuffled Array

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		[_array, 100] call A3A_fnc_patrolLoop;

    License: MIT License
*/

params ["_array", ["_count", 0]]; 

private _countX = count _array;

if (_count == 0) then {_count = _countX;};

for "_i" from 1 to _count do { 
	_array pushBack (_array deleteAt floor random _countX); 
};

_array
