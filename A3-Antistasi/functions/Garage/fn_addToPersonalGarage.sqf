params ["_unit", "_vehicleType", ["_amount", 1]];

private _personalGarage = _unit getVariable ["personalGarage", []];

while {_amount > 0} do {
	_personalGarage pushBack _vehicleType;
	_amount = _amount - 1;
};

if (_amount < 0) then {
	private _personalGaragePruned = [];

	{
		if (_x != _vehicleType ||	_amount >= 0) then {
			_personalGaragePruned pushBack _vehicleType;
		} else {
			_amount = _amount + 1;
		};
	} forEach _personalGarage;
	
	_personalGarage = _personalGaragePruned;
};


_unit setVariable ["personalGarage", _personalGarage, true];