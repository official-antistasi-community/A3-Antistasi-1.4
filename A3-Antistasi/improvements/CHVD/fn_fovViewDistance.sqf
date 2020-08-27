private ["_ret"];
_minViewDistance = [_this, 0, 0, [0]] call BIS_fnc_param;
_ret = _minViewDistance;

_zoom = call CHVD_fnc_trueZoom;
if (_zoom >= 1) then {
	_ret = _minViewDistance + ((12000 / 74) * (_zoom - 1)) min viewDistance;	
};

//systemChat str _ret;
_ret