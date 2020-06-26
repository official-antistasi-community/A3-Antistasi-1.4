if (count hcSelected player == 0) exitWith {["Vehicle Info", "You must select one group on the HC bar"] call A3A_fnc_customHint;};

private ["_groupX","_veh","_textX","_unitsX"];

/*
_esStatic = false;
{if (vehicle _x isKindOf "StaticWeapon") exitWith {_esStatic = true}} forEach units _groupX;
if (_esStatic) exitWith {hint "Static Weapon squad vehicles cannot be managed"};
*/

if (_this select 0 == "mount") exitWith
	{
	_textX = "";
	{
	_groupX = _x;
	_veh = objNull;
	{
	_owner = _x getVariable "owner";
	if (!isNil "_owner") then {if (_owner == _groupX) exitWith {_veh = _x}};
	} forEach vehicles;
	if !(isNull _veh) then
		{
		_transporte = true;
		if (count allTurrets [_veh, false] > 0) then {_transporte = false};
		if (_transporte) then
			{
			if (leader _groupX in _veh) then
				{
				_textX = format ["%2%1 dismounting<br/>",groupID _groupX,_textX];
				{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _groupX;
				}
			else
				{
				_textX = format ["%2%1 boarding<br/>",groupID _groupX,_textX];
				{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
				};
			}
		else
			{
			if (leader _groupX in _veh) then
				{
				_textX = format ["%2%1 dismounting<br/>",groupID _groupX,_textX];
				if (canMove _veh) then
					{
					{[_x] orderGetIn false; [_x] allowGetIn false} forEach assignedCargo _veh;
					}
				else
					{
					_veh allowCrewInImmobile false;
					{[_x] orderGetIn false; [_x] allowGetIn false} forEach units _groupX;
					}
				}
			else
				{
				_textX = format ["%2%1 boarding<br/>",groupID _groupX,_textX];
				{[_x] orderGetIn true; [_x] allowGetIn true} forEach units _groupX;
				};
			};
		};
	} forEach hcSelected player;
	if (_textX != "") then {["Vehicle Info", format ["%1",_textX]] call A3A_fnc_customHint;};
	};
_textX = "";
_groupX = (hcSelected player select 0);
player sideChat format ["%1, SITREP!!",groupID _groupX];
_unitsX = units _groupX;
_textX = format ["%1 Status<br/><br/>Alive members: %2<br/>Able to combat: %3<br/>Current task: %4<br/>Combat Mode:%5<br/>",groupID _groupX,{alive _x} count _unitsX,{[_x] call A3A_fnc_canFight} count _unitsX,_groupX getVariable ["taskX","Patrol"],behaviour (leader _groupX)];
if ({[_x] call A3A_fnc_isMedic} count _unitsX > 0) then {_textX = format ["%1Operative Medic<br/>",_textX]} else {_textX = format ["%1No operative Medic<br/>",_textX]};
if ({_x call A3A_fnc_typeOfSoldier == "ATMan"} count _unitsX > 0) then {_textX = format ["%1With AT capabilities<br/>",_textX]};
if ({_x call A3A_fnc_typeOfSoldier == "AAMan"} count _unitsX > 0) then {_textX = format ["%1With AA capabilities<br/>",_textX]};
if (!(isNull(_groupX getVariable ["mortarsX",objNull])) or ({_x call A3A_fnc_typeOfSoldier == "StaticMortar"} count _unitsX > 0)) then
	{
	if ({vehicle _x isKindOf "StaticWeapon"} count _unitsX > 0) then {_textX = format ["%1Mortar is deployed<br/>",_textX]} else {_textX = format ["%1Mortar not deployed<br/>",_textX]};
	}
else
	{
	if ({_x call A3A_fnc_typeOfSoldier == "StaticGunner"} count _unitsX > 0) then
		{
		if ({vehicle _x isKindOf "StaticWeapon"} count _unitsX > 0) then {_textX = format ["%1Static is deployed<br/>",_textX]} else {_textX = format ["%1Static not deployed<br/>",_textX]};
		};
	};

_veh = objNull;
{
_owner = _x getVariable "owner";
if (!isNil "_owner") then {if (_owner == _groupX) exitWith {_veh = _x}};
} forEach vehicles;
if (isNull _veh) then
	{
	{
	if ((vehicle _x != _x) and (_x == driver _x) and !(vehicle _x isKindOf "StaticWeapon")) exitWith {_veh = vehicle _x};
	} forEach _unitsX;
	};
if !(isNull _veh) then
	{
	_textX = format ["%1Current vehicle:<br/>%2<br/>",_textX,getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")];
	if (!alive _veh) then
		{
		_textX = format ["%1DESTROYED",_textX];
		}
	else
		{
		if (!canMove _veh) then {_textX = format ["%1DISABLED<br/>",_textX]};
		if (count allTurrets [_veh, false] > 0) then
			{
			if (!canFire _veh) then {_textX = format ["%1WEAPON DISABLED<br/>",_textX]};
			if (someAmmo _veh) then {_textX = format ["%1Munitioned<br/>",_textX]};
			};
		_textX = format ["%1Boarded:%2/%3",_textX,{vehicle _x == _veh} count _unitsX,{alive _x} count _unitsX];
		};
	};
["Vehicle Info", format ["%1",_textX]] call A3A_fnc_customHint;
