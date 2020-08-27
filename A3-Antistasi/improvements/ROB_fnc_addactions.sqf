/*
file: ROB_fnc_addactions.sqf
by DaVIdoSS
part of system which adds auto loot collector
fired from  initplayerLocal.sqf by
0 = [] spawn  ROB_fnc_addactions;
created for Barbolani's Antistasi
parameters:
none
return VOID
*/
if !(hasInterface) exitWith {};

private ["_objAround", "_boxesAround", "_deadAround", "_owner", "_actionID"];

while {true} do {

	_objAround = (entities [["SoldierWB","SoldierEB","SoldierGB","ReammoBox_F"], [], true, false]) select {
		_x inArea [getPosATL player, 50, 50, 360, false, -1] 
	};
	
	_boxesAround = _objAround select {
		_x isKindOf "ReammoBox_F" &&
		{!(_x in [cajaVeh, caja])} && 
		{isNil {_x getVariable "RobAction"}} &&
		{!((getWeaponCargo _x + getMagazineCargo _x + getItemCargo _x + getBackpackCargo _x) isEqualTo [[],[],[],[],[],[],[],[]])}	
	};
	
	_deadAround = _objAround select	{
		!alive _x &&
		{_x isKindOf "Man"} &&
		{isNil {_x getVariable "RobAction"}}
	};

	if (count _deadAround > 0) then {

		{
			_owner = 0;
			if (isNil {_x getVariable "my_owner"}) then {
				if (isMultiplayer) then {
					0 = [_x] remoteExecCall ["ROB_fnc_getOwner",2];
					waitUntil {sleep 1;!(isNil {_x getVariable "my_owner"})};
					_owner = _x getVariable ["my_owner",0];
				};
			};
		
			_actionID = _x addAction [
				"<t color='#ED2744'>Rob dead corpse</t><img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_forceRespawn_ca'/>",
				"0 = _this spawn ROB_fnc_collector", _owner, 6, true, true, "", "true", 3, false, "", ""
			];
			_x setVariable [ "RobAction", _actionID ];
			
		} forEach _deadAround;
	};

	if (count _boxesAround > 0) then {
		{
			_actionID = _x addAction [
				"<t>Move gear to nearest vehicle</t> <img size='2' image='\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca'/>",
				"0 = _this spawn ROB_fnc_collector", nil, 6, true, true, "", "true", 3, false, "", ""
			];
			_x setVariable [ "RobAction", _actionID ];
		
		} forEach _boxesAround;
	};
	
	sleep 30;
};