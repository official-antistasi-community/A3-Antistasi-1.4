/****************************************************************
File: UPSMON_Clones.sqf
Author: Monsada

Description:
	The script will create X Group with the same parameters and unit than the group of reference

Parameter(s):
	<--- Parameters of the original group
	<--- Minimum number of group to create
	<--- Maximum number of group to create
Returns:
	nothing
****************************************************************/

private ["_Ucthis","_mincopies","_maxcopies","_copies","_grpcnt","_unittype","_grp","_lead","_initstr","_members","_newunit"];

_Ucthis = _this select 0;
_mincopies = _this select 1;
_maxcopies = _this select 2;

_npc = _Ucthis select 0;
_grp = group _npc;
_members = (_this select 3) select 0;
_grpcnt = count units _npc;
_orgPos = (_grp getvariable "UPSMON_Origin") select 0;
_behaviour = (_grp getvariable "UPSMON_Origin") select 1;
_speedmode = (_grp getvariable "UPSMON_Origin") select 2;
If (UPSMON_Debug > 0) then {diag_log format ["%1 copy",_npc];};
_copies=_mincopies+random (_maxcopies-_mincopies);
	
// create the clones
for "_grpcnt" from 1 to _copies do 
{
	// copy groups
	if (isNil ("UPSMON_grpindex")) then {UPSMON_grpindex = 0}; 
	UPSMON_grpindex = UPSMON_grpindex+1;
	
	_grp=createGroup (side _npc);
	// make the clones civilians
	// use random Civilian models for single unit groups
	// any init strings?
	_initstr = ["INIT:","",_UCthis] call UPSMON_getArg;			
	_lead = ObjNull;
	// copy team members (skip the leader)
	_c=0;
	{	
		_unittype = _x select 0;
		if (((side _npc) == Civilian) && (count _members==1)) then {_rnd=1+round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
		_roletype = _x select 2;
		_targetpos = _orgpos findEmptyPosition [5,50];
		if (count _targetpos == 0) then {_targetpos = _orgpos};
		_newunit = _grp createUnit [_unittype, _targetpos, [], 0, "FORM"];
		_newunit setBehaviour _behaviour;
		_newunit setSpeedMode _speedmode;	
		_equipment = _x select 1;
		[_newunit,_equipment] call UPSMON_addequipment;
					
		if (isMultiplayer) then 
		{
			[netid _newunit, _initstr] remoteExec ["UPSMON_fnc_setVehicleInit", 0,true];
		} 
		else 
		{
			_unitstr = "_newunit";
			_index=[_initstr,"this",_unitstr] call UPSMON_Replace;
			call compile format ["%1",_index];
		};
				
		If (count _roletype > 0) then
		{
			_crews pushback [_newunit,_roletype];
		};
				
		[_newunit] join _grp;
		If (_c == 0) then
		{
			_grp selectLeader _newunit;
			_lead = _newunit;
		};
		_c=_c+1;
		sleep 0.1;
	} foreach _members;	
	
	_Ucthis set [0,_lead];
	nul= _Ucthis spawn UPSMON;
	//sleep .05;
};	
sleep .05;