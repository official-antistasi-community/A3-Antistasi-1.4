private ["_veh","_tipo"];

_veh = _this select 0;
if (isNil "_veh") exitWith {};
if ((_veh isKindOf "FlagCarrier") or (_veh isKindOf "Building") or (_veh isKindOf "ReammoBox_F")) exitWith {};
//if (_veh isKindOf "ReammoBox_F") exitWith {[_veh] call A3A_fnc_NATOcrate};

_tipo = typeOf _veh;

if ((_tipo in vehNormal) or (_tipo in vehAttack) or (_tipo in vehBoats)) then
	{
	_veh addEventHandler ["Killed",
		{
		private _veh = _this select 0;
		(typeOf _veh) call A3A_fnc_removeVehFromPool;
		_veh removeAllEventHandlers "HandleDamage";
		}];
	if !(_tipo in vehAttack) then
		{
		if (_tipo in vehAmmoTrucks) then
			{
			if (_veh distance getMarkerPos respawnBuenos > 50) then {if (_tipo == vehNatoAmmoTruck) then {_nul = [_veh] call A3A_fnc_NATOcrate} else {_nul = [_veh] call A3A_fnc_CSATcrate}};
			};
		if (_veh isKindOf "Car") then
			{
			_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != buenos)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
			if ({"SmokeLauncher" in (_veh weaponsTurret _x)} count (allTurrets _veh) > 0) then
				{
				_veh setVariable ["dentro",true];
				_veh addEventHandler ["GetOut", {private ["_veh"]; _veh = _this select 0; if (side (_this select 2) != buenos) then {if (_veh getVariable "dentro") then {_veh setVariable ["dentro",false]; [_veh] call A3A_fnc_smokeCoverAuto}}}];
				_veh addEventHandler ["GetIn", {private ["_veh"]; _veh = _this select 0; if (side (_this select 2) != buenos) then {_veh setVariable ["dentro",true]}}];
				};
			};
		}
	else
		{
		if (_tipo in vehAPCs) then
			{
			_veh addEventHandler ["killed",
				{
				private ["_veh","_tipo"];
				_veh = _this select 0;
				_tipo = typeOf _veh;
				if (side (_this select 1) == buenos) then
					{
					if (_tipo in vehNATOAPC) then {[-2,2,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2]};
					};
				}];
			_veh addEventHandler ["HandleDamage",{private ["_veh"]; _veh = _this select 0; if (!canFire _veh) then {[_veh] call A3A_fnc_smokeCoverAuto; _veh removeEventHandler ["HandleDamage",_thisEventHandler]};if (((_this select 1) find "wheel" != -1) and (_this select 4=="") and (!isPlayer driver (_veh))) then {0;} else {(_this select 2);}}];
			_veh setVariable ["dentro",true];
			_veh addEventHandler ["GetOut", {private ["_veh"];  _veh = _this select 0; if (side (_this select 2) != buenos) then {if (_veh getVariable "dentro") then {_veh setVariable ["dentro",false];[_veh] call A3A_fnc_smokeCoverAuto}}}];
			_veh addEventHandler ["GetIn", {private ["_veh"];_veh = _this select 0; if (side (_this select 2) != buenos) then {_veh setVariable ["dentro",true]}}];
			}
		else
			{
			if (_tipo in vehTanks) then
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_tipo"];
					_veh = _this select 0;
					_tipo = typeOf _veh;
					if (side (_this select 1) == buenos) then
						{
						if (_tipo == vehNATOTank) then {[-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2]};
						};
					}];
				_veh addEventHandler ["HandleDamage",{private ["_veh"]; _veh = _this select 0; if (!canFire _veh) then {[_veh] call A3A_fnc_smokeCoverAuto;  _veh removeEventHandler ["HandleDamage",_thisEventHandler]}}];
				}
			else
				{
				_veh addEventHandler ["HandleDamage",{if (((_this select 1) find "wheel" != -1) and ((_this select 4=="") or (side (_this select 3) != buenos)) and (!isPlayer driver (_this select 0))) then {0} else {(_this select 2)}}];
				};
			};
		};
	}
