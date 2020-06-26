params ["_preference", "_side"];

/*  Selects a fitting vehicle type based on given preference and side
*   Params:
*     _preference : STRING : The preferred vehicle type
*     _side : SIDE : The side of the vehicle
*
*   Returns:
*     _result : STRING : The typename of the selected vehicle
*/

private _fileName = "SelectVehicleType";

[4, format ["SelectVehicleType: Selecting vehicle now, preferred is %1, side is %2", _preference, _side], _fileName] call A3A_fnc_log;

if(_preference == "LAND_AIR") exitWith
{
  if(_side == Occupants) then {vehNATOAA} else {vehCSATAA};
};
if(_preference == "LAND_TANK") exitWith
{
  if(_side == Occupants) then {vehNATOTank} else {vehCSATTank};
};

private _possibleVehicles = [];
if(_preference in ["EMPTY", "LAND_START", "HELI_PATROL", "AIR_DRONE"]) then
{
  _possibleVehicles pushBack "";
};
if(_preference in ["LAND_START", "LAND_LIGHT", "LAND_DEFAULT"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append vehNATOLight;
  }
  else
  {
    _possibleVehicles append vehCSATLight;
  };
};
if(_preference in ["LAND_DEFAULT", "LAND_APC", "LAND_ATTACK"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append vehNATOAPC;
  }
  else
  {
    _possibleVehicles append vehCSATAPC;
  };
};
if(_preference in ["LAND_ATTACK"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles pushBack vehNATOTank;
  }
  else
  {
    _possibleVehicles pushBack vehCSATTank;
  };
};
if(_preference in ["HELI_PATROL", "HELI_LIGHT"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles pushBack vehNATOPatrolHeli;
  }
  else
  {
    _possibleVehicles pushBack vehCSATPatrolHeli;
  };
};
if(_preference in ["HELI_TRANSPORT", "HELI_DEFAULT"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append vehNATOTransportHelis;
  }
  else
  {
    _possibleVehicles append vehCSATTransportHelis;
  };
};
if(_preference in ["HELI_DEFAULT", "HELI_ATTACK"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append vehNATOAttackHelis;
  }
  else
  {
    _possibleVehicles append vehCSATAttackHelis;
  };
};
if(_preference in ["AIR_DRONE", "AIR_GENERIC"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append [vehNATOUAV, vehNATOUAVSmall];
  }
  else
  {
    _possibleVehicles append [vehCSATUAV, vehCSATUAVSmall];
  };
};
if(_preference in ["AIR_GENERIC", "AIR_DEFAULT"]) then
{
  if(_side == Occupants) then
  {
    _possibleVehicles append [vehNATOPlane, vehNATOPlaneAA];
  }
  else
  {
    _possibleVehicles append [vehCSATPlane, vehCSATPlaneAA];
  };
};

if(count _possibleVehicles == 0) exitWith
{
    [1, format ["No result for %1, assuming bad parameter!", _preference], _fileName] call A3A_fnc_log;
    "Empty";
};

[4, format ["SelectVehicleType: Preselection done, possible vehicles are %1", str _possibleVehicles], _fileName] call A3A_fnc_log;

private _result = selectRandom _possibleVehicles;
_result;
