/*
	Author: Genesis

	Description:
		Plants a mine

	Parameter(s):
		0: OBJECT - Unit to plant a mine
		1: ARRAY - ???

	Returns:
		NOTHING
*/

params ["_unit", "_mineArray"];

if !(VCM_MINEENABLED) exitWith {};

if (VCM_MINECHANCE > (random 100)) then
{


if (isPlayer _unit || {lifeState _Unit isEqualTo "INCAPACITATED"}) exitWith {};

private _mineType = _mineArray select 0;

//Let's see if we can place a scripted version of the item.
private _testName = _mineType + "_scripted";

switch (_mineType) do {
    case "APERSMine_Range_Ammo_scripted": {_testName = "APERSMineDispenser_Mine_Ammo_Scripted"};
    default {};
};


private _testMine = _testName createVehiclelocal [0,0,0];
if !(isNull _testMine) then
{
	_mineType = _testName;
	deleteVehicle _testMine;
};

private _magazineName = _mineArray select 1;

if (_mineArray isEqualTo []) exitWith {};

_unit removeMagazine _magazineName;

//systemchat format ["I %1",_unit];
private _nearestEnemy = _unit call VCM_fnc_ClstEmy;
if (_nearestEnemy isEqualTo [] || {isNil "_nearestEnemy"}) exitWith {};

private _mine = "";

if (_nearestEnemy distance2D _unit < 100) then
{
	//_mine = createMine [_mineType,getposATL _unit, [], 2];
	private _mPos = _unit modeltoworld [0,1,0.05];
	_mine = _mineType createVehicle _mPos;
	_mine setDir ([_mine, _nearestEnemy] call BIS_fnc_dirTo);
	_mine setpos _mPos;
	_mine setposATL (getposATL _mine);
	[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
}
else
{
	_nearRoads = _unit nearRoads 50;
	if (count _nearRoads > 0) then 
	{
		private _closestRoad = [_nearRoads,_unit,true,"2"] call VCM_fnc_ClstObj;
		doStop _unit;
		_unit doMove (getpos _closestRoad);
		waitUntil {!(alive _unit) || _unit distance2D _closestRoad < 7};
		private _mPos = _unit modeltoworld [0,1,0.05];
		_mine = _mineType createVehicle _mPos;
		_mine setDir ([_mine, _nearestEnemy] call BIS_fnc_dirTo);
		_mine setpos _mPos;
		_mine setposATL (getposATL _mine);
		//_mine = createMine [_mineType,getposATL _closestRoad, [], 3];
		[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
	}
	else
	{
		//_mine = createMine [_mineType,getposATL _unit, [], 3];
		private _mPos = _unit modeltoworld [0,1,0.05];
		_mine = _mineType createVehicle _mPos;
		_mine setDir ([_mine, _nearestEnemy] call BIS_fnc_dirTo);
		_mine setpos _mPos;
		_mine setposATL (getposATL _mine);
		[_unit,"AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon"] remoteExec ["Vcm_PMN",0];
	};
};

_unitSide = (side _unit);


if (_mine isEqualTo "") exitWith {};

VCOM_mineArray pushBack [_Mine,_unitSide];
[_Mine, false] remoteExecCall ["enableSimulationGlobal",2];
};
/*
[_mine,_unitSide] spawn 
{
	params ["_Mine","_unitSide"];
	
	
	
	private _NotSafe = true;
	[_Mine, false] remoteExecCall ["enableSimulationGlobal",2];
	waitUntil
	{
		private _Array1 = (allUnits select {!(side _x isEqualTo _unitSide)});
		private _ClosestEnemy = [0,0,0];
		_ClosestEnemy = [_Array1,_Mine,true,"2"] call VCM_fnc_ClstObj;
		if (_ClosestEnemy distance _Mine < 2.5) then {_NotSafe = false;};
		sleep 0.1;	
		(!(alive _mine) || {!(_NotSafe)})
	};
	[_Mine, true] remoteExecCall ["enableSimulationGlobal",2];
	sleep 0.25;
	_Mine setdamage 1;
};