/****************************************************************
File: UPSMON_doGetOut.sqf
Author: MONSADA

Description:
	Function for order a unit to exit
Parameter(s):
	<--- unit
	<--- Vehicle to leave
Returns:

****************************************************************/

private["_vehicle","_npc","_getout" ,"_gunner","_groupOne","_timeout","_dir"];	
			
_npc = _this;
_vehicle = vehicle (_npc);	
	
sleep 0.05;	
if (_vehicle == _npc) exitwith{};	

//Wait until vehicle is stopped
waituntil {!alive _npc || !canmove _npc || !alive _vehicle || ( (abs(velocity _vehicle select 0)) <= 0.5 && (abs(velocity _vehicle select 1)) <= 0.5 )
	 || ( _vehicle iskindof "Air" && ((getposATL _vehicle) select 2) <= 2.5)};	

if (!alive _npc || !canmove _npc) exitwith{};	
unassignVehicle _npc;	
_npc action ["getOut", _vehicle];
doGetOut _npc;
[_npc] allowGetIn false;	
nul = [_npc] spawn UPSMON_cancelstop;
	
waituntil {!alive _npc || !canmove _npc || vehicle _npc == _npc};	
if (!alive _npc || !canmove _npc) exitwith{};
		
if (leader _npc != _npc) then 
{
	//Moves out with dispersion of 45º
	_dir = getDir _npc;	
	_dir = _dir + 45 - (random 90);
	nul = [_npc,25,_dir] spawn UPSMON_domove;
	//if (UPSMON_Debug>0 ) then { player globalchat format["%1 Moving away from %2 %2º",_npc, typeof _vehicle,_dir];};	
};