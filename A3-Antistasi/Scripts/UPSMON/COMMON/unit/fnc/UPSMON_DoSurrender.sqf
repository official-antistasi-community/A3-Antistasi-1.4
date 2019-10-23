/****************************************************************
File: UPSMON_surrended.sqf
Author: MONSADA

Description:
	Function to surrender AI soldier
Parameter(s):

Returns:

****************************************************************/
private ["_npc","_vehicle"];

_npc = _this select 0;

if (!alive _npc) exitwith {};
	
_npc addrating -1000;
_npc setcaptive true;	
sleep 0.5;
	
_vehicle = vehicle _npc;
	
if ( _npc != _vehicle || !(_npc iskindof "Man" )) then 
{		
	_vehicle setcaptive true;	
		
	if ( "Air" countType [_vehicle]>0) then 
	{											
			
		//Si acaba de entrar en el heli se define punto de aterrizaje
		if (_npc == driver _vehicle ) then 
		{ 
			[_vehicle,getpos _vehicle] call UPSMON_MoveHeliback;							
		};				
	} else {			
		[_transport,[_npc]] call UPSMON_UnitsGetOut;		
	};	
		
	//Esperamos a que esté parado		
	waituntil {_npc == vehicle _npc || !alive _npc};
};	
	
if (!alive _npc) exitwith {};
_npc setcaptive true;
_npc stop true;

_npc setunitpos "UP";	
//If (_handweap != "") then {_npc action ["DropWeapon","GroundWeaponHolder" createVehicle getposATL _npc,handgunWeapon _npc];};
_ground = createVehicle ["groundweaponholder", getposATL _npc, [], 0, "NONE"];

If (primaryweapon _npc != "") then {_ground addWeaponCargo [primaryweapon _npc,1];};
If (secondaryWeapon _npc != "") then {_ground addWeaponCargo [secondaryWeapon _npc,1];};
If (handgunWeapon _npc != "") then {_ground addWeaponCargo [handgunWeapon _npc,1];};

RemoveAllweapons _npc;

sleep 1;
_npc playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";