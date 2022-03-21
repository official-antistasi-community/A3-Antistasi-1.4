
/*
	Author: Genesis, improved by Freddo

	Description:
		Plays appropiate hit reactions on unit

	Parameter(s):
		0: OBJECT - Object affected
		1 (Optional): OBJECT - Object that caused damage
		2: NUMBER - Level of damage caused
		3: OBJECT - Object that pulled the trigger

	Returns:
		NOTHING

	Example1:
		this addEventHandler ["Hit", {
			_this call VCM_fnc_AIHIT;
		}];
	
	NOTE:
		Meant to be called from a "HIT" eventhandler
*/
params ["_unit", "_source", "_damage", "_instigator"];

if (VCM_MEDICALACTIVE) exitWith {};

if (VCM_RAGDOLL && {_unit distance2D _instigator < 101} && {_damage > 0.05} && {!(lifestate _unit isEqualTo "INCAPACITATED")} && {VCM_RAGDOLLCHC > (random 100)}) then
{
	private _relPos = [0,-200,0];
	if !(isNull _instigator) then 
	{
	_relPos = _unit worldToModel ASLToAGL getPosASL _instigator;
	_relPos = _relPos apply {_x*10};
	};
	_unit addForce [_unit vectorModelToWorld _relPos, _unit selectionPosition "pelvis"];
	_unit spawn 
	{
		sleep 2;
		_this setUnconscious false;
	};
}
else
{
		
	//Lay down
	if (Vcm_SmokeChance > (random 100)) then
	{
		[_Unit,false,true] spawn VCM_fnc_ForceGrenadeFire;
	};
	
	private _GetUnitStance = Stance _unit;
	if !(_GetUnitStance isEqualTo "PRONE") then
	{	
		_Unit spawn {sleep 5;sleep (random 3);_this call VCM_fnc_HealSelf;}; 

		_unit setUnitPos "DOWN";
		[_unit,_GetUnitStance] spawn 
		{
			params ["_Unit","_Pos"];
			sleep 5;
			if (alive _unit) then 
			{
				_unit setUnitPos "AUTO";
			};
		};
	};
};
