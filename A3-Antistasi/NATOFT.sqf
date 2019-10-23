_chequeo = false;
_lado = side (group player);
_enemyFaction = if (_lado == malos) then {muyMalos} else {malos};
{_enemigo = _x;
if (((side _enemigo == _enemyFaction) or (side _enemigo == buenos)) and (_enemigo distance player < 500) and (not(captive _enemigo))) exitWith {_chequeo = true};
} forEach allUnits;

if (_chequeo) exitWith {Hint "You cannot Fast Travel while enemies are nearby"};

if (vehicle player != player) then {if (!(canMove vehicle player)) then {_chequeo = true}};
if (_chequeo) exitWith {Hint "You cannot Fast Travel if your vehicles don't have a driver or your vehicles immobile"};

posicionTel = [];

hint "Click on the zone you want to travel to";
if (!visibleMap) then {openMap true};
onMapSingleClick "posicionTel = _pos;";

waitUntil {sleep 1; (count posicionTel > 0) or (not visiblemap)};
onMapSingleClick "";

_posicionTel = posicionTel;

if (count _posicionTel > 0) then
	{;
	_mrkENY = marcadores select {lados getVariable [_x,sideUnknown] != _lado};
	_marcadores = +marcadores;
	_mrkRespawn = "";
	if (_lado == malos) then
		{
		_marcadores pushBack "respawn_west";
		_mrkRespawn = "respawn_west";
		}
	else
		{
		_marcadores pushBack "respawn_east";
		_mrkRespawn = "respawn_east";
		};
	_base = [_marcadores, _posicionTel] call BIS_Fnc_nearestPosition;

	if ((lados getVariable [_base,sideUnknown] == buenos) or (_base in _mrkENY)) exitWith {hint "You cannot Fast Travel to an enemy controlled zone"; openMap [false,false]};

	if ((!(_base in aeropuertos)) and (!(_base in puertos)) and (!(_base in puestos)) and (_base != _mrkRespawn)) exitWith {hint "You can only Fast Travel to Airbases, Outposts and Seaports"; openMap [false,false]};

	{
		if (((side (group _x) == buenos) or (side (group _x) == _enemyFaction)) and (_x distance (getMarkerPos _base) < 500) and (not(captive _x))) then {_chequeo = true};
	} forEach allUnits;

	if (_chequeo) exitWith {Hint "You cannot Fast Travel to an area under attack or with enemies in the surrounding area"; openMap [false,false]};

	if (_posicionTel distance getMarkerPos _base < 50) then
		{
		_posicion = [getMarkerPos _base, 10, random 360] call BIS_Fnc_relPos;
		_distancia = round (((position player) distance _posicion)/200);
		disableUserInput true;
		cutText ["Fast traveling, please wait","BLACK",2];
		sleep 2;
		(vehicle player) setPos _posicion;
		player allowDamage false;
		sleep _distancia;
		disableUserInput false;
		cutText ["You arrived to destination","BLACK IN",3];
		sleep 5;
		player allowDamage true;
		}
	else
		{
		Hint "You must click near a marker you control";
		};
	};
openMap false;
