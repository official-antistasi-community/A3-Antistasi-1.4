private _ingeniero = _this select 0;
_ingeniero setVariable ["maniobrando",true];
private _cercano = _this select 1;
private _building = _this select 2;
_building setVariable ["asaltado",true];
_ingeniero disableAI "TARGET";
_ingeniero disableAI "AUTOTARGET";
_ingeniero disableAI "SUPPRESSION";
_ingeniero disableAI "CHECKVISIBLE";
_ingeniero disableAI "COVER";
_ingeniero disableAI "AUTOCOMBAT";
doStop _ingeniero;
_ingeniero doMove (getPos _building);

while {true} do
	{
	if !([_ingeniero] call A3A_fnc_canFight) exitWith {};
	_arrayObjs = lineIntersectsObjs [(eyePos _ingeniero),(_ingeniero modelToWorld [0,3,0]),objNull,_ingeniero,false,32];
	if (_building in _arrayObjs) exitWith {};
	if (_ingeniero distance _building < 3) exitWith {};
	sleep 1;
	};

if !([_ingeniero] call A3A_fnc_canFight) exitWith
	{
	_ingeniero enableAI "TARGET";
	_ingeniero enableAI "AUTOTARGET";
	_ingeniero enableAI "SUPPRESSION";
	_ingeniero enableAI "CHECKVISIBLE";
	_ingeniero enableAI "COVER";
	_ingeniero enableAI "AUTOCOMBAT";
	_ingeniero call A3A_fnc_recallGroup;
	_building setVariable ["asaltado",false];
	};

private _side = side _ingeniero;
_ingeniero playActionNow "PutDown";
private _mina = "SatchelCharge_Remote_Ammo" createVehicle (getposATL _ingeniero);
private _mag = (magazines _ingeniero select {(_x call BIS_fnc_itemType) select 0 == "Mine"}) select 0;
_ingeniero removeMagazineGlobal _mag;
if (_ingeniero != leader _ingeniero) then {_ingeniero doMove (getPos (leader _ingeniero))} else {_ingeniero call A3A_fnc_recallGroup};
private _timeOut = time + 60;
waitUntil {sleep 5; ({(side _x == _side) and (_x distance _building < 20)} count allUnits == 0) or (time > _timeOut) or !(alive _ingeniero)};

if (time <= _timeOut) then {_mina setDamage 1};
_ingeniero enableAI "TARGET";
_ingeniero enableAI "AUTOTARGET";
_ingeniero enableAI "SUPPRESSION";
_ingeniero enableAI "CHECKVISIBLE";
_ingeniero enableAI "COVER";
_ingeniero enableAI "AUTOCOMBAT";
_ingeniero call A3A_fnc_recallGroup;
_building setVariable ["asaltado",false];
