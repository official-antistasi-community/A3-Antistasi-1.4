
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

if (VCM_DebugOld) then {systemChat format ["%1 attempting to heal %2", _medic, _unit];};

_medic setVariable ["VCM_MBUSY", true];

_medic disableAI "AUTOCOMBAT";
_medic setCombatBehaviour "SAFE"; 
_medic setUnitCombatMode "BLUE";


while {alive _medic && {alive _unit} && {_unit distance2D _medic > 3}} do 
{
	_medic forcespeed -1;
	_medic doMove getPos _unit;
	_medic moveTo getPos _unit;
	sleep 3;
};

_medic setCombatBehaviour "AWARE"; 
_medic setUnitCombatMode "BLUE";


if (!(alive _medic) || {!(alive _unit)} || {_unit distance2D _medic > 75}) exitWith {_medic setVariable ["VCM_MBUSY", false];};

doStop _unit;
doStop _medic;

_medic action ["HealSoldier",_unit];
sleep 4;
_unit setdamage 0;

_medic setVariable ["VCM_MBUSY", false]; // No longer busy