/*
	Author: Genesis

	Description:
		Makes group arm nearby static weapons.

	Parameter(s):
		0: GROUP - Affected group

	Returns:
		NOTHING
	
	Example1: groupAlpha call VCM_fnc_ArmStatics;
*/

private _leader = (leader _this);
private _weaps = nearestObjects [_leader, ["StaticWeapon"], 150];
private _unitArray = (units _this);
if (count _weaps < 0) exitWith {};
private _assignedPairs = []; //Static weapon - Gunner pair

{
	private _unit = [_unitArray,_x,true,"W1"] call VCM_fnc_ClstObj;

	//VCM_fnc_ClstObj returns [0,0,0] if nothing found
	if (_unit isEqualTo [0,0,0]) exitWith {};

	private _foot = isNull objectParent _unit;
	if (_foot) then
	{
		if (_unit distance2D _x < 100) then
		{
			_assignedPairs pushback [_unit,_x];
			_unitArray deleteAt (_unitArray findIf {_x isEqualTo _unit});	
		};
	};
} foreach _weaps;

if (count _assignedPairs isEqualTo 0) exitWith {};

{
	_x spawn
	{
		params ["_unit","_weap"];
		private _assignedGunner = assignedGunner _weap;
		if (isNull _assignedGunner) then
		{
			_unit setCombatBehaviour "SAFE"; 
			_unit setUnitCombatMode "BLUE";		
			_unit doMove (getposATL _weap);
			_unit assignAsGunner _weap;
			[_unit] orderGetIn true;
			_Waiting = 0;
			while {(alive _unit) && {_unit distance _weap > 4}} do
			{
				sleep 1;
			};
			_unit moveInGunner _weap;
			_unit setCombatBehaviour "AWARE"; 
			_unit setUnitCombatMode "YELLOW";					
			[_unit,_weap] spawn
			{
				params ["_unit","_weap"];
				private _staticGreen = true;
				private _statictime = VCM_STATICARMT;
				
				while {_staticGreen && {alive _unit} && {alive _weap} && {!(isNull (gunner _weap))} && {_unit distance2D (leader (group _unit)) < 500}} do
				{
					sleep 5;
					private _enemy = _unit findNearestEnemy _unit;
					if (!(isNull _enemy)) then 
					{
							private _cansee = [_unit, "VIEW"] checkVisibility [eyePos _unit, eyePos _enemy];
							if (_cansee > 0) then {_statictime = _statictime + 3;} else {_statictime = _statictime - 5;};
					}
					else
					{
						_statictime = _statictime - 5;
					};
					if (_statictime < 1) then {_staticGreen = false;};
				};				
				
				unassignVehicle _unit;
				_unit leaveVehicle _weap;
				doGetOut _unit;
			
			};
		};		
	};	
} foreach _assignedPairs;