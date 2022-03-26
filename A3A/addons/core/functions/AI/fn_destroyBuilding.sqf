private _engineerX = _this select 0;
_engineerX setVariable ["maneuvering",true];
private _nearX = _this select 1;
private _building = _this select 2;
_building setVariable ["assaulted",true];
_engineerX disableAI "TARGET";
_engineerX disableAI "AUTOTARGET";
_engineerX disableAI "SUPPRESSION";
_engineerX disableAI "CHECKVISIBLE";
_engineerX disableAI "COVER";
_engineerX disableAI "AUTOCOMBAT";
doStop _engineerX;
_engineerX doMove (getPos _building);

while {true} do
	{
	if !([_engineerX] call A3A_fnc_canFight) exitWith {};
	_arrayObjs = lineIntersectsObjs [(eyePos _engineerX),(_engineerX modelToWorld [0,3,0]),objNull,_engineerX,false,32];
	if (_building in _arrayObjs) exitWith {};
	if (_engineerX distance _building < 3) exitWith {};
	sleep 1;
	};

if !([_engineerX] call A3A_fnc_canFight) exitWith
	{
	_engineerX enableAI "TARGET";
	_engineerX enableAI "AUTOTARGET";
	_engineerX enableAI "SUPPRESSION";
	_engineerX enableAI "CHECKVISIBLE";
	_engineerX enableAI "COVER";
	_engineerX enableAI "AUTOCOMBAT";
	_engineerX call A3A_fnc_recallGroup;
	_building setVariable ["assaulted",false];
	};

private _side = side _engineerX;
_engineerX playActionNow "PutDown";
private _mineX = "SatchelCharge_Remote_Ammo" createVehicle (getposATL _engineerX);
private _mag = (magazines _engineerX select {(_x call BIS_fnc_itemType) select 0 == "Mine"}) select 0;
_engineerX removeMagazineGlobal _mag;
if (_engineerX != leader _engineerX) then {_engineerX doMove (getPos (leader _engineerX))} else {_engineerX call A3A_fnc_recallGroup};
private _timeOut = time + 60;
waitUntil {sleep 5; ({(side _x == _side) and (_x distance _building < 20)} count allUnits == 0) or (time > _timeOut) or !(alive _engineerX)};

if (time <= _timeOut) then {_mineX setDamage 1};
_engineerX enableAI "TARGET";
_engineerX enableAI "AUTOTARGET";
_engineerX enableAI "SUPPRESSION";
_engineerX enableAI "CHECKVISIBLE";
_engineerX enableAI "COVER";
_engineerX enableAI "AUTOCOMBAT";
_engineerX call A3A_fnc_recallGroup;
_building setVariable ["assaulted",false];
