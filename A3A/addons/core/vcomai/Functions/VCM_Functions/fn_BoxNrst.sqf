
/*
	Author: Genesis

	Description:
		Function for finding the closest WorldPos position (Left, Ride, Front, Rear) to an entity. And then finding a suitable position near that entity.

	Parameter(s):
		0: OBJECT - Entity
		1: OBJECT - Unit

	Returns:
		ARRAY - Position
		
	Note:
		DEPRECATED
*/

params ["_ent","_unit"];
private _div = 1;
if (_ent isKindOf "landvehicle" || _ent isKindOf "air") then {_div = 2;};

//First we need to get all the positions around the object, and mark each as front,rear,left,right.
private _entBX = boundingBoxReal _ent;
private _p1 = _entBX select 0;
private _p2 = _entBX select 1;
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _maxLength = abs ((_p2 select 1) - (_p1 select 1));

private _left =  _ent modelToWorld [-((_maxWidth)/_div),0,0];
private _right = _ent modelToWorld [(_maxWidth/_div),0,0];
private _front = _ent modelToWorld [0,(_maxLength/_div),0];
private _behind = _ent modelToWorld [0,(-(_maxLength)/_div),0];
private _ClstPos = [[_left,_right,_front,_behind],_unit,true,"NrstPos"] call DGN_fnc_ClosestObj;


_ClstPos