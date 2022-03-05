/****************************************************************
File: UPSMON_Gunnercontrol.sqf
Author: MONSADA

Description:
	Function that checks is gunner is alive, if not moves a cargo
Parameter(s):
	<--- vehicle
Returns:
	Nothing
****************************************************************/
private["_vehicle","_gunnercontrol","_hasgunner","_crew","_crew2"];				
_vehicle = _this select 0;

_gunnercontrol = false;
_hasgunner = (_vehicle) emptyPositions "Gunner" > 0 || !isnull gunner _vehicle; 
_crew = [];
_crew2 = []; //Without driver and gunner
	
sleep 0.05;	
if ( !alive _vehicle  || !canmove _vehicle ) exitwith{};
	
//Checks stuckcontrol not active
_gunnercontrol = _vehicle getVariable "UPSMON_gunnercontrol";
if (isnil ("_gunnercontrol")) then {_gunnercontrol=false};	
if (_gunnercontrol) exitwith {};
	
_vehicle setVariable ["UPSMON_gunnercontrol", true, false];													
	
_crew = crew _vehicle;
//gunner and driver loop control
while {	alive _vehicle && canmove _vehicle && count _crew > 0} do 
{
	_crew = crew _vehicle;
	{
		if (!canmove _x || !alive _x) then {_crew = _crew -[_x];};
	}foreach _crew;
		
	//Driver control	
	if ((isnull (driver _vehicle) || !alive (driver _vehicle) || !canmove (driver _vehicle)) && count _crew > 0) then 
	{
		_crew2 = _crew - [gunner _vehicle];
		if (count _crew2 > 0) then 
		{
			(_crew2 select (count _crew2 - 1)) spawn UPSMON_movetodriver;
		};
	};	
		
	//Gunner control	
	if ( _hasgunner && (isnull (gunner _vehicle) || !alive (gunner _vehicle) || !canmove (gunner _vehicle)) && count _crew > 1) then 
	{
		_crew2 = _crew - [driver _vehicle];
		if (count _crew2 > 0) then 
		{
			(_crew2 select (count _crew2 - 1)) spawn UPSMON_movetogunner;
		}
		else
		{
			(_crew select 0) spawn UPSMON_movetogunner;
		};
	};
	sleep 20;		
	//if (UPSMON_Debug>0 ) then {player globalchat format["%1 crew=%2",typeof _vehicle, count _crew];};		
};	
//if (UPSMON_Debug>0 ) then {player globalchat format["%1 exits from gunner control",typeof _vehicle];};
_vehicle setVariable ["UPSMON_gunnercontrol", false, false];