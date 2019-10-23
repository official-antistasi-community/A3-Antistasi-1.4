private ["_player"];
if (player != player getVariable ["owner",player]) exitWith {hint "You cannot go Undercover while you are controlling AI"};
_player = player getVariable ["owner",player];
if (captive _player) exitWith {hint "You are Undercover already"};

private ["_compromised","_cambiar","_aeropuertos","_arrayCivVeh","_player","_size","_base"];

_cambiar = "";
_aeropuertos = aeropuertos + puestos + (controles select {isOnRoad (getMarkerPos _x)});
_aeropuertos1 = aeropuertos;
_arrayCivVeh = arrayCivVeh + [civHeli] + civBoats;
_compromised = _player getVariable "compromised";

if (vehicle _player != _player) then
	{
	if (not(typeOf(vehicle _player) in _arrayCivVeh)) then
		{
		hint "You are not in a civilian vehicle";
		_cambiar = "Init"
		};
	if (vehicle _player in reportedVehs) then
		{
		hint "This vehicle has been reported to the enemy. Change or renew your vehicle in the Garage to go Undercover";
		_cambiar = "Init";
		};
	}
else
	{
	if ((primaryWeapon _player != "") or (secondaryWeapon _player != "") or (handgunWeapon _player != "") or (vest _player != "") or (getNumber (configfile >> "CfgWeapons" >> headgear _player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) or (hmd _player != "") or (not(uniform _player in civUniforms))) then
		{
		hint "You cannot go Undercover while:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform";
		_cambiar = "Init";
		};
	if (dateToNumber date < _compromised) then
		{
		hint "You have been reported in the last 30 minutes therefore you cannot go Undercover";
		_cambiar = "Init";
		};
	};

if (_cambiar != "") exitWith {};

if ({((side _x== muyMalos) or (side _x== malos)) and (((_x knowsAbout _player > 1.4) and (_x distance _player < 500)) or (_x distance _player < 350))} count allUnits > 0) exitWith
	{
	hint "You cannot go Undercover while enemies are spotting you";
	if (vehicle _player != _player) then
		{
		{
		if ((isPlayer _x) and (captive _x)) then {[_x,false] remoteExec ["setCaptive"]; _x setCaptive false; reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs"}
		} forEach ((crew (vehicle _player)) + (assignedCargo (vehicle _player)) - [_player]);
		};
	};

_base = [_aeropuertos,_player] call BIS_fnc_nearestPosition;
_size = [_base] call A3A_fnc_sizeMarker;
if ((_player distance getMarkerPos _base < _size*2) and (not(lados getVariable [_base,sideUnknown] == buenos))) exitWith {hint "You cannot go Undercover near Airports, Outposts or Roadblocks"};

["Undercover ON",0,0,4,0,0,4] spawn bis_fnc_dynamicText;

[_player,true] remoteExec ["setCaptive",0,_player];
_player setCaptive true;
[] spawn A3A_fnc_statistics;
if (_player == leader group _player) then
	{
	{if ((!isplayer _x) and (local _x) and (_x getVariable ["owner",_x] == _player)) then {[_x] spawn A3A_fnc_undercoverAI}} forEach units group _player;
	};
_estaEnControl = false;
while {_cambiar == ""} do
	{
	sleep 1;
	if (!captive _player) then
		{
		_cambiar = "Reported";
		}
	else
		{
		_veh = vehicle _player;
		_tipo = typeOf _veh;
		if (_veh != _player) then
			{
			if (not(_tipo in _arrayCivVeh)) then
				{
				_cambiar = "VNoCivil"
				}
			else
				{
				if (_veh in reportedVehs) then
					{
					_cambiar = "VCompromised"
					}
				else
					{
					if ((_tipo != civHeli) and (!(_tipo in civBoats))) then
						{
						if !(isOnRoad position _veh) then
							{
							if (count (_veh nearRoads 50) == 0) then
								{
								if ({((side _x== muyMalos) or (side _x== malos)) and ((_x knowsAbout _player > 1.4) or (_x distance _player < 350))} count allUnits > 0) then {_cambiar = "Carretera"};
								};
							};
						if (hayACE) then
							{
			  				if (((position _player nearObjects ["DemoCharge_Remote_Ammo", 5]) select 0) mineDetectedBy malos) then
								{
								_cambiar = "SpotBombTruck";
								};
							if (((position _player nearObjects ["SatchelCharge_Remote_Ammo", 5]) select 0) mineDetectedBy malos) then
								{
								_cambiar = "SpotBombTruck";
								};
							};
						};
					};
				}
			}
		else
			{
			if ((primaryWeapon _player != "") or (secondaryWeapon _player != "") or (handgunWeapon _player != "") or (vest _player != "") or (getNumber (configfile >> "CfgWeapons" >> headgear _player >> "ItemInfo" >> "HitpointsProtectionInfo" >> "Head" >> "armor") > 2) or (hmd _player != "") or (not(uniform _player in civUniforms))) then
				{
				if ({((side _x== muyMalos) or (side _x== malos)) and ((_x knowsAbout _player > 1.4) or (_x distance _player < 350))} count allUnits > 0) then {_cambiar = "Vestido2"} else {_cambiar = "Vestido"};
				};
			if (dateToNumber date < _compromised) then
				{
				_cambiar = "Compromised";
				};
			};
		if (_cambiar == "") then
			{
			if ((_tipo != civHeli) and (!(_tipo in civBoats))) then
				{
				_base = [_aeropuertos,_player] call BIS_fnc_nearestPosition;
				//_size = [_base] call A3A_fnc_sizeMarker;
				if ((_player inArea _base) and (lados getVariable [_base,sideUnknown] != buenos)) then
					{
					if !(_estaEnControl) then
						{
						_aggro = if (lados getVariable [_base,sideUnknown] == malos) then {prestigeNATO} else {prestigeCSAT};
						if (random 100 < _aggro) then
							{
							_cambiar = "Control";
							}
						else
							{
							_estaEnControl = true;
							};
						};
					}
				else
					{
					_estaEnControl = false;
					};
				}
			else
				{
				if (_tipo == civHeli) then
					{
					_base = [_aeropuertos1,_player] call BIS_fnc_nearestPosition;
					_size = [_base] call A3A_fnc_sizeMarker;
					if ((_player distance2d getMarkerPos _base < _size*3) and ((lados getVariable [_base,sideUnknown] == malos) or (lados getVariable [_base,sideUnknown] == muyMalos))) then
						{
						_cambiar = "NoFly";
						};
					};
				};
			};
		};
	};

if (captive _player) then {[_player,false] remoteExec ["setCaptive"]; _player setCaptive false};

if (vehicle _player != _player) then
	{
	{if (isPlayer _x) then {[_x,false] remoteExec ["setCaptive",0,_x]; _x setCaptive false}} forEach ((assignedCargo (vehicle _player)) + (crew (vehicle _player)) - [_player]);
	};

["Undercover OFF",0,0,4,0,0,4] spawn bis_fnc_dynamicText;
[] spawn A3A_fnc_statistics;
switch _cambiar do
	{
	case "Reported":
		{
		hint "You have been reported or spotted by the enemy";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then
			{
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
			}
		else
			{
			_player setVariable ["compromised",(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
			};
		};
	case "VNoCivil": {hint "You entered a non civilian vehicle"};
	case "VCompromised": {hint "You entered in a reported vehicle"};
	case "SpotBombTruck":
		{
		hint "Explosives have been spotted on your vehicle";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "Carretera":
		{
		hint "You went too far away from any roads and have been spotted";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "Vestido": {hint "You cannot stay Undercover while:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform"};
	case "Vestido2":
		{
		hint "You cannot stay Undercover while showing:\n\nA weapon is visible\nWearing a vest\nWearing a helmet\nWearing NVGs\nWearing a mil uniform\n\nThe enemy added you to their Wanted List";
		_player setVariable ["compromised",dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30]];
		};
	case "Compromised": {hint "You left your vehicle and you are still on the Wanted List"};
	case "Distancia":
		{
		hint "You have gotten too close to an enemy Base, Outpost or Roadblock";
		//_compromised = _player getVariable "compromised";
		if (vehicle _player != _player) then
			{
			//_player setVariable ["compromised",[_compromised select 0,vehicle _player]];
			reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
			}
		else
			{
			_player setVariable ["compromised",(dateToNumber [date select 0, date select 1, date select 2, date select 3, (date select 4) + 30])];
			};
		};
	case "NoFly":
		{
		hint "You have gotten too close to an enemy Airbase no-fly zone";
		//_compromised = _player getVariable "compromised";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	case "Control":
		{
		hint "The Roadblock Garrison has recognised you";
		//_compromised = _player getVariable "compromised";
		reportedVehs pushBackUnique (vehicle _player); publicVariable "reportedVehs";
		};
	};
