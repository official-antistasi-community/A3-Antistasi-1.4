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
****************************************************************/
private ["_grp","_timeontarget","_react","_npc","_target","_opfknowval","_attackPos","_Enemies","_Allies","_targetsnear","_Units","_dist","_newattackPos","_newtarget"];
	
_grp = _this select 0;
_accuracy = 1000;

_npc = leader _grp;
	
_target = objNull;
_opfknowval = 0;
_attackPos = [];
_Enemies = [];
_Allies = [];
_targetsnear = false;

//Resets distance to target
_dist = 10000;
	
///       GET ENEMIES AND ALLIES UNITS NEAR THE LEADER 			////		
_Units = [_npc] call UPSMON_findnearestenemy;
_Enemies = _Units select 0;
_Allies = _Units select 1;
_suspectenies = _Units select 2;

_grp setvariable ["UPSMON_GrpEnies",_Enemies];
If (count _Enemies == 0) then
{
	// Share the enemies infos we found with our allies
	If (_grp getvariable ["UPSMON_Shareinfos",false]) then
	{
		_enemies = [_npc] call UPSMON_Shareinfos;
	};
};

///      ENEMIES FOUND, the first of the list is our enemy now :p 			////	
If (count _Enemies > 0) then
{
	//Get the most dangerous in the list of enies
	_Enemies = [_grp,_Enemies] call UPSMON_Classifyenies;
	_target = _Enemies select 0;

	If (!IsNull _target) then
	{
		_opfknowval = (_target getvariable "UPSMON_TargetInfos") select 3;
		If (_npc knowsAbout _target < _opfknowval) then
		{
			_npc reveal [_target,_opfknowval];
		};
		_attackPos = (_target getvariable "UPSMON_TargetInfos") select 0;
		_grp setvariable ["UPSMON_Attackpos",_attackpos];
		If (_grp getvariable ["UPSMON_Grptarget",ObjNull] != _target) then
		{
			_grp setvariable ["UPSMON_TIMEONTARGET",time];
			_grp setvariable ["UPSMON_Grptarget",_target];
		};
	};
};

//
if (!IsNull (_grp getvariable ["UPSMON_Grptarget",ObjNull])) then 
{
	If (!alive (_grp getvariable ["UPSMON_Grptarget",ObjNull])) then
	{
		_grp setvariable ["UPSMON_Grptarget",ObjNull];
	};
};	
		
If (count _attackpos == 0) then
{
	_attackpos = _grp getvariable ["UPSMON_Attackpos",[]];
};

If (count _attackpos > 0) then
{
	_grp setvariable ["UPSMON_GrpStatus","YELLOW"];
	_dist = ([getposATL _npc,_attackPos] call UPSMON_distancePosSqr);
	if (UPSMON_Debug > 0) then {[_attackPos,"ICON","Hd_dot","ColorRed",format ["Group:%1 Time:%2",_grp getvariable ["UPSMON_Grpid",0],time]] call UPSMON_createmarker;};
};

If (_dist <= 300) then {_targetsnear = true;};
		
_result = [_Enemies,_Allies,_target,_dist,_targetsnear,_attackPos,_suspectenies,_opfknowval];
		
_result