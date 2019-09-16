private ["_veh","_sideX","_return","_totalSeats","_crewSeats","_cargoSeats","_countX"];
_veh = _this select 0;
_sideX = _this select 1;

_return = "";
_totalSeats = [_veh, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
_crewSeats = [_veh, false] call BIS_fnc_crewCount; // Number of crew seats only
_cargoSeats = _totalSeats - _crewSeats;

if (_cargoSeats <= 2) exitwith {diag_log format ["Error en cargoseats al intentar buscar para un %1",_veh];_return};
if ((_cargoSeats >= 2) and (_cargoSeats < 4)) then
	{
	switch (_sideX) do
		{
		case Occupants: {_return = groupsNATOSentry};
		case Invaders: {_return = groupsCSATSentry};
		};
	}
else
	{
	if ((_cargoSeats >= 4) and (_cargoSeats < 8)) then
		{
		switch (_sideX) do
			{
			case Occupants: {_return = selectRandom groupsNATOmid};
			case Invaders: {_return = selectRandom groupsCSATmid};
			};
		}
	else
		{
		switch (_sideX) do
			{
			case Occupants:
				{
				_return = selectRandom groupsNATOSquad;
				if (_cargoSeats > 8) then
					{
					_countX = _cargoSeats - (count _return);
					for "_i" from 1 to _countX do
						{
						if (random 10 < (tierWar + difficultyCoef)) then {_return pushBack NATOGrunt};
						};
					};
				};
			case Invaders:
				{
				_return = selectRandom groupsCSATSquad;
				if (_cargoSeats > 8) then
					{
					_countX = _cargoSeats - (count _return);
					for "_i" from 1 to _countX do
						{
						if (random 10 < (tierWar + difficultyCoef)) then {_return pushBack CSATGrunt};
						};
					};
				};
			};
		};
	};
_return