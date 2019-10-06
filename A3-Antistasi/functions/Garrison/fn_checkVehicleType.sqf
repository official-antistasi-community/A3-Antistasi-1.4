params ["_vehicle", "_preference"];

/*  Checks if the given vehicle type is within the preferred category
*   Params:
*     _vehicle : STRING : The vehicle type
*     _preference : STRING : The preferred category
*
*   Return:
*     _result : BOOLEAN : True if vehicle fits category, false otherwise
*/

private ["_result"];

//TODO this does not work properly (maybe even throws errors) as the template files arent
//unified on how they work, await Pots Templates, then fix this
_result = false;
switch (_preference) do
{
    case ("EMPTY"):
    {
      _result = (_vehicle == "");
    };
    case ("LAND_START"):
    {
      _result = (_vehicle == "" || {_vehicle in vehNATOLight || _vehicle in vehCSATLight});
    };
    case ("LAND_LIGHT"):
    {
      _result = (_vehicle in vehNATOLight || {_vehicle in vehCSATLight});
    };
    case ("LAND_DEFAULT"):
    {
      _result = (_vehicle in vehNATOLight || {_vehicle in vehCSATLight || {_vehicle in vehNATOAPC || {_vehicle in vehCSATAPC}}});
    };
    case ("LAND_APC"):
    {
      _result = (_vehicle in vehNATOAPC || {_vehicle in vehCSATAPC});
    };
    case ("LAND_ATTACK"):
    {
      //Does this work? vehXXXXTank is not an array...
      _result = (_vehicle in vehNATOAPC || {_vehicle in vehCSATAPC || {_vehicle == vehNATOTank || {_vehicle == vehCSATTank}}})
    };
    case ("LAND_TANK"):
    {
      _result = (_vehicle == vehNATOTank || {_vehicle == vehCSATTank});
    };
    case ("LAND_AIR"):
    {
      _result = (_vehicle == vehNATOAA || {_vehicle == vehCSATAA});
    };
    case ("HELI_PATROL"):
    {
      _result = (_vehicle == "" || {_vehicle in vehNATOPatrolHeli || _vehicle in vehCSATPatrolHeli});
    };
    case ("HELI_LIGHT"):
    {
      _result = (_vehicle in vehNATOPatrolHeli || {_vehicle in vehCSATPatrolHeli});
    };
    case ("HELI_TRANSPORT"):
    {
      _result = (_vehicle in vehNATOTransportHelis || {_vehicle in vehCSATTransportHelis});
    };
    case ("HELI_DEFAULT"):
    {
      _result = (_vehicle in vehNATOTransportHelis || {_vehicle in vehCSATTransportHelis || {_vehicle in vehNATOAttackHelis || {_vehicle in vehCSATAttackHelis}}});
    };
    case ("HELI_ATTACK"):
    {
      _result = (_vehicle in vehNATOAttackHelis || {_vehicle in vehCSATAttackHelis});
    };
    case ("AIR_DRONE"):
    {
      _result = (_vehicle == "" || {_vehicle in [vehNATOUAV, vehNATOUAVSmall] || {_vehicle in [vehCSATUAV, vehCSATUAVSmall]}});
    };
    case ("AIR_GENERIC"):
    {
      _result = (_vehicle in [vehNATOUAV, vehNATOUAVSmall] || {_vehicle in [vehCSATUAV, vehCSATUAVSmall] || {_vehicle in [vehNATOPlane, vehNATOPlaneAA] || {_vehicle in [vehCSATPlane, vehCSATPlaneAA]}}});
    };
    case ("AIR_DEFAULT"):
    {
      _result = (_vehicle in [vehNATOPlane, vehNATOPlaneAA] || {_vehicle in [vehCSATPlane, vehCSATPlaneAA]});
    };
};

_result;
