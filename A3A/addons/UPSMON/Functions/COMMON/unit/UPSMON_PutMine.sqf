/****************************************************************
File: UPSMON_doCreateMine.sqf
Author: MONSADA

Description:
	
Parameter(s):

Returns:

****************************************************************/

private ["_minetype","_soldier","_position","_dir","_minesnbr"];
	 
_soldier = _this select 0;
_grp = _this select 1;
_position = [(_this select 2) select 0,(_this select 2) select 1,0];
_currPos = _this select 3;
_minemag = _this select 4;

if (isnil "_soldier") exitWith {};
_grp setvariable ["UPSMON_GrpinAction",true];

_minetype = "";
switch (_minemag) do 
{
	case "SLAMDirectionalMine_Wire_Mag":
	{
		_minetype = "SLAMDirectionalMine";
	};
	
	case "ATMine_Range_Mag":
	{
		_minetype = "ATMine";
	};
};

//If not is Man or dead exit
if (!alive _soldier || !canstand _soldier) exitwith {_grp setvariable ["UPSMON_GrpinAction",false];};		
	
	
_soldier domove _position;
_soldier disableAI "AUTOTARGET";
_soldier disableAI "TARGET";
_soldier setDestination [_position, "LEADER PLANNED", true];

if (!isnil "_soldier") then 
{
	waituntil {unitReady _soldier || moveToCompleted _soldier || moveToFailed _soldier || !alive _soldier || !canstand _soldier || ((getposATL _soldier) vectordistance _position <= 5)}
};

if (moveToFailed _soldier || !alive _soldier || _soldier != vehicle _soldier || !canmove _soldier) exitwith {_grp setvariable ["UPSMON_GrpinAction",false];};	

//Crouche
//_soldier playMove "ainvpknlmstpslaywrfldnon_1";

sleep 1;
if (isnil "_soldier") exitWith {_grp setvariable ["UPSMON_GrpinAction",false];}; 
if (!alive _soldier || !canstand _soldier) exitwith {_grp setvariable ["UPSMON_GrpinAction",false];};

	
_dir = getdir _soldier;	
_minesnbr = {_x == _minemag} count (magazines _soldier);
[_minesnbr,_minetype,_minetype,_position,_dir,side _soldier] spawn UPSMON_spawnmines;

//Remove magazines
for "_x" from 0 to _minesnbr do
{
	_soldier removeMagazineGlobal _minemag;
};
//Prepare mine
//_soldier playMoveNow "AinvPknlMstpSlayWrflDnon_medic";
sleep 1;

if (alive _soldier) then
{
	_soldier Domove _currPos;
	_soldier enableAI "AUTOTARGET";
	_soldier enableAI "TARGET";
};
//Return to formation
if (isnil "_soldier") exitWith {_grp setvariable ["UPSMON_GrpinAction",false];}; 
_grp setvariable ["UPSMON_GrpinAction",false];