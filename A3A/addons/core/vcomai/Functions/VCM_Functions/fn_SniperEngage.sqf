/*
	Author: Genesis

	Description:
		This function handles the snipers actively engaging enemies from a large distance

	Parameter(s):
		0: ARRAY - List of all "range capable" units within a group

	Returns:
		nil
*/

params ["_Snipers","_Group"];
private _NearestEnemys = (leader _Group) call VCM_fnc_ClstKnwnEnmy;

if ((count _NearestEnemys) > 0) then
{

	private _ShootArray = [];
	{
		if (_x # 0 < 15) then
		{
			_ShootArray pushback (_x # 1);
		};
	
	} foreach _NearestEnemys;

	if (count _ShootArray > 0) then
	{

		{
			private _Unit = _x;
			//private _NearestEnemy = [_ShootArray,_Unit,true,""] call VCM_fnc_ClstObj;
			private _NearestEnemy = assignedTarget _Unit;
			_x lookat (getposATL _NearestEnemy); 
			_x doTarget _NearestEnemy; 
			
			//Based off distance - change skill
			private _Dist = _x distance2D _NearestEnemy;
			if (_Dist > 50) then
			{
				private _SkillSet = linearConversion[1000, 2000,_Dist,1, 0.5, true];
				_x setSkill ["aimingShake",_SkillSet];
				_x setSkill ["aimingSpeed",_SkillSet];
				_x setSkill ["aimingAccuracy",_SkillSet];
			}
			else
			{
				_x setSkill 0.9;		
				{
					_Unit setSkill _x;
				} forEach VCM_AIDIFA;
				
				
				if (VCM_CLASSNAMESPECIFIC && {count VCM_SKILL_CLASSNAMES > 0}) then
				{
					{
						if (typeOf _x isEqualTo (_x select 0)) exitWith
						{
							_ClassnameSet = true;
							_x setSkill ["aimingAccuracy",((_x select 1) select 0)];_x setSkill ["aimingShake",((_x select 1) select 1)];_x setSkill ["spotDistance",((_x select 1) select 2)];_x setSkill ["spotTime",((_x select 1) select 3)];_x setSkill ["courage",((_x select 1) select 4)];_x setSkill ["commanding",((_x select 1) select 5)];	_x setSkill ["aimingSpeed",((_x select 1) select 6)];_x setSkill ["general",((_x select 1) select 7)];_x setSkill ["endurance",((_x select 1) select 8)];_x setSkill ["reloadSpeed",((_x select 1) select 9)];
						};
					} foreach VCM_SKILL_CLASSNAMES;
				};			
				
				if (VCM_SIDESPECIFICSKILL) then
				{
					_x call VCM_AISIDESPEC;
				};
				
			};
			
			sleep (2 + RANDOM 4);
			if !(alive _x) then
			{
				if (isNil "_x") then
				{
					private _LOS = lineIntersectsSurfaces [eyePos _x, eyePos _NearestEnemy, (vehicle _NearestEnemy), _x, true, 1,"VIEW","GEOM"];
					if ((count _LOS) < 1) then
					{
						private _FireModes = (getArray (configFile >> "CfgWeapons" >> currentWeapon _x >> "modes"));
						_x forceWeaponFire [ primaryWeapon _x,(selectrandom _FireModes)];
						_x spawn {sleep 2;if !(unitPos _this isEqualTo "Auto") then {_this setUnitPos "Auto"};};
						_x reveal [_NearestEnemy,4];
					}
					else
					{
						private _IntersectPos = ((_LOS # 0) # 0);
						if (_IntersectPos distance2D _NearestEnemy < 20) then
						{	
							_x setUnitPos "UP";
						};
						private _SA = [];
						{
							if (_x distance2D _NearestEnemy < 20) then 
							{
								_Unit reveal [_x,4];
							};
						} foreach (_NearestEnemy call VCM_fnc_FriendlyArray);		
					};
				};
			};
		} foreach _Snipers;
	
	};
};
