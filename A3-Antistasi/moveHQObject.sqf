if (player != theBoss) exitWith {hint "Only Player Commander is allowed to move HQ assets"};
private ["_cosa","_jugador","_id","_sitios","_marcador","_size","_posicion"];

_cosa = _this select 0;
_jugador = _this select 1;
_id = _this select 2;

if (!(isNull attachedTo _cosa)) exitWith {hint "The asset you want to move is being moved by another player"};
if (vehicle _jugador != _jugador) exitWith {hint "You cannot move HQ assets while in a vehicle"};

if ({!(isNull _x)} count (attachedObjects _jugador) != 0) exitWith {hint "You have other things attached, you cannot move this"};
_sitios = marcadores select {lados getVariable [_x,sideUnknown] == buenos};
_marcador = [_sitios,_jugador] call BIS_fnc_nearestPosition;
_size = [_marcador] call A3A_fnc_sizeMarker;
_posicion = getMarkerPos _marcador;
if (_jugador distance2D _posicion > _size) exitWith {hint "This asset needs to be closer to it relative zone center to be able to be moved"};

_cosa removeAction _id;
_cosa attachTo [_jugador,[0,2,1]];
accion = _jugador addAction ["Drop Here", {{detach _x} forEach attachedObjects player; player removeAction accion},nil,0,false,true,"",""];

waitUntil {sleep 1; (count attachedObjects _jugador == 0) or (vehicle _jugador != _jugador) or (_jugador distance2D _posicion > (_size-3)) or !([_jugador] call A3A_fnc_canFight) or (!isPlayer _jugador)};

{detach _x} forEach attachedObjects _jugador;
player removeAction accion;
/*
for "_i" from 0 to (_jugador addAction ["",""]) do
	{
	_jugador removeAction _i;
	};
*/
_cosa addAction ["Move this asset", "moveHQObject.sqf",nil,0,false,true,"","(_this == theBoss)"];

_cosa setPosATL [getPosATL _cosa select 0,getPosATL _cosa select 1,0];

if (vehicle _jugador != _jugador) exitWith {hint "You cannot move HQ assets while in a vehicle"};

if  (_jugador distance2D _posicion > _size) exitWith {hint "This asset cannot be moved more far away for its zone center"};