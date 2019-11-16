/****************************************************************
File: UPSMON_movetoDriver.sqf
Author: MONSADA

Description:
	Funci�n que mueve al soldierX a la posici�n de conductor
Parameter(s):
	<--- unit
	<--- Vehicle to mount
Returns:

****************************************************************/
private["_vehicle","_npc"];		

_npc = _this ;
_vehicle = vehicle _npc;

//Si est� victim
if (vehicle _npc == _npc || !alive _npc || !canmove _npc || !(_npc iskindof "CAManBase")) exitwith{};
	
if (isnull(driver _vehicle) || !alive(driver _vehicle) || !canmove(driver _vehicle)) then 
{ 	
	//if (UPSMON_Debug>0) then {player sidechat format["%1: Moving to driver of %2 ",_npc,typeof _vehicle]}; 	
	_npc action ["getOut", _vehicle];
	doGetOut _npc;
	WaitUntil {vehicle _npc==_npc || !alive _npc || !canmove _npc};
	//Si est� victim
	if (!alive _npc || !canmove _npc) exitwith{};		
	unassignVehicle _npc;
	_npc assignasdriver _vehicle;
	_npc moveindriver _vehicle;
};