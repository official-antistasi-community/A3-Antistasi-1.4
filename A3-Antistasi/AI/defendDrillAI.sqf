private _groupX = _this select 0;
private _markerX = _this select 1;
private _modeX = _this select 2;
_objectivesX = _groupX call A3A_fnc_enemyList;
_groupX setVariable ["objectivesX",_objectivesX];
private _size = [_markerX] call A3A_fnc_sizeMarker;
if (_modeX != "FORTIFY") then {_groupX setVariable ["taskX","PatrolSoft"]} else {_groupX setVariable ["taskX","FORTIFY"]};
private _sideX = side _groupX;
private _friendlies = if (_sideX == Occupants) then {[Occupants,civilian]} else {[_sideX]};
private _mortarsX = [];
private _mgs = [];
private _movable = [leader _groupX];
private _baseOfFire = [leader _groupX];

{
if (alive _x) then
	{
	_result = _x call A3A_fnc_typeOfSoldier;
	_x setVariable ["maneuvering",false];
	if (_result == "Normal") then
		{
		_movable pushBack _x;
		}
	else
		{
		if (_result == "StaticMortar") then
			{
			_mortarsX pushBack _x;
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
} forEach (units _groupX);

if (count _mortarsX == 1) then
	{
	_mortarsX append ((units _groupX) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _mortarsX > 1) then
		{
		//_mortarsX spawn A3A_fnc_mortarDrill;
		_mortarsX spawn A3A_fnc_staticMGDrill;//no olvides borrar la otra función si esto funciona
		}
	else
		{
		_movable pushBack (_mortarsX select 0);
		};
	};
if (count _mgs == 1) then
	{
	_mgs append ((units _groupX) select {_x getVariable ["typeOfSoldier",""] == "StaticBase"});
	if (count _mgs == 2) then
		{
		_mgs spawn A3A_fnc_staticMGDrill;
		}
	else
		{
		_movable pushBack (_mgs select 0);
		};
	};

_groupX setVariable ["movable",_movable];
_groupX setVariable ["baseOfFire",_baseOfFire];
if (side _groupX == teamPlayer) then {_groupX setVariable ["autoRearmed",time + 300]};
_buildingsX = nearestTerrainObjects [getMarkerPos _markerX, ["House"],true];
_buildingsX = _buildingsX select {((_x buildingPos -1) isEqualTo []) and !((typeof _bld) in UPSMON_Bld_remove) and (_x inArea _markerX)};

if (_modeX == "FORTIFY") then
	{
	_buildingsX = _buildingsX call BIS_fnc_arrayShuffle;
	_bldPos = [];
	_countX = count _movable;
	_exit = false;
	{
	_edificio = _x;
	if (_exit) exitWith {};
	{
	if ([_x] call isOnRoof) then
		{
		_bldPos pushBack _x;
		if (count _bldPos == _countX) then {_exit = true};
		};
	} forEach (_edificio buildingPos -1);
	} forEach _buildingsX;
	};
while {true} do
	{
	if (({alive _x} count (_groupX getVariable ["movable",[]]) == 0) or (isNull _groupX)) exitWith {};

	_objectivesX = _groupX call A3A_fnc_enemyList;
	_groupX setVariable ["objectivesX",_objectivesX];
	if !(_objectivesX isEqualTo []) then
		{
		_air = objNull;
		_tanksX = objNull;
		{
		_eny = assignedVehicle (_x select 4);
		if (_eny isKindOf "Tank") then
			{
			_tanksX = _eny;
			}
		else
			{
			if (_eny isKindOf "Air") then
				{
				if (count (weapons _eny) > 1) then
					{
					_air = _eny;
					};
				};
			};
		if (!(isNull _air) and !(isNull _tanksX)) exitWith {};
		} forEach _objectivesX;
		_LeaderX = leader _groupX;
		_allNearFriends = allUnits select {(_x distance _LeaderX < (distanceSPWN/2)) and (side _x in _friendlies) and ([_x] call A3A_fnc_canFight)};
		{
		_unit = _x;
		{
		_objectiveX = _x select 4;
		if (_LeaderX knowsAbout _objectiveX >= 1.4) then
			{
			_know = _unit knowsAbout _objectiveX;
			if (_know < 1.2) then {_unit reveal [_objectiveX,(_know + 0.2)]};
			};
		} forEach _objectivesX;
		} forEach (_allNearFriends select {_x == leader _x}) - [_LeaderX];
		_numNearFriends = count _allNearFriends;
		_air = objNull;
		_tanksX = objNull;
		_numObjectives = count _objectivesX;
		_taskX = _groupX getVariable ["taskX","Patrol"];
		_nearX = _groupX call A3A_fnc_nearEnemy;
		_soldiers = ((units _groupX) select {[_x] call A3A_fnc_canFight}) - [_groupX getVariable ["mortarX",objNull]];
		_numSoldiers = count _soldiers;
		if !(isNull _air) then
			{
			if ({(_x call A3A_fnc_typeOfSoldier == "AAMan") or (_x call A3A_fnc_typeOfSoldier == "StaticGunner")} count _allNearFriends == 0) then
				{
				if (_sideX != teamPlayer) then {[[getPosASL _LeaderX,_sideX,"Air",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
				};
			//_nuevataskX = ["Hide",_soldiers - (_soldiers select {(_x call A3A_fnc_typeOfSoldier == "AAMan") or (_x getVariable ["typeOfSoldier",""] == "StaticGunner")})];
			_groupX setVariable ["taskX","Hide"];
			_taskX = "Hide";
			};
		if !(isNull _tanksX) then
			{
			if ({_x call A3A_fnc_typeOfSoldier == "ATMan"} count _allFriendlies == 0) then
				{
				_mortarX = _groupX getVariable ["mortarsX",objNull];
				if (!(isNull _mortarX) and ([_mortarX] call A3A_fnc_canFight)) then
					{
					if ({if (_x distance _tanksX < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortarX,getPosASL _tanksX,4] spawn A3A_fnc_mortarSupport};
					}
				else
					{
					if (_sideX != teamPlayer) then {[[getPosASL _LeaderX,_sideX,"Tank",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
					};
				};
			//_nuevataskX = ["Hide",_soldiers - (_soldiers select {(_x getVariable ["typeOfSoldier",""] == "ATMan")})];
			_groupX setVariable ["taskX","Hide"];
			_taskX = "Hide";
			};
		if (_numObjectives > 2*_numNearFriends) then
			{
			if !(isNull _nearX) then
				{
				if (_sideX != teamPlayer) then {[[getPosASL _LeaderX,_sideX,"Normal",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2]};
				_mortarX = _groupX getVariable ["mortarsX",objNull];
				if (!(isNull _mortarX) and ([_mortarX] call A3A_fnc_canFight)) then
					{
					if ({if (_x distance _nearX < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortarX,getPosASL _nearX,1] spawn A3A_fnc_mortarSupport};
					};
				};
			_groupX setVariable ["taskX","Hide"];
			_taskX = "Hide";
			};


		if (_taskX == "Patrol") then
			{
			if ((_nearX distance _LeaderX < 150) and !(isNull _nearX)) then
				{
				_groupX setVariable ["taskX","Assault"];
				_taskX = "Assault";
				}
			else
				{
				if (_numObjectives > 1) then
					{
					_mortarX = _groupX getVariable ["mortarsX",objNull];
					if (!(isNull _mortarX) and ([_mortarX] call A3A_fnc_canFight)) then
						{
						if ({if (_x distance _nearX < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortarX,getPosASL _nearX,1] spawn A3A_fnc_mortarSupport};
						};
					};
				};
			};

		if (_taskX == "Assault") then
			{
			if (_nearX distance _LeaderX < 50) then
				{
				_groupX setVariable ["taskX","AssaultClose"];
				_taskX = "AssaultClose";
				}
			else
				{
				if (_nearX distance _LeaderX > 150) then
					{
					_groupX setVariable ["taskX","Patrol"];
					}
				else
					{
					if !(isNull _nearX) then
						{
						{
						[_x,_nearX] call A3A_fnc_suppressingFire;
						} forEach ((_groupX getVariable ["baseOfFire",[]]) select {([_x] call A3A_fnc_canFight) and ((_x getVariable ["typeOfSoldier",""] == "MGMan") or (_x getVariable ["typeOfSoldier",""] == "StaticGunner"))});
						_mortarX = _groupX getVariable ["mortarsX",objNull];
						if (!(isNull _mortarX) and ([_mortarX] call A3A_fnc_canFight)) then
							{
							if ({if (_x distance _nearX < 100) exitWith {1}} count _allNearFriends == 0) then {[_mortarX,getPosASL _nearX,1] spawn A3A_fnc_mortarSupport};
							};
						};
					};
				};
			};

		if (_taskX == "AssaultClose") then
			{
			if (_nearX distance _LeaderX > 150) then
				{
				_groupX setVariable ["taskX","Patrol"];
				}
			else
				{
				if (_nearX distance _LeaderX > 50) then
					{
					_groupX setVariable ["taskX","Assault"];
					}
				else
					{
					if !(isNull _nearX) then
						{
						_flankers = (_groupX getVariable ["flankers",[]]) select {([_x] call A3A_fnc_canFight) and !(_x getVariable ["maneuvering",false])};
						if (count _flankers != 0) then
							{
							{
							[_x,_x,_nearX] spawn A3A_fnc_chargeWithSmoke;
							} forEach ((_groupX getVariable ["baseOfFire",[]]) select {([_x] call A3A_fnc_canFight) and (_x getVariable ["typeOfSoldier",""] == "Normal")});
							if ([getPosASL _nearX] call A3A_fnc_isBuildingPosition) then
								{
								_engineerX = objNull;
								_building = nearestBuilding _nearX;
								if !(_building getVariable ["assaulted",false]) then
									{
									{
									if ((_x call A3A_fnc_typeOfSoldier == "Engineer") and {_x != leader _x} and {!(_x getVariable ["maneuvering",true])} and {_x distance _nearX < 50} and {[_x] call A3A_fnc_canFight}) exitWith {_engineerX = _x};
									} forEach (_groupX getVariable ["baseOfFire",[]]);
									if !(isNull _engineerX) then
										{
										[_engineerX,_nearX,_building] spawn A3A_fnc_destroyBuilding;
										}
									else
										{
										[[_flankers,_nearX] call BIS_fnc_nearestPosition,_nearX,_building] spawn A3A_fnc_assaultBuilding;
										};
									};
								}
							else
								{
								[_flankers,_nearX] spawn A3A_fnc_doFlank;
								};
							};
						};
					};
				};
			};

		if (_taskX == "Hide") then
			{
			if ((isNull _tanksX) and {isNull _air} and {_numObjectives <= 2*_numNearFriends}) then
				{
				_groupX setVariable ["taskX","Patrol"];
				}
			else
				{
				_movable = (_groupX getVariable ["movable",[]]) select {[_x] call A3A_fnc_canFight and !(_x getVariable ["maneuvering",false])};
				_movable spawn A3A_fnc_hideInBuilding;
				};
			};
		}
	else
		{
		if (_groupX getVariable ["taskX","Patrol"] != "Patrol") then
			{
			if (_groupX getVariable ["taskX","Patrol"] == "Hide") then {_groupX call A3A_fnc_recallGroup};
			_groupX setVariable ["taskX","Patrol"];
			};
		if (side _groupX == teamPlayer) then
			{
			if (time >= _groupX getVariable ["autoRearm",time]) then
				{
				_groupX setVariable ["autoRearm",time + 120];
				{[_x] spawn A3A_fnc_autoRearm; sleep 1} forEach ((_groupX getVariable ["movable",[]]) select {[_x] call A3A_fnc_canFight and !(_x getVariable ["maneuvering",false])});
				};
			};
		};
	diag_log format ["taskX:%1.Movable:%2.Base:%3.Flankers:%4",_groupX getVariable "taskX",_groupX getVariable "movable",_groupX getVariable "baseOfFire",_groupX getVariable "flankers"];
	sleep 30;
	};
