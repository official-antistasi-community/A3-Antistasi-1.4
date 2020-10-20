params ["_vehicle", "_lock", "_seats"];

//toggle lock of the propper seats
_vehicle lockCargo false;
if !(isNil "_seats") then {//for vehicle loading cargo
	private _crew = crew _vehicle;
	private _crewCargoIndex = _crew apply {_vehicle getCargoIndex _x};

	private _seatsToLock = _vehicle getVariable ["Logistics_occupiedSeats", []];
	if (_lock) then {
		_seatsToLock append _seats
	} else {
		_seatsToLock = _seatsToLock - _seats;
	};
	_vehicle setVariable ["Logistics_occupiedSeats", _seatsToLock, true];

	{
		if (_x in _crewCargoIndex) then {
			moveOut (_crew # (_crewCargoIndex find _x)); //incase someone got into the seat before it is locked in the loading process
		};
		_vehicle lockCargo [_x, true];
	} forEach _seatsToLock;
} else {//for cargo, lock it fully and kick out any crew
	if (_vehicle isKindOf "StaticWeapon") exitWith {}; // dont lock statics, cang get out otherwise
	_vehicle lock _lock;
	if (_lock) then {{moveOut _x}forEach crew _vehicle};
};
