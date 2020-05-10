private ["_veh","_typeX"];

_veh = _this select 0;
if (isNil "_veh") exitWith {};
if ((_veh isKindOf "FlagCarrier") or (_veh isKindOf "Building") or (_veh isKindOf "ReammoBox_F")) exitWith {};
//if (_veh isKindOf "ReammoBox_F") exitWith {[_veh] call A3A_fnc_NATOcrate};

_typeX = typeOf _veh;

if ((_typeX in vehNormal) or (_typeX in vehAttack) or (_typeX in vehBoats)) then
{
	_veh call A3A_fnc_addActionBreachVehicle;

	_veh addEventHandler ["Killed",
		{
		private _veh = _this select 0;
		(typeOf _veh) call A3A_fnc_removeVehFromPool;
		_veh removeAllEventHandlers "HandleDamage";
		}];
	if !(_typeX in vehAttack) then
	{
		if (_veh isKindOf "Car") then
			{
			_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != teamPlayer)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
			if ({"SmokeLauncher" in (_veh weaponsTurret _x)} count (allTurrets _veh) > 0) then
				{
				_veh setVariable ["within",true];
				_veh addEventHandler ["GetOut", {private ["_veh"]; _veh = _this select 0; if (side (_this select 2) != teamPlayer) then {if (_veh getVariable "within") then {_veh setVariable ["within",false]; [_veh] call A3A_fnc_smokeCoverAuto}}}];
				_veh addEventHandler ["GetIn", {private ["_veh"]; _veh = _this select 0; if (side (_this select 2) != teamPlayer) then {_veh setVariable ["within",true]}}];
				};
			};
        if(_typeX in vehTrucks) then
        {
            _veh addEventHandler ["killed",
            {
                private ["_veh","_typeX"];
                _veh = _this select 0;
                _typeX = typeOf _veh;
                if (side (_this select 1) == teamPlayer) then
                {
                    if (_typeX in vehNATOTrucks) then
                    {
                        [[2, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                    }
                    else
                    {
                        [[0, 0], [2, 45]] remoteExec ["A3A_fnc_prestige",2];
                    };
                };
            }];
        }
        else
        {
            _veh addEventHandler ["killed",
            {
                private ["_veh","_typeX"];
                _veh = _this select 0;
                _typeX = typeOf _veh;
                if (side (_this select 1) == teamPlayer) then
                {
                    if (_typeX in vehNATOLight) then
                    {
                        [[5, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                    }
                    else
                    {
                        [[0, 0], [5, 45]] remoteExec ["A3A_fnc_prestige",2];
                    };
                };
            }];
        };
	}
	else
		{
		if (_typeX in vehAPCs) then
			{
			_veh addEventHandler ["killed",
				{
				private ["_veh","_typeX"];
				_veh = _this select 0;
				_typeX = typeOf _veh;
				if (side (_this select 1) == teamPlayer) then
				{
					if (_typeX in vehNATOAPC) then
                    {
                        [-2,2,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2];
                        [[10, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                    }
                    else
                    {
                        [[0, 0], [10, 45]] remoteExec ["A3A_fnc_prestige",2];
                    };
				};
				}];
			_veh addEventHandler ["HandleDamage",{private ["_veh"]; _veh = _this select 0; if (!canFire _veh) then {[_veh] call A3A_fnc_smokeCoverAuto; _veh removeEventHandler ["HandleDamage",_thisEventHandler]};if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_veh))) then {0;} else {(_this select 2);}}];
			_veh setVariable ["within",true];
			_veh addEventHandler ["GetOut", {private ["_veh"];  _veh = _this select 0; if (side (_this select 2) != teamPlayer) then {if (_veh getVariable "within") then {_veh setVariable ["within",false];[_veh] call A3A_fnc_smokeCoverAuto}}}];
			_veh addEventHandler ["GetIn", {private ["_veh"];_veh = _this select 0; if (side (_this select 2) != teamPlayer) then {_veh setVariable ["within",true]}}];
			}
		else
			{
			if (_typeX in vehTanks) then
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_typeX"];
					_veh = _this select 0;
					_typeX = typeOf _veh;
					if (side (_this select 1) == teamPlayer) then
						{
                            [
                                3,
                                "Rebels killed a tank",
                                "aggroEvent",
                                true
                            ] call A3A_fnc_log;
						if (_typeX == vehNATOTank) then
                        {
                            [-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2];
                            [[20, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                        }
                        else
                        {
                            [[0, 0], [20, 45]] remoteExec ["A3A_fnc_prestige",2];
                        };
						};
					}];
				_veh addEventHandler ["HandleDamage",{private ["_veh"]; _veh = _this select 0; if (!canFire _veh) then {[_veh] call A3A_fnc_smokeCoverAuto;  _veh removeEventHandler ["HandleDamage",_thisEventHandler]}}];
				}
			else
				{
				_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != teamPlayer)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
				};
			};
		};
	}
