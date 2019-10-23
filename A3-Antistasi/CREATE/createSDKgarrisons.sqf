if (!isServer and hasInterface) exitWith{};

private ["_marcador","_vehiculos","_grupos","_soldados","_posicion","_pos","_size","_veh","_estaticas","_garrison","_tam","_cuenta","_grupo","_grupoMort","_tipo","_unit"];

_marcador = _this select 0;

_vehiculos = [];
_grupos = [];
_soldados = [];
_civs = [];
//_tipoCiv = "";
_posicion = getMarkerPos (_marcador);
_pos = [];
_unit = objNull;
_veh = objNull;
_size = [_marcador] call A3A_fnc_sizeMarker;

if (_marcador != "Synd_HQ") then
	{
	if (!(_marcador in ciudades)) then
		{
		_veh = createVehicle [SDKFlag, _posicion, [],0, "CAN_COLLIDE"];
		if (hayIFA) then {_veh setFlagTexture SDKFlagTexture};
		_veh allowDamage false;
		_vehiculos pushBack _veh;
		[_veh,"SDKFlag"] remoteExec ["A3A_fnc_flagaction",0,_veh];
		//[_veh,"unit"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh];
		//[_veh,"vehicle"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh];
		//[_veh,"garage"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh];
		};
	if ((_marcador in recursos) or (_marcador in fabricas)) then
		{
		if (not(_marcador in destroyedCities)) then
			{
			if ((daytime > 8) and (daytime < 18)) then
				{
				_grupo = createGroup civilian;
				_grupos pushBack _grupo;
				for "_i" from 1 to 4 do
					{
					if (spawner getVariable _marcador != 2) then
						{
						_civ = _grupo createUnit ["C_man_w_worker_F", _posicion, [],0, "NONE"];
						_nul = [_civ] spawn A3A_fnc_CIVinit;
						_civs pushBack _civ;
						_civ setVariable ["marcador",_marcador,true];
						sleep 0.5;
						_civ addEventHandler ["Killed",
							{
							if (({alive _x} count units group (_this select 0)) == 0) then
								{
								_marcador = (_this select 0) getVariable "marcador";
								_nombre = [_marcador] call A3A_fnc_localizar;
								destroyedCities pushBackUnique _marcador;
								publicVariable "destroyedCities";
								["TaskFailed", ["", format ["%1 Destroyed",_nombre]]] remoteExec ["BIS_fnc_showNotification",[buenos,civilian]];
								};
							}];
						};
					};
				//_nul = [_marcador,_civs] spawn destroyCheck;
				_nul = [leader _grupo, _marcador, "SAFE", "SPAWNED","NOFOLLOW", "NOSHARE","DORELAX","NOVEH2"] execVM "scripts\UPSMON.sqf";
				};
			};
		};
	if (_marcador in puertos) then
		{
		[_veh,"seaport"] remoteExec ["A3A_fnc_flagaction",[buenos,civilian],_veh];
		};
	};
_estaticas = staticsToSave select {_x distance _posicion < _size};

_garrison = [];
_garrison = _garrison + (garrison getVariable [_marcador,[]]);
_grupo = createGroup buenos;
_grupoEst = createGroup buenos;
_grupoMort = createGroup buenos;
{
_index = _garrison findIf {_x in SDKMil};
if (_index == -1) exitWith {};
if (typeOf _x == SDKMortar) then
	{
	_unit = _grupoMort createUnit [(_garrison select _index), _posicion, [], 0, "NONE"];
	_unit moveInGunner _x;
	_nul=[_x] execVM "scripts\UPSMON\MON_artillery_add.sqf";
	}
else
	{
	_unit = _grupoEst createUnit [(_garrison select _index), _posicion, [], 0, "NONE"];
	_unit moveInGunner _x;
	};
[_unit,_marcador] call A3A_fnc_FIAinitBases;
_soldados pushBack _unit;
_garrison deleteAT _index;
} forEach _estaticas;

if (staticCrewBuenos in _garrison) then
	{
	{
	_unit = _grupoMort createUnit [staticCrewBuenos, _posicion, [], 0, "NONE"];
	_pos = [_posicion] call A3A_fnc_mortarPos;
	_veh = SDKMortar createVehicle _pos;
	_vehiculos pushBack _veh;
	_nul=[_veh] execVM "scripts\UPSMON\MON_artillery_add.sqf";
	_unit assignAsGunner _veh;
	_unit moveInGunner _veh;
	[_veh] call A3A_fnc_AIVEHinit;
	_soldados pushBack _unit;
	} forEach (_garrison select {_x == staticCrewBuenos});
	_garrison = _garrison - [staticCrewBuenos];
	};
_garrison = _garrison call A3A_fnc_garrisonReorg;
_tam = count _garrison;
_cuenta = 0;

while {(spawner getVariable _marcador != 2) and (_cuenta < _tam)} do
	{
	_tipo = _garrison select _cuenta;
	_unit = _grupo createUnit [_tipo, _posicion, [], 0, "NONE"];
	if (_tipo in SDKSL) then {_grupo selectLeader _unit};
	[_unit,_marcador] call A3A_fnc_FIAinitBases;
	_soldados pushBack _unit;
	_cuenta = _cuenta + 1;
	sleep 0.5;
	if (count units _grupo == 8) then
		{
		_grupo = createGroup buenos;
		_grupos pushBack _grupo;
		};
	};

for "_i" from 0 to (count _grupos) - 1 do
	{
	_grupo = _grupos select _i;
	if (_i == 0) then
		{
		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","RANDOMUP","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
		}
	else
		{
		_nul = [leader _grupo, _marcador, "SAFE","SPAWNED","RANDOM","NOVEH2","NOFOLLOW"] execVM "scripts\UPSMON.sqf";
		};
	};
waitUntil {sleep 1; (spawner getVariable _marcador == 2)};

{
_soldado = _x;
if (alive _soldado) then
	{
	deleteVehicle _x
	};
} forEach _soldados;
{deleteVehicle _x} forEach _civs;
//if (!isNull _periodista) then {deleteVehicle _periodista};
{deleteGroup _x} forEach _grupos;
deleteGroup _grupoEst;
deleteGroup _grupoMort;
{if (!(_x in staticsToSave)) then {deleteVehicle _x}} forEach _vehiculos;
