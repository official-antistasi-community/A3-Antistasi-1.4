/*
    Author: [Hazey]

    Description:
		Converts 32bit Floats longer than 6 digits to string.

    Arguments:
    	<Number> Number you want converted

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		_number call A3A_fnc_intToString;
		
    License: MIT License

	Notes:
		If the int is 7 digits or less long, string representation of it will be the exact number, above 7 digits, some rounding must occur.

*/
params ["_int"];

private _string = "";

while {_int >= 10} do {
	_int = _int / 10;
	_string = format ["%1%2", round ((_int % floor _int) * 10), _string];
	_int = floor _int;
};

format ["%1%2", _int, _string];