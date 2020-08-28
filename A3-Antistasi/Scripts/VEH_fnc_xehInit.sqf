/*
file: VEH_fnc_xehInit.sqf
by DaVidoSS
add possibility to automatically turn back vehicle on wheels once flipped
to event take place vehicle needs to be side/up flipped and empty and no units in 10m around
created for Barbolani's Antistasi
parameters:
0: OBJECT
return VOID
*/
params [["_vehicle",objNull,[objNull]]];

if (!isServer) exitWith {};
if (!((getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "hasDriver")) isEqualTo 1)) exitWith {};

_vehicle addEventHandler ["GetOut", {
	private _vehicle = param [0, objNull, [objNull]];
	if !((crew _vehicle) isEqualTo []) exitWith {}; //skip if anyone still in veh
	(_vehicle call BIS_fnc_getPitchBank) params ["_vx","_vy"];
	if (([_vx,_vy] findIf {_x > 80 || _x < -80}) != -1) then {	
		0 = [_vehicle] spawn {
			private _vehicle = param [0, objNull, [objNull]];
			waitUntil {(_vehicle nearEntities ["Man", 10]) isEqualTo [] || !alive _vehicle};
			if (!alive _vehicle) exitWith {};
			_vehicle allowDamage false;
			_vehicle setVectorUp [0,0,1];
			_vehicle setPosATL [(getPosATL _vehicle) select 0, (getPosATL _vehicle) select 1, 0];
			_vehicle allowDamage true;
		};
	};
}];