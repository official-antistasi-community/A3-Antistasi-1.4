private ["_curado","_curandero","_healed","_player","_timer","_lado","_accion"];

_curado = _this select 0;
_curandero = _this select 1;
_accion = 0;
_healed = false;
_player = isPlayer _curandero;
_inPlayerGroup = if !(_player) then {if ({isPlayer _x} count (units group _curandero) > 0) then {true} else {false}} else {false};
if (captive _curandero) then
	{
	[_curandero,false] remoteExec ["setCaptive",0,_curandero];
	_curandero setCaptive false;
	};
if !(alive _curado) exitWith
	{
	if (_player) then {hint format ["%1 is already dead",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat format ["%1 is already dead",name _curado]};
	_healed
	};
if !([_curandero] call A3A_fnc_canFight) exitWith {if (_player) then {hint "You are not able to revive anyone"};_healed};
if ((not("FirstAidKit" in (items _curandero))) and (not("FirstAidKit" in (items _curado)))) exitWith
	{
	if (_player) then {hint format ["You or %1 need a First Aid Kit to be able to revive",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat "I'm out of FA kits!"};
	_healed
	};
if ((not("FirstAidKit" in (items _curandero))) and !(_curandero canAdd "FirstAidKit")) exitWith
	{
	if (_player) then {hint format ["%1 has a First Aid Kit but you do not have enough space in your inventory to use it",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat "I'm out of FA kits!"};
	_healed
	};
if !(isNull attachedTo _curado) exitWith
	{
	if (_player) then {hint format ["%1 is being carried or transported and you cannot heal him",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat format ["%1 is being carried or transported and I cannot heal him",name _curado]};
	_healed
	};
if !(_curado getVariable ["INCAPACITATED",false]) exitWith
	{
	if (_player) then {hint format ["%1 no longer needs your help",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat format ["%1 no longer needs my help",name _curado]};
	_healed
	};
if (surfaceIsWater (position _curado)) exitWith {if (_player) then {hint format ["You cannot heal %1 in the water",name _curado]};_healed};
if (_player) then
	{
	_curado setVariable ["ayudado",_curandero,true];
	};
_curandero setVariable ["ayudando",true];
if (not("FirstAidKit" in (items _curandero))) then
	{
	_curandero addItem "FirstAidKit";
	_curado removeItem "FirstAidKit";
	};
_timer = if ([_curado] call A3A_fnc_fatalWound) then
			{
			time + 7 + (random 10)
			}
		else
			{
			if ((!isMultiplayer and (isPlayer _curado)) or ([_curandero] call A3A_fnc_isMedic)) then
				{
				time + 2 + (random 5)
				}
			else
				{
				time + 5 + (random 7)
				};
			};


_curandero setVariable ["timeToHeal",_timer];
_curandero playMoveNow selectRandom medicAnims;
_curandero setVariable ["animsDone",false];
_curandero setVariable ["curado",_curado];
_curandero setVariable ["success",false];
_curandero setVariable ["cancelRevive",false];
if (!_player) then
	{
	{_curandero disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	}
else
	{
	_accion = _curandero addAction ["Cancel Revive", {(_this select 1) setVariable ["cancelRevive",true]},nil,6,true,true,"","(_this getVariable [""ayudando"",false]) and (isPlayer _this)"];
	};
_curandero addEventHandler ["AnimDone",
	{
	private _curandero = _this select 0;
	private _curado = _curandero getVariable ["curado",objNull];
	if (([_curandero] call A3A_fnc_canFight) and (time <= (_curandero getVariable ["timeToHeal",time])) and !(_curandero getVariable ["cancelRevive",false]) and (alive _curado) and (_curado getVariable ["INCAPACITATED",false]) and (_curandero == vehicle _curandero)) then
		{
		_curandero playMoveNow selectRandom medicAnims;
		}
	else
		{
		_curandero removeEventHandler ["AnimDone",_thisEventHandler];
		_curandero setVariable ["animsDone",true];
		if (([_curandero] call A3A_fnc_canFight) and !(_curandero getVariable ["cancelRevive",false]) and (_curandero == vehicle _curandero) and (alive _curado)) then
			{
			if (_curado getVariable ["INCAPACITATED",false]) then
				{
				_curandero setVariable ["success",true];
				//_curado setVariable ["INCAPACITATED",false,true];
				//_curandero action ["HealSoldier",_curado];
				if ([_curandero] call A3A_fnc_isMedic) then {_curado setDamage 0.25} else {_curado setDamage 0.5};
				_curandero removeItem "FirstAidKit";
				};
			};
		};
	}];
waitUntil {sleep 0.5; (_curandero getVariable ["animsDone",true])};
_curandero setVariable ["animsDone",nil];
_curandero setVariable ["timeToHeal",nil];
_curandero setVariable ["curado",nil];
_curandero setVariable ["ayudando",false];
if (!_player) then
	{
	{_curandero enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	}
else
	{
	_curandero removeAction _accion;
	_curado setVariable ["ayudado",objNull,true];
	_curandero setVariable ["ayudando",false];
	};
if (_curandero getVariable ["cancelRevive",false]) exitWith
	{
	if (_player) then
		{
		hint "Revive cancelled";
		_curandero setVariable ["cancelRevive",nil];
		};
	_healed
	};
if !(alive _curado) exitWith
	{
	if (_player) then {hint format ["We lost %1",name _curado]};
	if (_inPlayerGroup) then {_curandero groupChat format ["We lost %1",name _curado]};
	_healed
	};
if (!([_curandero] call A3A_fnc_canFight) or (_curandero != vehicle _curandero) or (_curandero distance _curado > 3)) exitWith {if (_player) then {hint "Revive cancelled"};_healed};

if (_curandero getVariable ["success",true]) then
	{
	_lado = side (group _curado);
	if ((_lado != side (group _curandero)) and ((_lado == malos) or (_lado == muyMalos))) then
		{
		_curado setVariable ["surrendered",true,true];
		sleep 2;
		};
	_curado setVariable ["INCAPACITATED",false,true];
	_healed = true;
	}
else
	{
	if (_player) then {hint "Revive unsuccesful"};
	if (_inPlayerGroup) then {_curandero groupChat "Revive failed"};
	};

_healed