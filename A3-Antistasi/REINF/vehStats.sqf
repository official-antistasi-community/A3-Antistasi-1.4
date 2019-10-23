if (count hcSelected player == 0) exitWith {hint "You must select one group on the HC bar"};

private ["_grupo","_veh","_texto","_unidades"];

/*
_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") exitWith {_esStatic = true}} forEach units _grupo;
if (_esStatic) exitWith {hint "Static Weapon squad vehicles cannot be managed"};
*/

if (_this select 0 == "mount") exitWith
	{
	_texto = "";
	{
	_grupo = _x;
	_veh = objNull;
	{
	_owner = _x getVariable "owner";
	if (!isNil "_owner") then {if (_owner == _grupo) exitWith {_veh = _x}};
	} forEach vehicles;
	if !(isNull _veh) then
		{
		_transporte = true;
		if (count allTurrets [_veh, false] > 0) then {_transporte = false};
		if (_transporte) then
			{
			if (leader _grupo in _veh) then
				{
				_texto = format ["%2%1 dismounting\n",groupID _grupo,_texto];
				{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _grupo;
				}
			else
				{
				_texto = format ["%2%1 boarding\n",groupID _grupo,_texto];
				{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _grupo;
				};
			}
		else
			{
			if (leader _grupo in _veh) then
				{
				_texto = format ["%2%1 dismounting\n",groupID _grupo,_texto];
				if (canMove _veh) then
					{
					{[_x] orderGetIn false; [_x] allowGetIn false} forEach assignedCargo _veh;
					}
				else
					{
					_veh allowCrewInImmobile false;
					{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _grupo;
					}
				}
			else
				{
				_texto = format ["%2%1 boarding\n",groupID _grupo,_texto];
				{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _grupo;
				};
			};
		};
	} forEach hcSelected player;
	if (_texto != "") then {hint format ["%1",_texto]};
	};
_texto = "";
_grupo = (hcSelected player select 0);
player sideChat format ["%1, SITREP!!",groupID _grupo];
_unidades = units _grupo;
_texto = format ["%1 Status\n\nAlive members: %2\nAble to combat: %3\nCurrent task: %4\nCombat Mode:%5\n",groupID _grupo,{alive _x} count _unidades,{[_x] call A3A_fnc_canFight} count _unidades,_grupo getVariable ["tarea","Patrol"],behaviour (leader _grupo)];
if ({[_x] call A3A_fnc_isMedic} count _unidades > 0) then {_texto = format ["%1Operative Medic\n",_texto]} else {_texto = format ["%1No operative Medic\n",_texto]};
if ({_x call A3A_fnc_typeOfSoldier == "ATMan"} count _unidades > 0) then {_texto = format ["%1With AT capabilities\n",_texto]};
if ({_x call A3A_fnc_typeOfSoldier == "AAMan"} count _unidades > 0) then {_texto = format ["%1With AA capabilities\n",_texto]};
if (!(isNull(_grupo getVariable ["morteros",objNull])) or ({_x call A3A_fnc_typeOfSoldier == "StaticMortar"} count _unidades > 0)) then
	{
	if ({vehicle _x isKindOf "StaticWeapon"} count _unidades > 0) then {_texto = format ["%1Mortar is deployed\n",_texto]} else {_texto = format ["%1Mortar not deployed\n",_texto]};
	}
else
	{
	if ({_x call A3A_fnc_typeOfSoldier == "StaticGunner"} count _unidades > 0) then
		{
		if ({vehicle _x isKindOf "StaticWeapon"} count _unidades > 0) then {_texto = format ["%1Static is deployed\n",_texto]} else {_texto = format ["%1Static not deployed\n",_texto]};
		};
	};

_veh = objNull;
{
_owner = _x getVariable "owner";
if (!isNil "_owner") then {if (_owner == _grupo) exitWith {_veh = _x}};
} forEach vehicles;
if (isNull _veh) then
	{
	{
	if ((vehicle _x != _x) and (_x == driver _x) and !(vehicle _x isKindOf "StaticWeapon")) exitWith {_veh = vehicle _x};
	} forEach _unidades;
	};
if !(isNull _veh) then
	{
	_texto = format ["%1Current vehicle:\n%2\n",_texto,getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")];
	if (!alive _veh) then
		{
		_texto = format ["%1DESTROYED",_texto];
		}
	else
		{
		if (!canMove _veh) then {_texto = format ["%1DISABLED\n",_texto]};
		if (count allTurrets [_veh, false] > 0) then
			{
			if (!canFire _veh) then {_texto = format ["%1WEAPON DISABLED\n",_texto]};
			if (someAmmo _veh) then {_texto = format ["%1Munitioned\n",_texto]};
			};
		_texto = format ["%1Boarded:%2/%3",_texto,{vehicle _x == _veh} count _unidades,{alive _x} count _unidades];
		};
	};
hint format ["%1",_texto];
