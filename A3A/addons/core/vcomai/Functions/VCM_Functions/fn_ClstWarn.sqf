
/*
	Author: Genesis

	Description:
		Function for squads being able to warn their closest teammates about combat.

	Parameter(s):
		0: OBJECT - Unit whose group will call for help
		1: OBJECT - Unit who killed above unit

	Returns:
		NOTHING
*/

params ["_unit","_killer"];

private _unitGroup = (group _unit);

//If the squad is a TOUGH SQUAD, we just exit here.
if (_unitGroup getVariable ["VCM_TOUGHSQUAD",false] || _unitGroup getVariable ["Vcm_Disable",false] || _unitGroup getVariable ["VCM_NOFLANK",false]) exitWith {};

//If the squad is already calling for help, don't do anything further.
if (_unitGroup getVariable ["VCM_RQSTHELP",false]) exitWith {};
_unitGroup setVariable ["VCM_RQSTHELP",true];

_unitGroup spawn {sleep 300;_this setVariable ["VCM_RQSTHELP",false];};


private _trgtPos = getpos _killer;

//If this gets attached to a player, then exit before doing anything
if (isPlayer _unit) exitWith {};

//Check to see if this unit should be moving to support others or not
//Check to see if this unit is garrisoned. If so, don't do anything
//Check to see if unit has radio. If the unit does not have a radio, then it will not move to support
private _checkStatus = assignedItems _unit;

if (isNil "_checkStatus" || {(_unit getVariable ["Vcm_Disable",false])} || {!("ItemRadio" in _checkStatus)}) exitWith {};

private _arrayOrg = _unit call VCM_fnc_FriendlyArray;
_arrayOrg = _arrayOrg - VCM_ARTYLST;
//Remove players 
{if (isPlayer _x) then {_arrayOrg deleteAt _foreachIndex;};} foreach _arrayOrg;

private _array2 = _killer call VCM_fnc_FriendlyArray;
_array2 = _array2 - VCM_ARTYLST;
{
	if (_x distance _killer > 501) then {_array2 = _array2 - [_x];};
} foreach _array2;



sleep VCM_WARNDELAY;

private _EnemyCount = count _array2;
private _RespondCount = 0;
private _aliveCount = {alive _x} count (units _unitGroup);
if (_aliveCount > 0) then
{
	{
		if (_RespondCount < _EnemyCount) then
		{

			private _checkStatus2 = assignedItems _x;
			

			if (!(isNil "_checkStatus2") && {!(_x getVariable ["Vcm_Disable",false])} && {!(_x getVariable ["VCM_NOFLANK",false])} && {!(_x getVariable ["VCM_NORESCUE",false])} && {!(_x getVariable ["VCM_MOVE2SUP",false])} && {"ItemRadio" in _checkStatus2}) then 
			{


						private _group	= group _x;
						if ((count (waypoints _group)) < 2) then 
						{

							private _WaypointCheck = _group call VCM_fnc_WyptChk;
							if (count _WaypointCheck < 1) then 
							{
							

								if ((_x distance2D _unit) <= VCM_WARNDIST) then 
								{

											_x setbehaviour "AWARE";
											(group _x) setVariable ["VCM_MOVE2SUP",true];
											if !(vehicle _x isEqualTo _x) then
											{
													_RespondCount = _RespondCount + count (crew (vehicle _x));
													private _Driver = (driver (vehicle _x));
													//systemchat format ["_RespondCountDRIVER %1 GROUP: %2",[_EnemyCount,_RespondCount],(group _x)];
													_waypoint2 = (group _Driver) addwaypoint[_trgtPos,15,150];
													_waypoint2 setwaypointtype "MOVE";
													_waypoint2 setWaypointSpeed "NORMAL";
													_waypoint2 setWaypointBehaviour "AWARE";	
													[(group _Driver), (_waypoint2 select 1)] setWaypointCompletionRadius 25;											
											}
											else
											{
														_RespondCount = _RespondCount + (count (units (group _x)));
														//systemchat format ["_RespondCount %1 GROUP: %2",[_EnemyCount,_RespondCount],(group _x)];
														_waypoint2 = (group _x) addwaypoint[_trgtPos,15,150];
														_waypoint2 setwaypointtype "MOVE";
														_waypoint2 setWaypointSpeed "NORMAL";
														_waypoint2 setWaypointBehaviour "AWARE";
														[(group _x), (_waypoint2 select 1)] setWaypointCompletionRadius 25;
														_waypoint2 = (group _x) addwaypoint[_trgtPos,15,150];
														_waypoint2 setwaypointtype "MOVE";
														_waypoint2 setWaypointSpeed "NORMAL";
														_waypoint2 setWaypointBehaviour "AWARE";
														[(group _x), (_waypoint2 select 1)] setWaypointCompletionRadius 25;												
											};


											(group _x) spawn 
											{
												sleep 300;
												_this setVariable ["VCM_MOVE2SUP",false];
											};
								
								};
							};
	
						};
						
						


	
			
			};	
		};
	} foreach _arrayOrg;	
};
