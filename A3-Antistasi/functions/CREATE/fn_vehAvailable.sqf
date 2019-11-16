private ["_typeX","_cant"];
_typeX = _this select 0;
if (_typeX == "") exitWith {false};
if ((_typeX in [vehCSATPatrolHeli,vehNATOPatrolHeli,vehCSATRBoat,vehNATORBoat]) or (_typeX in vehCSATTrucks) or (_typeX in vehNATOTrucks) or (_typeX in vehNATOCargoTrucks)) exitWith {true};
_cant = timer getVariable _typeX;
if (isNil "_cant") exitWith {true};
if (_cant <= 1) exitWith {false};
if ({typeOf _x == _typeX} count vehicles >= (floor _cant)) exitWith {false};
true