/*
*
*
*
*
*
*
*
*/
#include "..\..\Includes\common.inc"
FIX_LINE_NUMBERS()
Debug_1("Updating preferences now, tierWar is %1", tierWar);

//No need to update the preferences
if(tierPreference >= tierWar) exitWith {Debug("Aborting update of preferences!")};

for "_i" from (tierPreference + 1) to tierWar do
{
  if(_i in airportUpdateTiers) then
  {
    _preference = garrison getVariable ["Airport_preference", []];
    //Update vehicle types
    [_preference] call A3A_fnc_updateVehicles;

    //Add new vehicles
    _index = airportUpdateTiers findIf {_x == _i};
    if(_index % 2 == 0) then
    {
      _preference pushBack ["LAND_LIGHT", -1, "SQUAD"];
      _preference pushBack ["HELI_LIGHT", -1, "GROUP"];
    }
    else
    {
      _preference pushBack ["LAND_AIR", -1, "AA"];
      _preference pushBack ["AIR_GENERIC", -1, "EMPTY"];
    };

    if(true || debug) then
    {
        Debug("Airport_preference hit level %1", tierWar)
        DebugArray("Airport_preference",_preference);
    };
    garrison setVariable ["Airport_preference", _preference, true];
    garrison setVariable ["Airport_statics", (airportStaticsTiers select _index), true];
  };

  if(_i in outpostUpdateTiers) then
  {
    _preference = garrison getVariable ["Outpost_preference", []];
    //Update vehicle types
    [_preference] call A3A_fnc_updateVehicles;

    //Add new vehicles
    _index = outpostUpdateTiers findIf {_x == _i};
    if(_index % 2 == 0) then
    {
      _preference pushBack ["LAND_LIGHT", -1, "SQUAD"];
    }
    else
    {
      _preference pushBack ["HELI_LIGHT", -1, "GROUP"];
    };
    if(true || debug) then
    {
        Debug("Outpost_preference hit level %1", tierWar)
        DebugArray("Outpost_preference",_preference);
    };
    garrison setVariable ["Outpost_preference", _preference, true];
    garrison setVariable ["Outpost_statics", (outpostStaticsTiers select _index), true];
  };

  if(_i in cityUpdateTiers) then
  {
    //Update preferences of cities
    _preference = garrison getVariable ["City_preference", []];
    _preference pushBack ["LAND_LIGHT", -1, "GROUP"];

    if(true || debug) then
    {
        Debug("City_preference hit level %1", tierWar)
        DebugArray("City_preference",_preference);
    };
    garrison setVariable ["City_preference", _preference, true];

    //Update statics percentage
    _index = cityUpdateTiers findIf {_x == _i};
    garrison setVariable ["City_statics", (cityStaticsTiers select _index), true];
  };

  if(_i in otherUpdateTiers) then
  {
    //Update preferences of other sites
    _preference = garrison getVariable ["Other_preference", []];
    //Update vehicle types
    [_preference] call A3A_fnc_updateVehicles;

    _preference pushBack ["EMPTY", 0, "SQUAD"];

    if(true || debug) then
    {
        Debug("Other_preference hit level %1", tierWar)
        DebugArray("Other_preference",_preference);
    };
    garrison setVariable ["Other_preference", _preference, true];

    //Update statics percentage
    _index = otherUpdateTiers findIf {_x == _i};
    garrison setVariable ["Other_statics", (otherStaticsTiers select _index), true];
  };

};

tierPreference = tierWar;
publicVariable "tierPreference";
