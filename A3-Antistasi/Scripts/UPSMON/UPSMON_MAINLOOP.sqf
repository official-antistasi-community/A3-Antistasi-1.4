while {true} do
{
	_cycle = ((random 1) + 1);
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
			_surrended = false;

			if (({alive _x && !(captive _x)} count units _grp) == 0 ||  _grp getvariable ["UPSMON_Removegroup",false]) exitwith
			{
				[_grp,_UCthis] call UPSMON_RESPAWN;
			};

			_npc = leader _grp;
			_driver = driver (vehicle _npc);

			// did the leader die?
			_npc = [_npc,_grp] call UPSMON_getleader;
			if (!alive _npc || isplayer _npc) exitwith {[_grp,_UCthis] call UPSMON_RESPAWN;};

			_buildingdist = 50;
			_deadbodiesnear = false;
			_stuck = false;
			_makenewtarget = false;
			_haslos = false;
			_terrainscan = ["meadow",10];
			_targetpos = [0,0];
			_Attackpos = [];
			_opfknowval = 0;
			_wptype = "MOVE";
			_targetdist = 1000;
			_traveldist = 0;
			_dist = 10000;
			_ratio = 0.5;
			_safemode = ["CARELESS","SAFE"];

			_target = ObjNull;
			_typeofeni = [];

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
			_weaponrange = _grpcomposition select 3;

			_supstatus = [_grp] call UPSMON_supstatestatus;
			_nowp = [_grp,_target,_supstatus] call UPSMON_NOWP;

		If (_grp getvariable ["UPSMON_NOAI",false]) then
		{
			_fixedtargetPos = [_grp,_lastpos] call UPSMON_GetReinfPos;
			if (count _fixedtargetPos > 0) then {_targetpos = _fixedtargetPos;};

			_terrainscan = _currpos call UPSMON_sample_terrain;
			_unitsneedammo = [_npc] call UPSMON_checkmunition;
			_vehiclesneedsupply = [_assignedvehicle] call UPSMON_Checkvehiclesstatus;

//*********************************************************************************************************************
// 											Acquisition of the target
//*********************************************************************************************************************
			_TargetSearch 	= [_grp] call UPSMON_TargetAcquisition;
			_Enemies 		= _TargetSearch select 0;
			_Allies 		= _TargetSearch select 1;
			_target 		= _TargetSearch select 2;
			_dist 			= _TargetSearch select 3;
			_targetsnear 	= _TargetSearch select 4;
			_attackPos 		= _TargetSearch select 5;
			_suspectenies	= _TargetSearch select 6;
			_opfknowval 	= _TargetSearch select 7;

			if (_opfknowval > 0) then
			{
				If (_grp getvariable ["UPSMON_lastOpfknowval",0] < _opfknowval) then
				{
					_timeontarget = (_grp getvariable ["UPSMON_TIMEONTARGET",time]) - 10;
					_grp setvariable ["UPSMON_TIMEONTARGET",_timeontarget];
				};
			};
//*********************************************************************************************************************
// 											Reactions
//*********************************************************************************************************************

			_nowp = [_grp,_target,_supstatus] call UPSMON_NOWP;

			If (!IsNull _target) then
			{
				_grp setvariable ["UPSMON_Grpstatus","RED"];

				_haslos = [_npc,_target,_weaponrange,130] call UPSMON_Haslos;

				//Analyse Targets && Allies
				_Situation = [_grp,_Allies,_Enemies] call UPSMON_Checkratio;
				_ratio = _Situation select 0;
				_enicapacity = _Situation select 1;
				_typeofeni = _Situation select 2;

				//Retreat
				[_grp,_dist,_ratio,_supstatus,_unitsneedammo,_typeofgrp,_attackpos,_assignedvehicle] call UPSMON_IsRetreating;

				//Surrender
				[_grp,_dist,_ratio,_supstatus,_unitsneedammo,_typeofgrp,_haslos] call UPSMON_IsSurrending;

				If (_grp getvariable ["UPSMON_Grpmission",""] == "SURRENDER") exitwith {[_grp] call UPSMON_surrended;};

				// Artillery Support
				_artillery = [_grp] call UPSMON_ArtiChk;
				If (_artillery) then
				{
					[_grp,_currpos,_attackpos,_dist,_enies] call UPSMON_FO;
				};

				// Reinforcement Support
				_reinf = [_grp,_ratio,_typeofgrp] call UPSMON_ReinfChk;
				If (_reinf) then
				{
					[_grp,_currpos,_attackpos,_radiorange,_enicapacity] spawn UPSMON_CallRenf;
				};
			};

			if (_supstatus == "SUPRESSED") then
			{
				_timeontarget = (_grp getvariable ["UPSMON_TIMEONTARGET",time]) + 30;
				_grp setvariable ["UPSMON_TIMEONTARGET",_timeontarget];
			};

			_nowp = [_grp,_target,_supstatus] call UPSMON_NOWP;
			_maneuver = [_grp,_nowp,_attackpos,_typeofgrp] call UPSMON_Cangrpmaneuver;

			If (_maneuver) then
			{
				If ("air" in _typeofgrp) then
				{
					[_grp,_attackpos,_lastattackpos,_typeofgrp,_dist] call UPSMON_PLANASSLT;
					_grp setvariable ["UPSMON_Grpmission","ASSAULT"];
					_grpstatus = "PURPLE";
				}
				else
				{
					If ("ship" in _typeofgrp) then
					{
						If (_dist < 300 && (surfaceIsWater _attackpos)) then
						{
							[_grp,_attackpos,_lastattackpos,_typeofgrp,_dist] call UPSMON_PLANASSLT;
							_grp setvariable ["UPSMON_Grpstatus","BLACK"];
						}
						else
						{
							[_grp,_attackpos,_lastattackpos,_dist,_typeofgrp,_terrainscan,_areamarker,_haslos] call UPSMON_PLANFLANK;
						};
					}
					else
					{
						If (_ratio < 1.2 && (_supstatus != "SUPRESSED")) then
						{
							_inmarker =  [_attackpos,_areamarker] call UPSMON_pos_fnc_isBlacklisted;
							// Offensive Behaviour
							If (_dist <= 300 && ({alive _x && !(captive _x)} count units _grp) >= 4 && !("arti" in _typeofgrp)  && (!(_grp getvariable ["UPSMON_NOFOLLOW",false]) || !_inmarker)) then
							{
								//Assault
								If ("car" in _typeofgrp && !("infantry" in _typeofgrp)) then
								{
									_terrainscantarget = _attackpos call UPSMON_sample_terrain;

									If (((_terrainscantarget) select 0 == "inhabited" || (_terrainscantarget) select 0 == "forest") && (_terrainscantarget) select 1 > 100) then
									{
										[_grp,_attackpos,_lastattackpos,_dist,_typeofgrp,_terrainscan,_areamarker,_haslos] call UPSMON_PLANFLANK;
									}
									else
									{
										[_grp,_attackpos,_lastattackpos,_typeofgrp,_dist] call UPSMON_PLANASSLT;
										_grp setvariable ["UPSMON_Grpstatus","BLACK"];
									};
								}
								else
								{
									[_grp,_attackpos,_lastattackpos,_typeofgrp,_dist,_targetdist] call UPSMON_PLANASSLT;
									_grp setvariable ["UPSMON_Grpstatus","BLACK"];
								};
							}
							else
							{
								If (("staticbag" in _typeofgrp) || (_grp getvariable ["UPSMON_NOFOLLOW",false] && _inmarker)) then
								{
									If ((_haslos && _dist <= _weaponrange && _dist > 300)  || (_grp getvariable ["UPSMON_NOFOLLOW",false] && _inmarker)) then
									{
										//SUPPORT
										//[_grp] call UPSMON_PLANSPT;
										if (_wptype != "HOLD") then
										{
											_timeorder = time + 15;
											_grp setvariable ["UPSMON_TIMEORDER",_timeorder];
											[_grp,_currpos,"HOLD","LINE","LIMITED","STEALTH","YELLOW",1] call UPSMON_DocreateWP;
										};
										_grp setvariable ["UPSMON_Grpmission","SUPPORT"];
										_grp setvariable ["UPSMON_Grpstatus","PURPLE"];
									}
									else
									{
										//FLANK
										[_grp,_attackpos,_lastattackpos,_dist,_typeofgrp,_terrainscan,_areamarker,_haslos,_targetpos,_currpos] call UPSMON_PLANFLANK;
									};
								}
								else
								{
									//FLANK
									[_grp,_attackpos,_lastattackpos,_dist,_typeofgrp,_terrainscan,_areamarker,_haslos,_targetpos,_currpos] call UPSMON_PLANFLANK;
								};
							};
						}
						else
						{
							//Defensive Behaviour
							if (_wptype != "HOLD") then
							{
								[_grp,_dist,_target,_supstatus,_terrainscan] spawn UPSMON_DODEFEND;
								_timeorder = time + 5;
								_grp setvariable ["UPSMON_TIMEORDER",_timeorder];
							};
							_grp setvariable ["UPSMON_Grpmission","DEFEND"];
						};
					};
				};
			};

			If (IsNull _target) then
			{
				If (count (_grp getvariable ["UPSMON_attackpos",[]]) == 0) then
				{
					If (count _suspectenies > 0) then
					{
						_suspectenies = [_suspectenies, [], { _currpos distance ((_x getvariable "UPSMON_TargetInfos") select 0)}, "ASCEND"] call BIS_fnc_sortBy;
						_suspectpos = ((_suspectenies select 0) getvariable "UPSMON_TargetInfos") select 0;
						_grp setvariable ["UPSMON_SuspectPos",_suspectpos];
					};
				};

				If (_supstatus != "" || count (_grp getvariable ["UPSMON_SuspectPos",[]]) > 0) then
				{
					_artipos = _grp getvariable ["UPSMON_SuspectPos",[]];

					If (count _artipos > 0) then
					{
						[_grp,(_grp getvariable "UPSMON_SuspectPos"),_currpos] call UPSMON_GETINPATROLSRCH;
					};
					If ([] call UPSMON_Nighttime) then
					{
						If (!(UPSMON_FlareInTheAir)) then
						{

							If (count _artipos == 0) then
							{
								_artipos = [_currpos,[100,200],[0,360],0,[0,100],0] call UPSMON_pos;
							};

							If (count _artipos > 0) then
							{
								_artillery = [_grp] call UPSMON_ArtiChk;
								If (_artillery) then
								{
									[_grp,_currpos,_artipos,_dist,_enies,"ILLUM"] call UPSMON_FO;
								}
								else
								{
									If (_supstatus != "SUPRESSED") then
									{
										//Fire Flare
										[_grp,_artipos] call UPSMON_FireFlare;
									};
								};
							};
						};
					}
					else
					{
						If (_supstatus == "SUPRESSED") then
						{
							_smokepos = _grp getvariable ["UPSMON_SuspectPos",[]];
							If (count _smokepos == 0) then
							{
								_smokepos = [_currpos,[30,100],[0,360],0,[0,100],0] call UPSMON_pos;
							};

							If (count _smokepos > 0) then
							{
								_nosmoke = [_grp] call UPSMON_NOSMOKE;
								If (!_nosmoke) then {[units _grp,_smokepos] spawn UPSMON_CreateSmokeCover;};
							};
						};
					};
				};
			};

			_targetdist = [_currpos,_targetpos] call UPSMON_distancePosSqr;

			[_grp,_supstatus,_attackpos,_dist,_terrainscan,_haslos,_typeofgrp] call UPSMON_ChangeFormation;

			If ("arti" in _typeofgrp) then
			{
				If (_grp getvariable ["UPSMON_Grpmission",""] != "RETREAT") then
				{
					If (!(_grp getvariable ["UPSMON_OnBattery",false])) then
					{
						If (count _attackpos > 0 || count (_grp getvariable ["UPSMON_Artifiremission",[]]) > 0) then
						{
							_artitarget = _attackpos;
							If (count (_grp getvariable ["UPSMON_Artifiremission",[]]) > 0) then {_artitarget = (_grp getvariable ["UPSMON_Artifiremission",[]]) select 0;};
							[_grp,_typeofgrp,_nowp,_artitarget] spawn UPSMON_artillerysetbattery;
							if (_grp getvariable ["UPSMON_Grpmission",""] != "FIREMISSION") then
							{
								_grp setvariable ["UPSMON_Grpmission","FIREMISSION"];
							};
						};
					};
				};
			};

			If (_grp getvariable ["UPSMON_TRANSPORT",false]) then
			{
				If (!(_grp getvariable ["UPSMON_GrpInAction",false])) then
				{
					If (count (_grp getvariable ["UPSMON_Transportmission",[]]) > 0) then
					{
						_grp setvariable ["UPSMON_Grpmission","TRANSPORT"];
					};
				};
			};

			If (_grp getvariable ["UPSMON_Supply",false]) then
			{
				If (!(_grp getvariable ["UPSMON_GrpInAction",false])) then
				{
					If (count (_grp getvariable ["UPSMON_Supplymission",[]]) > 0) then
					{
						_grp setvariable ["UPSMON_Grpmission","SUPPLY"];
					};
				};
			};

			If (_grpstatus == "GREEN") then
			{
				_dead = ObjNull;
				//If in safe mode if find dead bodies change behaviour
				if (UPSMON_deadBodiesReact)then
				{
					{
						if (alive _x) then
						{
							if (vehicle _x == _x) then
							{
								_dead = [_x,_buildingdist] call UPSMON_deadbodies;
								if (!IsNull _dead) exitwith
								{
									_deadbodiesnear = true;
									_grp setvariable ["UPSMON_Grpstatus","YELLOW"];
								};
							};
						};
					} foreach units _grp;

					If (_deadbodiesnear) then
					{
						[_grp,getposATL _dead,_currpos] call UPSMON_GETINPATROLSRCH;
					};
				};

				//Stuck control
				_stuck = [_npc,_lastcurrpos,_currpos] call UPSMON_Isgrpstuck;
			}
			else
			{
				If (IsNull _target) then
				{
					_grpstatus = "YELLOW";
				};
			};

		}; // End NOAI

		If ("air" in _typeofgrp || "car" in _typeofgrp || "tank" in _typeofgrp) then
		{
			If (_grp getvariable ["UPSMON_Grpmission",""] != "RESSUPLY") then
			{
				If ((_grp getvariable ["UPSMON_Grpstatus","GREEN"] == "GREEN") || (_grp getvariable ["UPSMON_Grpmission",""] == "DEFEND") || ("air" in _typeofgrp)) then
				{
					If (_dist > 800) then
					{
						//_supplyunit = [_grp] call UPSMON_getsupply;
						//If (!IsNull _supplyunit) then
						//{
							//_grp setvariable ["UPSMON_Grpmission","RESSUPLY"];
							//_grp setvariable ["UPSMON_SupplyGrp",_supplyunit];
							//_supplypos = [_grp] call UPSMON_GetSupplyPos;
							//_supplyunit setvariable ["UPSMON_Supplymission",[_grp,_vehiclesneedsupply,_supplypos]];
						//}
						//else
						//{
							//If ("air" in _typeofgrp) then
							//{
								//_basepos = (_grp getvariable "UPSMON_Origin") select 0;
								//[_grp,_basepos,"MOVE","COLUMN","FULL","CARELESS","YELLOW",1,UPSMON_flyInHeight] call UPSMON_DocreateWP;
								//_grp setvariable ["UPSMON_Grpmission","RESSUPLY"];
							//}
						//};
					};
				};
			};
		};

//*********************************************************************************************************************
// 											ORDERS
//*********************************************************************************************************************

		switch (_grp getvariable "UPSMON_GrpMission") do
		{
			case "ASSAULT":
			{
				If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
				{
					If (!(_grp  getvariable ["UPSMON_GrpinAction",false])) then
					{
						If (_targetdist <= 300) then
						{
							If (IsNull _target) then
							{
								If (_targetdist <= 100) then
								{
									[_grp,_grp getvariable ["UPSMON_attackpos",[]],_currpos] call UPSMON_GETINPATROLSRCH;
								};
							}
							else
							{
								If (vehicle _target == _target) then
								{
									If ([_target] call UPSMON_Inbuilding) then
									{
										If ((_target getvariable "UPSMON_TargetInfos") select 1 <= 10) then
										{
											If (_dist <= 100) then
											{
												//The target is in a building, what do we do ?
												[_grp,_target,_currpos] spawn UPSMON_AssltBld;
											};
										};
									}
									else
									{
										if (_dist > 50) then
										{
											If (_haslos) then
											{
												//[_grp,_target] spawn UPSMON_Assltposition;
											};
										};
									};
								};
							};
						};
					};
				};
			};

			case "FLANK":
			{
				If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
				{
					If (_targetdist <= 20) then
					{
						If (_grp getvariable "UPSMON_TIMEORDER" <= time) then
						{
							If (IsNull _target) then
							{
								[_grp,_grp getvariable ["UPSMON_attackpos",[]],_currpos] call UPSMON_GETINPATROLSRCH;
							};
						};
					};
				};
			};

			case "SUPPORT":
			{
				If (_targetdist <= 10) then
				{
					If (!IsNull _target) then
					{
						If (!(_grp  setvariable ["UPSMON_GrpinAction",false])) then
						{
							If ("staticbag" in _typeofgrp) then
							{
								//Deploy static
								[_grp,_currpos,_attackpos] call UPSMON_DeployStatic;
							};
						};
					}
					else
					{
						[_grp,(_grp getvariable "UPSMON_Attackpos"),_currpos] call UPSMON_GETINPATROLSRCH;
					};
				};
			};

			case "DEFEND":
			{
				If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
				{
					If (_wptype == "HOLD") then
					{
						If (!(_grp  getvariable ["UPSMON_GrpinAction",false])) then
						{
							If (_supstatus != "SUPRESSED") then
							{
								If (_targetdist <= 100) then
								{
									If (_dist > 500) then
									{
										If ("heavy" in _typeofeni || "medium" in _typeofeni) then
										{
											//Put minefield
											[_grp,_attackpos] call UPSMON_SetMinefield;
										};
									};

									[_grp,_attackpos] spawn UPSMON_FORTIFY;
								};
							};
						};
					};
				};
			};

			case "PATROLSRCH":
			{
				If (count (_grp getvariable ["UPSMON_Alertpos",[]]) > 0) then
				{
					If (_grp getvariable ["UPSMON_SRCHTIME",time] > time) then
					{
						if (!(_grp getvariable ["UPSMON_searchingpos",false])) then
						{
							if (!(_grp getvariable ["UPSMON_Disembarking",false])) then
							{
								If ((_targetpos select 0 == (_grp getvariable "UPSMON_Alertpos") select 0 && _targetpos select 1 == (_grp getvariable "UPSMON_Alertpos") select 1)
									|| _targetdist <= 5
									//|| _stuck
									|| moveToFailed _npc
									|| moveToCompleted _npc
									|| (_grp getvariable ["UPSMON_TIMEONTARGET",0] < time && !("air" in _typeofgrp))
									//|| (("air" in _typeofgrp && !(_grp getVariable ["UPSMON_landing",false])) && (_targetdist <= (30 + (_currpos select 2))))
									|| ("air" in _typeofgrp && _wptype != "LOITER")) then
								{
									[_grp,_grp getvariable "UPSMON_Alertpos",_typeofgrp,_areamarker] spawn UPSMON_DOPATROLSRCH;
								};
							};
						};
					}
					else
					{
						[_grp] spawn UPSMON_BackToNormal;
						_grp setvariable ["UPSMON_Alertpos",[]];
					};
				};
			};

			case "PATROLINBLD":
			{
				If (_targetdist <= 100) then
				{
					If (count (_grp getvariable ["UPSMON_bldposToCheck",[]]) > 0) then
					{
						If (!(_grp getvariable ["UPSMON_InBuilding",false])) then
						{
							_units = [units _grp] call UPSMON_Getunits;
							[_units,_grp getvariable ["UPSMON_bldposToCheck",[]],_grp,55] spawn UPSMON_patrolBuilding;
						}
					}
					else
					{
						_grp setvariable ["UPSMON_Grpmission","PATROLSRCH"];
					};
				};
			};

			case "REINFORCEMENT":
			{
				If (_targetdist <= UPSMON_Closeenough) then
				{
					[_grp,_targetpos,_currpos] call UPSMON_GETINPATROLSRCH;
					_grpstatus = "YELLOW"
				};
			};

			case "AMBUSH":
			{
				_ambush2 = if ("AMBUSH2:" in _UCthis || "AMBUSH2" in _UCthis || "AMBUSHDIR2:" in _UCthis) then {true} else {false};
				_ambushdistance = [_currpos,(_grp getvariable "UPSMON_Positiontoambush")] call UPSMON_distancePosSqr;
				_targetdistance = 1000;
				_targetknowaboutyou = 0;
				_linkactivate = false;

				if (!isnull _target) then {_targetdistance = [_currpos,getposATL _target] call UPSMON_distancePosSqr;_targetknowaboutyou = _target knowsabout _npc;};
				//Ambush enemy is nearly aproach
				//_ambushdist = 50;
				// replaced _target by _NearestEnemy

				If (_grp getvariable ["UPSMON_LINKED",0] > 0) then
				{
					{
						If (side _x == _side) then
						{
							If (round ([_currpos,getposATL (leader _x)] call UPSMON_distancePosSqr) <= (_grp getvariable ["UPSMON_LINKED",0])) then
							{
								If (_x getvariable "UPSMON_AMBUSHFIRE")
								exitwith {_linkactivate = true};
							};
						};
					} foreach UPSMON_NPCs
				};

				If (((_supstatus != "") || _linkactivate || (_grp getvariable ["UPSMON_AMBUSHWAIT",time]) < time)
					|| ((!isNull _target && "Air" countType [_target] == 0)
						&& ((_targetdistance <= _ambushdistance)
						||(round ([getposATL _target,(_grp getvariable "UPSMON_Positiontoambush")] call UPSMON_distancePosSqr) < 10)
						|| (_npc knowsabout _target > 3 && _ambush2)))) then
				{
					sleep ((random 0.5) + 1); // let the enemy then get in the area

					if (UPSMON_Debug>0) then {diag_log format["%1: FIREEEEEEEEE!!! Gothit: %2 linkactivate: %3 Distance: %4 PositionToAmbush: %5 AmbushWait:%6 %7",_grpid,_supstatus,_linkactivate,(_targetdistance <= _ambushdistance),_target distance (_grp getvariable "UPSMON_Positiontoambush") < 20,_grp getvariable ["UPSMON_AMBUSHWAIT",time] < time,(_npc knowsabout _target > 3 && _ambush2)]};

					_npc setBehaviour "COMBAT";
					_npc setcombatmode "YELLOW";
					_grpstatus = "PURPLE";

					{
						If !(isNil "bdetect_enable") then {_x setVariable ["bcombat_task", nil];};
					} foreach units _grp;

					_grp setvariable ["UPSMON_AMBUSHFIRE",true];

					//No engage yet
					_grp setvariable ["UPSMON_grpmission","SUPPORT"];
				};
			};

			case "FORTIFY":
			{
				If (!(IsNull _target)) then
				{
					If (!(_grp getvariable ["UPSMON_Checkbuild",false])) then
					{
						if (behaviour _npc != "COMBAT") then {_npc setbehaviour "COMBAT"};
						[_grp,_dist] call UPSMON_unitdefend;

						If (_grp getvariable ["UPSMON_OrgGrpMission",""] != "FORTIFY") then
						{
							If (_ratio > 1.2) then
							{
								_grp setvariable ["UPSMON_Grpmission","SUPPORT"];
							}
						};
					};
				}
				else
				{
					If (_grp getvariable ["UPSMON_OrgGrpMission",""] != "FORTIFY") then
					{
						[_grp,(_grp getvariable "UPSMON_Attackpos"),_currpos] call UPSMON_GETINPATROLSRCH;
						_grpstatus = "YELLOW"
					};
				};
			};

			case "RETREAT":
			{
				If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
				{
					If (_targetdist <= 50) then
					{
						_grp setvariable ["UPSMON_Grpmission","DEFEND"];
					};
				};
			};

			case "TRANSPORT":
			{
				If (count _assignedvehicle > 0) then
				{
					If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "MoveToRP" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDRP") then
					{
						_grouptransported = [_grp] call UPSMON_CheckTransported;

						If (!IsNull _grouptransported) then
						{
							If (!(_grp getvariable ["UPSMON_embarking",false])) then
							{
								If (_targetdist <= 50) then
								{
									_destination = (_grp getvariable ["UPSMON_Transportmission",[]]) select 1;
									If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "MoveToRP") then
									{
										//Embark group in transport (LAND)
										[_grouptransported,_assignedvehicle,_destination] spawn UPSMON_getinassignedveh;
									};
									If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDRP") then
									{
										if (_currpos select 2 <= 3) then
										{
											//Embark group in transport (HELI)
											[_grouptransported,_assignedvehicle,_destination] spawn UPSMON_getinassignedveh;
										};
									};
								};
							};
						}
						else
						{
							//If there are nobody anymore to transport then return to base
							[_assignedvehicle select 0] call UPSMON_Returnbase;
						};
					};

					If (_targetdist <= 100) then
					{
						If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDING" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDBASE" || ((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDPZ") then
						{
							If (unitReady (driver (_assignedvehicle select 0)) || toUpper(landResult (_assignedvehicle select 0)) != "NOTREADY" || (landResult (_assignedvehicle select 0)) == "") then
							{
								//Make heli land and stop or land and be ready to move :)
								If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDING") then {If (((getposATL (_assignedvehicle select 0)) select 2) > 20) then {(_assignedvehicle select 0) land "GET OUT";}};
								If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDRP") then {If (((getposATL (_assignedvehicle select 0)) select 2) > 20) then {(_assignedvehicle select 0) land "GET IN";}};
								If (((_grp getvariable ["UPSMON_Transportmission",[]]) select 0) == "LANDBASE") then {(_assignedvehicle select 0) land "LAND";};
							};
						};
					};
				}
				else
				{
					_grp setvariable ["UPSMON_Transport",false];
					_grp setvariable ["UPSMON_Transportmission",[]]
				};
			};

			case "WAITTRANSPORT":
			{
				_grouptransported = [_grp] call UPSMON_CheckTransported;
				If (IsNull _grouptransported) then
				{
					[_grp,_grp getvariable ["UPSMON_TransportDest",[]],"MOVE",_formation,_speedmode,_behaviour,"YELLOW",1] spawn UPSMON_DocreateWP;
				};
			};

			case "SUPPLY":
			{
				If (true) then
				{

				};
			};

			case "RESUPPLY":
			{

			};

			case "PATROL":
			{
				_speedmode = Speedmode _npc;
				_behaviour = Behaviour _npc;
				_wpformation = Formation _npc;

				If (!(_grp getvariable ["UPSMON_InTransport",false])) then
				{

					If ("arti" in _typeofgrp) then
					{
						If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
						{
							If (_targetdist <= 10 && (_grp getvariable ["UPSMON_TIMEONTARGET",time] <= time)) then
							{
								_makenewtarget=true;
							};
						};
					}
					else
					{

						If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
						{
							If (!(_grp getvariable ["UPSMON_embarking",false])) then
							{
								If (!(_grp getvariable ["UPSMON_Disembarking",false])) then
								{
									If (!([_targetpos,_areamarker] call UPSMON_pos_fnc_isBlacklisted)
											|| _stuck
											|| _targetdist <= 5
											//|| moveToFailed _driver
											//|| Unitready _driver
											//|| moveToCompleted _driver
											|| count(waypoints _grp) == 0
											|| ((("tank" in _typeofgrp) || ("ship" in _typeofgrp) || ("apc" in _typeofgrp) ||("car" in _typeofgrp)) && _targetdist <= 25)
											|| (("air" in _typeofgrp && !(_grp getVariable ["UPSMON_landing",false])) && (_targetdist <= 70 || Unitready _driver))) then
									{
										_makenewtarget=true;
									};
								};
							};
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

			case "FIREMISSION":
			{
				If (count _attackpos > 0 || count (_grp getvariable ["UPSMON_Artifiremission",[]]) > 0) then
				{
					If (_grp getvariable ["UPSMON_OnBattery",false]) then
					{
						//_area = (_attackpos distance (leader _grp))/10;//modified by Barbolani to make the dispersion distance dependant.
						_friendlies = if (side _grp == Occupants) then {{((side (group _x) == civilian) or (side (group _x) == side (leader _grp))) and (_x distance _attackPos < 100)} count allUnits} else {{(side (group _x) == side (leader _grp)) and (_x distance _attackPos < 100)} count allUnits};
						If ((!(_grp getvariable ["UPSMON_Batteryfire",false])) and (_friendlies == 0) and !((vehicle _target) isKindOf "Air")) then //modified by Barbolani for Antistasi
						{
							_artitarget = _attackpos;
							_firemission = "HE";
							_roundsask = 1;
							_area = 10;
							If (count (_grp getvariable ["UPSMON_Artifiremission",[]]) > 0) then
							{
								_artitarget = (_grp getvariable ["UPSMON_Artifiremission",[]]) select 0;
								_firemission = (_grp getvariable ["UPSMON_Artifiremission",[]]) select 1;
								_roundsask = (_grp getvariable ["UPSMON_Artifiremission",[]]) select 2;
								_area = (_grp getvariable ["UPSMON_Artifiremission",[]]) select 2;
							};

							[_grp,_artitarget,_area,_roundsask,_firemission] spawn UPSMON_artillerydofire;
						}
						else
						{
							If (_grp getvariable ["UPSMON_RoundsComplete",false]) then
							{
								[_grp] call UPSMON_BackToNormal;
								_grp setvariable ["UPSMON_OnBattery",false];
								_grp setvariable ["UPSMON_RoundsComplete",false];
							};
						};
					};
				}
				else
				{
					If (_grp getvariable ["UPSMON_RoundsComplete",false]) then
					{
						[_grp] call UPSMON_BackToNormal;
						_grp setvariable ["UPSMON_OnBattery",false];
						_grp setvariable ["UPSMON_RoundsComplete",false];
					};
				};
			};

			case "RELAX":
			{
				[_grp,_areamarker] call UPSMON_DORELAX;
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
///////////////////////////////////////////////////////////////////////////
///////////					Disembarking 				//////////////////
//////////////////////////////////////////////////////////////////////////

			If (!(_grp getvariable ["UPSMON_disembarking",false])) then
			{
				If (!(_grp getvariable ["UPSMON_searchingpos",false])) then
				{
					If (_targetpos select 0 != 0 && _targetpos select 1 != 0) then
					{
						If (count _assignedvehicle > 0) then
						{
							[_grp,_assignedvehicle,_dist,_targetdist,_supstatus] call UPSMON_Disembarkment;
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
			};// !NOWP

			if (({alive _x && !(captive _x)} count units _grp) == 0 ||  _grp getvariable ["UPSMON_Removegroup",false]) exitwith
			{
				[_grp,_UCthis] call UPSMON_RESPAWN;
			};

			_grp setvariable ["UPSMON_Lastinfos",[_currpos,_targetpos]];
			_grp setvariable ["UPSMON_lastOpfknowval",_opfknowval];
			_grp setvariable ["UPSMON_LastGrpmission",_grp getvariable ["UPSMON_Grpmission",""]];

			sleep 0.1;
		};

	} foreach UPSMON_NPCs;

	If (ObjNull in UPSMON_NPCs) then {UPSMON_NPCs = UPSMON_NPCs - [ObjNull]};
	sleep _cycle;
};