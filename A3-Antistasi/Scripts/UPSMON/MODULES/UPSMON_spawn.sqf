
/****************************************************************
File: UPSMON_spawn.sqf
Author: Monsada

Description:
	The script will spawn a squad based on a template.
	Called by the mission creator:
	nul = [1,[0,0,0],3,[mark, upsmon optional params]] EXECVM "SCRIPTS\UPSMON\MODULES\UPSMON_SPAWN.SQF";
	
Parameter(s):
	<--- Id of the template to copy.
	<--- Position to create new squad.
	<--- Number of squads to create
	<--- Array of parameters of UPSMON, first must be name of marker to patrol
Returns:
	nothing
****************************************************************/
 
 //if (!isserver) exitWith {}; 
if (!isServer) exitWith {};

//Waits until UPSMON is init
waitUntil {!isNil("UPSMON_INIT")};
waitUntil {UPSMON_INIT==1};	
private ["_template","_position","_params","_copies","_membertypes","_unittype","_side","_UCthis","_initstr","_grp","_lead","_newunit","_i","_newpos","_vehicle","_initlstr"];

//Parameter reading
_template  = _this select 0;
_position = _this select 1;
_copies = _this select 2;
_params = _this select 3;

//Initialization
_membertypes = [];
_side = "";
_UCthis = [];
_initstr = "";
_initlstr = "";
_grp = grpnull;
_lead = objnull;
_newunit = objnull;
_newpos=[];
_vehicle=[];

//Gets parameters of UPSMON
for [{_i=0},{_i<count _params},{_i=_i+1}] do {_e=_params select _i; if (_e isEqualType "STRING") then {_e=toUpper(_e)};_UCthis set [_i,_e]};
_initstr = ["INIT:","",_UCthis] call UPSMON_getArg;
_initlstr = ["INITL:","",_UCthis] call UPSMON_getArg;
_initlstr = _initlstr + _initstr;
_spawned= if ("SPAWNED" in _UCthis) then {true} else {false};
if (!_spawned) then {_UCthis = _UCthis + ["SPAWNED"]};	

if (UPSMON_Debug>0) then {player globalchat format["Spawning %3 copies of template %1",_template,_position,_copies,count UPSMON_TEMPLATES]};	
if (UPSMON_Debug>0) then {diag_log format["Spawning %3 copies of template %1 on %2 templates %4",_template,_position,_copies,UPSMON_TEMPLATES]};	
	
//Search if any template	
{
	if ((_x select 0) == _template) then 
	{
		_side = _x select 1;
		_membertypes = _x select 2;	
		_vehicletypes = _x select 3;	
		//Gets leader type		
		if (UPSMON_Debug>0) then {diag_log format["template %1 side %2 membertypes %3",_template,_side,_membertypes]};	
		//if (UPSMON_Debug>0) then {player globalchat format["template %1:%2 ",_template,_membertypes]};	
		// any init strings?
		_initstr = ["INIT:","",_UCthis] call UPSMON_getArg;
		
		for [{_i=1},{_i<=_copies},{_i=_i+1}] do 
		{
	
			// make the clones civilians
			// use random Civilian models for single unit groups
			//if ((_side == "Civilian") && (count _members==1)) then {_rnd=1+round(random 20); if (_rnd>1) then {_unittype=format["Civilian%1",_rnd]}};
			
			_grp=createGroup _side;
			
		_lead = ObjNull;
		// copy team members (skip the leader)
		_c=0;
		{
			_unittype = _x select 0;
			_roletype = _x select 2;
			_targetpos = _orgpos findEmptyPosition [5,50];
			if (count _targetpos == 0) then {_targetpos = _orgpos};
			_newunit = _grp createUnit [_unittype, _targetpos, [], 0, "FORM"];
			_equipment = _x select 1;
			[_newunit,_equipment] call UPSMON_addequipment;
					
			if (isMultiplayer) then 
			{
				[netid _newunit, _initstr] remoteExec ["UPSMON_fnc_setVehicleInit", 0,true];
			} else 
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
		} foreach _membertypes;
			

			{		
				_vehicle = _x;
				_targetpos = _orgpos findEmptyPosition [10, 200];
				sleep .4;
				if (count _targetpos <= 0) then {_targetpos = _orgpos};
				//if (UPSMON_Debug>0) then {player globalchat format["%1 create vehicle _newpos %2 ",_x,_targetpos]};	
				_newunit = (_x select 0) createvehicle (_targetpos);
				_newunit setdir (_x select 1);
				_crews = _x select 2;
				{
					_crew = _x select 1;
					_role = (_x select 2) select 0;
					_newunit = _grp createUnit [_crew, _orgpos, [], 0, "FORM"];
					switch (_role) do 
					{
						case "Driver":
						{
							_newunit moveindriver _vehicle
						};
						case "COMMANDER":
						{
							_newunit moveincommander _vehicle
						};
						case "TURRET":
						{
							_newunit moveInTurret [_vehicle,(_x select 2) select 1]
						};
					};
				} foreach _crews;	
			} foreach _vehicletypes;			
			
			//Set new parameters			
			_params = [_lead] + _UCthis;						
			
			//Exec UPSMON script			
			_params SPAWN UPSMON;
		};
	};
}foreach UPSMON_TEMPLATES;

if (true) exitwith{};