else
	{
	if (_typeX in vehPlanes) then
		{
		_veh addEventHandler ["killed",
			{
			private ["_veh","_typeX"];
			_veh = _this select 0;
			(typeOf _veh) call A3A_fnc_removeVehFromPool;
			}];
		_veh addEventHandler ["GetIn",
			{
			_positionX = _this select 1;
			if (_positionX == "driver") then
				{
				_unit = _this select 2;
				if ((!isPlayer _unit) and (_unit getVariable ["spawner",false]) and (side group _unit == teamPlayer)) then
					{
					moveOut _unit;
					["General", "Only Humans can pilot an air vehicle"] call A3A_fnc_customHint;
					};
				};
			}];
		if (_veh isKindOf "Helicopter") then
		{
			if (_typeX in vehTransportAir) then
			{
				_veh setVariable ["within",true];
				_veh addEventHandler ["GetOut", {private ["_veh"];_veh = _this select 0; if ((isTouchingGround _veh) and (isEngineOn _veh)) then {if (side (_this select 2) != teamPlayer) then {if (_veh getVariable "within") then {_veh setVariable ["within",false]; [_veh] call A3A_fnc_smokeCoverAuto}}}}];
				_veh addEventHandler ["GetIn", {private ["_veh"];_veh = _this select 0; if (side (_this select 2) != teamPlayer) then {_veh setVariable ["within",true]}}];
                _veh addEventHandler ["killed",
				{
					private ["_veh","_typeX"];
					_veh = _this select 0;
					_typeX = typeOf _veh;
					if (side (_this select 1) == teamPlayer) then
					{
						if (_typeX in vehNATOTransportHelis) then
                        {
                            [[5, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                        }
                        else
                        {
                            [[0, 0], [5, 45]] remoteExec ["A3A_fnc_prestige",2];
                        };
					};
				}];
			}
			else
			{
				_veh addEventHandler ["killed",
				{
					private ["_veh","_typeX"];
					_veh = _this select 0;
					_typeX = typeOf _veh;
					if (side (_this select 1) == teamPlayer) then
					{
						if (_typeX in vehNATOAttackHelis) then
                        {
                            [-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2];
                            [[15, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                        }
                        else
                        {
                            [[0, 0], [15, 45]] remoteExec ["A3A_fnc_prestige",2];
                        };
					};
				}];
			};
		};
		if (_veh isKindOf "Plane") then
		{
			_veh addEventHandler ["killed",
			{
				private ["_veh","_typeX"];
				_veh = _this select 0;
				_typeX = typeOf _veh;
				if (side (_this select 1) == teamPlayer) then
				{
					if ((_typeX == vehNATOPlane) or (_typeX == vehNATOPlaneAA)) then
                    {
                        [-8,8,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2];
                        [[10, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                    }
                    else
                    {
                        [[0, 0], [10, 45]] remoteExec ["A3A_fnc_prestige",2];
                    };
				};
			}];
		};
	}
	else
		{
		if (_veh isKindOf "StaticWeapon") then
			{
			_veh setCenterOfMass [(getCenterOfMass _veh) vectorAdd [0, 0, -1], 0];
			if ((not (_veh in staticsToSave)) and (side gunner _veh != teamPlayer)) then
				{
				if (activeGREF and ((_typeX == staticATteamPlayer) or (_typeX == staticAAteamPlayer))) then {[_veh,"moveS"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh]} else {[_veh,"steal"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh]};
				};
			if (_typeX == SDKMortar) then
				{
				if (!isNull gunner _veh) then
					{
					[_veh,"steal"] remoteExec ["A3A_fnc_flagaction",[teamPlayer,civilian],_veh];
					};
				_veh addEventHandler ["Fired",
					{
					_mortarX = _this select 0;
					_dataX = _mortarX getVariable ["detection",[position _mortarX,0]];
					_positionX = position _mortarX;
					_chance = _dataX select 1;
					if ((_positionX distance (_dataX select 0)) < 300) then
						{
						_chance = _chance + 2;
						}
					else
						{
						_chance = 0;
						};
					if (random 100 < _chance) then
						{
						{if ((side _x == Occupants) or (side _x == Invaders)) then {_x reveal [_mortarX,4]}} forEach allUnits;
						if (_mortarX distance posHQ < 300) then
							{
							if (!(["DEF_HQ"] call BIS_fnc_taskExists)) then
								{
								_LeaderX = leader (gunner _mortarX);
								if (!isPlayer _LeaderX) then
									{
									[[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2];
									}
								else
									{
									if ([_LeaderX] call A3A_fnc_isMember) then {[[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2]};
									};
								};
							}
						else
							{
							_bases = airportsX select {(getMarkerPos _x distance _mortarX < distanceForAirAttack) and ([_x,true] call A3A_fnc_airportCanAttack) and (sidesX getVariable [_x,sideUnknown] != teamPlayer)};
							if (count _bases > 0) then
								{
								_base = [_bases,_positionX] call BIS_fnc_nearestPosition;
								_sideX = sidesX getVariable [_base,sideUnknown];
								[[getPosASL _mortarX,_sideX,"Normal",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
								};
							};
						};
					_mortarX setVariable ["detection",[_positionX,_chance]];
					}];
				}
			else
			{
				_veh addEventHandler ["killed",
				{
					private ["_veh","_typeX"];
					_veh = _this select 0;
                    _typeX = typeOf _veh;
					_typeX call A3A_fnc_removeVehFromPool;
				}];
			};
		}
		else
			{
			if ((_typeX in vehAA) or (_typeX in vehMRLS)) then
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_typeX"];
					_veh = _this select 0;
					_typeX = typeOf _veh;
					if (side (_this select 1) == teamPlayer) then
					{
                        [
                            3,
                            "Rebels killed a special vehicle",
                            "aggroEvent",
                            true
                        ] call A3A_fnc_log;
						if (_typeX == vehNATOAA || _typeX == vehNATOMRLS) then
                        {
                            [-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2];
                            [[20, 45], [0, 0]] remoteExec ["A3A_fnc_prestige",2];
                        }
                        else
                        {
                            [[0, 0], [20, 45]] remoteExec ["A3A_fnc_prestige",2];
                        };
					};
					_typeX call A3A_fnc_removeVehFromPool;
					}];
				};
			};
		};
	};

[_veh] spawn A3A_fnc_cleanserVeh;

_veh addEventHandler ["Killed",{[_this select 0] spawn A3A_fnc_postmortem}];

if (not(_veh in staticsToSave)) then
	{
	if (((count crew _veh) > 0) and (not (_typeX in vehAA)) and (not (_typeX in vehMRLS) and !(_veh isKindOf "StaticWeapon"))) then
		{
		[_veh] spawn A3A_fnc_VEHdespawner
		}
	else
		{
		_veh addEventHandler ["GetIn",
			{
			_unit = _this select 2;
			if ((side _unit == teamPlayer) or (isPlayer _unit)) then {[_this select 0] spawn A3A_fnc_VEHdespawner};
			}
			];
		};
	if (_veh distance getMarkerPos respawnTeamPlayer <= 50) then
		{
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		};
	};
