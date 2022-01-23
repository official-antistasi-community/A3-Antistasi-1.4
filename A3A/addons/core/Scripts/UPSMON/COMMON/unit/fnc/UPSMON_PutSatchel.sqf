/****************************************************************
File: UPSMON_doCreateMine.sqf
Author: MONSADA

Description:
	
Parameter(s):

Returns:

****************************************************************/

private ["_minetype","_soldier","_position","_currPos","_minemag"];
	 
_soldier = _this select 0;
_grp = _this select 1;
_position = [(_this select 2) select 0,(_this select 2) select 1,0];
_currPos = _this select 3;
_minemag = _this select 4;

if (isnil "_soldier") exitWith {};
_muzzle = "";
switch (_minemag) do
{
	case "SatchelCharge_Remote_Mag":
	{
		_muzzle = "SatchelChargeMuzzle";
	};
	
	case "DemoCharge_Remote_Mag":
	{
		_muzzle = "DemoChargeMuzzle";
	};
};

//If not is Man or dead exit
if (!alive _soldier || !canstand _soldier) exitwith {};		
	
	
_soldier domove _position;
_soldier disableAI "AUTOTARGET";
_soldier disableAI "TARGET";
_soldier setDestination [_position, "LEADER PLANNED", true];
_soldier forcespeed 100;
if (!isnil "_soldier") then 
{
	waituntil {unitReady _soldier || moveToCompleted _soldier || moveToFailed _soldier || !alive _soldier || !canstand _soldier || ((getposATL _soldier) vectordistance _position <= 10)}
};

if (moveToFailed _soldier || !alive _soldier || _soldier != vehicle _soldier || !canmove _soldier) exitwith {};	

//Crouche
//_soldier playMove "ainvpknlmstpslaywrfldnon_1";

sleep 0.5;
if (isnil "_soldier") exitWith {}; 
if (!alive _soldier || !canstand _soldier) exitwith {};

_soldier playActionNow "PutDown";
_soldier selectWeapon _muzzle;
_soldier fire [_muzzle, _muzzle, _minemag];

//Prepare mine
//_soldier playMoveNow "AinvPknlMstpSlayWrflDnon_medic";
sleep 1;

if (alive _soldier) then
{
	_soldier Domove _currPos;
	waituntil {_position vectordistance (getposATL _soldier) >= 50 || !alive _soldier || !canmove _soldier};
	
	If (alive _soldier) then
	{
		_soldier enableAI "AUTOTARGET";
		_soldier enableAI "TARGET";
		_soldier forcespeed -1;
		_soldier action ["TOUCHOFF", _soldier];
		_soldier dofollow (leader (group _soldier)); 
	};
};
//Return to formation
if (isnil "_soldier") exitWith {}; 