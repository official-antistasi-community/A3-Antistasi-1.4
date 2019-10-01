params["_vehicle", "_caller", "_actionID"];

if(!isPlayer _caller) exitWith {hint "Only players are currently able to breach vehicles!";};

private ["_isEngineer", "_isAPC", "_isTank", "_magazines", "_explosive", "_abort", "_index"];

//Only engineers should be able to breach a vehicle
_isEngineer = _caller getUnitTrait "engineer";
if(!_isEngineer) exitWith {hint "You have to be an engineer to breach open a vehicle!";};

if(!alive _vehicle) exitWith {hint "Why would you want to breach open a destroyed vehicle?"; _vehicle removeAction _actionID;};

_isAPC = (typeOf _vehicle) in vehAPCs;
_isTank = (typeOf _vehicle) in vehTanks;

_magazines = magazines _caller;
_explosive = "";
_abort = false;

switch (true) do {
	case _isAPC: {
	  _index = _magazines findIf {_x in breachExplosiveSmall};
	  if(_index == -1) then
	  {
		_abort = true;
		hint "You need a small explosive charge to breach an APC open!";
	  }
	  else
	  {
		_explosive = _magazines select _index;
	  };
	};
	
	case _isTank: {
	  _index = _magazines findIf {_x in breachExplosiveLarge};
	  if(_index == -1) then
	  {
		_abort = true;
		hint "You need a large explosive charge to breach a tank open!";
	  }
	  else
	  {
		_explosive = _magazines select _index;
	  };	
	};
	
	default {
		_abort = true;
		hint "You can only breach APCs and Tanks."; 
	};
};

if(_abort) exitWith {};

private ["_time", "_action"];

_time = 15 + (random 5);
if(_isAPC) then
{
  _time = 25 + (random 10);
};
if(_isTank) then
{
  _time = 45 + (random 15);
};

_caller setVariable ["timeToBreach",time + _time];
_caller playMoveNow selectRandom medicAnims;
_caller setVariable ["breachVeh", _vehicle];
_caller setVariable ["animsDone",false];
_caller setVariable ["cancelBreach",false];

_action = _caller addAction ["Cancel Breaching", {(_this select 1) setVariable ["cancelBreach",true]},nil,6,true,true,"","(isPlayer _this) && (_this == vehicle _this)"];
_vehicle removeAction _actionID;

_caller addEventHandler ["AnimDone",
{
	private _caller = _this select 0;
  private _vehicle = _caller getVariable "breachVeh";
	if
  (
    (alive _vehicle) &&
    {(_caller == vehicle _caller) &&
    {(_caller distance _vehicle < 8) &&
    {([_caller] call A3A_fnc_canFight) &&
    {(time <= (_caller getVariable ["timeToBreach",time])) &&
    {!(_caller getVariable ["cancelBreach",false])}}}}}
  ) then
	{
		_caller playMoveNow selectRandom medicAnims;
	}
	else
	{
		_caller removeEventHandler ["AnimDone",_thisEventHandler];
		_caller setVariable ["animsDone",true];
	};
}];

//Wait for anims to finish
waitUntil {sleep 0.5; (_caller getVariable ["animsDone",false])};

_caller setVariable ["breachVeh", objNull];
_caller removeAction _action;

if
(
  !alive _vehicle ||
  {_caller != vehicle _caller || //TODO there was something about that on the optimisation page, look it up
  {_caller distance _vehicle >= 8 ||
  {!([_caller] call A3A_fnc_canFight) ||
  {_caller getVariable ["cancelBreach",false]}}}}
) exitWith
{
	hint "Breaching cancelled";
  _caller setVariable ["cancelBreach",nil];
  if(alive _vehicle) then {
	_vehicle call A3A_fnc_addActionBreachVehicle;
  };
};

private ["_damageDealt", "_currentDamage", "_result", "_bomb", "_crew", "_dropPos"];

_damageDealt = 0;
if(_isAPC) then
{
  _caller removeMagazine _explosive;
  _damageDealt = 0.15 + random 0.15;
};

if(_isTank) then
{
  _caller removeMagazine _explosive;
  _damageDealt = 0.25 + random 0.25;
};

//Added as the vehicle might blow up. Best not to blow up in the player's face.
//Pause AFTER removing the explosive in case they decide to drop it or something.
hint "Breaching in 10 seconds.";
sleep 10;

private _hitPointsConfigPath = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints";

private _hullHitPoint = getText (_hitPointsConfigPath >> "HitHull" >> "name");
_currentDamage = _vehicle getHit _hullHitPoint;
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [_hullHitPoint, _result];

private _fuelHitPoint = getText (_hitPointsConfigPath >> "HitFuel" >> "name");
_currentDamage = _vehicle getHitPointDamage _fuelHitPoint;
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [_fuelHitPoint, _result];

private _engineHitPoint = getText (_hitPointsConfigPath >> "HitEngine" >> "name");
_currentDamage = _vehicle getHitPointDamage _engineHitPoint;
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [_engineHitPoint, _result];

private _bodyHitPoint = getText (_hitPointsConfigPath >> "HitBody" >> "name");
_currentDamage = _vehicle getHitPointDamage _bodyHitPoint;
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [_bodyHitPoint, _result];

if(((damage _vehicle) + _damageDealt) > 0.9) exitWith
{
  _bomb = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (getPos _vehicle);
  _bomb setDamage 1;
  _vehicle setDamage 1;
};

playSound3D [ "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss", _vehicle, false, (getPos _vehicle), 4, 1, 0 ];



sleep 0.5;
_vehicle lock 0;

_crew = crew _vehicle;
{
    if(random 10 > 7) then
    {
      _x setDamage 1;
    };
    if(alive _x) then
    {
      moveOut _x;
      _x setVariable ["surrendered",true,true];
      [_x] spawn A3A_fnc_surrenderAction;
    }
    else
    {
      _dropPos = _vehicle getRelPos [5, random 360];
      _X setPos _dropPos;
    };
} forEach _crew;

if((_isAPC && {(typeOf _vehicle) in vehNATOAPC}) || {_isTank && {(typeOf _vehicle) in vehNATOTank}}) then
{
  [1,0] remoteExec ["A3A_fnc_prestige",2];
  if(citiesX findIf {(getMarkerPos _x) distance _vehicle < 300} != -1) then
  {
    [-1, 1, getPos _vehicle] remoteExec ["A3A_fnc_citySupportChange",2];
  };
}
else
{
  [0,1] remoteExec ["A3A_fnc_prestige",2];
};
