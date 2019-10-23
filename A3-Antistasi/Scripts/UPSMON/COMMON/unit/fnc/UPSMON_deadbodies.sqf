/****************************************************************
File: UPSMON_deadbodies.sqf
Author: Monsada

Description:
	Función que devuelve un array con los vehiculos terrestres más cercanos
Parameter(s):
	<--- object for  position search
	<---  max distance from npc
Returns:
	---> _vehicles:  array of vehiclesnetid object
****************************************************************/
private["_vehicles","_npc","_bodies","_OCercanos","_distance","_side"];	
					
_npc = _this select 0;	
_distance = _this select 1;	
		
_OCercanos = [];
_bodies = objNull;
		
//Buscamos objetos cercanos
_OCercanos = nearestObjects [_npc,["Man"],_distance];
			
{	
	if (!alive _x) then
	{
		if ([_npc,_x,_distance,130] call UPSMON_Haslos) exitwith
		{
			_bodies = _x;
			_bodies
		};
	};
}foreach _OCercanos;
		
_bodies;