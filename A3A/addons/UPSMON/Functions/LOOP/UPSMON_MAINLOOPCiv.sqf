private ["_cycle","_grp","_members","_grpmission","_grpstatus","_grpid","_Ucthis","_lastcurrpos","_lastpos","_lastattackpos","_areamarker","_npc","_driver","_buildingdist","_deadbodiesnear","_stuck","_makenewtarget","_targetpos","_attackpos","_dist","_target","_wptype","_traveldist","_targetdist","_speedmode","_behaviour","_combatmode","_currPos","_grpcomposition","_typeofgrp","_capacityofgrp","_assignedvehicle","_supstatus","_TargetSearch"];

while {true} do 
{
	_cycle = ((random 1) + 1.5);
	{
		If (!IsNull _x) then
		{
			_grp = _x;
		
			_members = (_grp getvariable "UPSMON_Origin") select 4;

			_grpmission = _grp getvariable "UPSMON_GrpMission";
			_grpstatus = _grp getvariable "UPSMON_Grpstatus";
		
			_grpid = _grp getVariable "UPSMON_grpid";
			_Ucthis = _grp getvariable "UPSMON_Ucthis";
		
			_lastcurrpos = (_grp getvariable "UPSMON_Lastinfos") select 0;
			_lastpos = (_grp getvariable "UPSMON_Lastinfos") select 1;
			_lastattackpos = _grp getvariable ["UPSMON_Lastattackpos",[]];
		
			_areamarker = _Ucthis select 1;
		
			if (({alive _x && !(captive _x)} count units _grp) == 0 ||  _grp getvariable ["UPSMON_Removegroup",false]) exitwith
			{
				[_grp,_UCthis] call UPSMON_RESPAWN;
			}; 	
		
			_npc = leader _grp;
			_driver = driver (vehicle _npc);
		
			// did the leader die?
			_npc = [_npc,_grp] call UPSMON_getleader;							
			if (!alive _npc || isplayer _npc) exitwith {[_grp,_UCthis] call UPSMON_Respawngrp;};			
		
			_buildingdist = 50;
			_deadbodiesnear = false;
			_stuck = false;
			_makenewtarget = false;
			_targetpos = [0,0];
			_Attackpos = [];
			_wptype = "MOVE";
			_targetdist = 1000;
			_traveldist = 0;
			_dist = 10000;
			_safemode = ["CARELESS","SAFE"];
		
			_target = ObjNull;
			
			_speedmode = speedmode _npc;
			_behaviour = behaviour _npc;
			_combatmode = "YELLOW";
		

			// current position
			_currPos = getposATL _npc;

			If (count(waypoints _grp) != 0) then
			{
				_wppos = waypointPosition [_grp,count(waypoints _grp)-1];
				_targetpos = _wppos;
				_wptype = waypointType [_grp,count(waypoints _grp)-1];
				_targetdist = [_currpos,_targetpos] call UPSMON_distancePosSqr;
			};
		
			_grpcomposition = [_grp] call UPSMON_analysegrp;
			_typeofgrp = _grpcomposition select 0;
			_capacityofgrp = _grpcomposition select 1;
			_assignedvehicle = _grpcomposition select 2;
	
			_supstatus = [_grp] call UPSMON_supstatestatus;
			_nowp = [_grp,_target,_supstatus] call UPSMON_NOWP;
		
		If (_grp getvariable ["UPSMON_GrpHostility",0] > 0) then
		{
			_TargetSearch 	= [_grp,_areamarker] call UPSMON_TargetAcquisitionCiv;
			_target = _TargetSearch select 0;
			_dist = _TargetSearch select 1;
			_attackpos = _TargetSearch select 2;
		
			If (_grp getvariable ["UPSMON_Grpmission",""] != "HARASS") then
			{
				If (!Isnull _target) then
				{
					_grp setvariable ["UPSMON_Grpmission","HARASS"]
				};
			}
			else
			{
				If (Isnull _target) then
				{
					[_grp] call UPSMON_BackToNormal;
				};		
			};
		};
	
		//If in safe mode if find dead bodies change behaviour
		{
			if (alive _x) then
			{
				if (vehicle _x == _x) then
				{
					If (!(_x getvariable ["UPSMON_Civfleeing",false])) then
					{
						If ((_x getvariable ["UPSMON_SUPSTATUS",""]) == "") then
						{
							If (UPSMON_deadBodiesReact)then 
							{
								_dead = [_x,_buildingdist] call UPSMON_deadbodies;
								if (!IsNull _dead) exitwith 
								{
									["FLEE",_x,Objnull] spawn UPSMON_Civaction;
								};
							};	
						}
						else
						{
							["FLEE",_x,Objnull] spawn UPSMON_Civaction;
						};
					
					};
				};
			};
		} foreach units _grp;
			
		//Stuck control
		If (!(_npc getvariable ["UPSMON_Civdisable",false])) then
		{
			_stuck = [_npc,_lastcurrpos,_currpos] call UPSMON_Isgrpstuck;
		};
		
//*********************************************************************************************************************
// 											ORDERS	
//*********************************************************************************************************************	
		
		switch (_grp getvariable "UPSMON_GrpMission") do 
		{	
			case "PATROL":
			{
				_speedmode = Speedmode _npc;
				_behaviour = Behaviour _npc;
				_wpformation = Formation _npc;
					
				If (!(_grp getvariable ["UPSMON_InTransport",false])) then
				{

					If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
					{
						If (!([_targetpos,_areamarker] call UPSMON_pos_fnc_isBlacklisted) 
							|| _stuck
							|| _targetdist <= 5
							|| count(waypoints _grp) == 0 
							|| ((("tank" in _typeofgrp) || ("ship" in _typeofgrp) || ("apc" in _typeofgrp) ||("car" in _typeofgrp)) && _targetdist <= 25)
							|| (("air" in _typeofgrp && !(_grp getVariable ["UPSMON_landing",false])) && (_targetdist <= 70 || Unitready _driver))) then
						{
							_makenewtarget=true;
						};
					};
				};
					
				// Search new patrol pos
				if (_makenewtarget) then
				{
					if (UPSMON_Debug > 0) then {diag_log format ["Grp%1 search newpos",_grp getvariable ["UPSMON_grpid",0]];};
					[_grp,_wpformation,_speedmode,_areamarker,_Behaviour,_combatmode,_typeofgrp] spawn UPSMON_DOPATROL;
				};					
			};
		
			case "RELAX":
			{
				[_grp,_areamarker] call UPSMON_DORELAX;
			};
		
			case "HARASS":
			{
				{
					If (alive _x) then
					{
						If (canmove _x) then
						{
							If (vehicle _x == _x) then
							{
								If (!(_x getvariable ["UPSMON_Civfleeing",false])) then
								{
									If (_x getvariable ["UPSMON_Throwstone",time] <= time) then
									{
										If (!IsNull _target) then
										{
											If (_dist > 100 && !([_x,_target,100,130] call UPSMON_Haslos)) then
											{
												If (_x getvariable ["UPSMON_Civdisable",false]) then 
												{
													_x switchmove "";
													_x enableAI "MOVE";
													_x setvariable ["UPSMON_Civdisable",false];	
												};
											
												If (_x getvariable ["UPSMON_Movingtotarget",time] <= time) then
												{
													Dostop _x;
													_x domove _attackpos;
													_x setDestination [_attackpos, "LEADER PLANNED", true];
													_time = time + 120;
													_x setvariable ["UPSMON_Movingtotarget",_time];
												};
											}
											else
											{
												[_x,_attackpos] spawn UPSMON_throw_stone;
											};
										};
									};
								};
							};
						};
					};
					sleep 0.2;
				} foreach units _grp;
			};		
		
			case "STATIC":
			{
			
			};
					
		};
	
		If (count(waypoints _grp) != 0) then
		{
			_wppos = waypointPosition [_grp,count(waypoints _grp)-1];
			_targetpos = _wppos;
			_wptype = waypointType [_grp,count(waypoints _grp)-1];
			_targetdist = [_currpos,_targetpos] call UPSMON_distancePosSqr;
		};
		
		if (!_nowp) then
		{
			If (_grp getvariable "UPSMON_GrpMission" == "PATROL") then
			{
///////////////////////////////////////////////////////////////////////////
///////////					Disembarking 				//////////////////
//////////////////////////////////////////////////////////////////////////
		
				If (!(_grp getvariable ["UPSMON_disembarking",false])) then
				{
					If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
					{
						If (_targetpos select 0 != 0 && _targetpos select 1 != 0) then 
						{
							If (!(_npc getvariable ["UPSMON_Civfleeing",false])) then
							{
								If (count _assignedvehicle > 0) then
								{
									[_grp,_assignedvehicle,_dist,_targetdist,_supstatus] call UPSMON_Disembarkment;
								};
							};
						};
					};
				};
///////////////////////////////////////////////////////////////////////////
///////////					Embarking 				     //////////////////
//////////////////////////////////////////////////////////////////////////

				If (!(_grp getvariable ["UPSMON_embarking",false])) then
				{
					if (!(_grp getvariable ["UPSMON_Disembarking",false])) then
					{
						If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
						{
							If (!(_grp getVariable ["UPSMON_landing",false])) then
							{
								[_grp,_typeofgrp,_targetpos,_dist,_targetdist,_assignedvehicle,_supstatus,_speedmode,_behaviour] call UPSMON_Embarkment;
							};
						};
					};
				};
			};
		};// !NOWP
		
		if (({alive _x && !(captive _x)} count units _grp) == 0 ||  _grp getvariable ["UPSMON_Removegroup",false]) exitwith
		{
			[_grp,_UCthis] call UPSMON_RESPAWN;
		}; 	
		
		_grp setvariable ["UPSMON_Grpstatus",_grpstatus];
		_grp setvariable ["UPSMON_Lastinfos",[_currpos,_targetpos]];
		_grp setvariable ["UPSMON_Lastattackpos",_attackpos];
		_grp setvariable ["UPSMON_LastGrpmission",_grp getvariable ["UPSMON_Grpmission",""]];
		
		sleep 0.1;
		
		};
		
	} foreach UPSMON_Civs;
	If (ObjNull in UPSMON_NPCs) then {UPSMON_NPCs = UPSMON_NPCs - [ObjNull]};
	sleep _cycle;
};