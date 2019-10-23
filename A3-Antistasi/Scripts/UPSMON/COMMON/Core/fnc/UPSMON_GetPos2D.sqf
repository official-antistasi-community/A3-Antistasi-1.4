/****************************************************************
File: UPSMON_GetPos2D.sqf
Author: MONSADA

Description:
	Función que devuelve una posición en 2D a partir de otra, una dirección y una distancia
Parameter(s):
	<--- Position
	<--- Direction
	<--- Distance
Returns:
	Position
****************************************************************/
private ["_pos","_dir","_dist","_cosU","_cosT","_relTX","_sinU","_sinT","_relTY","_newPos","_newPosX","_newPosY" ];

_pos = _this select 0;
_dir = _this select 1;
_dist = _this select 2;
			
if (isnil "_pos") exitWith {}; 
_targetX = _pos select 0; _targetY = _pos select 1; 
			
//Calculamos posición 	
_cosU = [_dir] call UPSMON_GetCOS;		_sinU = [_dir] call UPSMON_GetSIN;			
_cosT = abs cos(_dir);				_sinT = abs sin(_dir);
_relTX = _sinT * _dist * _cosU;  	_relTY = _cosT * _dist * _sinU;
_newPosX = _targetX + _relTX;		_newPosY = _targetY + _relTY;		
_newPos = [_newPosX,_newPosY];
_newPos;