/****************************************************************
File: UPSMON_GetOut.sqf
Author: MONSADA

Description:
	Function for order a unit to exit if no gunner
Parameter(s):

Returns:

****************************************************************/
private["_vehicle","_npc","_getout" ,"_gunner"];	
				
_npc = _this;
_vehicle = vehicle (_npc);	
_gunner = objnull;
_gunner = gunner _vehicle;	
		
sleep 0.05;	
if (!alive _npc) exitwith{};
		
//If no leave the vehicle gunner
if ( isnull _gunner || !alive _gunner  || !canmove _gunner || (_gunner != _npc && driver _vehicle != _npc && commander _vehicle != _npc) ) then { 			
	[_npc] allowGetIn false;
	_npc spawn UPSMON_doGetOut;										 
	unassignVehicle _npc;
			
	//sleep 0.2;
};	