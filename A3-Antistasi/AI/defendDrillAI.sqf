private _grupo = _this select 0;
private _marcador = _this select 1;
private _modo = _this select 2;
_objetivos = _grupo call A3A_fnc_enemyList;
_grupo setVariable ["objetivos",_objetivos];
private _size = [_marcador] call A3A_fnc_sizeMarker;
if (_modo != "FORTIFY") then {_grupo setVariable ["tarea","PatrolSoft"]} else {_grupo setVariable ["tarea","FORTIFY"]};
private _lado = side _grupo;
private _friendlies = if (_lado == malos) then {[malos,civilian]} else {[_lado]};
private _morteros = [];
private _mgs = [];
private _movable = [leader _grupo];
private _baseOfFire = [leader _grupo];

{
if (alive _x) then
	{
	_result = _x call A3A_fnc_typeOfSoldier;
	_x setVariable ["maniobrando",false];
	if (_result == "Normal") then
		{
		_movable pushBack _x;
		}
	else
		{
		if (_result == "StaticMortar") then
			{
			_morteros pushBack _x;
			}
		else
			{
			if (_result == "StaticGunner") then
				{
				_mgs pushBack _x;
				};
			_movable pushBack _x;
			_baseOfFire pushBack _x;
			};
		};
	};
} forEach (units _grupo);

if (count _morteros == 1) then
	{
	_morteros append ((units _grupo) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _morteros > 1) then
		{
		//_morteros spawn A3A_fnc_mortarDrill;
		_morteros spawn A3A_fnc_staticMGDrill;//no olvides borrar la otra función si esto funciona
		}
	else
		{
		_movable pushBack (_morteros select 0);
		};
	};
if (count _mgs == 1) then
	{
	_mgs append ((units _grupo) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _mgs == 2) then
		{
		_mgs spawn A3A_fnc_staticMGDrill;
		}
	else
		{
		_movable pushBack (_mgs select 0);
		};
	};

_grupo setVariable ["movable",_movable];
_grupo setVariable ["baseOfFire",_baseOfFire];
if (side _grupo == buenos) then {_grupo setVariable ["autoRearmed",time + 300]};
_edificios = nearestTerrainObjects [getMarkerPos _marcador, ["House"],true];
_edificios = _edificios select {((_x buildingPos -1) isEqualTo []) and !((typeof _bld) in UPSMON_Bld_remove) and (_x inAera _marcador)};

if (_modo == "FORTIFY") then
	{
	_edificios = _edificios call BIS_fnc_arrayShuffle;
	_bldPos = [];
	_cuenta = count _movable;
	_exit = false;
	{
	_edificio = _x;
	if (_exit) exitWith {};
	{
	if ([_x] call isOnRoof) then
		{
		_bldPos pushBack _x;
		if (count _bldPos == _cuenta) then {_exit = true};
		};
	} forEach (_edificio buildingPos -1);
	} forEach _edificios;
	};
