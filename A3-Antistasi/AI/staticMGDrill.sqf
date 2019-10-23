private ["_gunner","_ayudante"];
private _esMortero = false;
{if (_x getVariable ["typeOfSoldier",""] == "StaticGunner") then {_gunner = _x} else {_ayudante = _x}} forEach _this;
{if (_x getVariable ["typeOfSoldier",""] == "StaticMortar") then {_gunner = _x;_esMortero = true} else {_ayudante = _x}} forEach _this;
private _grupo = group _gunner;
private _mounted = false;
private _veh = objNull;
private _lado = side _grupo;
private _tipoVeh = 	if !(_esMortero) then
						{
						if (_lado == malos) then {NATOMG} else {if (_lado == muyMalos) then {CSATMG} else {SDKMGStatic}};
						}
					else
						{
						if (_lado == malos) then {NATOMortar} else {if (_lado == muyMalos) then {CSATMortar} else {SDKMortar}};
						};
private _mochiG = backPack _gunner;
private _mochiA = backpack _ayudante;
while {(alive _gunner)} do
	{
	if (!(alive _ayudante) and !(_mounted)) exitWith {};
	if (!(isNull _veh) and !(alive _veh)) exitWith {};
	_objetivos = _grupo getVariable ["objetivos",[]];
	_enemigo = objNull;
	if (!(_objetivos isEqualTo []) and (((_objetivos select 0) select 4) distance _gunner > 150))  then
		{
		if !(_esMortero) then
			{
			{
			_eny = _x select 4;
			if !(_eny isKindOf "Tank") then
				{
				if  (([objNull, "VIEW"] checkVisibility [eyePos _eny, eyePos _gunner]) > 0) then
					{
					_enemigo = _eny;
					};
				};
			if !(isNull _enemigo) exitWith {};
			} forEach _objetivos;
			}
		else
			{
			_enemigo = ((_objetivos select 0) select 4);
			};
		};
	if !(isNull _enemigo) then
		{
		if !(_mounted) then
			{
			if !(_gunner getVariable ["maniobrando",false]) then
				{
				if (([_gunner] call A3A_fnc_canFight) and ([_ayudante] call A3A_fnc_canFight)) then
					{
					_gunner setVariable ["maniobrando",true];
					_gunner playMoveNow selectRandom medicAnims;
					_gunner setVariable ["timeToBuild",time + 30];
					_gunner addEventHandler ["AnimDone",
						{
						private _gunner = _this select 0;
						if ((time > _gunner getVariable ["timeToBuild",0]) or !([_gunner] call A3A_fnc_canFight)) then
							{
							_gunner removeEventHandler ["AnimDone",_thisEventHandler];
							_gunner setVariable ["maniobrando",false];
							}
						else
							{
							_gunner playMoveNow selectRandom medicAnims;
							};
						}];
					waitUntil {sleep 0.5; !(_gunner getVariable ["maniobrando",false])};
					_gunner setVariable ["timeToBuild",nil];
					if ([_gunner] call A3A_fnc_canFight) then
						{
						private _veh = _tipoVeh createVehicle [0,0,1000];
						_veh setPos position (_gunner);
						removeBackpackGlobal _gunner;
						removeBackpackGlobal _ayudante;
						_grupo addVehicle _veh;
						_gunner assignAsGunner _veh;
						[_gunner] orderGetIn true;
						[_gunner] allowGetIn true;
						_gunner moveInGunner _veh;
						[_veh] call A3A_fnc_AIVEHinit;
						_mounted = true;
						if (_esMortero) then {_grupo setVariable ["morteros",_gunner]};
						sleep 60;
						};
					};
				};
			}
		else
			{
			if (_gunner getVariable ["maniobrando",false]) then
				{
				if (([_gunner] call A3A_fnc_canFight) and ([_ayudante] call A3A_fnc_canFight)) then
					{
					[_gunner] orderGetIn false;
					[_gunner] allowGetIn false;
					waitUntil {sleep 1; (vehicle _gunner == _gunner) or !(alive _gunner)};
					if (alive _gunner) then
						{
						_mounted = false;
						_gunner addBackpackGlobal _mochiG;
						_ayudante addBackpackGlobal _mochiA;
						deleteVehicle _veh;
						_gunner call A3A_fnc_recallGroup;
						if (_esMortero) then {_grupo setVariable ["morteros",objNull]};
						};
					};
				};
			};
		}
	else
		{
		if (_mounted) then
			{
			if (([_gunner] call A3A_fnc_canFight) and ([_ayudante] call A3A_fnc_canFight)) then
				{
				[_gunner] orderGetIn false;
				[_gunner] allowGetIn false;
				_veh = vehicle _gunner;
				moveOut _gunner;
				_mounted = false;
				_gunner addBackpackGlobal _mochiG;
				_ayudante addBackpackGlobal _mochiA;
				deleteVehicle _veh;
				_gunner call A3A_fnc_recallGroup;
				if (_esMortero) then {_grupo setVariable ["morteros",objNull]};
				};
			};
		};

	sleep 15;
	};
if (alive _gunner) then
	{
	[_gunner] orderGetIn false;
	[_gunner] allowGetIn false;
	moveOut _gunner;
	_gunner setVariable ["maniobrando",false];
	_flankers = _grupo getVariable ["flankers",[]];
	_flankers pushBack _gunner;
	_grupo setVariable ["flankers",_flankers];
	_gunner call A3A_fnc_recallGroup;
	};
if (alive _ayudante) then
	{
	_ayudante setVariable ["maniobrando",false];
	_flankers = _grupo getVariable ["flankers",[]];
	_flankers pushBack _ayudante;
	_grupo setVariable ["flankers",_flankers];
	_ayudante call A3A_fnc_recallGroup;
	};