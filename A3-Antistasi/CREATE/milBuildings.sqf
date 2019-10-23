private ["_posicion","_size","_buildings","_grupo","_tipoUnit","_lado","_building","_tipoB","_frontera","_tipoVeh","_veh","_vehiculos","_soldados","_pos","_ang","_marcador","_unit","_return"];
_marcador = _this select 0;
_posicion = getMarkerPos _marcador;
_size = _this select 1;
_buildings = nearestObjects [_posicion, listMilBld, _size * 1.2, true];

if (count _buildings == 0) exitWith {[grpNull,[],[]]};

_lado = _this select 2;
_frontera = _this select 3;

_vehiculos = [];
_soldados = [];

_grupo = createGroup _lado;
_tipoUnit = if (_lado==malos) then {staticCrewmalos} else {staticCrewMuyMalos};

for "_i" from 0 to (count _buildings) - 1 do
	{
	if (spawner getVariable _marcador == 2) exitWith {};
	_building = _buildings select _i;
	/*
	if !(_building getVariable ["conEH",false]) then
		{
		_building setVariable ["conEH",true,true];
		_building addEventHandler ["Killed",{
			_building = _this select 0;
			destroyedBuildings pushBackUnique (getPos _building);
			publicVariable "destroyedBuildings";
			}
			];
		};*/
	_tipoB = typeOf _building;
	if ((_tipoB == "Land_HelipadSquare_F") and (!_frontera)) then
		{
		_tipoVeh = if (_lado == malos) then {vehNATOPatrolHeli} else {vehCSATPatrolHeli};
		_veh = createVehicle [_tipoVeh, position _building, [],0, "CAN_COLLIDE"];
		_veh setDir (getDir _building);
		_vehiculos pushBack _veh;
		}
	else
		{
		if 	((_tipoB == "Land_Cargo_HQ_V1_F") or (_tipoB == "Land_Cargo_HQ_V2_F") or (_tipoB == "Land_Cargo_HQ_V3_F")) then
			{
			_tipoVeh = if (_lado == malos) then {staticAAmalos} else {staticAAmuyMalos};
			_veh = createVehicle [_tipoVeh, (_building buildingPos 8), [],0, "CAN_COLLIDE"];
			_veh setPosATL [(getPos _building select 0),(getPos _building select 1),(getPosATL _veh select 2)];
			_veh setDir (getDir _building);
			_unit = _grupo createUnit [_tipoUnit, _posicion, [], 0, "NONE"];
			[_unit,_marcador] call A3A_fnc_NATOinit;
			_unit moveInGunner _veh;
			_soldados pushBack _unit;
			_vehiculos pushBack _veh;
			}
		else
			{
			if 	((_tipoB == "Land_Cargo_Patrol_V1_F") or (_tipoB == "Land_Cargo_Patrol_V2_F") or (_tipoB == "Land_Cargo_Patrol_V3_F")) then
				{
				_tipoVeh = if (_lado == malos) then {NATOMG} else {CSATMG};
				_veh = createVehicle [_tipoVeh, (_building buildingPos 1), [], 0, "CAN_COLLIDE"];
				_ang = (getDir _building) - 180;
				_pos = [getPosATL _veh, 2.5, _ang] call BIS_Fnc_relPos;
				_veh setPosATL _pos;
				_veh setDir (getDir _building) - 180;
				_unit = _grupo createUnit [_tipoUnit, _posicion, [], 0, "NONE"];
				[_unit,_marcador] call A3A_fnc_NATOinit;
				_unit moveInGunner _veh;
				_soldados pushBack _unit;
				_vehiculos pushBack _veh;
				}
			else
				{
				if 	(_tipoB in listbld) then
					{
					_tipoVeh = if (_lado == malos) then {NATOMG} else {CSATMG};
					_veh = createVehicle [_tipoVeh, (_building buildingPos 11), [], 0, "CAN_COLLIDE"];
					_unit = _grupo createUnit [_tipoUnit, _posicion, [], 0, "NONE"];
					[_unit,_marcador] call A3A_fnc_NATOinit;
					_unit moveInGunner _veh;
					_soldados pushBack _unit;
					_vehiculos pushBack _veh;
					sleep 0.5;
					_veh = createVehicle [_tipoVeh, (_building buildingPos 13), [], 0, "CAN_COLLIDE"];
					_unit = _grupo createUnit [_tipoUnit, _posicion, [], 0, "NONE"];
					[_unit,_marcador] call A3A_fnc_NATOinit;
					_unit moveInGunner _veh;
					_soldados pushBack _unit;
					_vehiculos pushBack _veh;
					};
				};
			};
		};
	};
[_grupo,_vehiculos,_soldados]