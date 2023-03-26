/*
    Author: [Hazey] [Genesis]

    Description:
		Handle suppression on unit.

    Arguments:
		<Object> Unit to which the event is assigned
		<Number> Distance of the projectile pass-by
		<Object> Who or what fired - vehicle or drone
		<Object> Who pressed the Trigger.
		<Object> The ammunition itself.
		<String> The ammunitions classname.
		<Config> The ammunitions CfgAmmo config path.

    Return Value:
    	N/A

    Scope: Any
    Environment: Any
    Public: No

    Example: 
		_x addEventHandler ["Suppressed", {_this call A3A_fnc_patrolSuppressionEH;}];
    License: MIT License
*/

params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

if (_distance < 5) then {
	private _UnitSupChk = _unit getvariable ["PATCOM_Supp_Time", -100];
	
	if (_UnitSupChk + 10 < time) then {
		if (PATCOM_DEBUG) then {
			[_unit, "SUPPRESSED", 10] call A3A_fnc_debugText3D;
		};
		_unit setCombatBehaviour "COMBAT"; 
		_unit setUnitCombatMode "RED";
		_unit enableAI "AUTOCOMBAT";
		_unit dotarget _shooter;
		_unit doSuppressiveFire _shooter;
		_unit setvariable ["PATCOM_Supp_Time", time];
	};

	// Chance to call Counter Artillery. Temp way to get the AI to fire it.
	private _counterArtilleryCall = random 10;
	if (_counterArtilleryCall > 8) then {
		[getPos _instigator, (random 150), "HE"] call A3A_fnc_artilleryFireMission;
	};
};