params ["_vehicleType", "_crewType"];

/*  Returns an array of the needed crew for the vehicle
*   Params:
*     _vehicleType : STRING : The classname of the vehicle
*     _crewType : STRING : The classname of the crewmember
*
*   Returns:
*     _result : ARRAY of STRINGS : The needed amount of crewmember as an array
*/

private ["_seatCount", "_result"];

if(_vehicleType == "" || _vehicleType == "Empty") exitWith {[]};

_seatCount = [_vehicleType, false] call BIS_fnc_crewCount;
_result = [];
for "_i" from 1 to _seatCount do
{
  _result pushBack _crewType;
};
_result;
