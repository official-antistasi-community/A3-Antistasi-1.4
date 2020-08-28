private _filename = "fn_cargoSeats";
params ["_veh", "_sideX"];

private _isMilitia = _veh in [vehFIAArmedCar, vehFIATruck, vehFIACar];

private _totalSeats = [_veh, true] call BIS_fnc_crewCount; // Number of total seats: crew + non-FFV cargo/passengers + FFV cargo/passengers
private _crewSeats = [_veh, false] call BIS_fnc_crewCount; // Number of crew seats only
private _cargoSeats = _totalSeats - _crewSeats;
if (_veh == vehPoliceCar) then { _cargoSeats = 4 min _cargoSeats };

if (_cargoSeats < 2) exitwith { [1, format ["Cargoseats misused for vehicle %1", _veh], _filename]; [] };

if (_cargoSeats < 4) exitWith
{
	if (_isMilitia) exitWith { selectRandom groupsFIASmall };
	if (_veh == vehPoliceCar) exitWith { [policeOfficer, policeGrunt] };
	if (_sideX == Occupants) then { groupsNATOSentry } else { groupsCSATSentry };
};

if (_cargoSeats < 7) exitWith			// fudge for Warrior
{
	if (_isMilitia) exitWith { selectRandom groupsFIAMid };
	if (_veh == vehPoliceCar) exitWith { [policeOfficer, policeGrunt, policeGrunt, policeGrunt] };
	if (_sideX == Occupants) then { selectRandom groupsNATOmid } else { selectRandom groupsCSATmid };
};

private _squad = call {
	if (_isMilitia) exitWith { selectRandom groupsFIASquad };
	if (_sideX == Occupants) then { selectRandom groupsNATOSquad } else {selectRandom groupsCSATSquad };
};
if (_cargoSeats == 7) then { _squad deleteAt 7 };
_squad;
