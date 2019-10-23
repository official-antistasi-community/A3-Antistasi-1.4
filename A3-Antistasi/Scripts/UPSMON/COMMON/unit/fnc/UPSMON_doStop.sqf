/****************************************************************
File: UPSMON_doStop.sqf
Author: MONSADA

Description:
	Función que detiene al soldado y lo hace esperar x segundos
Parameter(s):
	<--- unit
	<--- Wait time
Returns:

****************************************************************/
private["_sleep","_npc"];	
	
_npc = _this select 0;
_sleep = _this select 1;		
	
sleep 0.05;	
if (!alive _npc  || !canmove _npc ) exitwith{};
if 	( _sleep == 0 ) then {_sleep = 0.1};	
	
//Restauramos valores por defecto de movimiento
if 	(((group _npc) getvariable "UPSMON_Grpstatus") select 0 == "FORTIFY") then 
{	
	dostop _npc ;
	_npc disableAI "TARGET";
} 
else 
{
	dostop _npc ;
	sleep _sleep;	
	[_npc] spawn UPSMON_cancelstop;
};