while {true} do
	{
	if (({alive _x} count (_grupo getVariable ["movable",[]]) == 0) or (isNull _grupo)) exitWith {};

	_objetivos = _grupo call A3A_fnc_enemyList;
	_grupo setVariable ["objetivos",_objetivos];
	if !(_objetivos isEqualTo []) then
		{
		_aire = objNull;
		_tanques = objNull;
		{
		_eny = assignedVehicle (_x select 4);
		if (_eny isKindOf "Tank") then
			{
			_tanques = _eny;
			}
		else
			{
			if (_eny isKindOf "Air") then
				{
				if (count (weapons _eny) > 1) then
					{
					_aire = _eny;
					};
				};
			};
		if (!(isNull _aire) and !(isNull _tanques)) exitWith {};
		} forEach _objetivos;
		_lider = leader _grupo;
		_allNearFriends = allUnits select {(_x distance _lider < (distanciaSPWN/2)) and (side _x in _friendlies) and ([_x] call A3A_fnc_canFight)};
		{
		_unit = _x;
		{
		_objetivo = _x select 4;
		if (_lider knowsAbout _objetivo >= 1.4) then
			{
			_know = _unit knowsAbout _objetivo;
			if (_know < 1.2) then {_unit reveal [_objetivo,(_know + 0.2)]};
			};
		} forEach _objetivos;
		} forEach (_allNearFriends select {_x == leader _x}) - [_lider];
		_numNearFriends = count _allNearFriends;
		_aire = objNull;
		_tanques = objNull;
		_numObjetivos = count _objetivos;
		_tarea = _grupo getVariable ["tarea","Patrol"];
		_cercano = _grupo call A3A_fnc_enemigoCercano;
		_soldados = ((units _grupo) select {[_x] call A3A_fnc_canFight}) - [_grupo getVariable ["mortero",objNull]];
		_numSoldados = count _soldados;
		if !(isNull _aire) then
			{
			if ({(_x call A3A_fnc_typeOfSoldier == "AAMan") or (_x call A3A_fnc_typeOfSoldier == "StaticGunner")} count _allNearFriends == 0) then
				{
				if (_lado != buenos) then {[[getPosASL _lider,_lado,"Air",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
				};
			//_nuevaTarea = ["Hide",_soldados - (_soldados select {(_x call A3A_fnc_typeOfSoldier == "AAMan") or (_x getVariable ["typeOfSoldier",""] == "StaticGunner")})];
			_grupo setVariable ["tarea","Hide"];
			_tarea = "Hide";
			};
		if !(isNull _tanques) then
			{
			if ({_x call A3A_fnc_typeOfSoldier == "ATMan"} count _allFriendlies == 0) then
				{
				_mortero = _grupo getVariable ["morteros",objNull];
				if (!(isNull _mortero) and ([_mortero] call A3A_fnc_canFight)) then
					{
					if ({if (_x distance _tanques < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortero,getPosASL _tanques,4] spawn A3A_fnc_mortarSupport};
					}
				else
					{
					if (_lado != buenos) then {[[getPosASL _lider,_lado,"Tank",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
					};
				};
			//_nuevaTarea = ["Hide",_soldados - (_soldados select {(_x getVariable ["typeOfSoldier",""] == "ATMan")})];
			_grupo setVariable ["tarea","Hide"];
			_tarea = "Hide";
			};
		if (_numObjetivos > 2*_numNearFriends) then
			{
			if !(isNull _cercano) then
				{
				if (_lado != buenos) then {[[getPosASL _lider,_lado,"Normal",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
				_mortero = _grupo getVariable ["morteros",objNull];
				if (!(isNull _mortero) and ([_mortero] call A3A_fnc_canFight)) then
					{
					if ({if (_x distance _cercano < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortero,getPosASL _cercano,1] spawn A3A_fnc_mortarSupport};
					};
				};
			_grupo setVariable ["tarea","Hide"];
			_tarea = "Hide";
			};


		if (_tarea == "Patrol") then
			{
			if ((_cercano distance _lider < 150) and !(isNull _cercano)) then
				{
				_grupo setVariable ["tarea","Assault"];
				_tarea = "Assault";
				}
			else
				{
				if (_numObjetivos > 1) then
					{
					_mortero = _grupo getVariable ["morteros",objNull];
					if (!(isNull _mortero) and ([_mortero] call A3A_fnc_canFight)) then
						{
						if ({if (_x distance _cercano < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortero,getPosASL _cercano,1] spawn A3A_fnc_mortarSupport};
						};
					};
				};
			};

		if (_tarea == "Assault") then
			{
			if (_cercano distance _lider < 50) then
				{
				_grupo setVariable ["tarea","AssaultClose"];
				_tarea = "AssaultClose";
				}
			else
				{
				if (_cercano distance _lider > 150) then
					{
					_grupo setVariable ["tarea","Patrol"];
					}
				else
					{
					if !(isNull _cercano) then
						{
						{
						[_x,_cercano] call A3A_fnc_fuegoSupresor;
						} forEach ((_grupo getVariable ["baseOfFire",[]]) select {([_x] call A3A_fnc_canFight) and ((_x getVariable ["typeOfSoldier",""] == "MGMan") or (_x getVariable ["typeOfSoldier",""] == "StaticGunner"))});
						_mortero = _grupo getVariable ["morteros",objNull];
						if (!(isNull _mortero) and ([_mortero] call A3A_fnc_canFight)) then
							{
							if ({if (_x distance _cercano < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortero,getPosASL _cercano,1] spawn A3A_fnc_mortarSupport};
							};
						};
					};
				};
			};

		if (_tarea == "AssaultClose") then
			{
			if (_cercano distance _lider > 150) then
				{
				_grupo setVariable ["tarea","Patrol"];
				}
			else
				{
				if (_cercano distance _lider > 50) then
					{
					_grupo setVariable ["tarea","Assault"];
					}
				else
					{
					if !(isNull _cercano) then
						{
						_flankers = (_grupo getVariable ["flankers",[]]) select {([_x] call A3A_fnc_canFight) and !(_x getVariable ["maniobrando",false])};
						if (count _flankers != 0) then
							{
							{
							[_x,_x,_cercano] spawn A3A_fnc_cubrirConHumo;
							} forEach ((_grupo getVariable ["baseOfFire",[]]) select {([_x] call A3A_fnc_canFight) and (_x getVariable ["typeOfSoldier",""] == "Normal")});
							if ([getPosASL _cercano] call A3A_fnc_isBuildingPosition) then
								{
								_ingeniero = objNull;
								_building = nearestBuilding _cercano;
								if !(_building getVariable ["asaltado",false]) then
									{
									{
									if ((_x call A3A_fnc_typeOfSoldier == "Engineer") and {_x != leader _x} and {!(_x getVariable ["maniobrando",true])} and {_x distance _cercano < 50} and {[_x] call A3A_fnc_canFight}) exitWith {_ingeniero = _x};
									} forEach (_grupo getVariable ["baseOfFire",[]]);
									if !(isNull _ingeniero) then
										{
										[_ingeniero,_cercano,_building] spawn A3A_fnc_destroyBuilding;
										}
									else
										{
										[[_flankers,_cercano] call BIS_fnc_nearestPosition,_cercano,_building] spawn A3A_fnc_assaultBuilding;
										};
									};
								}
							else
								{
								[_flankers,_cercano] spawn A3A_fnc_doFlank;
								};
							};
						};
					};
				};
			};

		if (_tarea == "Hide") then
			{
			if ((isNull _tanques) and {isNull _aire} and {_numObjetivos <= 2*_numNearFriends}) then
				{
				_grupo setVariable ["tarea","Patrol"];
				}
			else
				{
				_movable = (_grupo getVariable ["movable",[]]) select {[_x] call A3A_fnc_canFight and !(_x getVariable ["maniobrando",false])};
				_movable spawn A3A_fnc_hideInBuilding;
				};
			};
		}
	else
		{
		if (_grupo getVariable ["tarea","Patrol"] != "Patrol") then
			{
			if (_grupo getVariable ["tarea","Patrol"] == "Hide") then {_grupo call A3A_fnc_recallGroup};
			_grupo setVariable ["tarea","Patrol"];
			};
		if (side _grupo == buenos) then
			{
			if (time >= _grupo getVariable ["autoRearm",time]) then
				{
				_grupo setVariable ["autoRearm",time + 120];
				{[_x] spawn A3A_fnc_autoRearm; sleep 1} forEach ((_grupo getVariable ["movable",[]]) select {[_x] call A3A_fnc_canFight and !(_x getVariable ["maniobrando",false])});
				};
			};
		};
	diag_log format ["Tarea:%1.Movable:%2.Base:%3.Flankers:%4",_grupo getVariable "tarea",_grupo getVariable "movable",_grupo getVariable "baseOfFire",_grupo getVariable "flankers"];
	sleep 30;
	};
