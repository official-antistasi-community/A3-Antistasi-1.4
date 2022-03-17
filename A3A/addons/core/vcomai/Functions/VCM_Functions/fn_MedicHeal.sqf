
/*
	Author: Genesis

	Description:
		Makes medic move to a soldier and heal him.

	Parameter(s):
		0: OBJECT - Medic
		1: OBJECT - Injured unit

	Returns:
		NOTHING
*/

params ["_medic","_unit"];


if (_medic isEqualType [] || {!(alive _medic)} || {!(alive _unit)} || {_unit distance2D _medic > 75}) exitWith {};

if (VCM_DEBUG) then {systemChat format ["%1 attempting to heal %2", _medic, _unit];};

_medic setVariable ["VCM_MBUSY", true];
 
_medic disableAI "FSM";
_medic disableAI "TARGET";
_medic disableAI "WEAPONAIM";
_medic disableAI "AUTOTARGET";
_medic disableAI "SUPPRESSION";
_medic disableAI "CHECKVISIBLE";
_medic disableAI "COVER";
_medic forcespeed -1;
_medic setDestination [(getpos _Unit), "FORMATION PLANNED", true];

while {alive _medic && {alive _unit} && {_unit distance2D _medic > 3}} do 
{
	_medic forceSpeed -1;				
	_medic setDestination [(getpos _Unit), "FORMATION PLANNED", true];
	sleep 3;
};

_medic enableAI "FSM";
_medic enableAI "TARGET";
_medic enableAI "WEAPONAIM";
_medic enableAI "AUTOTARGET";
_medic enableAI "SUPPRESSION";
_medic enableAI "CHECKVISIBLE";
_medic enableAI "COVER";

if (!(alive _medic) || {!(alive _unit)} || {_unit distance2D _medic > 75}) exitWith {};

_unit forcespeed 0;
_medic forcespeed 0;

_medic action ["HealSoldier",_unit];
sleep 4;
_unit setdamage 0;
_unit forcespeed -1;
_medic forcespeed -1;
_medic setVariable ["VCM_MBUSY", false]; // No longer busy