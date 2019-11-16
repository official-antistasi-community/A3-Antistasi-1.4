/****************************************************************
File: UPSMON_TargetAcquisition.sqf
Author: Azroul13

Description:

Parameter(s):
	<--- Group
	<--- Does the group share enemy info
	<--- Radius where Enemys is consider closed to the group
	<--- Time 
	<--- Last time group share infos
	<--- 
Returns:
	---> Enemies Array
	---> Allies Array
	---> nearest target
	---> Distance from target
	---> how much group know about target
	---> Is target near to the group (less than 300m)
	---> known position of the target
	--->
****************************************************************/
private ["_grp","_timeontarget","_npc","_target","_attackPos","_Enemies","_Units","_dist"];
	
_grp = _this select 0;
_areamarker = _this select 1;

_npc = leader _grp;
	
_target = objNull;
_attackPos = [];
_Enemies = [];

//Resets distance to target
_dist = 10000;
	
///       GET ENEMIES AND ALLIES UNITS NEAR THE LEADER 			////		
_targets = _npc nearTargets 500;
	
_enemysides = [];
If (_grp getvariable ["UPSMON_GrpHostility",0] > UPSMON_WEST_HM) then {_enemysides pushback WEST};
If (_grp getvariable ["UPSMON_GrpHostility",0] > UPSMON_EAST_HM) then {_enemysides pushback EAST};
If (_grp getvariable ["UPSMON_GrpHostility",0] > UPSMON_GUER_HM) then {_enemysides pushback Resistance};
	
{
	_position = (_x select 0);
	_cost = (_x select 3);
	_unit = (_x select 4);
	_side = (_x select 2);
	_accuracy = (_x select 5);
		
	If (_side in _enemySides) then
	{
		If (alive _unit) then
		{
			If (alive _npc) then
			{
				if (vehicle _unit == _unit) then
				{
					If ([_position,_areamarker] call UPSMON_pos_fnc_isBlacklisted) then
					{
						if (_accuracy < 20) then
						{
							_enemies pushback [_unit,_position];
						};
					};
				};
			};
		};
	};	
} forEach _targets;


///      ENEMIES FOUND, the first of the list is our enemy now :p 			////	
If (count _Enemies > 0) then
{
	//Get the most dangerous in the list of enies
	_Enemies = [_Enemies, [], {(_x select 1) vectordistance getposATL _npc}, "ASCEND"] call BIS_fnc_sortBy;
	_target = (_Enemies select 0) select 0;
	If (!IsNull _target) then
	{
		_attackPos = (_Enemies select 0) select 1;
		_grp setvariable ["UPSMON_Attackpos",_attackpos];
	};

	// Let's check if we have a more dangerous threat
};

//
if (!isNull (_target)) then 
{
	If (alive _target) then
	{
		If ((_grp getvariable ["UPSMON_Grptarget",ObjNull]) != _target) then
		{
			_timeontarget = time;
			_grp setvariable ["UPSMON_TIMEONTARGET",_timeontarget];
			_grp setvariable ["UPSMON_Grptarget",_target];
		};
	};
};	
		
If (count _attackpos == 0) then
{
	_attackpos = _grp getvariable ["UPSMON_Attackpos",[]];
};

If (count _attackpos > 0) then
{
	_dist = ([getposATL _npc,_attackPos] call UPSMON_distancePosSqr);
};
		
_result = [_target,_dist,_attackPos];
		
_result