else
	{
	if (_tipo in vehPlanes) then
		{
		_veh addEventHandler ["killed",
			{
			private ["_veh","_tipo"];
			_veh = _this select 0;
			(typeOf _veh) call A3A_fnc_removeVehFromPool;
			}];
		_veh addEventHandler ["GetIn",
			{
			_posicion = _this select 1;
			if (_posicion == "driver") then
				{
				_unit = _this select 2;
				if ((!isPlayer _unit) and (_unit getVariable ["GREENFORSpawn",false])) then
					{
					moveOut _unit;
					hint "Only Humans can pilot an air vehicle";
					};
				};
			}];
		if (_veh isKindOf "Helicopter") then
			{
			if (_tipo in vehTransportAir) then
				{
				_veh setVariable ["dentro",true];
				_veh addEventHandler ["GetOut", {private ["_veh"];_veh = _this select 0; if ((isTouchingGround _veh) and (isEngineOn _veh)) then {if (side (_this select 2) != buenos) then {if (_veh getVariable "dentro") then {_veh setVariable ["dentro",false]; [_veh] call A3A_fnc_smokeCoverAuto}}}}];
				_veh addEventHandler ["GetIn", {private ["_veh"];_veh = _this select 0; if (side (_this select 2) != buenos) then {_veh setVariable ["dentro",true]}}];
				}
			else
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_tipo"];
					_veh = _this select 0;
					_tipo = typeOf _veh;
					if (side (_this select 1) == buenos) then
						{
						if (_tipo in vehNATOAttackHelis) then {[-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2]};
						};
					}];
				};
			};
		if (_veh isKindOf "Plane") then
			{
			_veh addEventHandler ["killed",
				{
				private ["_veh","_tipo"];
				_veh = _this select 0;
				_tipo = typeOf _veh;
				if (side (_this select 1) == buenos) then
					{
					if ((_tipo == vehNATOPlane) or (_tipo == vehNATOPlaneAA)) then {[-8,8,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2]};
					};
				}];
			};
		}
	else
		{
		if (_veh isKindOf "StaticWeapon") then
			{
			_veh setCenterOfMass [(getCenterOfMass _veh) vectorAdd [0, 0, -1], 0];
			if ((not (_veh in staticsToSave)) and (side gunner _veh != buenos)) then
				{
				if (activeGREF and ((_tipo == staticATBuenos) or (_tipo == staticAABuenos))) then {[_veh,"moveS"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh]} else {[_veh,"steal"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh]};
				};
			if (_tipo == SDKMortar) then
				{
				if (!isNull gunner _veh) then
					{
					[_veh,"steal"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh];
					};
				_veh addEventHandler ["Fired",
					{
					_mortero = _this select 0;
					_datos = _mortero getVariable ["detection",[position _mortero,0]];
					_posicion = position _mortero;
					_chance = _datos select 1;
					if ((_posicion distance (_datos select 0)) < 300) then
						{
						_chance = _chance + 2;
						}
					else
						{
						_chance = 0;
						};
					if (random 100 < _chance) then
						{
						{if ((side _x == malos) or (side _x == muyMalos)) then {_x reveal [_mortero,4]}} forEach allUnits;
						if (_mortero distance posHQ < 300) then
							{
							if (!(["DEF_HQ"] call BIS_fnc_taskExists)) then
								{
								_lider = leader (gunner _mortero);
								if (!isPlayer _lider) then
									{
									[[],"A3A_fnc_ataqueHQ"] remoteExec ["A3A_fnc_scheduler",2];
									}
								else
									{
									if ([_lider] call A3A_fnc_isMember) then {[[],"A3A_fnc_ataqueHQ"] remoteExec ["A3A_fnc_scheduler",2]};
									};
								};
							}
						else
							{
							_bases = aeropuertos select {(getMarkerPos _x distance _mortero < distanceForAirAttack) and ([_x,true] call A3A_fnc_airportCanAttack) and (lados getVariable [_x,sideUnknown] != buenos)};
							if (count _bases > 0) then
								{
								_base = [_bases,_posicion] call BIS_fnc_nearestPosition;
								_lado = lados getVariable [_base,sideUnknown];
								[[getPosASL _mortero,_lado,"Normal",false],"A3A_fnc_patrolCA"] remoteExec ["A3A_fnc_scheduler",2];
								};
							};
						};
					_mortero setVariable ["detection",[_posicion,_chance]];
					}];
				}
			else
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_tipo"];
					_veh = _this select 0;
					(typeOf _veh) call A3A_fnc_removeVehFromPool;
					}];
				};
			}
		else
			{
			if ((_tipo in vehAA) or (_tipo in vehMRLS)) then
				{
				_veh addEventHandler ["killed",
					{
					private ["_veh","_tipo"];
					_veh = _this select 0;
					_tipo = typeOf _veh;
					if (side (_this select 1) == buenos) then
						{
						if (_tipo == vehNATOAA) then {[-5,5,position (_veh)] remoteExec ["A3A_fnc_citySupportChange",2]};
						};
					_tipo call A3A_fnc_removeVehFromPool;
					}];
				};
			};
		};
	};

[_veh] spawn A3A_fnc_cleanserVeh;

_veh addEventHandler ["Killed",{[_this select 0] spawn A3A_fnc_postmortem}];

if (not(_veh in staticsToSave)) then
	{
	if (((count crew _veh) > 0) and (not (_tipo in vehAA)) and (not (_tipo in vehMRLS) and !(_veh isKindOf "StaticWeapon"))) then
		{
		[_veh] spawn A3A_fnc_VEHdespawner
		}
	else
		{
		_veh addEventHandler ["GetIn",
			{
			_unit = _this select 2;
			if ((side _unit == buenos) or (isPlayer _unit)) then {[_this select 0] spawn A3A_fnc_VEHdespawner};
			}
			];
		};
	if (_veh distance getMarkerPos respawnBuenos <= 50) then
		{
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		};
	};