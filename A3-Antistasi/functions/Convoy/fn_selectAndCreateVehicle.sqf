params ["_vehPool", "_side", ["_isAir", false]];

/*  Selects a vehicle from the given pool, if available, selects basic vehicle else
*   Params:
*     _vehPool: ARRAY of STRINGS; the current vehicle pool
*     _side: SIDE; the side for which the vehicle should be choosen
*     _isAir: BOOLEAN; Optional, selects if vehicle pool consists of air vehicles, default false
*   Returns:
*     ARRAY of mixed types:
*       - ARRAY of STRINGS:
*         - choosen vehicle: STRING
*         - choosen cargo group: STRING
*       - ARRAY of STRINGS: the new vehicle pool
*/

if(isNil "_side") exitWith
{
  diag_log "SelectAndCreateVehicle: No side given!";
  [objNull, objNull];
};
if(isNil "_vehPool" || {!(_vehPool isEqualType []) || {count _vehPool == 0}}) exitWith
{
  diag_log "SelectAndCreateVehicle: _vehpool is not a correct variable or empty!";
  [objNull, objNull];
};
private ["_selectedVehicle"];
_selectedVehicle = selectRandom _vehPool;

_crewUnits = if(_side == Occupants) then {NATOCrew} else {CSATCrew};

while{!([_selectedVehicle] call A3A_fnc_vehAvailable)} do
{
  _vehPool = _vehPool - [_selectedVehicle];
  if (count _vehPool == 0) then
  {
    switch (true) do
    {
      case (_side == Occupants && {!_isAir}):
      {
        _vehPool = vehNATOTrucks;
      };
      case (_Side == Occupants && {_isAir}):
      {
        _vehPool = vehNATOTransportHelis;
      };
      case (_side == Invaders && {!_isAir}):
      {
        _vehPool = vehCSATTrucks;
      };
      case (_Side == Invaders && {_isAir}):
      {
        _vehPool = vehCSATTransportHelis;
      };
    };
  };
  _selectedVehicle = selectRandom _vehPool;
};
_crew = [_selectedVehicle, _crewUnits] call A3A_fnc_getVehicleCrew;

_typeGroup = [];
if (!_isEasy) then
{
  if (!(_selectedVehicle in vehTanks)) then
  {
    _typeGroup = [_selectedVehicle,_side] call A3A_fnc_cargoSeats;
  };
}
else
{
  if (not(_selectedVehicle == vehFIAArmedCar)) then
  {
    _typeGroup = selectRandom groupsFIASquad;
    if (_selectedVehicle == vehFIACar) then
    {
      _typeGroup = selectRandom groupsFIAMid;
    };
  };
};

[[_selectedVehicle, _crew, _typeGroup], _vehPool];
