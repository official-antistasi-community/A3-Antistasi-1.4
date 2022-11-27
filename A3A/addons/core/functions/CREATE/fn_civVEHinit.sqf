#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private ["_veh"];

_veh = _this select 0;

if (_veh isKindOf "Car") then
	{
	_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)};}];
	};

[_veh] spawn A3A_fnc_cleanserVeh;

_veh addEventHandler ["Killed",{[_this select 0] spawn A3A_fnc_postmortem}];

if ((count crew _veh == 0) and ("vanilla" in A3A_factionEquipFlags)) then
	{
	sleep 10;
	[_veh,false] remoteExec ["enableSimulationGlobal",2];
	_veh addEventHandler ["GetIn",//ToDo: we should clean up the sim eh after as its a one of thing
		{
		_veh = _this select 0;
		if (!simulationEnabled _veh) then {[_veh,true] remoteExec ["enableSimulationGlobal",2]};
		[_veh] spawn A3A_fnc_VEHdespawner;
		}
		];
	_veh addEventHandler ["HandleDamage",
		{
		_veh = _this select 0;
		if (!simulationEnabled _veh) then {[_veh,true] remoteExec ["enableSimulationGlobal",2]};
		}
		];
	};
["civVehInit", [_veh]] call EFUNC(Events,triggerEvent);
