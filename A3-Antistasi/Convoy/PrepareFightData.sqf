params ["_marker", "_attackingUnits", "_sideAttacker"];

if(isNil "_marker") exitWith {diag_log "PrepareFightData: Can't simulate a fight without a marker!"};
if(isNil "_attackingUnits") exitWith {diag_log "PrepareFightData: No attacking units found!"};

_sideDefender = sidesX getVariable [_marker, sideUnknown];

if(_sideDefender == _sideAttacker) exitWith
{
  //This was either a reinforment convoy or a patrol, neither needs a simulated fight
  //TODO add a check whether case and act depending on it
  diag_log "PrepareFightData: Attacker and Defender are the same side. No fighting needed!";
};

_attackerMan = [];
_attackerLight = [];
_attackerAPC = [];
_attackerTank = [];
_attackerHeli = [];
_attackerJet = [];
_attackerStatics = [];



{
  _vehicleData = _x;
  _vehicle = _vehicleData select 0;
  _cargoUnits = _vehicleData select 1;
  _hasCargo = (count _cargoUnits) > 0;
  switch (true) do
  {
     case (_vehicle isKindOf "Car") : {_attackerLight pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "APC") : {_attackerAPC pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "Tank") : {_attackerTank pushBack [_vehicle, false]};
     case (_vehicle isKindOf "Helicopter") : {_attackerHeli pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "Plane") : {_attackerJet pushBack [_vehicle, false]};
     case (_vehicle isKindOf "StaticWeapon") : {_attackerStatics pushBack [_vehicle, true]};
     default {};
  };
  {
    if(_x isKindOf "Man") then {_attackerMan pushBack [_x, _vehicle]};
  } forEach _cargoUnits;
} forEach _attackingUnits;


__defenderTroops = [];
__defenderMan = [];
__defenderCar = [];
__defenderAPC = [];
__defenderTank = [];
__defenderHeli = [];
__defenderJet = [];
__defenderStatics = [];


//This does not work, the garrison only counts foot units, statics are added by script as much as their crew
//For FIA it is saved different again
//Who did this, for real??

/*
{
  _vehicleData = _x;
  _vehicle = _vehicleData select 0;
  _cargoUnits = _vehicleData select 1;
  _hasCargo = (count _cargoUnits) > 0;
  switch (true) do
  {
     case (_vehicle isKindOf "Car") : {__defenderCar pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "APC") : {__defenderAPC pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "Tank") : {__defenderTank pushBack [_vehicle, false]};
     case (_vehicle isKindOf "Helicopter") : {__defenderHeli pushBack [_vehicle, _hasCargo]};
     case (_vehicle isKindOf "Plane") : {__defenderJet pushBack [_vehicle, false]};
     case (_vehicle isKindOf "StaticWeapon") : {__defenderStatics pushBack [_vehicle, true]};
     default {};
  };
  {
    if(_x isKindOf "Man") then {__defenderMan pushBack [_x, _vehicle]};
  } forEach _cargoUnits;
} forEach _attackingUnits;
*/

//The data has to be saved globally and executed once a second to ensure reinforcements can join the battle
