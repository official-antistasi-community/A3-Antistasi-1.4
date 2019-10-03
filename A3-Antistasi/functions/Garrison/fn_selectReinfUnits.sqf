params ["_base", "_target", ["_isAir", false], ["_bypass", false]];

/*  Selects the units to send, given on the targets reinf needs (and what the base has (not yet))
*   Params:
*     _base : STRING : The name of the origin base
*     _target : STRING : The name of the destination
*     _isAir : BOOLEAN : UNUSED
*
*   Returns:
*     _unitsSend : ARRAY : The units in the correct format
*/

private ["_maxUnitSend", "_unitsSend", "_reinf", "_side", "_currentSelected", "_seatCount", "_vehicle", "_allSeats", "_crewSeats", "_neededSpace", "_crewMember", "_crew", "_cargo", "_openSpace", "_abort", "_data", "_dataCrew", "_dataCargo", "_vehicleIsNeeded"];

_maxUnitSend = garrison getVariable [format ["%1_recruit", _base], 0];
if(_maxUnitSend < 3 && {!_bypass}) exitWith
{
  diag_log "Can't select units with less than 3 slots, would be an vehicle only with crew!";
  [];
};

_unitsSend = [];

//Hard copy, need to work on this
_reinf = +([_target] call A3A_fnc_getRequested);
_side = sidesX getVariable [_base, sideUnknown];

private _maxRequested = [_reinf, false] call A3A_fnc_countGarrison;
private _maxCrewSpaceNeeded = _maxRequested select 1;
private _maxCargoSpaceNeeded = _maxRequested select 2;

private _currentUnitCount = 0;
private _numberCargoUnitsSent = 0;

while {_currentUnitCount < (_maxUnitSend - 2) && {[_reinf, true] call A3A_fnc_countGarrison != 0}} do
{
  private _remainingUnitsAvailable = _maxUnitSend - _currentUnitCount;
  //Find vehicle to send
  _currentSelected = "";
  _seatCount = 0;
  _vehicleIsNeeded = false;

  {
    _vehicle = (_x select 0);
    if(_vehicle != "") then
    {
      _allSeats = [_vehicle, true] call BIS_fnc_crewCount;
      _crewSeats = [_vehicle, false] call BIS_fnc_crewCount;

      //TODO available check on the base, currently it is bypassing the economy
	  
	  //Check we don't overflow the max units we can send, if we get this vehicle and crew it.
	  //Also, only select if bigger (we want the biggest first)
	  //Also, if it should be air, only select air vehicles.
      if(((_currentUnitCount + _crewSeats) <= _maxUnitSend) && {_allSeats > _seatCount} && {!_isAir ||	_vehicle isKindOf "Air"}) then
      {
        _currentSelected = _vehicle;
        _seatCount = _allSeats;
        _vehicleIsNeeded = true;
      };
    };
  } forEach _reinf;

  //Delete vehicle
  _index = _reinf findIf {(_x select 0) == _currentSelected};
  if(_index != -1) then
  {
    (_reinf select _index) set [0, ""];
  };

  //No suitable vehicle found, usign different vehicle to reinforce
  if(_currentSelected == "") then
  {
	//We can guarantee we have enough units for crew (at least 2), plus 1 point for the vehicles, otherwise the while loop would exit.
	//So just check how much space we need for cargo, OR the maximum number we can send that exhausts the supply, after taking crew into account.
	private _neededCargoSpace = (_maxCargoSpaceNeeded - _numberCargoUnitsSent) min (_remainingUnitsAvailable - 3);
	
	if (_isAir) then {
		if (_neededCargoSpace <= 4) then {
			_currentSelected = if (_side ==	Occupants) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli};
		} else {
			_currentSelected = if (_side ==	Occupants) then {selectRandom vehNATOTransportHelis} else {selectRandom vehCSATTransportHelis};
		};
	} else {
		if(_neededCargoSpace <= 1) then
		{
		  //Vehicle, crew and one person, selecting quad
		  _currentSelected = if(_side == Occupants) then {vehNATOBike} else {vehCSATBike};
		}
		else
		{
		  if(_neededSpace <= 5) then
		  {
			//Select light unarmed vehicle (as the armed uses three crew)
			_currentSelected = if(_side == Occupants) then {selectRandom vehNATOLightUnarmed} else {selectRandom vehCSATLightUnarmed};
		  }
		  else
		  {
			//Select truck as it is the best option (what about helicopter???)
			_currentSelected = if(_side == Occupants) then {selectRandom vehNATOTrucks} else {selectRandom vehCSATTrucks};
		  };
		};
	};
    _seatCount = [_currentSelected, true] call BIS_fnc_crewCount;
  };

  //Assigning crew
  _crewMember = if(_side == Occupants) then {NATOCrew} else {CSATCrew};
  _crew = [_currentSelected, _crewMember] call A3A_fnc_getVehicleCrew;
  _crewOffset = if(_vehicleIsNeeded) then {count _crew} else {0};
  _currentUnitCount = _currentUnitCount + 1 + (count _crew);

  //Assining cargo
  _cargo = [];
  _openSpace = _seatCount - (count _crew);
  _abort = false;

  for "_i" from 0 to ((count _reinf) - 1) do
  {
    _data = _reinf select _i;
    _dataCrew = _data select 1;
    _dataCargo = _data select 2;

    while {count _dataCrew > 0} do
    {
      if((_currentUnitCount < _maxUnitSend) && {_openSpace > 0}) then
      {
        if(_crewOffset > 0) then
        {
          _crewOffset = _crewOffset - 1;
          _dataCrew deleteAt 0;
        }
        else
        {
          _cargo pushBack (_dataCrew deleteAt 0);
          _currentUnitCount = _currentUnitCount + 1;
          _openSpace = _openSpace - 1;
        };
      }
      else
      {
        _abort = true;
      };
      if(_abort) exitWith {};
    };

    while {count _dataCargo > 0} do
    {
      if((_currentUnitCount < _maxUnitSend) && {_openSpace > 0}) then
      {
        _cargo pushBack (_dataCargo deleteAt 0);
        _currentUnitCount = _currentUnitCount + 1;
		_numberCargoUnitsSent = _numberCargoUnitsSent + 1;
        _openSpace = _openSpace - 1;
      }
      else
      {
        _abort = true;
      };
      if(_abort) exitWith {};
    };
    //No more space, exit
    if(_abort) exitWith {};
  };

  _unitsSend pushBack [_currentSelected, _crew, _cargo];
};

garrison setVariable [format ["%1_recruit", _base], (_maxUnitSend - _currentUnitCount), true];

_unitsSend;
