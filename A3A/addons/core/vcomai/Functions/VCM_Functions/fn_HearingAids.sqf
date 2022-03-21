
/*
	Author: Genesis

	Description:
		Firing unsuppressed shots reveals unit.

	Parameter(s):
		0: OBJECT - Unit that fired
		1: STRING - Weapon fired
		2: STRING - Muzzle used
		3: STRING - Firing mode
		4: STRING - Ammo used
		5: STRING - Magazine used
		6: OBJECT - Projectile created
		7: OBJECT - Gunner whose weapon was fired (For use with vehicles)

	Returns:
		NOTHING
		
	Note:
		For use with "Fired" eventhandler
		
	Example1:
		this addEventHandler ["Fired", {
			_this call VCM_fnc_HearingAids;
		}];
*/

params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_bullet","_gunner"];

if (_weapon isEqualTo "Put" || {_weapon isEqualTo "Throw"} || {!(Vcm_ActivateAI)}) exitwith {};

private _timeShot = _unit getVariable ["VCM_FTH",-60];

if ((_timeShot + 2) < time) then 
{
	
	_unit setVariable ["VCM_FTH",time];
	private _UnitGroup = (group _unit);
	if !(_UnitGroup getvariable ["VCM_EngagedMovement",true]) then
	{
		private _FSMID = _UnitGroup getVariable "VCOM_FSMH";
		_FSMID setFSMVariable ["_Cover2Cover",time];
		[(leader _UnitGroup)] spawn VCM_fnc_ForceMove;
	};
	if (_UnitGroup getVariable ["VCM_NOFLANK",false]) exitWith {};
	
	//Check if unit has suppressor on weapon.
	private _mzl = currentMuzzle _unit;
	private _mzl = if (_mzl isEqualType "") then {_mzl} else {""};
	private _atch = _unit weaponAccessories _mzl param [0, ""];
	private _return = (!(_atch isEqualTo "")) && {getNumber(configFile >> "CfgWeapons" >> _atch >> "ItemInfo" >> "AmmoCoef" >> "audibleFire") < 1};
	
	if (VCM_DebugOld) then {diag_log (format ["%2: WEAPON SUPRRESSED - %1",_return,_unit])};
	

	//systemchat format ["%1",_sup];
	if !(_return) then 
	{

		private _array1 = ((_unit call VCM_fnc_EnemyArray) select {(_x distance2D _unit) < VCM_HEARINGDISTANCE});
		
		if (count _array1 > 0) then
		{
			[_array1,_unit,1] remoteExec ["VCM_fnc_KnowAbout",0];	
			//[_array1] remoteExec ["VCM_fnc_ResetAnimation",0];	
		};
		
	};

};



