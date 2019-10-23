/****************************************************************
File: UPSMON_assignasgunner.sqf
Author: MONSADA

Description:
	Move unit to the gunner position of a vehicle
Parameter(s):
	<--- unit
	<--- vehicle
	<--- Do they move to the position or spawn ?
Returns:
	Nothing
****************************************************************/
private["_vehicle","_gunner","_dist","_spawninveh"];	
_gunner =  _this  select 0;
_vehicle = _this select 1;
_spawninveh = false;
if (count _this > 2) then {_spawninveh = _this select 2;};
	
_dist=0;
	
[_gunner] orderGetIn true;
_gunner forcespeed 40;
_gunner assignasgunner _vehicle;
if (_spawninveh) then {_gunner moveingunner _vehicle;};
	
waituntil  { _gunner != vehicle _gunner || !alive _gunner || !canmove _gunner ||!alive _vehicle || !canfire _vehicle};
	
if ( alive _gunner && alive _vehicle && canmove _gunner && canfire _vehicle) then {				
_dist = _gunner distanceSqr _vehicle;
if (_dist < 3) then 
{
	_gunner moveInTurret [_vehicle, [0]] ;	
};		
