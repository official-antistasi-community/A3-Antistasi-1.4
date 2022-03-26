private _mainRunway = configFile >> "CfgWorlds" >> worldName;
private _otherRunways = "true" configClasses (_mainRunway >> "SecondaryAirports");
private _runways = [_mainRunway] + _otherRunways;

//Use sin and cos combined to determine angles based on quadrant
private _fnc_sinCosToDir = { 
	params ["_sinVal", "_cosVal"]; 

	//Sin +ve amd Cos +ve = First 0-90 
	//Sin +ve and Cos -ve = Second 90-180 
	//Both -ve = 180-270 
	//Sin -ve and Cos +ve = 270-360 

	//0-180, where acos works as expected 
	// We have to use a tiny negative here, because (sin 180) sucks and doesn't return 0. 
	// Worst case, we get a 0.1 degree margin of error.
	if (_sinVal >= -0.0001) exitWith { 
		acos _cosVal; 
	}; 

	//270-360, where asin works as expected 
	if (_cosVal >= 0) exitWith { 
		asin _sinVal; 
	}; 

	//180-270, where need to do some addition 
	0 - acos _cosVal; 
};

private _runwayIlsPositions = _runways apply {
	private _position = getArray (_x >> "ilsPosition");
	//Make sure we're grounded.
	_position set [2, 0.1];
	//Necessary because the map 'Enoch' has a damn typo in its IlsPosition, where one value is a string.
	_position apply {if (_x isEqualType "") then {parseNumber _x} else {_x}};
};
private _runwayTakeoffDirs = _runways apply {
	private _ilsDir = getArray (_x >> "ilsDirection");
	//Turn the weird sin/cos numbers into an actual compass bearing.
	([_ilsDir select 0, _ilsDir select 2] call _fnc_sinCosToDir) + 180;
};

//Return position, direction pairs.
private _return = [];
{
	_return pushBack [_x, _runwayTakeoffDirs select _forEachIndex];
} forEach _runwayIlsPositions;

_return;