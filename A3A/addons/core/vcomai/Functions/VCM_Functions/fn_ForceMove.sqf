
/*
	Author: Genesis
	Description:
		Forces AI to move towards enemies, failing that move towards waypoint.

	Parameter(s):
		0: OBJECT - Group leader to get moving
		1 (Optional): NUMBER - Distance to move

	Returns:
		NOTHING
*/
params ["_SquadLeader"];

private _Squad = (group _SquadLeader);

//_Squad setbehaviour "SAFE";
//_Squad setCombatMode "BLUE";
//_Squad setbehaviour "AWARE";

private _Units = (units _Squad);

//Let's see if any of the units have fired recently, if not, get them moving without taking cover.
private _Engaged = false;

{
	if (((_x getvariable ["VCM_FTH",-1000]) + 60) > time) exitwith {_Engaged = true;};
} foreach _Units;


//If we are engaged, then let's look for cover.
if (_Engaged) then
{
	_Squad setvariable ["VCM_EngagedMovement",true];
	private _NearbyCoverArray = [_SquadLeader,30] call VCM_fnc_CoverDetect;


	_NearbyCoverArray params ["_CenterUnitPos","_CoverObjects","_WPPos"];


	private _SavedCoverArray = _CoverObjects;
	private _NoCover = false;

	//Not much cover?
	if (count _CoverObjects < ((count _Units)/2)) then
	{
		_NoCover = true;
	};
	
	private _ClstEnemy = _Squad call VCM_fnc_ClstKnwnEnmy;
	if (count _ClstEnemy < 1) then
	{
		_ClstEnemy = _SquadLeader call VCM_fnc_ClstEmy;
	}
	else
	{
		_ClstEnemy=(_ClstEnemy#0)#1;
	};
	private _ClstArray0 = [];
	{
		_ClstArray0 pushback [(_WPPos distance2D _x),_x];
	} foreach (units _Squad);	
	
	_ClstArray0 sort false;
	private _NumberToSel = (count _ClstArray0/2);
	if (VCM_DebugCombatMove) then
	{
		systemchat format ["Combat Movement: Number to move %1",_NumberToSel];
	};	
	
	
	private _SelectedNumber = 0;
	{
		_x params ["_Dist","_Unit"];
		if (_SelectedNumber < _NumberToSel) then
		{
			_SelectedNumber = _SelectedNumber + 1;
			if (count _CoverObjects < 1 && {!(_NoCover)}) then
			{
				_CoverObjects = _SavedCoverArray;
			};
			
			
			_Unit setCombatBehaviour "SAFE"; 
			_Unit setUnitCombatMode "BLUE";
			_Unit disableAI "AUTOCOMBAT"; 
			
			
			//Find closest cover		
			private _Go2Pos = [0,0,0];
			if !(_NoCover) then
			{
				private _ClstCover = [_CoverObjects,_ClstEnemy,true] call VCM_fnc_ClstObj;		
				_CoverObjects = _CoverObjects - [_ClstCover];
				_Go2Pos = [_ClstCover,_Unit] call VCM_fnc_BoxNrst;
				if (VCM_DebugCombatMove) then
				{
					systemchat "Cover found!";
				};
			}
			else
			{
				_Go2Pos = _Unit getpos [(10 + (random 10)),(_Unit getdir _WPPos)];
				if (VCM_DebugCombatMove) then
				{
					systemchat "No Cover found!";
				};			
			};
			if (VCM_DebugCombatMove) then{[_Unit,"MOVE",10] call VCM_fnc_DebugText;};
			[_Unit,_Go2Pos,1.5,30] spawn VCM_fnc_ForceMoveFSM;
		}
		else
		{
			if (VCM_DebugCombatMove) then{[_Unit,(format ["FIRE AT ENEMY : %1",_ClstEnemy]),10] call VCM_fnc_DebugText;};
			_Unit disableAI "AUTOCOMBAT"; 
			_Unit setCombatBehaviour "AWARE"; 
			_Unit setUnitCombatMode "YELLOW";
			_Unit forcespeed 0;
			//_Unit enableAI "AUTOCOMBAT";
			//_Unit dotarget _ClstEnemy;
			//_Unit dowatch _ClstEnemy;
			//_Unit reveal [_ClstEnemy, 4];
			_Unit doSuppressiveFire _ClstEnemy;	
			_Unit suppressFor 10;		

		};
	} foreach _ClstArray0;
}
else
{
	_Squad setvariable ["VCM_EngagedMovement",false];
			if (VCM_DebugCombatMove) then
			{
				systemchat format ["Combat Movement: Not fired, lets move quickly %1",_Squad];
			};
	//Let's make sure everyone can move.
	_Squad setbehaviour "AWARE";
	{
		_x doFollow _SquadLeader;
		_x disableAI "AUTOCOMBAT";
		_x doWatch objNull;
		_x setCombatBehaviour "AWARE";
		_x forcespeed -1;
	} foreach (units _Squad);

};